#!/bin/bash

# 0: Check DB status
# 1: Query MySql for latest migration
# 2: Check sql dir for migrations newer than query result
# 3..: Execute newer sql *in order*

################################################################################
# script and sql calls
################################################################################

DB_HOST=$1
DB_USER=$2
DB_PASSWORD=$3
DB_NAME=$4

SSH_PREFIX="ssh -o StrictHostKeyChecking=no -i sshkey ${REMOTE_USER}@${REMOTE_HOST}"
MYSQL_CLIENT="mysql -h ${DB_HOST} --protocol=tcp -u ${DB_USER} --password=${DB_PASSWORD} ${DB_NAME}"

#checking mysql connection
mysql_db_statuscheck(){
	echo "`date` :Checking DB connectivity...";
	echo "`date` :Trying to connect to the ODU MySQL Database..."
	TAIL="-e 'SELECT 1;'"
	cmd="$SSH_PREFIX $MYSQL_CLIENT ${TAIL}"
	$cmd
	if [[ $? -eq 0 ]]
	then
		DB_STATUS="UP"
		export DB_STATUS
		echo "`date` :Status: ${DB_STATUS}. Able to Connect..."
	else
		DB_STATUS="DOWN"
		export DB_STATUS
		echo "`date` :Status: DOWN . Not able to Connect."
		echo "`date`:Not able to connect to database with Username:
		"${DB_USER}" HostName: ""${DB_HOST}" " SID: "${DB_NAME}"."
		echo "`date` :Exiting Script Run..."
		exit 1
	fi
}

# run mysql function
runmysqls() {
	echo "`date` :Checking DB and table status..."

	mysql_db_statuscheck

	echo "`date` :DB status check completed"
	echo "`date` :Connecting To ${DB_USER}/******@${DB_NAME}";
	if [[ $DB_STATUS == "UP" ]]
	then
		# latest_migration will be an int
		TAIL="-se 'SELECT MAX(version) FROM migrations;'"
		latest_migration=`$SSH_PREFIX $MYSQL_CLIENT ${TAIL} 2>&1`
		if [[ `echo "${latest_migration}" |cut -c 1-10` == "ERROR 1146" ]]; then
			echo "`date` :Running initial migration"
			latest_migration=0
		fi

		for file in `ls ./sql`; do
			file_migration_no=`echo "$file" |cut -c1-3`
		   	if [[ $latest_migration -lt $file_migration_no ]]; then
				echo "`date` :Executing migration $file_migration_no from file $file...";
				echo "`date` :__________________________________________";
				echo "`date` :SQL OUTPUT:";
				echo "`date` :__________________________________________";
				TAIL="-se '`cat ./sql/${file}`'"
				sqlout=`$SSH_PREFIX $MYSQL_CLIENT ${TAIL} 2>&1`
				if [[ $? -eq 0 ]]; then 
					TAIL="-se 'INSERT INTO migrations (version) VALUES (${file_migration_no});'"
					`$SSH_PREFIX $MYSQL_CLIENT ${TAIL}`
				else
					echo ${sqlout}
					exit 1
				fi
			fi
		done
	else
		echo "`date` :Either the DB is down or the exit status returned by
		the script shows ERROR."
		echo "`date` :Exiting ..."
		exit
	fi
}

# main function
Main() {
	echo "`date` :Starting sql auto run script."
	runmysqls
	echo "`date` :sql auto run script execution completed."
}
Main

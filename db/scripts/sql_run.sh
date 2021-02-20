#!bin/bash

# 0: Check DB status
# 1: Query MySql for latest migration
# 2: Check sql dir for migrations newer than query result
# 3..: Execute newer sql *in order*

################################################################################
# script and sql calls
###############################################################################

#checking mysql connection
mysql_db_statuscheck(){
	echo "`date` :Checking DB connectivity...";
	echo "`date` :Trying to connect to the ODU MySQL Database..."
	echo "exit" | mysql -h ${DB_HOST} -u ${DB_USER} -p ${DB_PASSWORD} ${DB_NAME} -e "SELECT 1"
	if [[ $? -eq 0 ]]
	then
		DB_STATUS="UP"
		export DB_STATUS
		echo "`date` :Status: ${DB_STATUS}. Able to Connect..."
	else
		DB_STATUS="DOWN"
		export DB_STATUS
		echo "`date` :Status: DOWN . Not able to Connect."
		echo "`date` :Not able to connect to database with Username:
		"${user}" HostName: ""${host}" DB Port: "${port}"." SID: "${service}"."
		echo "`date` :Exiting Script Run..."
		exit 1
	fi
}

# run mysql function
runmtsqls() {
	echo "`date` :Checking DB and table status..."

	mysql_db_statuscheck

	echo "`date` :DB status check completed"
	echo "`date` :Connecting To ${user}/******@${service}";
	if [[ $DB_STATUS == "UP" ]]
	then
		# latest_migration will be an int
		latest_migration=`mysql -h ${DB_HOST} -u ${DB_USER} -p ${DB_PASSWORD} ${DB_NAME} -se SELECT MAX(version) FROM MIGRATIONS;`
		if [[ `$latest_migration |cut -c 1-10` -eq 'ERROR 1146' ]] then
			latest_migration=0
		fi

		for file in `ls ./db/sql`; do
			file_migration_no=`$file |cut -c1-3`
		   	if [[ $latest_migration -gt $file_migration_no ]] then
				echo "`date`:Executing file $file...";
				echo "`date`:__________________________________________";
				echo "`date`:SQL OUTPUT:";
				echo "`date`:__________________________________________";
				mysql -h ${DB_HOST} -u ${DB_USER} -p ${DB_PASSWORD} ${DB_NAME} < $file
			fi  
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

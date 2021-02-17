#!bin/bash


################################################################################
# password:
################################################################################

# ask user for MySQL user id production password. The users password is not store is
# history, and is hidden when input into command line. 
# After defining the database and server, update environment vars for host and service. 

# read -p "Enter the database name: " ora
#read -p "Enter the service name: " sid
read -p "Enter you userid: " uid 
read -s -p "Enter your password: " cmd
################################################################################
# variables:
################################################################################

host=""
port=""
service=""
user="$uid"  #(whoami) # will need to change to ORA_ADM account
password="$cmd" # holds password locally, but does not cache. 
tbl=""
col=""
#report="./report/export_to_excel.sql"
################################################################################
# script and sql calls
###############################################################################

#checking postgre connection
postgre_db_statuscheck(){
    echo "`date` :Checking DB connectivity...";
    echo "`date` :Trying to connect to the ODU MySQL Database..."
    echo "exit" | mysql "${user}/${password}@${host}/${service}" | grep -q "Connected to:" > /dev/null
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
        exit
    fi
}




# run oracle sql function
runpsqls() {
    echo "`date` :Checking DB and table status..."
    if [[ $DB_STATUS == "DOWN" ]];
    then
        echo "`date` :DB status check failed..."
        echo "`date` :Exiting bash script..."
        exit
    fi
    echo "`date` :DB status check completed"
    echo "`date` :Connecting To ${user}/******@${service}";
    if [[ $DB_STATUS == "UP" ]]
    then
        for file in `dir -d $master`;
        do
        #for file in `cat extrasqlslist.txt` ;do
           echo "`date`:Executing file $file...";
           echo "`date`:__________________________________________";
           echo "`date`:SQL OUTPUT:";
           echo "`date`:__________________________________________";
           mysql -s ${user}/${password}@${host}/${service}<<-EOF
           @$file;
           commit;
           quit;
EOF
        while 
         mapfile -t meta < $file
        psql  
    else
        echo "`date` :Either the DB is down or the exit status returned by
        the script shows ERROR."
        echo "`date` :Exiting ..."
        exit
    fi
}



# main function
Main() {
    echo "`date` :Starting Sql auto run script."
    runpsqls
    echo "`date` :Sql auto run script execution completed."
}
Main | tee autosql.log 

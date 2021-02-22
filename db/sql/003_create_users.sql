CREATE TABLE IF NOT EXISTS tbl_fact_users(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,uname varchar(30) NOT NULL unique
       ,email varchar(15) NOT NULL unique 
       ,password varchar(100) NOT NULL unique
       ,created_date datetime
       ,update_date datetime
       ,role varchar(15) check (role in ('ADMINISTRATOR','FACULTY'))
       ,department smallint UNSIGNED NOT NULL
);

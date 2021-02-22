CREATE TABLE IF NOT EXISTS tbl_fact_users(
       id int UNSIGNED AUTO_INCREMENT NOT NULL,
       name varchar(30) NOT NULL,
       email varchar(15) NOT NULL unique, 
       password varchar(100) NOT NULL,
       created_date Timestamp,
       update_date TimeStamp,
       user_role ENUM("FACULTY", "ADMINISTRATOR"),
       department int UNSIGNED NOT NULL,
       PRIMARY KEY(id)
);
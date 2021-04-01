CREATE TABLE IF NOT EXISTS tbl_fact_departments(
            id smallint UNSIGNED  NOT NULL auto_increment PRIMARY KEY
           ,dname varchar(30)
           constraint fk_user_dpt foreign key (id)
            references tbl_fact_users (id)
);

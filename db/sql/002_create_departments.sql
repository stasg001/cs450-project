CREATE TABLE IF NOT EXISTS tbl_fact_departments(
            id smallint UNSIGNED  auto_increment NOT NULL PRIMARY KEY
           ,dname varchar(30)
            constraint fk_dpt_id foreign key (id)
             references tbl_fact_users (department)
);

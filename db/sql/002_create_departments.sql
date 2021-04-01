CREATE TABLE IF NOT EXISTS tbl_fact_departments(
            id smallint UNSIGNED  auto_increment NOT NULL PRIMARY KEY
           ,dname varchar(30)
           constraint fk_user_dpmt foreign key (id)
            references tbl_fact_users (id)
);

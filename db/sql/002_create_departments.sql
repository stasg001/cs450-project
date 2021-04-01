CREATE TABLE IF NOT EXISTS tbl_fact_departments(
            id INT UNSIGNED  AUTO_INCREMENT NOT NULL PRIMARY KEY,
            dname varchar(30) not null
            constraint fk_dpt_id foreign key (id)
            references tbl_fact_users (department)
);

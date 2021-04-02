CREATE TABLE IF NOT EXISTS tbl_fact_granting_entity(
            id int UNSIGNED NOT NULL auto_increment PRIMARY KEY,
            name varchar(50),
            type ENUM('EXTERNAL', 'INTERNAL')
);

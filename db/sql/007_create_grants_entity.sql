CREATE TABLE IF NOT EXISTS tbl_fact_granting_entity(
            id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
           ,gname varchar(50)
           ,gtype char(8) check (gtype in ('EXTERNAL', 'INTERNAL'))
);

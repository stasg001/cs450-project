CREATE TABLE IF NOT EXISTS tbl_fact_employment(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,student_uin smallint UNSIGNED
       ,etype ENUM('GRA', 'GTA', 'URA')
       ,semester varchar(10)
       ,faculty_id smallint UNSIGNED
       ,amount float(7,0)
       ,payment_type ENUM('STIPEND', 'SALARY')
       ,workload smallint UNSIGNED
       ,start_date date
       ,end_date date
       constraint fk_faclt_id foreign key (faculty_id)
          references tbl_fact_users(id)
);

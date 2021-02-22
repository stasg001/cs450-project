CREATE TABLE IF NOT EXISTS tbl_fact_employment(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,student_uin smallint UNSIGNED
       ,etype char(3) check (etype in ('GRA', 'GTA', 'URA'))
       ,semester varchar(10)
       ,faculty_id smallint UNSIGNED
       ,amount float(7,0)
       ,payment_type varchar(7) check (payment_type in ('STIPEND', 'SALARY'))
       ,workload smallint UNSIGNED
       ,start_date date
       ,end_date date
);

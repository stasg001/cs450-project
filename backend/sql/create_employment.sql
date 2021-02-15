create table tbl_fact_employment(
        id smallint UNSIGNED not null auto_increment 
       ,student_uin smallint UNSIGNED
       ,_type char(3) check (_type in ('GRA', 'GTA', 'URA'))
       ,semester varchar(10)
       ,faculty_id smallint UNSIGNED
       ,amount float(7,0)
       ,payment_type varchar(7) check (payment_type in ('STIPEND', 'SALARY'))
       ,workload smallint UNSIGNED
       ,start_date date
       ,end_date date
       constraint pk_emplid primary key (id)
       constraint fk_student_id foreign key (student_uin)
       reference tbl_fat_students (uin)
);
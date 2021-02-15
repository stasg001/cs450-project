create table tbl_fact_student(
        uin smallint UNSIGNED not null auto_increment 
       ,name varchar(50)
       ,department smallint UNSIGNED
       ,program varchar(3) check (program in ('UG', 'MS', 'PHD'))
       constraint pk_uin primary key (uin)
       constraint fk_depart foreign key (department)
       reference tbl_fact_department (id) 
);
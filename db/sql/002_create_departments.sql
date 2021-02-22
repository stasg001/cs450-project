create table if not exists tbl_fact_departments(
            id smallint UNSIGNED  not null auto_increment
           ,dname varchar(30)
           constraint pk_deptid primary key (id) 
);
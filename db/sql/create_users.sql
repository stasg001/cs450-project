create table tbl_fact_users(
        id smallint UNSIGNED not null auto_increment 
       ,uname varchar(30) not null unique
       ,email varchar(15) not null unique 
       ,password varchar(100) not null unique
       ,created_date datetime
       ,update_date datetime
       ,role varchar(15) check (role in ('ADMINISTRATOR','FACULTY'))
       ,department smallint UNSIGNED not null
       constraint pk_user_id primary key (id) 
       constraint fk_department foreign key (department)
       reference tbl_fact_department (id)
);
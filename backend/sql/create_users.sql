create table tbl_fact_users(
        id smallint UNSIGNED not null auto_increment 
       ,name varchar(30)
       ,email varchar(15)
       ,password varchar(100)
       ,created_date datetime
       ,update_date datetime
       ,role varchar(15) check (role in ('ADMINISTRATOR','FACULTY'))
       ,department smallint UNSIGNED not null
       constraint pk_user_id primary key (id) 
       constraint fk_department foreign key (department)
       reference tbl_fact_department (id)
);
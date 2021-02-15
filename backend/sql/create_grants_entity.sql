create table tbl_fact_granting_entity(
            id smallint UNSIGNED not null auto_increment 
           ,name varchar(50)
           ,type char(8) check (type in ('EXTERNAL', 'INTERNAL'))
        constraint pk_entity_id primary key (id)
);
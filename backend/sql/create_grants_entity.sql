create table tbl_fact_granting_entity(
            id smallint UNSIGNED not null auto_increment 
           ,gname varchar(50)
           ,gtype char(8) check (type in ('EXTERNAL', 'INTERNAL'))
           constraint pk_entity_id primary key (id)
           constraint fk_grant_id foreign key 
           reference tbl_fact_grant (id)
);
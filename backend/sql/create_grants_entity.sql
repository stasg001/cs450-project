create table tbl_fact_granting_entity(
            id smallint UNSIGNED
           ,name varchar(50)
           ,type char(8) check (type in ('external', 'internal'))
        constraint pk_entity_id primary key (id)
);
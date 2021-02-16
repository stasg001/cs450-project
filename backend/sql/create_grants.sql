create table tbl_fact_grants(
        id smallint UNSIGNED not null auto_increment 
       ,grant_number varchar(20)
       ,title varchar(30)
       ,source_id smallint UNSIGNED
       ,original_amt float(7,0)
       ,balance float(7,2)
       ,active varchar(7) check (active in ('PENDING','APPROVED', 'DENIED'))
       ,administrator smallint UNSIGNED
       constraint pk_grant_id primary key (id)
       constraint fk_gentity_id foreign key (source_id)
       reference tbl_fact_grant_entity (id)
);
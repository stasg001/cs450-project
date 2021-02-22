create table if not exists tbl_map_grant_users(
            id smallint UNSIGNED not null auto_increment 
           ,grant_id smallint UNSIGNED
           constraint pk_map_id primary key (id)
           constraint fk_grant_id foreign key 
           reference tbl_fact_grants (id)
);

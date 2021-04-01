CREATE TABLE IF NOT EXISTS tbl_fact_grants(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,grant_number varchar(20)
       ,title varchar(30)
       ,source_id smallint UNSIGNED
       ,original_amt float(7,0)
       ,balance float(7,2)
       ,active ENUM('PENDING', 'APPROVED', 'DENIED')
       ,administrator smallint UNSIGNED
       constraint fk_grant_id foreign key (grant_number)
         references tbl_map_grant_users (grant_id)
       constraint fk_purch_id foreign key (grant_id)
         references tbl_fact_purchases (grant_number)
        constraint fk_entity_id foreign key (id
         references tbl_fact_granting_entity (id)

);

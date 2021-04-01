CREATE TABLE IF NOT EXISTS tbl_map_grant_users(
            id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
           ,grant_id smallint UNSIGNED
           constraint fk_grant_id foreign key (id)
              references tbl_fact_users (id)
           constraint fk_grant_id foreign key (grant_id)
               references tbl_fact_grants (grant_number)
);

CREATE TABLE IF NOT EXISTS tbl_map_grant_users(
    grant_id int UNSIGNED,
    user_id int UNSIGNED,
    FOREIGN KEY (grant_id)
        REFERENCES tbl_fact_grants(id),
    FOREIGN KEY (user_id)
        REFERENCES tbl_fact_users(id)
);

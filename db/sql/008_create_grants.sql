CREATE TABLE IF NOT EXISTS tbl_fact_grants(
        id int UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        grant_number varchar(20),
        title varchar(30),
        source_id smallint UNSIGNED,
        original_amt float(7,2),
        balance float(7,2),
        status ENUM('PENDING', 'APPROVED', 'DENIED'),
        administrator_id smallint UNSIGNED,
        FOREIGN KEY (source_id)
                REFERENCES tbl_fact_granting_entity(id),
        FOREIGN KEY (administrator_id)
                REFERENCES tbl_fact_users(id)
);

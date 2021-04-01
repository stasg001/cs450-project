CREATE TABLE IF NOT EXISTS tbl_fact_grants(
        id int UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        grant_number varchar(20),
        title varchar(30),
        source_id smallint UNSIGNED,
        original_amt float(7,0),
        balance float(7,2),
        active ENUM('PENDING', 'APPROVED', 'DENIED'),
        administrator smallint UNSIGNED
);

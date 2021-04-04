CREATE TABLE IF NOT EXISTS tbl_fact_granting_entity(
            id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(50),
            type ENUM('EXTERNAL', 'INTERNAL')
);

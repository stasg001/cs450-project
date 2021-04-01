CREATE TABLE IF NOT EXISTS tbl_fact_student(
        uin smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        sname varchar(50),
        department smallint UNSIGNED,
        program ENUM('UG', 'MS', 'PHD')
);

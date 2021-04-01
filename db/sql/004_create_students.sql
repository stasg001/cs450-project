CREATE TABLE IF NOT EXISTS tbl_fact_student(
        uin smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        name varchar(50),
        department_id int UNSIGNED,
        program ENUM('UG', 'MS', 'PHD'),
        FOREIGN KEY (department_id)
                REFERENCES tbl_fact_departments(id)
);

CREATE TABLE IF NOT EXISTS tbl_fact_employment(
        id int UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        student_uin smallint UNSIGNED,
        etype ENUM('GRA', 'GTA', 'URA'),
        semester varchar(10),
        faculty_id smallint UNSIGNED,
        amount float(7,0),
        payment_type ENUM('STIPEND', 'SALARY'),
        workload smallint UNSIGNED,
        start_date date,
        end_date date,
        FOREIGN KEY (student_uin)
                REFERENCES tbl_fact_student(uin),
        FOREIGN KEY (faculty_id)
                REFERENCES tbl_fact_users(id)
);

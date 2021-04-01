CREATE TABLE IF NOT EXISTS tbl_fact_student(
        uin smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        sname varchar(50),
        department smallint UNSIGNED,
        program ENUM('UG', 'MS', 'PHD')
        constraint fk_stud_id foreign key (uin)
           references tbl_fact_employment (student_uin)
        constraint fk_stud_dpt foreign key (department)
           references tbl_fact_departments (department)
);

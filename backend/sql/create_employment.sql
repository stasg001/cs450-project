create table tbl_fact_employment(
        id smallint UNSIGNED
       ,student_uin smallint UNSIGNED
       ,_type char(3)
       ,semester varchar(10)
       ,faculty_id smallint UNSIGNED
       ,amount float(7,0)
       ,payment_type varchar(7)
       ,workload smallint UNSIGNED
       ,start_date date
       ,end_date date
    constraint pk_emplid primary key (id)

)
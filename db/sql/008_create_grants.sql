CREATE TABLE IF NOT EXISTS tbl_fact_grants(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,grant_number varchar(20)
       ,title varchar(30)
       ,source_id smallint UNSIGNED
       ,original_amt float(7,0)
       ,balance float(7,2)
       ,active varchar(7) check (active = 'PENDING' OR active = 'APPROVED' OR active = 'DENIED')
       ,administrator smallint UNSIGNED
);

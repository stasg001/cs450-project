CREATE TABLE IF NOT EXISTS tbl_fact_purchaes(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY
       ,grant_number smallint UNSIGNED
       ,pname varchar(50)
       ,qty int UNSIGNED
       ,link varchar(100)
       ,unit_cost float(7,2)
       ,total_cost float(7,2)
       ,purchaser smallint UNSIGNED
       ,order_date datetime
       ,deliver_date datetime
       ,cancel_date datetime
);

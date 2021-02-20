create table if not exists tbl_fact_purchaes(
        id smallint UNSIGNED not null auto_increment 
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
       constraint pk_purch_id primary key (id)
       constraint fk_user_id foreign key (purchaser)
       reference tbl_fact_users (id)
);
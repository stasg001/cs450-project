CREATE TABLE IF NOT EXISTS tbl_fact_purchases(
        id smallint UNSIGNED NOT NULL auto_increment PRIMARY KEY,
        grant_id int UNSIGNED,
        pname varchar(50),
        qty int UNSIGNED,
        url varchar(100),
        unit_cost float(7,2),
        total_cost float(7,2),
        purchaser_id int UNSIGNED,
        order_date datetime,
        deliver_date datetime,
        cancel_date datetime,
        FOREIGN KEY (grant_id)
                REFERENCES tbl_fact_grants(id),
        FOREIGN KEY (purchaser_id)
                REFERENCES tbl_fact_users(id)
);

SELECT table_name, column_name,
    concat(table_name,".",column_name)  NAM,
    dense_rank() over (order by table_name, table_name) table_rank,
    dense_rank() over (partition by table_name order by column_name, column_name) column_rank
FROM information_schema.columns
WHERE table_schema = 'retail_db'
group by table_name,column_name;


select count(products.product_category_id)
from products
join order_items
on products.product_category_id = order_items.order_item_product_id;


select a.table_name, a.column_name,
dense_rank() over( order by a.table_name) as table_ranks,
dense_rank() over(partition by a.table_name order by a.column_name) as column_ranks
from a 
;
select * from a;


select * from products;
select * from order_items;

SELECT 
    COLUMN_NAME,
    COUNT(*) AS table_count,
    GROUP_CONCAT(TABLE_NAME ORDER BY TABLE_NAME) AS tables_using_it
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = "retail_db"   -- ⬅ change this
GROUP BY COLUMN_NAME
HAVING COUNT(*) >= 1        -- only show columns that appear in 2+ tables
ORDER BY table_count DESC, COLUMN_NAME;

select 1.1,
count(2.1)
from 1
join 2
on 1.1 = 2.1;


SELECT t1.column1, COUNT(t2.column1)
FROM orders t1
JOIN customers t2
    ON t1.column1 = t2.column1;

/*Check Duplicates (เช็คข้อมูลซ้ำ)*/
SELECT order_id, COUNT(*) AS duplicate_count
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

/*เชคค่าว่าง แต่ว่าในตารางนี้มันmissing เพราะ เป็นออเดอร์ื canceled*/
SELECT COUNT(*) AS missing_delivery_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NULL;


/*เชคว่าค่าว่างอยู่ใน status ไหนบ้าง*/
SELECT 
    order_status, 
    COUNT(*) AS missing_delivery_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NULL
GROUP BY order_status;

SELECT *
FROM olist_orders_dataset
WHERE order_status = 'delivered' 
  AND order_delivered_customer_date IS NULL;
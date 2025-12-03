USE salesdb;
#1.STRING FUNCTION

#CONCAT() combines multiplies string into one
SELECT CONCAT(firstname," in ",country) FROM customers;
#LOWER() UPPER()
#TRIM() remove headings and railings space
#REPLACE("123-123-123","-","")
#LEN("123ABC")
#SUBSTRING(value, start, length)

#2.NUMERIC FUNCTION
#ROUND(3.1356, 2)
#ABS()

#3.DATE TIME FUNCTION
SELECT orderdate,shipdate,creationtime FROM orders;

#DAY() MONTH() YEAR()
SELECT MONTH(orders.creationtime), COUNT(*) Month_orders
FROM orders
GROUP BY MONTH(orders.creationtime);

#CAST(value AS data_type) convert to another datatype

#4.NULL FUNCTION
#ISNULL
#Limited 2 values
SELECT IFNULL(score, "N/A") FROM customers;

#COALESCE
#Unlimited values
SELECT COALESCE(customers.lastname,customers.score) FROM customers;

SELECT AVG(score) OVER() AS AVG, AVG(IFNULL(score,0)) OVER() AVG1
FROM customers;

SELECT CONCAT(customers.firstname," ",IFNULL(lastname,"")), (IFNULL(score,0)+10)
FROM customers;

#Avoid missing value in KEY

#When sorting data
SELECT IFNULL(score,0), CASE WHEN score IS NULL THEN 1 ELSE 0 END
FROM customers ORDER BY IFNULL(score,0) DESC;

#NULLIF
SELECT NULLIF(orders.sales,0)/NULLIF(orders.quantity,0) FROM orders;

#IS NULL, IS NOT NULL

#5.CASE STATEMENT
/*
 CASE
    WHEN conditional 1 THEN result
    WHEN conditional 2 THEN result
    ELSE result
 END
 */
SELECT CASE
    WHEN customers.score > 500 THEN "High"
    WHEN score > 200 THEN "Medium"
    ELSE "Normal"
    END
FROM customers;

SELECT DISTINCT A.category, SUM(IFNULL(B.sales,0)) AS Sale_categories
FROM products AS A
    LEFT JOIN orders AS B ON B.productid = A.productid
GROUP BY A.category;

SELECT A.product, A.category, IFNULL(B.sales,0) AS sale , CASE
    WHEN IFNULL(B.sales,0) > 50 THEN "High"
    WHEN IFNULL(B.sales,0) > 20 THEN "Medium"
    ELSE "Low"
END AS level
FROM products AS A
LEFT JOIN orders AS B ON B.productid = A.productid;

SELECT os.category, SUM(IFNULL(os.sales,0))
FROM (
    SELECT sales, CASE
        WHEN IFNULL(sales,0) > 50 THEN "High"
        WHEN IFNULL(sales,0) > 20 THEN "Medium"
        ELSE "Low"
    END AS category
    FROM orders
     ) as os
GROUP BY category;
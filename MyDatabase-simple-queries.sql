USE MyDatabase;

SELECT * FROM customers WHERE score > 0;
#1.ORDER BY
SELECT * FROM customers ORDER BY country ASC,score DESC ;
#2.GROUP BY
/* combines rows with same value
   aggregates columns by another columns

   columns in SELECT must be in GROUP BY
`  should not include unique value for GROUP BY


*/
SELECT
    country, #Category
    SUM(customers.score) AS Country_tolal_spent, #Aggregation
    COUNT(id) AS Customer_in_coutry
FROM customers
GROUP BY country; #Merge duplicate row same categories value into single one

#3.HAVING
/*
 Filter data after aggregations
 Can be used only after GROUP BY
 Eg. GROUP BY ... HAVING ...
 */
SELECT country, SUM(score)
FROM customers
GROUP BY country
HAVING SUM(score) > 800; #Using with aggregations

/*
 WHERE is executing before aggregations
 HAVING is executing after aggregations

 */
SELECT country, SUM(score)
FROM customers
WHERE score > 400 #Executing first (before aggregations)
GROUP BY country #Aggregations happens
HAVING SUM(score) > 800; #Executing lastest (after aggregations)

SELECT country, AVG(score)
FROM customers
WHERE score > 0
GROUP BY country
HAVING AVG(score) > 430;

#4.DISTINCT
/*
 Each row have unique value
 Should not use if not specific problem -> Slow query
 */
SELECT DISTINCT country
FROM customers;

#5.TOP, LIMIT
/*
 In MSSQL-server SELECT TOP 3 * FROM ...
 */
SELECT * FROM customers ORDER BY customers.score DESC LIMIT 2;

SELECT * FROM orders ORDER BY order_date DESC LIMIT 2;

#6.Compare Executing SQL and Coding SQL order
/* Coding
 SELECT DISTINCT col1, SUM(col2)
 FROM ...
 WHERE ...
 ORDER BY col1
 HAVING SUM(col2) ...
 ORDER BY ... ASC/DESC
 LIMIT ...
 */

/* Executing
 SELECT
 FROM
 WHERE
 GROUP BY
 HAVING
 SELECT DISTINCT
 ORDER BY
 LIMIT
 */
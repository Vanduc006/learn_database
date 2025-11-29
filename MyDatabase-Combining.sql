/*
 Joining data

 With columns using JOIN
 With rows using SET operators
 */

 /*
  Using JOIN for
    Combining data to big
    Get extra data
    Filtering, checking for exists
  */

#1.NO JOIN
#Return data from 2 tables without combine
SELECT * FROM customers;
SELECT * FROM orders;

#2.INNER JOIN
#Return combining data that matching condition
SELECT A.id, A.first_name, B.order_id, B.sales
FROM customers AS A INNER JOIN orders AS B ON A.id = B.customer_id;

#3.LEFT JOIN
#Return rows in table left and only matching right
SELECT A.id, A.first_name, B.order_id, B.sales
FROM customers AS A LEFT JOIN orders AS B ON A.id = B.customer_id;
SELECT B.id, B.first_name, A.order_id, A.sales
FROM orders AS A LEFT JOIN customers AS B
ON B.id = A.customer_id;

#4.RIGTH JOIN
SELECT A.id, A.first_name, B.order_id, B.sales
FROM customers AS A RIGHT JOIN orders AS B ON A.id = B.customer_id;

#4.FULL JOIN
# SELECT *
# FROM customers AS A JOIN orders AS B ON A.id = B.customer_id;

#5.LEFT ANTI JOIN & RIGHT ANTI JOIN
#Return rows in table left and only not matching right
SELECT A.id, A.first_name, B.order_id, B.sales
FROM customers AS A LEFT JOIN orders AS B ON A.id = B.customer_id
WHERE B.customer_id IS NULL ;

#6.FULL ANTI JOIN
# SELECT *
# FROM customers AS A JOIN orders AS B ON A.id = B.customer_id
# WHERE B.customer_id IS NULL
# OR A.id IS NULL;

#7.CROSS JOIN
#Return combine all row of left and right (A X B)
SELECT *
FROM customers AS A CROSS JOIN orders AS B;

USE salesdb;
SELECT A.orderid, B.firstname, C.product, D.firstname
FROM orders AS A
LEFT JOIN customers AS B ON A.customerid = B.customerid
LEFT JOIN products AS C ON A.productid = C.productid
LEFT JOIN employees AS D ON A.salespersonid = D.employeeid;


#8.UNION
#Get both data from 2 queries exclude duplicates
SELECT A.firstname, A.lastname
FROM customers AS A
UNION
SELECT B.firstname,B.lastname
FROM employees AS B;

#Get both data from 2 queries include duplicates
SELECT A.firstname, A.lastname
FROM customers AS A
UNION ALL
SELECT B.firstname,B.lastname
FROM employees AS B;

#9.EXCEPT
#Get data from query 1 that unique, not in queries 2
SELECT A.firstname, A.lastname
FROM customers AS A
EXCEPT
SELECT B.firstname,B.lastname
FROM employees AS B;

#10.INTERSECT
#Get data that in both queries
SELECT A.firstname, A.lastname
FROM customers AS A
INTERSECT
SELECT B.firstname,B.lastname
FROM employees AS B;

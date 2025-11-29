/*
 Operators
 =
 != <>
 <=
 >=
 <
 >
 */

/*
 Logical AND, OR, NOT
 Range BETWEEN
 Membership IN, NOT IN
 Search LIKE
*/

#1.BETWEEN
#Check if value within range
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;
#2.IN & NOT IN
SELECT *
FROM customers
WHERE country IN ("VietNam","UK");

#3.LIKE
#Regex ?
SELECT *
FROM customers
WHERE country LIKE "%M";
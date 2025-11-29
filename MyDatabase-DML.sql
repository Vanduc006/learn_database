#Data Manipulation Language
USE MyDatabase;

#1.INSERT
/*
 If no columns are specific SQL expects value of all columns
 Match number of columns and values
 */
INSERT INTO customers (id, first_name, country, score)
VALUES (6,"Duc","VietNam","555"),
       (7,"Tan","VietNam","555");

#2.INSERT using SELECT
#Copy from table into table
INSERT INTO persons (id, person_name, birth_data, email)
SELECT
        id,
       first_name,
       NULL,
       "Unknown"
FROM customers;

#3.UPDATE
/*
 always using WHERE
 */
UPDATE persons
SET person_name = "ChaoChao",
    email = "bear"
WHERE id = 1;

UPDATE customers
SET score = 0
WHERE score IS NULL;

#4.DELETE & TRUNCATE
DELETE FROM persons WHERE email = "Unknown";
DELETE FROM persons;

/*
 Compare DELETE and TRUNCATE

 DELETE removed all rows if not have WHERE
    DELETE will logging and checking each row
    Logging each row in transaction_log -> So next row will the last id + 1

 TRUNCATE removed delete whole table without logging or checking
    Can only executing with table
    TRUNCATE delete both rows and transaction_log
    CAN not using when table have references (FK) to another table
 TRUNCATE faster than DELETE
 */

 /*
  In short if we want delete whole data in table
  DELETE will keep trasaction_log, the next id n+1
  TRUNCATE remove transaction_log, the next id n
  */
 TRUNCATE TABLE persons;
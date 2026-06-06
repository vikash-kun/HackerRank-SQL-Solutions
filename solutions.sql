/* Q1- Query all columns for all American cities in the CITY table with populations larger than 100000. 
The CountryCode for America is USA.*/

/* solution */ 

select * from city where COUNTRYCODE = 'USA' AND POPULATION > 100000;



/* Q2- Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
The CountryCode for America is USA.*/

/* solution */ 

SELECT NAME from city where COUNTRYCODE = 'USA' AND POPULATION > 120000;



/* Q3- Query all columns (attributes) for every row in the CITY table.*/


/* solution */ 

SELECT * FROM CITY;



/* Q4-Query all columns for a city in CITY with the ID 1661. */


/* solution */ 

SELECT * FROM CITY WHERE ID = 1661;



/* Q5-Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.*/


/* solution*/

SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';


/* Q6-Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.*/


/*solution*/

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';




/* Q7-Query a list of CITY and STATE from the STATION table.*/


/*solution*/

SELECT CITY , STATE FROM STATION;



/* Q8-Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.*/


/*solution*/

SELECT  DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0;



/* Q9-Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/


/*solution*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;



/* Q10 - Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/


/* solution */

SELECT CITY, LENGTH(CITY) FROM (
  SELECT CITY, ROW_NUMBER() OVER (ORDER BY LENGTH(CITY) ASC, CITY ASC) AS RN
  FROM STATION
) WHERE RN = 1

UNION

SELECT CITY, LENGTH(CITY) FROM (
  SELECT CITY, ROW_NUMBER() OVER (ORDER BY LENGTH(CITY) DESC, CITY ASC) AS RN
  FROM STATION
) WHERE RN = 1;



/* Q11 -Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.*/



/* solution*/

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE 'A%' 
   OR CITY LIKE 'E%' 
   OR CITY LIKE 'I%' 
   OR CITY LIKE 'O%' 
   OR CITY LIKE 'U%'
   OR CITY LIKE 'a%' 
   OR CITY LIKE 'e%' 
   OR CITY LIKE 'i%' 
   OR CITY LIKE 'o%' 
   OR CITY LIKE 'u%';




/* Q12- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/


/*solution*/


SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE '%a'
   OR CITY LIKE '%e' 
   OR CITY LIKE '%i' 
   OR CITY LIKE '%o' 
   OR CITY LIKE '%u';




/* Q13-Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/


/*solution*/


SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a','e','i','o','u')
  AND LOWER(RIGHT(CITY,1)) IN ('a','e','i','o','u');




/* Q14- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates*/


/*solution*/


SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) not in ('a','e','i','o','u');




/* Q15-Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.*/


/*solution*/


SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(RIGHT(CITY,1)) not in ('a','e','i','o','u');




/*Q16-Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.*/


/*solution*/


SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) not IN  ('a','e','i','o','u')
  or LOWER(RIGHT(CITY,1))  not IN ('a','e','i','o','u');

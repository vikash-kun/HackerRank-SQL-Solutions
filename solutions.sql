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




  /*Q17-Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.*/


  /*solution*/


 SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) not IN  ('a','e','i','o','u')
  and LOWER(RIGHT(CITY,1))  not IN ('a','e','i','o','u');




  /*Q18Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/


 /*solution*/


select name from students where marks > 75
order by right (Name, 3), ID ASC;




/*Q19-Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.*/


/*solution*/


SELECT name from Employee
order by name ;




/*Q20-Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.*/


/*solution*/


SELECT name from Employee where salary >2000 and months < 10 order by employee_id;




/*Q21-Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.*/


/*solution*/


SELECT 
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A 
            THEN 'Not A Triangle'
        WHEN A = B AND B = C 
            THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C 
            THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM TRIANGLES;




/*Q22-Query a count of the number of cities in CITY having a Population larger than 100,000 .*/


/*solution*/


SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;




/*Q23-Query the total population of all cities in CITY where District is California.*/


/*solution*/


SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';




/*Q24-Query the average population of all cities in CITY where District is California.*/


/*solution*/


SELECT avg(POPULATION) 
FROM CITY
WHERE DISTRICT = 'California';




/*Q25-Query the average population for all cities in CITY, rounded down to the nearest integer.*/


/*solution*/


select avg(Population) from city;




/*Q26-Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.*/


/*solution*/


SELECT SUM(population) FROM city WHERE countrycode = 'JPN';




/*Q27-Query the difference between the maximum and minimum populations in CITY.*/


/*solution*/


SELECT Max(population) - min (population) from city;




/*Q-28-We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.


/*solution*/


SELECT 
    months * salary,
    COUNT(*) 
FROM Employee
GROUP BY months * salary
ORDER BY months * salary DESC
LIMIT 1;




/*Q29-Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.*/


/*solution*/


select cast(round(sum(lat_n),2) as numeric(7,2)),
       cast(round(sum(long_w),2) as numeric(7,2))
from station;

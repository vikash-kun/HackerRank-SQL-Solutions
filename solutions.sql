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

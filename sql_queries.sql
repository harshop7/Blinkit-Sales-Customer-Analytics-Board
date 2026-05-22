/* =========================================
   BLINKIT SALES ANALYSIS PROJECT
========================================= */

CREATE DATABASE blinkitdb;

USE blinkitdb;


/* =========================================
   CHECK DATA
========================================= */

SELECT *
FROM blinkit_sales_dataset
LIMIT 10;

SELECT COUNT(*) AS Total_Records
FROM blinkit_sales_dataset;


/* =========================================
   DATA CLEANING
========================================= */

UPDATE blinkit_sales_dataset
SET `Item Fat Content` = 'Low Fat'
WHERE `Item Fat Content` IN ('LF','low fat');

UPDATE blinkit_sales_dataset
SET `Item Fat Content` = 'Regular'
WHERE `Item Fat Content` = 'reg';


/* CHECK UNIQUE VALUES */

SELECT DISTINCT `Item Fat Content`
FROM blinkit_sales_dataset;


/* =========================================
   KPI ANALYSIS
========================================= */

/* Total Sales */

SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset;


/* Average Sales */

SELECT
ROUND(AVG(Sales),2) AS Average_Sales
FROM blinkit_sales_dataset;


/* Total Items */

SELECT
COUNT(*) AS Total_Items
FROM blinkit_sales_dataset;


/* Average Rating */

SELECT
ROUND(AVG(Rating),2) AS Average_Rating
FROM blinkit_sales_dataset;


/* =========================================
   SALES ANALYSIS
========================================= */

/* Sales By Fat Content */

SELECT
`Item Fat Content`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Item Fat Content`
ORDER BY Total_Sales DESC;


/* Sales By Item Type */

SELECT
`Item Type`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Item Type`
ORDER BY Total_Sales DESC;


/* Sales By Outlet Size */

SELECT
`Outlet Size`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Outlet Size`
ORDER BY Total_Sales DESC;


/* Sales By Outlet Location */

SELECT
`Outlet Location Type`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Outlet Location Type`
ORDER BY Total_Sales DESC;


/* Outlet Establishment Analysis */

SELECT
`Outlet Establishment Year`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;


/* =========================================
   PRODUCT ANALYSIS
========================================= */

/* Top 5 Selling Item Types */

SELECT
`Item Type`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM blinkit_sales_dataset
GROUP BY `Item Type`
ORDER BY Total_Sales DESC
LIMIT 5;


/* Average Rating By Item Type */

SELECT
`Item Type`,
ROUND(AVG(Rating),2) AS Average_Rating
FROM blinkit_sales_dataset
GROUP BY `Item Type`
ORDER BY Average_Rating DESC;


/* Outlet Type Analysis */

SELECT
`Outlet Type`,
COUNT(*) AS Number_Of_Items,
ROUND(AVG(Sales),2) AS Average_Sales
FROM blinkit_sales_dataset
GROUP BY `Outlet Type`
ORDER BY Average_Sales DESC;


/* Highest Visibility Products */

SELECT
`Item Identifier`,
`Item Type`,
`Item Visibility`
FROM blinkit_sales_dataset
ORDER BY `Item Visibility` DESC
LIMIT 10;


/* Average Item Weight */

SELECT
`Item Type`,
ROUND(AVG(`Item Weight`),2) AS Average_Weight
FROM blinkit_sales_dataset
GROUP BY `Item Type`
ORDER BY Average_Weight DESC;


/* =========================================
   END OF PROJECT
========================================= */
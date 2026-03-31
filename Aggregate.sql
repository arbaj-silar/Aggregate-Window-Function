USE MyDatabase

/*		Aggregation   &   Analytical   Functions		*/

/*	Aggregation	 Functions	*/

	--	COUNT,	SUM,  MAX,  MIN,  AVG

SELECT 
	COUNT(*) AS total_order,
	SUM(sales) AS total_sales,
	AVG(sales) AS Avg_salse,
	MIN(sales) AS min_sales,
	MAX(sales) AS max_sales
FROM orders

/*	Window Function	*/

USE SalesDB

SELECT
	productID,
	SUM(Sales) AS total_sales
FROM Sales.Orders
GROUP BY ProductID

SELECT 
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) total_order
FROM Sales.Orders
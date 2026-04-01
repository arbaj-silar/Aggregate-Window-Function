/*	Window Aggregate Functions	*/

USE SalesDB

SELECT
	OrderID,
	OrderDate,
	CustomerID,
	COUNT(*) OVER () ToatalOrders,
	COUNT(*) OVER (PARTITION BY CustomerID)
FROM Sales.Orders

SELECT 
	*,
	COUNT(*) OVER () total_cust,
	COUNT(1) OVER () total_cust1,
	COUNT(Score) OVER() total_score
FROM Sales.Customers
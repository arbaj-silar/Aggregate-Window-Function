USE SalesDB

/*	Window Function	*/ 

	--	OVER(PARTITON BY ____)

SELECT
	OrderDate,
	MONTH(OrderDate),
	SUM(Sales) OVER(PARTITION BY MONTH(OrderDate))
FROM Sales.Orders


SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS By_ProductID,
	SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus)
FROM Sales.Orders


SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	RANK() OVER(ORDER BY Sales ASC) AS By_ProductID
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
					ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) TatalSales
FROM Sales.Orders
USE SalesDB

/*		Window Value	*/

	-- LEAD,	LAG

SELECT *,
	Total_Sales - PreviousMonthSales AS MoM_change,
	ROUND(CAST((Total_Sales - PreviousMonthSales) AS FLOAT) / PreviousMonthSales * 100, 2)
FROM (
	SELECT 
		MONTH(OrderDate) Order_Month,
		SUM(Sales) Total_Sales,
		LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousMonthSales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
)t


SELECT *,
	nextMonthSales - Total_Sales AS MoM_change,
	ROUND(CAST((nextMonthSales - Total_Sales) AS FLOAT) / nextMonthSales * 100, 2) Per_MonthProfit
FROM (
	SELECT 
		MONTH(OrderDate) Order_Month,
		SUM(Sales) Total_Sales,
		LEAD(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) nextMonthSales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
)t
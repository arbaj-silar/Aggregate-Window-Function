USE SalesDB

/*	Window	Ranking	Function	*/

	--	ROW_NUMBER,	RANK, DENSE_RaNK

SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER (ORDER BY Sales DESC) RowRank_Sales
FROM Sales.Orders

SELECT 
	OrderID,
	ProductID,
	Sales,
	RANK() OVER (ORDER BY Sales DESC) Rank_Sales,
	DENSE_RANK() OVER(ORDER BY Sales DESC) DenseRank_sales
FROM Sales.Orders

SELECT *
FROM (
	SELECT 
		OrderID,
		ProductID,
		Sales,
		ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
	FROM Sales.Orders
)t WHERE RankByProduct = 1

SELECT *
FROM (
	SELECT 
		CustomerID,
		SUM(Sales) TotalSales,
		ROW_NUMBER() OVER (ORDER BY SUM(Sales) ASC) RankOfTotal_Sales
	FROM Sales.Orders
	GROUP  BY CustomerID
)t WHERE RankOfTotal_Sales <= 2;

SELECT * 
FROM (
	SELECT 
		ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY Sales DESC) Rank_SalesBYOrderID,
		*
	FROM Sales.Orders
)t WHERE Rank_SalesBYOrderID = 1
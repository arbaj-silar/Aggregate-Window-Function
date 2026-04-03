USE SalesDB

	-- NTILE


SELECT 
	OrderID,
	ProductID,
	Sales,
	NTILE(2) OVER (ORDER BY Sales DESC) OneBucket,
	NTILE(1) OVER (ORDER BY Sales DESC) TwoBucket,
	NTILE(3) OVER (ORDER BY Sales DESC) ThreeBucket,
	NTILE(4) OVER (ORDER BY Sales DESC) FourBucket
FROM Sales.Orders

SELECT *,
	CASE 
		WHEN Bucket = 1 THEN 'High'
		WHEN Bucket = 2 THEN 'Medium'
		ELSE 'Low'
	END SalesSegment
	FROM (
SELECT 
	OrderID,
	ProductID,
	Sales,
	NTILE(3) OVER (ORDER BY Sales DESC) Bucket
FROM Sales.Orders
)t

	--	CUME_DIST,	PERCENT_RANK


SELECT 
	Product,
	Price,
	CUME_DIST() OVER(ORDER BY Price DESC) Order_Price,
	PERCENT_RANK() OVER(ORDER BY price DESC) Order_Per
FROM Sales.Products
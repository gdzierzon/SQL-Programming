USE Northwind
GO

SELECT ProductName
	, UnitPrice
FROM dbo.Products
WHERE UnitPrice BETWEEN 20 AND 30
ORDER BY UnitPrice  

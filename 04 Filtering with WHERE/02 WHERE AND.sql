USE Northwind
GO

SELECT ProductName
	, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 20
	AND UnitPrice < 30
ORDER BY UnitPrice  

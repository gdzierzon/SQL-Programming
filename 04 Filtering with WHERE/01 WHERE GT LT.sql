USE Northwind
GO

SELECT ProductName
	, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 20
ORDER BY UnitPrice DESC 

SELECT ProductName
	, UnitPrice
FROM dbo.Products
WHERE UnitPrice <= 20
ORDER BY UnitPrice DESC 
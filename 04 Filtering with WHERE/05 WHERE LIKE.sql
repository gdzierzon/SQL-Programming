USE Northwind
GO

SELECT CompanyName
	, Country
	, City
FROM dbo.Customers
WHERE CompanyName LIKE 'A%'

SELECT ProductName
FROM dbo.Products
WHERE ProductName LIKE '%hot%'

USE Northwind
GO

SELECT CompanyName
	, Country
	, City
FROM dbo.Customers
WHERE Country IN('USA', 'Germany')

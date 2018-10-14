USE Northwind
GO

SELECT CompanyName
	, Country
	, City
	, PostalCode
FROM dbo.Customers
WHERE PostalCode IS NULL

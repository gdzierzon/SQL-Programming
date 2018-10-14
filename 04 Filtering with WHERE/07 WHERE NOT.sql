USE Northwind
GO

SELECT CompanyName
	, Country
	, City
	, PostalCode
FROM dbo.Customers
WHERE PostalCode IS NOT NULL


SELECT CompanyName
	, Country
	, City
	, PostalCode
FROM dbo.Customers
WHERE NOT(PostalCode IS NULL)

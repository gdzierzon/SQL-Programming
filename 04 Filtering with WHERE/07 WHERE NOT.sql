USE Northwind
GO

SELECT CompanyName
	, Country
	, City
	, PostalCode
FROM Customers
WHERE PostalCode IS NOT NULL

SELECT c.CompanyName
	, c.Country
	, c.City
	, c.PostalCode
FROM Customers AS c
WHERE NOT(c.PostalCode IS NULL)
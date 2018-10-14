USE Northwind
GO

SELECT Country
	, CompanyName
	, ContactName
	, Phone
FROM dbo.Customers
WHERE Country = 'USA'
ORDER BY CompanyName
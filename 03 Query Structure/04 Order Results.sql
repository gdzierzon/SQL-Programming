USE Northwind
GO

SELECT Country
	, CompanyName
	, ContactName
	, Phone
FROM dbo.Customers
ORDER BY Country
	, CompanyName
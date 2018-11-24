SELECT FirstName
	, LastName
	, City
FROM dbo.Customer
WHERE City IN('Las Vegas', 'Chicago')

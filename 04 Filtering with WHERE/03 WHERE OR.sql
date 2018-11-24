SELECT Title
	, Price
FROM dbo.Book
WHERE Price < 25
	OR Price > 45
ORDER BY Price

SELECT FirstName
	, LastName
	, City
FROM dbo.Customer
WHERE City = 'Las Vegas'
		OR City = 'Chicago')

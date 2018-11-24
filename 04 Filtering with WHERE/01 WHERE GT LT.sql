SELECT Title
	, Price
FROM dbo.Book
WHERE Price > 30
ORDER BY Price DESC

SELECT Title
	, Price
FROM dbo.Book
WHERE Price <= 30
ORDER BY Price DESC
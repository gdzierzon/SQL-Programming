SELECT Title
	, Price
FROM dbo.Book
WHERE Price > 25
	AND Price < 26.1
ORDER BY Price

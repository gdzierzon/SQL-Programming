SELECT *
FROM dbo.Customer
WHERE MiddleInitial IS NOT NULL

SELECT Title
	, Price
FROM dbo.Book
WHERE NOT (
      Price < 25
      OR Price > 45
    )
ORDER BY Price
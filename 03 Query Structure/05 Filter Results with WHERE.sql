SELECT CustomerId
  , FirstName
	, MiddleInitial
  , LastName
  , Email
FROM dbo.Customer
WHERE MiddleInitial IS NOT NULL
ORDER BY LastName
	, FirstName
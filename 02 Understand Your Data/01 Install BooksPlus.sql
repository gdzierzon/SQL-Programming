CREATE DATABASE [BooksPlus]
GO

USE [BooksPlus]
GO

CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeId] [int] NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[City] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
	(
		[AddressId] ASC
	)
)
GO

CREATE TABLE [dbo].[AddressType](
	[AddressTypeId] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
	(
		[AddressTypeId] ASC
	)
)
GO

CREATE TABLE [dbo].[Author](
	[AuthorId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[AddressId] [int] NOT NULL,
	CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
	(
		[AuthorId] ASC
	)
)
GO

CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[BookTypeId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Summary] [nvarchar](4000) NOT NULL,
	[Price] [decimal](5, 2) NOT NULL,
	[ISBN] [nchar](13) NULL,
	[UnitsInStock] [int] NULL,
	[ReorderLevel] [int] NULL,
	[UnitsOnOrder] [int] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
	(
		[BookId] ASC
	)
)
GO

CREATE TABLE [dbo].[BookAuthor](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[RoyaltyPercentage] [decimal](3, 2) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
	(
		[BookId] ASC,
		[AuthorId] ASC
	)
) 
GO

CREATE TABLE [dbo].[BookTag](
	[BookId] [int] NOT NULL,
	[Tag] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_BookTag_1] PRIMARY KEY CLUSTERED 
	(
		[BookId] ASC,
		[Tag] ASC
	)
)
GO

CREATE TABLE [dbo].[BookType](
	[BookTypeId] [int] NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_BookType] PRIMARY KEY CLUSTERED 
	(
		[BookTypeId] ASC
	)
)
GO

CREATE TABLE [dbo].[Carrier](
	[CarrierId] [int] NOT NULL,
	[CarrierName] [nvarchar](100) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Carrier] PRIMARY KEY CLUSTERED 
	(
		[CarrierId] ASC
	)
)
GO

CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
	(
		[CategoryId] ASC
	)
)
GO

CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[CountryCode] [nvarchar](5) NOT NULL,
	[CountryName] [nvarchar](255) NOT NULL,
	[Currency] [nvarchar](100) NOT NULL,
	[CurrencyCode] [nvarchar](5) NOT NULL,
	[CurrencySymbol] [nvarchar](5) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED
	(
		[CountryId] ASC
	)
)
GO

CREATE TABLE [dbo].[Customer](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[ShippingAddressId] [int] NULL,
	[BillingAddressId] [int] NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleInitial] [nchar](1) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
	(
		[CustomerId] ASC
	)
)
GO

CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
	(
		[DepartmentId] ASC
	)
)
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[ManagerId] [int] NULL,
	[DepartmentId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[JobTitle] [nvarchar](100) NOT NULL,
	[Salary] [money] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
	(
		[EmployeeId] ASC
	)
)
GO

CREATE TABLE [dbo].[Order](
	[OrderId] [bigint] IDENTITY(1001,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[StoreId] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[OrderStatusId] [int] NOT NULL,
	[ShippingAddressID] [int] NULL,
	[BillingAddressId] [int] NOT NULL,
	[CarrierId] [int] NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShipDate] [datetime2](7) NULL,
	[SubTotal] [money] NOT NULL,
	[Discount] [money] NOT NULL,
	[Tax] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[OrderTotal] [money] NOT NULL,
	[Notes] [nvarchar](4000) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
	(
		[OrderId] ASC
	)
)
GO

CREATE TABLE [dbo].[OrderLineItem](
	[OrderLineItemId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[BookId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceDiscount] [money] NOT NULL,
	[LineTotal] [decimal](10, 2) NOT NULL,
	[TrackingNumber] [nvarchar](25) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_OrderLineItem] PRIMARY KEY CLUSTERED 
	(
		[OrderLineItemId] ASC
	)
)
GO

CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusId] [int] NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
	CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
	(
		[OrderStatusId] ASC
	)
)
GO

CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](255) NOT NULL,
	[AddressId] [int] NULL,
	[PhoneId] [int] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
	(
		[PublisherId] ASC
	)
)
GO

CREATE TABLE [dbo].[PublisherAuthor](
	[PublisherId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	CONSTRAINT [PK_PublisherAuthor] PRIMARY KEY CLUSTERED 
	(
		[PublisherId] ASC,
		[AuthorId] ASC
	)
)
GO

CREATE TABLE [dbo].[Region](
	[RegionId] [int] NOT NULL,
	[RegionName] [nvarchar](100) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
	(
		[RegionId] ASC
	)
)
GO

CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nchar](5) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
	(
		[StateId] ASC
	)
)
GO

CREATE TABLE [dbo].[Store](
	[StoreId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
	(
		[StoreId] ASC
	)
)
GO

ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AddressType] ADD  CONSTRAINT [DF_AddressType_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[BookAuthor] ADD  CONSTRAINT [DF_BookAuthor_RoyaltyPercentage]  DEFAULT ((1.00)) FOR [RoyaltyPercentage]
GO
ALTER TABLE [dbo].[BookAuthor] ADD  CONSTRAINT [DF_BookAuthor_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Carrier] ADD  CONSTRAINT [DF_Carrier_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_MadifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DiscountTotal]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Tax]  DEFAULT ((0.00)) FOR [Tax]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingTotal]  DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[OrderLineItem] ADD  CONSTRAINT [DF_OrderLineItem_Price]  DEFAULT ((0.00)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderLineItem] ADD  CONSTRAINT [DF_OrderLineItem_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderLineItem] ADD  CONSTRAINT [DF_OrderLineItem_Discount]  DEFAULT ((0.00)) FOR [UnitPriceDiscount]
GO
ALTER TABLE [dbo].[OrderLineItem] ADD  CONSTRAINT [DF_OrderLineItem_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Publisher] ADD  CONSTRAINT [DF_Publisher_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Region] ADD  CONSTRAINT [DF_Region_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsOnline]  DEFAULT ((0)) FOR [Url]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_ModifiedDate]  DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AddressType]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_State]
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_Address]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookType] FOREIGN KEY([BookTypeId])
REFERENCES [dbo].[BookType] ([BookTypeId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookType]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Author]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Book]
GO
ALTER TABLE [dbo].[BookTag]  WITH CHECK ADD  CONSTRAINT [FK_BookTag_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[BookTag] CHECK CONSTRAINT [FK_BookTag_Book]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address] FOREIGN KEY([ShippingAddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Store]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Carrier] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carrier] ([CarrierId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Carrier]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Store]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineItem_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [FK_OrderLineItem_Book]
GO
ALTER TABLE [dbo].[OrderLineItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderLineItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderLineItem] CHECK CONSTRAINT [FK_OrderLineItem_Order]
GO
ALTER TABLE [dbo].[Publisher]  WITH CHECK ADD  CONSTRAINT [FK_Publisher_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Publisher] CHECK CONSTRAINT [FK_Publisher_Address]
GO
ALTER TABLE [dbo].[PublisherAuthor]  WITH CHECK ADD  CONSTRAINT [FK_PublisherAuthor_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[PublisherAuthor] CHECK CONSTRAINT [FK_PublisherAuthor_Author]
GO
ALTER TABLE [dbo].[PublisherAuthor]  WITH CHECK ADD  CONSTRAINT [FK_PublisherAuthor_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[PublisherAuthor] CHECK CONSTRAINT [FK_PublisherAuthor_Publisher]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country1] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country1]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Region]
GO

/***********************************************/
/*********  Insert Helper Data   ***************/
/***********************************************/

-- AddressType
INSERT INTO AddressType (AddressTypeId, TypeName)
VALUES (1, 'Shipping')
	, (2, 'Billing')

--BookType
INSERT INTO BookType (BookTypeId, TypeName)
VALUES (1, 'Print')
	, (2, 'Audio')
	, (3, 'Video')

--Carriers
INSERT INTO Carrier (CarrierId, CarrierName)
VALUES (1, 'USPS')
	, (2, 'UPS')
	, (3, 'FedEx')
	, (4, 'DHL')

--Category
INSERT INTO Category (CategoryName)
VALUES ('Networking')
	, ('Programming')
	, ('Data Science')
	, ('Business')
	, ('Science Fiction')
	, ('Fiction')
	, ('Drama')
	, ('Graphic Design')
	, ('Art')
	, ('Wood Working')

--Country
INSERT INTO Country (CountryId, CountryCode, CountryName, Currency, CurrencyCode, CurrencySymbol)
VALUES (1, 'AF', 'Afghanistan', 'Afghani', 'AFN', N'؋')
,(2, 'AL', 'Albania', 'Lek', 'ALL', N'Lek')
,(3, 'AR', 'Argentina', 'Peso', 'ARS', N'$')
,(4, 'AW', 'Aruba', 'Guilder', 'AWG', N'ƒ')
,(5, 'AU', 'Australia', 'Dollar', 'AUD', N'$')
,(6, 'AT', 'Austria', 'Euro', 'EUR', N'€')
,(7, 'AZ', 'Azerbaijan', 'Manat', 'AZN', N'₼')
,(8, 'BS', 'Bahamas', 'Dollar', 'BSD', N'$')
,(9, 'BB', 'Barbados', 'Dollar', 'BBD', N'$')
,(10, 'BY', 'Belarus', 'Ruble', 'BYR', N'p.')
,(11, 'BE', 'Belgium', 'Euro', 'EUR', N'€')
,(12, 'BZ', 'Belize', 'Dollar', 'BZD', N'BZ$')
,(13, 'BM', 'Bermuda', 'Dollar', 'BMD', N'$')
,(14, 'BO', 'Bolivia', 'Boliviano', 'BOB', N'$b')
,(15, 'BA', 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', N'KM')
,(16, 'BW', 'Botswana', 'Pula', 'BWP', N'P')
,(17, 'BR', 'Brazil', 'Real', 'BRL', N'R$')
,(18, 'BN', 'Brunei Darussalam', 'Darussalam Dollar', 'BND', N'$')
,(19, 'BG', 'Bulgaria', 'Lev', 'BGN', N'лв')
,(20, 'KH', 'Cambodia', 'Riel', 'KHR', N'៛')
,(21, 'CA', 'Canada', 'Dollar', 'CAD', N'$')
,(22, 'KY', 'Cayman Islands', 'Dollar', 'KYD', N'$')
,(23, 'CL', 'Chile', 'Peso', 'CLP', N'$')
,(24, 'CN', 'China', 'Yuan Renminbi', 'CNY', N'¥')
,(25, 'CO', 'Colombia', 'Peso', 'COP', N'$')
,(26, 'CR', 'Costa Rica', 'Colon', 'CRC', N'₡')
,(27, 'HR', 'Croatia', 'Kuna', 'HRK', N'kn')
,(28, 'CU', 'Cuba', 'Peso', 'CUP', N'₱')
,(29, 'CY', 'Cyprus', 'Euro', 'EUR', N'€')
,(30, 'CZ', 'Czech Republic', 'Koruna', 'CZK', N'Kč')
,(31, 'DK', 'Denmark', 'Krone', 'DKK', N'kr')
,(32, 'DO', 'Dominican Republic', 'Peso', 'DOP', N'RD$')
,(33, 'EG', 'Egypt', 'Pound', 'EGP', N'£')
,(34, 'SV', 'El Salvador', 'Colon', 'SVC', N'$')
,(35, 'EE', 'Estonia', 'Kroon', 'EEK', N'kr')
,(36, 'FK', 'Falkland Islands', 'Pound', 'FKP', N'£')
,(37, 'FJ', 'Fiji', 'Dollar', 'FJD', N'$')
,(38, 'FI', 'Finland', 'Euro', 'EUR', N'€')
,(39, 'FR', 'France', 'Euro', 'EUR', N'€')
,(40, 'GE', 'Georgia', 'Lari', 'GEL', N'₾')
,(41, 'DE', 'Germany', 'Euro', 'EUR', N'€')
,(42, 'GH', 'Ghana', 'Cedis', 'GHC', N'¢')
,(43, 'GI', 'Gibraltar', 'Pound', 'GIP', N'£')
,(44, 'GR', 'Greece', 'Euro', 'EUR', N'€')
,(45, 'GT', 'Guatemala', 'Quetzal', 'GTQ', N'Q')
,(46, 'GY', 'Guyana', 'Dollar', 'GYD', N'$')
,(47, 'HN', 'Honduras', 'Lempira', 'HNL', N'L')
,(48, 'HK', 'Hong Kong', 'Dollar', 'HKD', N'$')
,(49, 'HU', 'Hungary', 'Forint', 'HUF', N'Ft')
,(50, 'IS', 'Iceland', 'Krona', 'ISK', N'kr')
,(51, 'IN', 'India', 'Rupee', 'INR', N'₹')
,(52, 'ID', 'Indonesia', 'Rupiah', 'IDR', N'Rp')
,(53, 'IR', 'Iran', 'Rial', 'IRR', N'﷼')
,(54, 'IE', 'Ireland', 'Euro', 'EUR', N'€')
,(55, 'IL', 'Israel', 'Shekel', 'ILS', N'₪')
,(56, 'IT', 'Italy', 'Euro', 'EUR', N'€')
,(57, 'JM', 'Jamaica', 'Dollar', 'JMD', N'J$')
,(58, 'JP', 'Japan', 'Yen', 'JPY', N'¥')
,(59, 'KZ', 'Kazakhstan', 'Tenge', 'KZT', N'лв')
,(60, 'KP', 'Korea, Democratic People''s Republic of (North)', 'Won', 'KPW', N'₩')
,(61, 'KR', 'Korea, Republic of (South)', 'Won', 'KRW', N'₩')
,(62, 'KG', 'Kyrgyzstan', 'Som', 'KGS', N'лв')
,(63, 'LA', 'Laos', 'Kip', 'LAK', N'₭')
,(64, 'LV', 'Latvia', 'Lat', 'LVL', N'Ls')
,(65, 'LB', 'Lebanon', 'Pound', 'LBP', N'£')
,(66, 'LR', 'Liberia', 'Dollar', 'LRD', N'$')
,(67, 'LI', 'Liechtenstein', 'Franc', 'CHF', N'CHF')
,(68, 'LT', 'Lithuania', 'Litas', 'LTL', N'L')
,(69, 'LU', 'Luxembourg', 'Euro', 'EUR', N'€')
,(70, 'MK', 'Macedonia', 'Denar', 'MKD', N'ден')
,(71, 'MY', 'Malaysia', 'Ringgit', 'MYR', N'RM')
,(72, 'MT', 'Malta', 'Euro', 'EUR', N'€')
,(73, 'MU', 'Mauritius', 'Rupee', 'MUR', N'₨')
,(74, 'MX', 'Mexico', 'Peso', 'MXN', N'$')
,(75, 'MN', 'Mongolia', 'Tughrik', 'MNT', N'₮')
,(76, 'MZ', 'Mozambique', 'Metical', 'MZN', N'MT')
,(77, 'NA', 'Namibia', 'Dollar', 'NAD', N'$')
,(78, 'NP', 'Nepal', 'Rupee', 'NPR', N'₨')
,(79, 'NL', 'Netherlands', 'Antilles Guilder', 'ANG', N'ƒ')
,(80, 'NZ', 'New Zealand', 'Dollar', 'NZD', N'$')
,(81, 'NI', 'Nicaragua', 'Cordoba', 'NIO', N'C$')
,(82, 'NG', 'Nigeria', 'Naira', 'NGN', N'₦')
,(83, 'NO', 'Norway', 'Krone', 'NOK', N'kr')
,(84, 'OM', 'Oman', 'Rial', 'OMR', N'﷼')
,(85, 'PK', 'Pakistan', 'Rupee', 'PKR', N'₨')
,(86, 'PA', 'Panama', 'Balboa', 'PAB', N'B/.')
,(87, 'PY', 'Paraguay', 'Guarani', 'PYG', N'Gs')
,(88, 'PE', 'Peru', 'Nuevo Sol', 'PEN', N'S/.')
,(89, 'PH', 'Philippines', 'Peso', 'PHP', N'₱')
,(90, 'PL', 'Poland', 'Zloty', 'PLN', N'zł')
,(91, 'PT', 'Portugal', 'Euro', 'EUR', N'€')
,(92, 'QA', 'Qatar', 'Riyal', 'QAR', N'﷼')
,(93, 'RO', 'Romania', 'New Leu', 'RON', N'lei')
,(94, 'RU', 'Russia', 'Ruble', 'RUB', N'₽')
,(95, 'SH', 'Saint Helena', 'Pound', 'SHP', N'£')
,(96, 'SA', 'Saudi Arabia', 'Riyal', 'SAR', N'﷼')
,(97, 'CS', 'Serbia and Montenegro', 'Dinar', 'RSD', N'Дин.')
,(98, 'SC', 'Seychelles', 'Rupee', 'SCR', N'₨')
,(99, 'SG', 'Singapore', 'Dollar', 'SGD', N'$')
,(100, 'SK', 'Slovakia', 'Euro', 'EUR', N'€')
,(101, 'SI', 'Slovenia', 'Euro', 'EUR', N'€')
,(102, 'SB', 'Solomon Islands', 'Dollar', 'SBD', N'$')
,(103, 'SO', 'Somalia', 'Shilling', 'SOS', N'S')
,(104, 'ZA', 'South Africa', 'Rand', 'ZAR', N'R')
,(105, 'ES', 'Spain', 'Euro', 'EUR', N'€')
,(106, 'LK', 'Sri Lanka', 'Rupee', 'LKR', N'₨')
,(107, 'SR', 'Suriname', 'Dollar', 'SRD', N'$')
,(108, 'SE', 'Sweden', 'Krona', 'SEK', N'kr')
,(109, 'CH', 'Switzerland', 'Franc', 'CHF', N'CHF')
,(110, 'SY', 'Syria', 'Pound', 'SYP', N'£')
,(111, 'TW', 'Taiwan', 'New Dollar', 'TWD', N'NT$')
,(112, 'TH', 'Thailand', 'Baht', 'THB', N'฿')
,(113, 'TT', 'Trinidad and Tobago', 'Dollar', 'TTD', N'TT$')
,(114, 'TR', 'Turkey', 'Lira', 'TRL', N'₺')
,(115, 'TV', 'Tuvalu', 'Dollar', 'TVD', N'$')
,(116, 'UA', 'Ukraine', 'Hryvna', 'UAH', N'₴')
,(117, 'GB', 'United Kingdom', 'Pound', 'GBP', N'£')
,(118, 'US', 'United States', 'Dollar', 'USD', N'$')
,(119, 'UY', 'Uruguay', 'Peso', 'UYU', N'$U')
,(120, 'UZ', 'Uzbekistan', 'Som', 'UZS', N'лв')
,(121, 'VN', 'Viet Nam', 'Dong', 'VND', N'₫')
,(122, 'YE', 'Yemen', 'Rial', 'YER', N'﷼')
,(123, 'ZW', 'Zimbabwe', 'Dollar', 'ZWD', N'Z$')

--Department
INSERT INTO Department (DepartmentId, DepartmentName)
VALUES (1, 'Human Resources')
	, (2, 'Sales')
	, (3, 'Marketing')
	, (4, 'IT')
	, (5, 'Fulfillment')
	, (6, 'Software Engineering')

--OrderStatus
INSERT INTO OrderStatus (OrderStatusId, StatusName)
VALUES (1, 'Pending')
	, (2, 'Awaiting Payment')
	, (3, 'Awaiting Fulfillment')
	, (4, 'Awaiting Shippment')
	, (5, 'Completed')
	, (6, 'Shipped')
	, (7, 'Cancelled')
	, (8, 'Declined')
	, (9, 'Refunded')


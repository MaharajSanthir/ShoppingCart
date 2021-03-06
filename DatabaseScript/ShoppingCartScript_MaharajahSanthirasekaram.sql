USE [master]
GO

CREATE DATABASE [ShoppingCart]
GO

Use [ShoppingCart]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[categories]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[cat_id] [int] IDENTITY(1000,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_addresses]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_addresses](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[province] [varchar](50) NOT NULL,
	[postalcode] [varchar](7) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](25) NOT NULL,
 CONSTRAINT [PK_customer_addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[payment_type] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[total] [money] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1000,1) NOT NULL,
	[cat_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_order]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_product]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer_addresses] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products] FOREIGN KEY([cat_id])
REFERENCES [dbo].[categories] ([cat_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products]
GO
/****** Object:  StoredProcedure [dbo].[DisplayOrderDetails]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayOrderDetails]
	@OrderID int

AS
BEGIN

	SELECT customer_addresses.firstname AS FirstName,
	customer_addresses.lastname AS LastName,
	customer_addresses.[address] AS CustAddress,
	customer_addresses.city AS City,
	customer_addresses.province AS Province,
	customer_addresses.postalcode AS PostalCode,
	customer_addresses.phone AS CustPhone,
	customer_addresses.email AS CustEmail,
	orders.payment_type AS PaymentType,
	orders.[date] AS OrderDate,
	orders.[status] AS OrderStatus,
	orders.total AS OrderTotal
	
	from orders INNER JOIN customer_addresses ON orders.customer_id = customer_addresses.id  where orders.id=@OrderID;
END


GO
/****** Object:  StoredProcedure [dbo].[DisplayOrderItems]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DisplayOrderItems] 
	@OrderID int
AS
BEGIN
	Select order_items.product_id AS ItemProdID,
	order_items.quantity AS ItemQuantity,
	products.name AS ItemProdName,
	products.price AS ItemProdPrice
	
	from order_items INNER JOIN products ON order_items.product_id = products.product_id where order_items.order_id = @OrderID;
END


GO
/****** Object:  StoredProcedure [dbo].[InsertCustomerAddresses]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[InsertCustomerAddresses]
	@firstname varchar(50),
	@lastname varchar(50),
	@address varchar(100),
	@city varchar(50),
	@province varchar(50),
	@postalcode varchar(7),
	@phone varchar(10),
	@email varchar(25),
	@InsertedCustID int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into [dbo].customer_addresses(firstname, lastname, [address], city, province, postalcode, phone, email)
	values(@firstname, @lastname, @address, @city, @province, @postalcode, @phone, @email);
	set @InsertedCustID  = SCOPE_IDENTITY();

END

GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertOrder]
	@customer_id int,
	@payment_type varchar(50),
	@total money,
	@order_id int OUTPUT

AS
BEGIN

	insert into orders(customer_id, payment_type, [date], [status], total)
	values (@Customer_id, @payment_type, getdate(), 'Pending', @total);
	set @order_id = SCOPE_IDENTITY();
END

GO
/****** Object:  StoredProcedure [dbo].[InsertOrderItems]    Script Date: 2014-12-13 12:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrderItems]
	@order_id int,
	@product_id int,
	@quantity int
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into order_items(order_id,product_id,quantity)
	values(@order_id,@product_id,@quantity);

END

GO

Insert into categories(name,[description]) VALUES('White Teas', 'Least processed (steamed and dried) of all tea types.');
Insert into categories(name,[description]) VALUES('Green Teas', 'Have a clean, delicious taste.');
Insert into categories(name,[description]) VALUES('Black Teas', 'Full-bodied, strong taste.');

insert into products(cat_id,name,[description],price) values('1000','Silver Yin Zhen Pearls - 1LB','Mellow infusion with silky sweet undertones', 184);
insert into products(cat_id,name,[description],price) values('1000','Youthberry White Tea - 1LB','Refreshing sweet pineapple and fruity acai berry infusion with subtle floral finish', 110);
insert into products(cat_id,name,[description],price) values('1000','Sweet Asian Pear White Tea - 1LB','Balanced with passion fruit & citrus with delicate floral undertones', 120);

insert into products(cat_id,name,[description],price) values('1001','Dragonwell Green Tea - 1LB','Lightly sweet with a smooth texture and a hint of lingering chestnut', 120);
insert into products(cat_id,name,[description],price) values('1001','Jeju Island Green Tea - 1LB','Full-bodied green tea flavor with rich notes of toasted chestnuts', 110);
insert into products(cat_id,name,[description],price) values('1001','Moroccan Mint Green Tea - 1LB','Robust green tea with refreshing spearmint', 150);

insert into products(cat_id,name,[description],price) values('1002','English Breakfast - 1LB','Full-bodied infusion with malty and oaky undertones', 30);
insert into products(cat_id,name,[description],price) values('1002','Earl Grey - 1LB','Smooth infusion with bergamot overtones', 35);
insert into products(cat_id,name,[description],price) values('1002','Cacao Mint Black Tea - 1LB','Full-bodied cocoa infusion with minty undertones', 50);


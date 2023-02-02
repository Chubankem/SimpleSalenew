USE [master]
GO
/****** Object:  Database [simplesale]    Script Date: 2/2/2023 4:21:32 PM ******/
CREATE DATABASE [simplesale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'simplesale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\simplesale.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'simplesale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\simplesale_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [simplesale] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [simplesale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [simplesale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [simplesale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [simplesale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [simplesale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [simplesale] SET ARITHABORT OFF 
GO
ALTER DATABASE [simplesale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [simplesale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [simplesale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [simplesale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [simplesale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [simplesale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [simplesale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [simplesale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [simplesale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [simplesale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [simplesale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [simplesale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [simplesale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [simplesale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [simplesale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [simplesale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [simplesale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [simplesale] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [simplesale] SET  MULTI_USER 
GO
ALTER DATABASE [simplesale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [simplesale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [simplesale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [simplesale] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [simplesale] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [simplesale] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [simplesale] SET QUERY_STORE = OFF
GO
USE [simplesale]
GO
/****** Object:  User [root]    Script Date: 2/2/2023 4:21:32 PM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [root]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [root]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [root]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [root]
GO
ALTER ROLE [db_datareader] ADD MEMBER [root]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [root]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [root]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[type_id] [int] NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin_type]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_type](
	[id] [int] NOT NULL,
	[type_name] [nvarchar](255) NULL,
	[permissons] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[voucher_id] [int] NULL,
	[total_price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_item]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_item](
	[id] [int] NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[desc] [nvarchar](max) NULL,
	[discount_percent] [decimal](18, 0) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount_relation]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_relation](
	[id] [int] NOT NULL,
	[product_id] [int] NULL,
	[discount_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[Payment_id] [int] NULL,
	[total_item] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[id] [int] NOT NULL,
	[order_id] [int] NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_payment]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_payment](
	[id] [int] NOT NULL,
	[amount] [int] NULL,
	[provider] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[category_id] [int] NULL,
	[inventory_id] [int] NULL,
	[discount_id] [int] NULL,
	[name] [nvarchar](255) NULL,
	[desc] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[desc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_ingredient]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_ingredient](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[ingre_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_inventory]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_inventory](
	[id] [int] NOT NULL,
	[prod_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_recipe]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_recipe](
	[id] [int] NOT NULL,
	[product_id] [int] NULL,
	[ingredient_id] [int] NULL,
	[ingre_amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[id] [int] NOT NULL,
	[voucher_code] [nvarchar](255) NULL,
	[desc] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[create_at] [datetimeoffset](7) NULL,
	[voucher_percent] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SequelizeMeta]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SequelizeMeta](
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[telephone] [int] NULL,
	[email] [nvarchar](255) NULL,
	[gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_address]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_address](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[address_line1] [nvarchar](255) NULL,
	[address_line2] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[telephone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_payment]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_payment](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[payment_type] [nvarchar](255) NULL,
	[provider] [nvarchar](255) NULL,
	[expiry] [date] NULL,
	[require_account] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[promotion_id] [int] NULL,
	[voucher_name] [nvarchar](255) NULL,
	[get_at] [datetimeoffset](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher_detail]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher_detail](
	[id] [int] NOT NULL,
	[voucher_id] [int] NULL,
	[active] [bit] NULL,
	[quantity] [int] NULL,
	[expire_date] [datetimeoffset](7) NULL,
	[voucher_percent] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Admin_type1] FOREIGN KEY([type_id])
REFERENCES [dbo].[Admin_type] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Admin_type1]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Cart]  WITH NOCHECK ADD  CONSTRAINT [FK_Cart_Voucher] FOREIGN KEY([voucher_id])
REFERENCES [dbo].[Voucher] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Voucher]
GO
ALTER TABLE [dbo].[Cart_item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_item_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([id])
GO
ALTER TABLE [dbo].[Cart_item] CHECK CONSTRAINT [FK_Cart_item_Cart]
GO
ALTER TABLE [dbo].[Cart_item]  WITH CHECK ADD  CONSTRAINT [FK_Cart_item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart_item] CHECK CONSTRAINT [FK_Cart_item_Product]
GO
ALTER TABLE [dbo].[Discount_relation]  WITH CHECK ADD  CONSTRAINT [FK_Discount_relation_Discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[Discount_relation] CHECK CONSTRAINT [FK_Discount_relation_Discount]
GO
ALTER TABLE [dbo].[Discount_relation]  WITH CHECK ADD  CONSTRAINT [FK_Discount_relation_Product_category] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product_category] ([id])
GO
ALTER TABLE [dbo].[Discount_relation] CHECK CONSTRAINT [FK_Discount_relation_Product_category]
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Order_payment] FOREIGN KEY([Payment_id])
REFERENCES [dbo].[Order_payment] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Order_item_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Order_item_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Product_category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_category]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Product_inventory] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[Product_inventory] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_inventory]
GO
ALTER TABLE [dbo].[Product_recipe]  WITH CHECK ADD  CONSTRAINT [FK_Product_recipe_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product_recipe] CHECK CONSTRAINT [FK_Product_recipe_Product]
GO
ALTER TABLE [dbo].[Product_recipe]  WITH CHECK ADD  CONSTRAINT [FK_Product_recipe_Product_ingredient] FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[Product_ingredient] ([id])
GO
ALTER TABLE [dbo].[Product_recipe] CHECK CONSTRAINT [FK_Product_recipe_Product_ingredient]
GO
ALTER TABLE [dbo].[User_address]  WITH CHECK ADD  CONSTRAINT [FK_User_address_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_address] CHECK CONSTRAINT [FK_User_address_User]
GO
ALTER TABLE [dbo].[User_payment]  WITH CHECK ADD  CONSTRAINT [FK_User_payment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_payment] CHECK CONSTRAINT [FK_User_payment_User]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_Promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[Promotion] ([id])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_Promotion]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_User]
GO
ALTER TABLE [dbo].[Voucher_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_Voucher_detail_Voucher] FOREIGN KEY([voucher_id])
REFERENCES [dbo].[Voucher] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Voucher_detail] CHECK CONSTRAINT [FK_Voucher_detail_Voucher]
GO
/****** Object:  StoredProcedure [dbo].[createCartItem1]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[createCartItem1]
	@cart_id int,
	@product_id int
as
begin

	declare @total_itemprice decimal(18,0)

	insert into Cart_item(cart_id,product_id,quantity) values (@cart_id,@product_id,1)
	exec updateTotalPrice @cart_id
end
GO
/****** Object:  StoredProcedure [dbo].[createCartwithUser]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[createCartwithUser]
	@user_id int,
	@cart_id int output
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Cart where id = @id))
		set @id = @id + 1
	insert into Cart(id,[user_id],voucher_id,total_price) values (@id,@user_id,null,0)
	set @cart_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getErrorInfo]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getErrorInfo]
as
begin
	SELECT   
         ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
end
GO
/****** Object:  StoredProcedure [dbo].[updateAllInventory]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateAllInventory]
as
begin
	declare @count int
	set @count = 0

	while (@count < (select count(*) from Product_inventory))
	begin
		exec updateOneInventoryByProductID @count
		set @count = @count + 1
	end
end
GO
/****** Object:  StoredProcedure [dbo].[updateOneInventoryByProductID]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateOneInventoryByProductID]
	@productID int
as
begin
	declare @calculatedAmount table (amount int)
	declare @ingredient_id int
	declare @ingre_amount int
	declare @temp_quantity int
	declare @temp_canmake int

	DECLARE cursorProduct CURSOR FOR
	select pr.ingredient_id, pr.ingre_amount 
	from Product_recipe pr 
	where pr.product_id = @productID

	OPEN cursorProduct                

	FETCH NEXT FROM cursorProduct     
	INTO @ingredient_id,@ingre_amount

	WHILE @@FETCH_STATUS = 0         
	BEGIN
										
		set @temp_quantity = (select ingre_quantity from Product_ingredient where id = @ingredient_id)
		set @temp_canmake = @temp_quantity/@ingre_amount

		insert into @calculatedAmount values (@temp_canmake)

		FETCH NEXT FROM cursorProduct 
			  INTO @ingredient_id,@ingre_amount
	END

CLOSE cursorProduct            
DEALLOCATE cursorProduct       
	
	set @temp_canmake = (select min(amount) from @calculatedAmount)

	update Product_inventory set prod_quantity = @temp_canmake where id = @productID
end
GO
/****** Object:  StoredProcedure [dbo].[updateQuantity]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateQuantity]
	@id int,
	@quanity int,
	@cart_id int
as
begin
	update Cart_item set quantity=@quanity where id=@id
	exec updateTotalPrice @cart_id
end
GO
/****** Object:  StoredProcedure [dbo].[updateTotalPrice]    Script Date: 2/2/2023 4:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateTotalPrice]
	@cart_id int
as
begin
	declare @total_price decimal(18,0)
	select @total_price = sum(p.price * ci.quantity) from Cart c, Cart_item ci, Product p where c.id=0 and c.id=ci.cart_id and p.id=ci.product_id

	update Cart set total_price=@total_price where Cart.id=@cart_id
end
GO
USE [master]
GO
ALTER DATABASE [simplesale] SET  READ_WRITE 
GO

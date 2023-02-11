--trigger---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createCategory
on Product_category
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Product_category where id = @id))
		set @id = @id + 1

	declare @name varchar(255)
	declare @desc varchar(255)
	set @name = (select [name] from inserted)
	set @desc = (select [desc] from inserted) 

	insert into Product_category values (@id,@name,@desc)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createProduct
on Product
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Product where id = @id))
		set @id = @id + 1

	declare @category_id int
	declare @discount_id int
	declare @name varchar(255)
	declare @desc varchar(255)
	declare @price decimal(18,0)

	select @category_id = category_id, @discount_id = discount_id, @name = [name], @desc = [desc], @price = price from inserted

	insert into Product_inventory values (@id,0)
	insert into Product values (@id,@category_id,@id,@discount_id,@name,@desc,@price)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createAdmin
on [Admin]
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from [Admin] where id = @id))
		set @id = @id + 1

	declare @type_id int
	declare @username varchar(255)
	declare @password varchar(255)
	declare @first_name varchar(255)
	declare @last_name varchar(255)

	select @type_id = [type_id],@username=username,@password=[password],@first_name=first_name,@last_name=last_name from inserted

	insert into [Admin] values (@id,@type_id,@username,@password,@first_name,@last_name)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createAdminType
on Admin_type
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Admin_type where id = @id))
		set @id = @id + 1

	declare @type_name varchar(255)
	declare @permissons varchar(255)

	select @type_name=[type_name],@permissons=permissons from inserted

	insert into Admin_type values (@id,@type_name,@permissons)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createCart
on Cart
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Cart where id = @id))
		set @id = @id + 1

	declare @user_id int
	declare @voucher_id int
	declare @total_price decimal(18,0)

	select @user_id=[user_id],@voucher_id=voucher_id,@total_price=total_price from inserted

	insert into Cart values (@id,@user_id,@voucher_id,@total_price)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createCartItem
on Cart_item
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Cart_item where id = @id))
		set @id = @id + 1

	declare @cart_id int
	declare @product_id int
	declare @quantity int

	select @cart_id=cart_id,@product_id=product_id,@quantity=quantity from inserted

	insert into Cart_item values (@id,@cart_id,@product_id,@quantity)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createDiscount
on Discount
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Discount where id = @id))
		set @id = @id + 1

	declare @name varchar(255)
	declare @desc varchar(255)
	declare @discount_percent decimal(18,0)
	declare @active bit

	select @name=[name],@desc=[desc],@discount_percent=discount_percent,@active=active from inserted

	insert into Discount values (@id,@name,@desc,@discount_percent,@active)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createDiscountRelation
on Discount_relation
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Discount_relation where id = @id))
		set @id = @id + 1

	declare @product_id int
	declare @discount_id int

	select @product_id=product_id,@discount_id=discount_id from inserted

	insert into Discount_relation values (@id,@product_id,@discount_id)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createOrder
on [Order]
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from [Order] where id = @id))
		set @id = @id + 1

	declare @user_id int
	declare @payment_id int
	declare @total_item int

	select @user_id=[user_id],@payment_id=Payment_id,@total_item=total_item from inserted

	insert into [Order] values (@id,@user_id,@payment_id,@total_item)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createOrderItem
on Order_item
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Order_item where id = @id))
		set @id = @id + 1

	declare @order_id int
	declare @product_id int
	declare @quantity int

	select @order_id=order_id,@product_id=product_id,@quantity=quantity from inserted

	insert into Order_item values (@id,@order_id,@product_id,@quantity)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createOrderPayment
on Order_payment
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Order_payment where id = @id))
		set @id = @id + 1

	declare @amount int
	declare @provider varchar(255)
	declare @status varchar(255)

	select @amount=amount,@provider=[provider],@status=[status] from inserted

	insert into Order_payment values (@id,@amount,@provider,@status)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createProductIngredient
on Product_ingredient
instead of insert
as
begin
	declare @id int
set @id = 0
	while (exists(select id from Product_ingredient where id = @id))
		set @id = @id + 1

	declare @name varchar(255)
	declare @ingre_quantity int

	select @name=[name],@ingre_quantity=ingre_quantity from inserted

	insert into Product_ingredient values (@id,@name,@ingre_quantity)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createProductRecipe
on Product_recipe
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Product_recipe where id = @id))
		set @id = @id + 1

	declare @product_id int
	declare @ingredient_id int
	declare @ingre_amount int

	select @product_id=product_id,@ingredient_id=ingredient_id,@ingre_amount=ingre_amount from inserted

	insert into Product_recipe values (@id,@product_id,@ingredient_id,@ingre_amount)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createPromotion
on Promotion
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Promotion where id = @id))
		set @id = @id + 1

	declare @voucher_code varchar(255)
	declare @desc varchar(255)
	declare @quantity int
	declare @create_at datetime
	declare @voucher_percent decimal(18,0)

	select @voucher_code=voucher_code,@desc=[desc],@quantity=quantity,@create_at=create_at,@voucher_percent=voucher_percent from inserted

	insert into Promotion values (@id,@voucher_code,@desc,@quantity,@create_at,@voucher_percent)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger tg_createUser
on [User]
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from [User] where id = @id))
		set @id = @id + 1

	declare @username varchar(255)
	declare @password varchar(255)
	declare @first_name varchar(255)
	declare @last_name varchar(255)
	declare @telephone int
	declare @email varchar(255)
	declare @gender bit

	select @username=username,@password=[password],@first_name=first_name,@last_name=last_name,@telephone=telephone,@email=email,@gender=gender from inserted

	insert into [User] values (@id,@username,@password,@first_name,@last_name,@telephone,@email,@gender)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createUserAddress
on User_address
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from User_address where id = @id))
		set @id = @id + 1

	declare @user_id int
	declare @address_line1 varchar(255)
	declare @address_line2 varchar(255)
	declare @city varchar(255)
	declare @telephone int

	select @user_id=[user_id],@address_line1=address_line1,@address_line2=address_line2,@city=city,@telephone=telephone from inserted

	insert into User_address values (@id,@user_id,@address_line1,@address_line2,@city,@telephone)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createUserPayment
on User_payment
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from User_payment where id = @id))
		set @id = @id + 1

	declare @user_id int
	declare @payment_type varchar(255)
	declare @provider varchar(255)
	declare @expiry date
	declare @require_account bit

	select @user_id=[user_id],@payment_type=payment_type,@provider=[provider],@expiry=expiry,@require_account=require_account from inserted

	insert into User_payment values (@id,@user_id,@payment_type,@provider,@expiry,@require_account)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createVoucher
on Voucher
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Voucher where id = @id))
		set @id = @id + 1

	declare @user_id int
	declare @promotion_id int
	declare @voucher_name varchar(255)
	declare @get_at datetime

	select @user_id=[user_id],@promotion_id=promotion_id,@voucher_name=voucher_name,@get_at=get_at from inserted

	insert into Voucher values (@id,@user_id,@promotion_id,@voucher_name,@get_at)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
create trigger createVoucherDetail
on Voucher_detail
instead of insert
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Voucher_detail where id = @id))
		set @id = @id + 1

	declare @voucher_id int
	declare @active bit
	declare @quantity int
	declare @expire_date datetime
	declare @voucher_percent decimal(18,0)

	select @voucher_id=voucher_id,@active=active,@quantity=quantity,@expire_date=expire_date,@voucher_percent=voucher_percent from inserted

	insert into Voucher_detail values (@id,@voucher_id,@active,@quantity,@expire_date,@voucher_percent)
end
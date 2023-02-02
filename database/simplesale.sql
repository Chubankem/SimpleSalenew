--procedure------------------------------------------------------------------------------------------------------------------------------------------------------------
--1) uppdate inventory from recipe------------------------------------------------------------------------------------------------------------------------------------
alter procedure updateOneInventoryByProductID
	@productID int
as
begin
	declare @calculatedAmount table (amount int)   -- bảng tạm thời dùng để tính số lượng product có thể làm với ingredient hiện có
	declare @ingredient_id int
	declare @ingre_amount int
	declare @temp_quantity int						
	declare @temp_canmake int

	DECLARE cursorProduct CURSOR FOR				-- khai báo cursor
	select pr.ingredient_id, pr.ingre_amount		-- lấy bảng recipe dùng mã product id được nhập vào 
	from Product_recipe pr 
	where pr.product_id = @productID

	OPEN cursorProduct								

	FETCH NEXT FROM cursorProduct					-- chạy cursor vào mã ingredient id và ingredient amount
	INTO @ingredient_id,@ingre_amount

	WHILE @@FETCH_STATUS = 0         
	BEGIN
										
		set @temp_quantity = (select ingre_quantity from Product_ingredient where id = @ingredient_id)		-- lấy số lượng ingredient tồn ở bảng product_ingredient
		set @temp_canmake = @temp_quantity/@ingre_amount													-- tính toán số lượng product có thể làm với số lượng ingredient đang có

		insert into @calculatedAmount values (@temp_canmake)												-- lưu vào bảng tạm thời và tính toán số lượng product với ingredient khác

		FETCH NEXT FROM cursorProduct 
			  INTO @ingredient_id,@ingre_amount
	END

CLOSE cursorProduct            
DEALLOCATE cursorProduct       
	
	set @temp_canmake = (select min(amount) from @calculatedAmount)			-- số lượng nhỏ nhất ở trong bảng là số lượng product có thể làm với tất cả ingredient đang có

	update Product_inventory set prod_quantity = @temp_canmake where id = @productID  -- update bảng inventory
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec updateOneInventoryByProductID 3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure updateAllInventory
as
begin
	declare @count int
	set @count = 0

	while (@count < (select count(*) from Product_inventory))		-- update tất cả số lượng trong bảng inventory
	begin
		exec updateOneInventoryByProductID @count
		set @count = @count + 1
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exec updateAllInventory
--2)Cart procedure-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create procedure createCart
	@cart_id int output
as
begin
	declare @id int
	set @id = 0
	while (exists(select id from Cart where id = @id))
		set @id = @id + 1
	insert into Cart(id,[user_id],voucher_id,total_price) values (@id,null,null,0)
	set @cart_id = @id
end

create procedure createCartwithUser
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

alter procedure createCartItem1
	@cart_id int,
	@product_id int
as
begin

	declare @total_itemprice decimal(18,0)

	insert into Cart_item(cart_id,product_id,quantity) values (@cart_id,@product_id,1)
	exec updateTotalPrice @cart_id
end

create procedure updateUsertoCart
	@cart_id int,
	@user_id int
as
begin
	update Cart set [user_id]=@user_id where id=@cart_id
end

create procedure updateVouchertoCart
	@cart_id int,
	@voucher_id int
as
begin
	update Cart set voucher_id=@voucher_id where Cart.id=@cart_id
end

create procedure updateTotalPrice
	@cart_id int
as
begin
	declare @total_price decimal(18,0)
	select @total_price = sum(p.price * ci.quantity) from Cart c, Cart_item ci, Product p where c.id=0 and c.id=ci.cart_id and p.id=ci.product_id

	update Cart set total_price=@total_price where Cart.id=@cart_id
end

create procedure updateQuantity
	@id int,
	@quanity int,
	@cart_id int
as
begin
	update Cart_item set quantity=@quanity where id=@id
	exec updateTotalPrice @cart_id
end

create procedure deleteCart
	@cart_id int
as
begin
	delete from Cart where id=@cart_id
	delete from Cart_item where cart_id=@cart_id
end

create procedure deleteItem
	@cart_id int,
	@id int
as
begin
	delete from Cart_item where id=@id
	exec updateTotalPrice @cart_id
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
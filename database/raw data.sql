insert into [User] values (1,'username','password','Nguyen','Hung','123456789','email@.gmail.com',1)
insert into [User] values (1,'nameuser','123456','Hung','Nguyen','1234','test@.gmail.com',1)

insert into Product_category values (1,'nuoc ngot','nuoc co duong, co hoa chat, de trong chai, tot cho suc khoe')

insert into Product values (1,0,1,null,'coca cola','mau den, nhan do, 100ml',10000 )
insert into Product values (1,0,1,null,'pepsi','mau den, nhan xanh, 100ml',10000 )
insert into Product values (1,0,1,null,'sprite','mau trang, nhan xanh la, 100ml',10000 )

exec createCartwithUser 0,0

exec createCartItem1 0,0
exec createCartItem1 0,1
exec createCartItem1 0,2

exec updateTotalPrice 0

exec updateQuantity 2,3,0
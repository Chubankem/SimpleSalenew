-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from [User]
select * from [Admin]
select * from Admin_type
select * from Cart
select * from Cart_item
select * from Discount
--Error info for try - catch-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure getErrorInfo
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

create procedure sendError
	@errCode int,
	@message varchar(255)
as
begin
	select 
		@errCode as errCode,
		@message as [message]
end
exec sendError 1,'text'
--findIDForDefaultCreate-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

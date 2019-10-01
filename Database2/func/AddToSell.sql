CREATE PROCEDURE [dbo].[AddToSell]
	@ProductId int,
	@ConsumerId int,
	@DateTime DateTime,
	@Price money,
	@Count int
AS
begin

--select GetAllBuyCount(@ProductId) ;

--select GetAllSellCount(@ProductId)+@Count;

--exec GetBuyCount @ProductId;
--exec GetSalesCount @ProductId;

if ((dbo.GetAllBuyCount(@ProductId))>=(dbo.GetAllSellCount(@ProductId)+@Count))
	begin
		PRINT('fff')

		insert into Sell (ProductId,ConsumerId,DateTime,Price,Count) values 
		(@ProductId,@ConsumerId,@DateTime,@Price,@Count)
		RETURN 1
	end

	PRINT('fuuu')

	RETURN 0
--if ()
--begin

--end
--	IF Boolean_expression
--BEGIN
--    -- Statement block executes when the Boolean expression is TRUE
--END
--ELSE
--BEGIN
--    -- Statement block executes when the Boolean expression is FALSE
--END
end

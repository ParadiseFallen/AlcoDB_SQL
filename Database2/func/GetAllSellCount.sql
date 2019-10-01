CREATE FUNCTION [dbo].[GetAllSellCount]
(
	@ProductId int
)
RETURNS INT
AS
BEGIN
declare @ans int
set @ans = (select SUM(Sell.Count) from Sell where Sell.ProductId = @ProductId);

if @ans IS NULL
return 0;

return @ans;
END

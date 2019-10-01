CREATE FUNCTION [dbo].[GetAllBuyCount]
(
	@ProductId int
)
RETURNS INT
AS
BEGIN
	RETURN (select SUM(ArrivalTable.Count) from ArrivalTable where ArrivalTable.ProductId = @ProductId);
END
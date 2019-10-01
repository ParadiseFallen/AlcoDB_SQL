CREATE TABLE [dbo].[Products]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Name] NVARCHAR(200) NOT NULL, 
    [Sku] NVARCHAR(15) not NULL unique
    --[Price] MONEY NOT NULL check ([Price] > 0)
)

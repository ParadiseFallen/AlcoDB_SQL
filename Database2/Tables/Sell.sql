CREATE TABLE [dbo].[Sell]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [ProductId] INT NOT NULL, 
    [ConsumerId] INT NOT NULL, 
	foreign key ([ProductId]) references Products(Id) ON DELETE CASCADE,
	foreign key ([ConsumerId]) references Consumer(Id) ON DELETE CASCADE,
    [DateTime] DATETIME NOT NULL, 
    [Price] MONEY NOT NULL check ([Price] > 0), 
    [Count] INT NOT NULL check ([Count] > 0), 
)

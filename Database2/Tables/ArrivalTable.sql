CREATE TABLE [dbo].[ArrivalTable]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [ProductId] INT NOT NULL , 
    [SuplierId] INT NOT NULL , 
	foreign key ([ProductId]) references Products(Id) ON DELETE CASCADE,
	foreign key ([SuplierId]) references Suppliers(Id) ON DELETE CASCADE,
    [DateTime] DATETIME NOT NULL, 
    [Price] MONEY NOT NULL check ([Price] > 0), 
    [Count] INT NOT NULL check ([Count] > 0)
	--PRIMARY KEY ([ProductId],[SuplierId],[DateTime],[Price])
)

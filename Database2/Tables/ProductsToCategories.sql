CREATE TABLE [dbo].[ProductsToCategories]
(
	--[Id] INT NOT NULL PRIMARY KEY identity, 
    [ProductId] INT NOT NULL, 
    [CategoryId] INT NOT NULL,
	foreign key ([ProductId]) references Products(Id) ON DELETE CASCADE,
	foreign key ([CategoryId]) references Categories(Id) ON DELETE CASCADE,
	PRIMARY KEY([CategoryId],[ProductId])

)

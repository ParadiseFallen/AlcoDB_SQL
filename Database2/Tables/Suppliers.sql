CREATE TABLE [dbo].[Suppliers]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Adress] NVARCHAR(50) NOT NULL, 
    [Country] INT NOT NULL
	foreign key ([Country]) references Countries(Id) ON DELETE CASCADE,

)

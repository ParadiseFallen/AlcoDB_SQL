CREATE TABLE [dbo].[Categories]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Name] NVARCHAR(50) NOT NULL unique
)

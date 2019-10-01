CREATE TABLE [dbo].[Transactions]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Money] MONEY NOT NULL, 
    [TransactionId] INT NOT NULL, 
    [DateTime] DATETIME NOT NULL
)

--Категории
select 
Id as N'Код',
Name as N'Наименование'
from Categories

--таблица приходов
select 
Id as N'Код',
(select Name from Products where Id = ProductId) as N'Продукт',
(select Name from Suppliers where Id = SuplierId) as N'Поставщик',
DateTime as N'Дата и время',
Price as N'Цена',
Count as N'Количество',
Price*Count as N'Цена'
from ArrivalTable

--таблица продаж
select 
Id as N'Код',
(select Name from Products where Id = ProductId) as N'Продукт',
(select Name from Consumer where Id = ConsumerId) as N'Покупатель',
DateTime as N'Дата и время',
Price as N'Цена',
Count as N'Количество',
Price*Count as N'Цена'
from Sell

--потребители
select 
Id as N'Код',
Name as N'Название',
(select Name from Countries where Id = Country) as N'Страна',
Adress as N'Адресс'
from Consumer

--поставщики
select 
Id as N'Код',
Name as N'Название',
(select Name from Countries where Id = Country) as N'Страна',
Adress as N'Адресс'
from Suppliers

--продукты
select 
Id as N'Внутренний код для бд',
Name as N'Наименование',
Sku as N'Код'
from Products

--продукты и категории
select 
(select Name from Products where Id = ProductId) as N'Наименование',
(select Name from Categories where Id = CategoryId) as N'Категория'
from ProductsToCategories

--выбрать все продажи
SELECT 
ROW_NUMBER() OVER (ORDER BY ProductId) as N'Позиция',
--Countries.Name as N'b',
--посчитать цену на кол-во и вывести как прайс
Products.Name as N'Наименование',
Products.Sku as N'Код продукта',
Sell.DateTime as N'Время и дата',
Countries.Name as N'Страна',
Consumer.Adress as N'Адресс',
Consumer.Name as N'Торговая точка',
Sell.Price as N'Цена за еденицу',
Sell.Count as N'Количество',
(Price*Count) as N'Полная стоимость'
--из продаж
FROM Sell--присоеденив
JOIN Products ON ProductId = Products.Id
JOIN Consumer ON ConsumerId = Consumer.Id
JOIN Countries ON Country = Consumer.Country;
--выбрать все поступления
SELECT 
ROW_NUMBER() OVER (ORDER BY ProductId) as N'Позиция',
--Countries.Name as N'b',
--посчитать цену на кол-во и вывести как прайс
Products.Name as N'Наименование',
Products.Sku as N'Код продукта',
ArrivalTable.DateTime as N'Время и дата',
Countries.Name as N'Страна',
Suppliers.Adress as N'Адресс',
Suppliers.Name as N'Торговая точка',
ArrivalTable.Price as N'Цена за еденицу',
ArrivalTable.Count as N'Количество',
(Price*Count) as N'Полная стоимость'
--из продаж
FROM ArrivalTable--присоеденив
JOIN Products ON ProductId = Products.Id
JOIN Suppliers ON ArrivalTable.SuplierId = Suppliers.Id
JOIN Countries ON Country = Suppliers.Country;



--SELECT 
--*
----из продаж
--FROM Sell sell
----присоеденив
--JOIN Products ON ProductId = Products.Id
--JOIN Consumer ON ConsumerId = Consumer.Id
--JOIN Countries ON Country = Consumer.Country
--;

/*
SELECT * FROM Employers;
SELECT * FROM Sectors;

SELECT *, 'JOIN' FROM Employers e
JOIN Sectors s 
ON s.Id = e.SectorId;

SELECT *, 'LEFT JOIN' FROM Employers e
LEFT JOIN Sectors s 
ON s.Id = e.SectorId;

SELECT *, 'RIGHT JOIN' FROM Employers e
RIGHT JOIN Sectors s 
ON s.Id = e.SectorId;

SELECT *, 'FULL JOIN' FROM Employers e
FULL JOIN Sectors s 
ON s.Id = e.SectorId;
*/


/*
[Id] INT NOT NULL PRIMARY KEY identity, 
    [ProductId] INT NOT NULL, 
    [SuplierId] INT NOT NULL, 
    [DateTime] DATETIME NOT NULL, 
    [Price] MONEY NOT NULL check ([Price] > 0), 
    [Count] INT NOT NULL check ([Count] > 0)
*/



/*
--select 

--Id as N'Номер',
--Name as N'Название категории'

--from Categories 


--select 

--Id as N'Номер',
--Name as N'Название категории',
--Sku as N'Код'

--from Products 
--select 


--(select Name from Products where Id = ProductId) as N'Название',
--(select Name from Categories where Id = CategoryId)as N'Категория'

----ProductId as N'Название продукта',
----CategoryId as N'Название категории'

--from ProductsToCategories

--select * from ArrivalTable

--select SUM(Count*Price) as N'Цена' from ArrivalTable

--select * from ArrivalTable


--select (select SUM(Count*Price) from Sell)-(select SUM(Count*Price) from ArrivalTable) as "Доход"
----SUM(select SUM(Count*Price) from ArrivalTable-select SUM(Count*Price) from Sell)) 
----select Id from Categories where Name = N'тоже пиво2'

*/

--Категории

--



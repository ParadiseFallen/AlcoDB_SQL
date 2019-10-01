/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
База данных магазин-склад "Алкомаркет"
Товары которые имеют уникальный идентификатор и количество  (Балтика 9 - 1111111111111 - количествол 5)
У товаров есть категории - товар к 1 категории
Храним данные о поставщике
Храним данные о покупателях
Храним данные о поступлении товара (когда, что, сколько, за сколько и кто поставщик)
Храним данные о продаже товара (когда, что, сколько, за сколько и кто покупатель)

Задача.

1. Создать базу данных.
2. Создать проект в Visual Studio
3. Настроить развертывание базы данных.
4. Создать структру таблиц (скрипты) для хранения информации согласно заданию.
*/

/*
Товары - 10
	У каждого товара - до 3 категорий
	Поставщики - 3
	Покупатели - 3
	Покупки - по каждому товару от 2-3 с датами от 1 до 30 сентября
	Продажи - по каждому товару от 2-3 с датами от 1 до 30 сентября
*/


--тестовые продукты
insert into Products (Name,Sku) values 
(N'Балтика 7',N'1'),
(N'Балтика 0',N'2'),
(N'Балтика 3',N'3'),
(N'Garage',N'4'),
(N'Балтика 9',N'5'),
(N'WhyNot',N'6'),
(N'Revo',N'7'),
(N'Jagenmaister',N'8'),
(N'Pitbull',N'9'),
(N'Детское пиво',N'10')

--тестовые категории
insert into Categories (Name) values 
(N'Слабоолкогольное'),
(N'Безалкагольное'),
(N'Пиво'),
(N'Крепкоалкогольное'),
(N'Детское'),
(N'Напиток'),
(N'Энергетик')

--продукты к категориям соотношение
insert into ProductsToCategories (ProductId,CategoryId) values 
--1
(
(select Id from Products where Sku = N'1'),(select Id from Categories where Name = N'Пиво')
),
--2
(
(select Id from Products where Sku = N'2'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'2'),(select Id from Categories where Name = N'Безалкагольное')
),
--3
(
(select Id from Products where Sku = N'3'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'3'),(select Id from Categories where Name = N'Слабоолкогольное')
),
--4
(
(select Id from Products where Sku = N'4'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'4'),(select Id from Categories where Name = N'Слабоолкогольное')
),
--5
(
(select Id from Products where Sku = N'5'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'5'),(select Id from Categories where Name = N'Крепкоалкогольное')
),
--6
(
(select Id from Products where Sku = N'6'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'6'),(select Id from Categories where Name = N'Слабоолкогольное')
),
--7
(
(select Id from Products where Sku = N'7'),(select Id from Categories where Name = N'Энергетик')
),
(
(select Id from Products where Sku = N'7'),(select Id from Categories where Name = N'Безалкагольное')
),
--8
(
(select Id from Products where Sku = N'8'),(select Id from Categories where Name = N'Пиво')
),
(
(select Id from Products where Sku = N'8'),(select Id from Categories where Name = N'Крепкоалкогольное')
),
--9
(
(select Id from Products where Sku = N'9'),(select Id from Categories where Name = N'Энергетик')
),
(
(select Id from Products where Sku = N'9'),(select Id from Categories where Name = N'Безалкагольное')
),
--10
(
(select Id from Products where Sku = N'10'),(select Id from Categories where Name = N'Напиток')
),
(
(select Id from Products where Sku = N'10'),(select Id from Categories where Name = N'Безалкагольное')
)


--Страны
insert into Countries (Name) values 
(N'Украина'),
(N'Россия'),
(N'Германия')

--поставщики
insert into Suppliers(Name,Adress,Country) values 
(N'Оболонь',N'Мариуполь какой то адресс 46',(select Id from Countries where Name = N'Украина')),
(N'Старый мариуполь',N'Мариуполь какой то адресс 133',(select Id from Countries where Name = N'Украина')),
(N'Weissbier',N'Какой то германский адресс 951',(select Id from Countries where Name = N'Германия')),
(N'Жигули',N'Где то в Росии',(select Id from Countries where Name = N'Россия'))

--потребители
insert into Consumer(Name,Adress,Country) values 
(N'Сильпо',N'Мариуполь сильпо',(select Id from Countries where Name = N'Украина')),
(N'АТБ',N'Мариуполь атб',(select Id from Countries where Name = N'Украина')),
(N'Щирий кум',N'Мариуполь кум',(select Id from Countries where Name = N'Украина')),
(N'Зеркальный',N'Мариуполь зеркальный',(select Id from Countries where Name = N'Украина'))

--поступления
insert into ArrivalTable (ProductId,SuplierId,DateTime,Price,Count) values 
((select Id from Products where Sku = N'1'),(select Id from Suppliers where Name = N'Оболонь'),('1/09/2019 10:21'),(45.65),(3)),
((select Id from Products where Sku = N'2'),(select Id from Suppliers where Name = N'Weissbier'),('2/09/2019 12:21'),(92.15),(6)),
((select Id from Products where Sku = N'3'),(select Id from Suppliers where Name = N'Жигули'),('3/09/2019 14:21'),(12.10),(10)),
((select Id from Products where Sku = N'5'),(select Id from Suppliers where Name = N'Weissbier'),('4/09/2019 22:21'),(64.40),(2)),
((select Id from Products where Sku = N'7'),(select Id from Suppliers where Name = N'Оболонь'),('5/09/2019 6:21'),(22.30),(5))

--продажи
--insert into Sell (ProductId,ConsumerId,DateTime,Price,Count) values 
--((select Id from Products where Sku = N'1'),(select Id from Consumer where Name = N'Сильпо'),('1/9/2019 20:00'),(60.00),(3)),
--((select Id from Products where Sku = N'2'),(select Id from Consumer where Name = N'Сильпо'),('5/9/2019 20:00'),(100.20),(2)),
--((select Id from Products where Sku = N'3'),(select Id from Consumer where Name = N'АТБ'),('13/9/2019 20:00'),(15.25),(4)),
--((select Id from Products where Sku = N'5'),(select Id from Consumer where Name = N'Зеркальный'),('24/9/2019 20:00'),(67.70),(1)),
--((select Id from Products where Sku = N'7'),(select Id from Consumer where Name = N'Щирий кум'),('28/9/2019 20:00'),(25.40),(4))


DECLARE @Product int;
SET @Product = (select Id  from Products where Sku = N'1');
DECLARE @consumer int;
SET @consumer = (select Id from Consumer where Name = N'Сильпо');

EXECUTE dbo.AddToSell 
@Product,
@consumer,
'1/9/2019 20:00',
60.00,
1;

--insert into ArrivalTable (ProductId,SuplierId,DateTime,Price,Count) values 
--((select Id from Products where Sku = N'123456'),(select Id from Suppliers where Name = N'Оболонь'),('24.09.2019 20:21:21'),(999.25),(5))
--insert into ArrivalTable (ProductId,SuplierId,DateTime,Price,Count) values 
--((select Id from Products where Sku = N'123456'),(select Id from Suppliers where Name = N'Оболонь'),('24.09.2019 20:22:21'),(999.25),(2))
------((select Id from Products where Sku = N'124456'),(select Id from Categories where Name = N'тоже пиво2'))

--insert into Sell (ProductId,ConsumerId,DateTime,Price,Count) values 
--((select Id from Products where Sku = N'123456'),(select Id from Consumer where Name = N'Фиг пойми что за магазин'),('24.10.2019 20:12:21'),(1000.25),(3))
----((select Id from Products where Sku = N'124456'),(select Id from Categories where Name = N'тоже пиво2'))


--(select Id from Products where Sku = N'123456')

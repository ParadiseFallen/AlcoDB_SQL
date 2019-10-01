update Products
set Name = N'Балтика 69'
where Sku = N'1';

update Categories
set Name = N'Пиво2'
where Id = (select Id from Categories where Name = N'Пиво');

update Products
set Name = N'Балтика 0'
where Name = (select Name from Products where Name = N'Балтика 69');

delete from Products
where Sku = N'1';

delete from Categories
where Id = (select Id from Categories where Name = N'Пиво');

delete from Products
where Name = (select Name from Products where Name = N'Балтика 0');




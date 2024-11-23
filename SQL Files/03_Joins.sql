--Products, Order details ve orders tablolarýyla birlikte join yapýsý kullanýldý.

Select c.CustomerID,
	   c.CompanyName,
	   c.City,
	   c.Country,
	   o.OrderID,
	   o.OrderDate,
	   o.ShipCity,
	   o.ShipCountry,
	   o.ShipRegion,
	   o.ShipVia
	   from Customers as c
	   inner join Orders as o on c.CustomerID = o.CustomerID

Select c.CustomerID,
	   c.CompanyName,
	   c.City,
	   c.Country,
	   o.OrderID,
	   o.OrderDate,
	   o.ShipCity,
	   o.ShipCountry,
	   o.ShipRegion,
	   o.ShipVia
	   from Customers as c
	   inner join Orders as o on c.CustomerID = o.CustomerID
	   where o.ShipRegion is null

Select c.CustomerID,
	   c.CompanyName,
	   c.City,
	   c.Country,
	   o.OrderID,
	   o.OrderDate,
	   o.ShipCity,
	   o.ShipCountry,
	   o.ShipRegion,
	   o.ShipVia
	   from Customers as c
	   inner join Orders as o on c.CustomerID = o.CustomerID
	   where o.ShipRegion is null and
			 o.ShipVia = '1'
			 --o.ShipVia in('1','2','3')

Select c.CustomerID,
	   count(*) as totalOrderAmountPerCustomer
	   from Customers as c
	   inner join Orders as o on c.CustomerID = o.CustomerID
	   group by c.CustomerID
	   having count(*) > 15
	 
Select o.OrderID,
	   p.ProductID,
       p.ProductName, 
	   od.UnitPrice,
	   od.Quantity,
	   (od.UnitPrice*od.Quantity) as totalPrice
	   from [Order Details] as od
	   inner join Orders as o on o.OrderID = od.OrderID
	   inner join Products as p on od.ProductID = p.ProductID


Select o.OrderID,
	   sum(od.UnitPrice*od.Quantity) as totalPrice,
	   count(*) as totalOrderAmountPerOrder
	   from [Order Details] as od
	   inner join Orders as o on o.OrderID = od.OrderID
	   inner join Products as p on od.ProductID = p.ProductID
	   group by o.OrderID
	   having sum(od.UnitPrice*od.Quantity) > 0
	   order by o.OrderID
	   
Select od.ProductID,
	   count(*) as totalOrderPerProduct
	   from [Order Details] as od
	   group by od.ProductID

Select * from [Order Details] order by [Order Details].ProductID

Select o.OrderDate
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by o.OrderDate
		order by o.OrderDate

--Grouplama yapýldýðýnda yani group by kullanýldýðýnda, product isimlerine veya özel olarak sütun isimlerine eriþmek için MIN veya MAX aggregate fonksiyonlarý kullanýlabilir.
Select MAX(p.ProductName) as productName,
	   od.ProductID,
	   count(*) totalSalesPerProductInAll
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by od.ProductID
		order by od.ProductID

Select Max(p.ProductName) as ProductName,
	   od.ProductID,
	   Count(*) totalSalesPerProductInAll,
	   Sum(od.UnitPrice*od.Quantity) as TotalRevenue
	   --Max(o.OrderDate) as OrderDate --en son satýþý alýyor.
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by od.ProductID
		order by od.ProductID

--Total sipariþ kaydýna göre kaç tane kayýt geliyor diye kontrol ediyorum. Çünkü buna baðlý olarak, bir yýlda bir ürün grubundan en fazla kaç adet satýldýðýný öðrenmek istiyorum. Ürünlerin total satýþ miktarýný buldum ancak 1 yýla baðlý olarak bulmam gerekiyor.
Select Count(*) as totalRecord
		from [Order Details]  as od

Select o.OrderID,
	   od.ProductID,
	   o.OrderDate
		from Orders as o
		inner join [Order Details] as od on od.OrderID = o.OrderID
		where od.ProductID = 11

Select Max(p.ProductName) as ProductName,
	   od.ProductID,
	   Count(*) totalSalesPerProductInAll,
	   Sum(od.UnitPrice*od.Quantity) as TotalRevenue
	   --Max(o.OrderDate) as OrderDate --en son satýþý alýyor.
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by od.ProductID
		order by od.ProductID

--Yýl bazlý sorguya geçmeden önce rank, rownumber, partition by ifadelerini daha güzel kullanmayý amaçlýyorum. Amaç gelir bazlý deðil satýþ  adedi bazlý sýralamayý oluþturmak. 
Select	od.ProductID,
		Year(o.OrderDate) as OrderDate,
		Sum(od.UnitPrice*od.Quantity) as TotalRevenuePerProductPerYear,
		Count(*) as TotalAmountPerProductID, --Over (Partition By od.ProductID) as TotalAmountPerProductID,
		Rank() Over (Partition By Year(o.OrderDate) Order By Count(*) Desc) as RankingByTotalSaleAmountPerYear
		from orders as o
		inner join [Order Details] as od on o.OrderID = od.OrderID
		group by od.ProductID, Year(o.OrderDate)
		order by Year(o.OrderDate), RankingByTotalSaleAmountPerYear 

--Yukarýda yazmýþ olduðum sorgunun içerisinden iþlem yapmaya çalýþýyorum, dolayýsýyla ranký 1 olanlarý seçicem. Her yýl bazlý olarak daðýtmýþ olacaðým. 
--Alt sorgular içerisinde order by ifadesi kullanýmýna izin verilmiyor. Zaten rank kullanýldýðý için order by ifadesini sorgudan çýkarýyorum.
--Alt sorgu üzerinden istediðim herþeye ulaþabilirim. Þuanlýk yýl bazýnda en çok satýþ yapan ürünleri listeliyorum. Ayrýyaten buna product ismi için products tablosuyla join iþlemi yaptým. 
Select total.ProductID,
	   p.ProductName,
	   total.OrderDate,
	   total.TotalRevenuePerProductPerYear,
	   total.TotalAmountPerProductID,
	   total.RankingByTotalSaleAmountPerYear as firstRankPerYear
	   from (Select	od.ProductID,
				Year(o.OrderDate) as OrderDate,
				Sum(od.UnitPrice*od.Quantity) as TotalRevenuePerProductPerYear,
				Count(*) as TotalAmountPerProductID, --Over (Partition By od.ProductID) as TotalAmountPerProductID,
				Rank() Over (Partition By Year(o.OrderDate) Order By Count(*) Desc) as RankingByTotalSaleAmountPerYear
				from orders as o
				inner join [Order Details] as od on o.OrderID = od.OrderID
				group by od.ProductID, Year(o.OrderDate)) as total
				--order by Year(o.OrderDate), RankingByTotalSaleAmountPerYear) 
	   inner join Products as p on p.ProductID = total.ProductID
	   where total.RankingByTotalSaleAmountPerYear = 1
	   --group by total.OrderDate
	   --having total.RankingByTotalSaleAmountPerYear = 1




		 


	   
	   
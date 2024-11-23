--Products, Order details ve orders tablolar�yla birlikte join yap�s� kullan�ld�.

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

--Grouplama yap�ld���nda yani group by kullan�ld���nda, product isimlerine veya �zel olarak s�tun isimlerine eri�mek i�in MIN veya MAX aggregate fonksiyonlar� kullan�labilir.
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
	   --Max(o.OrderDate) as OrderDate --en son sat��� al�yor.
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by od.ProductID
		order by od.ProductID

--Total sipari� kayd�na g�re ka� tane kay�t geliyor diye kontrol ediyorum. ��nk� buna ba�l� olarak, bir y�lda bir �r�n grubundan en fazla ka� adet sat�ld���n� ��renmek istiyorum. �r�nlerin total sat�� miktar�n� buldum ancak 1 y�la ba�l� olarak bulmam gerekiyor.
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
	   --Max(o.OrderDate) as OrderDate --en son sat��� al�yor.
		from [Order Details] as od
		inner join orders as o on o.OrderID = od.OrderID
		inner join Products as p on p.ProductID = od.ProductID
		group by od.ProductID
		order by od.ProductID

--Y�l bazl� sorguya ge�meden �nce rank, rownumber, partition by ifadelerini daha g�zel kullanmay� ama�l�yorum. Ama� gelir bazl� de�il sat��  adedi bazl� s�ralamay� olu�turmak. 
Select	od.ProductID,
		Year(o.OrderDate) as OrderDate,
		Sum(od.UnitPrice*od.Quantity) as TotalRevenuePerProductPerYear,
		Count(*) as TotalAmountPerProductID, --Over (Partition By od.ProductID) as TotalAmountPerProductID,
		Rank() Over (Partition By Year(o.OrderDate) Order By Count(*) Desc) as RankingByTotalSaleAmountPerYear
		from orders as o
		inner join [Order Details] as od on o.OrderID = od.OrderID
		group by od.ProductID, Year(o.OrderDate)
		order by Year(o.OrderDate), RankingByTotalSaleAmountPerYear 

--Yukar�da yazm�� oldu�um sorgunun i�erisinden i�lem yapmaya �al���yorum, dolay�s�yla rank� 1 olanlar� se�icem. Her y�l bazl� olarak da��tm�� olaca��m. 
--Alt sorgular i�erisinde order by ifadesi kullan�m�na izin verilmiyor. Zaten rank kullan�ld��� i�in order by ifadesini sorgudan ��kar�yorum.
--Alt sorgu �zerinden istedi�im her�eye ula�abilirim. �uanl�k y�l baz�nda en �ok sat�� yapan �r�nleri listeliyorum. Ayr�yaten buna product ismi i�in products tablosuyla join i�lemi yapt�m. 
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




		 


	   
	   
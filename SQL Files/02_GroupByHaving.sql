Select * from Orders

--group by kullanýrken dikkat etmemiz gereken alan, alan adlarý çaðýrdýðýmýzda bununla birlikte sadece kendi adýný getirebiliriz. Count ile birlikte kullanýldýðýnda, count(*) kullanmak daha doðru bir fiade olacaktýr.

--group by kullanýldýðýnda ve aggregate (count, sum, avg metotlarý) kullanýldýðýnda bunlarla birlikte having by kulnýlýr.

Select o.ShipCountry 
	   from Orders as o 
	   group by o.ShipCountry --grup bazýnda verileri getirir. 
Select o.ShipCountry, SUM(o.Freight) as 'Toplam Maaliyet' from Orders as o group by o.ShipCountry --ülke bazýnda toplam ne kadarlýk satýþ varsa ekrana getirecektir.

Select o.ShipCountry, 
	   COUNT(*) 
	   from Orders as o 
	   group by o.ShipCountry --ülke bazýnda toplamda kaç adet satýþ yapýldýðýný gsöterir.

Select * 
	   from Orders 
	   where Orders.ShipCountry = 'Germany' --yukarýdaki komutun doðrulamasýný yapmak için kullanýlýr.

Select * 
	   from Orders 
	   where Orders.ShipCountry = 'Finland' --yukarýdaki komutun doðrulamasýný yapmak için kullanýlýr.

Select * from Products

--group by ile where kullanýlamýyor, bunun yerine having kullanýyoruz.
Select p.CategoryID, 
	   SUM(P.UnitPrice) as 'Kategorilerdeki ürünlerin birim fiyat toplamý' 
	   from Products as p 
	   group by p.CategoryID 
	   having SUM(P.UnitPrice) > 200

Select p.CategoryID, 
	   SUM(P.UnitPrice) as 'Kategorilerdeki ürünlerin birim fiyat toplamý' 
	   from Products as p 
	   group by p.CategoryID 
	   having SUM(P.UnitPrice) < 200

Select * from [Order Details]

Select od.ProductID,
       COUNT(*) as 'Satýþ Adedi', 
	   SUM(od.UnitPrice*od.Quantity) as 'Satýþ Toplam Tutarý' 
	   from [Order Details] as od 
	   group by od.ProductID  

Select od.ProductID,
	   COUNT(*) as 'Satýþ Adedi', 
	   SUM(od.UnitPrice*od.Quantity) as 'Satýþ Toplam Tutarý' 
	   from [Order Details] as od 
	   group by od.ProductID 
	   having SUM(od.UnitPrice*od.Quantity) < 10000  
	   order by od.ProductID

--Subquery içerisinde yalnýzca bir adet sütun getirebiliriz. Joinlerde ise birden fazla sütun getirilebilir. Buradaki amacýmýz, farklý tablolar arasýnda iliþki kurmak. Products tablosu içerisindeki product name alanýna ulaþabilmek için, order details içerisindeki product id ile products içerisinde product id alanlarýný eþleþtirmem gerekmektedir. ID ler eþleþtikten sonra, product name alanýna eriþebilirim. Gruplamayý ise order details içerisinde yapmam gerekir çünkü hesaplamayý bu tablo içerisinde yapýyorum. 
Select (Select p.ProductName from Products as p where p.ProductID = od.ProductID) as 'Product Names', 
	   SUM(od.UnitPrice*od.Quantity) as 'Toplam Satýþ Tutarý' 
	   from [Order Details] as od 
	   group by od.ProductID 
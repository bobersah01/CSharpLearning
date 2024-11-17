Select * from Orders

--group by kullan�rken dikkat etmemiz gereken alan, alan adlar� �a��rd���m�zda bununla birlikte sadece kendi ad�n� getirebiliriz. Count ile birlikte kullan�ld���nda, count(*) kullanmak daha do�ru bir fiade olacakt�r.

--group by kullan�ld���nda ve aggregate (count, sum, avg metotlar�) kullan�ld���nda bunlarla birlikte having by kuln�l�r.

Select o.ShipCountry 
	   from Orders as o 
	   group by o.ShipCountry --grup baz�nda verileri getirir. 
Select o.ShipCountry, SUM(o.Freight) as 'Toplam Maaliyet' from Orders as o group by o.ShipCountry --�lke baz�nda toplam ne kadarl�k sat�� varsa ekrana getirecektir.

Select o.ShipCountry, 
	   COUNT(*) 
	   from Orders as o 
	   group by o.ShipCountry --�lke baz�nda toplamda ka� adet sat�� yap�ld���n� gs�terir.

Select * 
	   from Orders 
	   where Orders.ShipCountry = 'Germany' --yukar�daki komutun do�rulamas�n� yapmak i�in kullan�l�r.

Select * 
	   from Orders 
	   where Orders.ShipCountry = 'Finland' --yukar�daki komutun do�rulamas�n� yapmak i�in kullan�l�r.

Select * from Products

--group by ile where kullan�lam�yor, bunun yerine having kullan�yoruz.
Select p.CategoryID, 
	   SUM(P.UnitPrice) as 'Kategorilerdeki �r�nlerin birim fiyat toplam�' 
	   from Products as p 
	   group by p.CategoryID 
	   having SUM(P.UnitPrice) > 200

Select p.CategoryID, 
	   SUM(P.UnitPrice) as 'Kategorilerdeki �r�nlerin birim fiyat toplam�' 
	   from Products as p 
	   group by p.CategoryID 
	   having SUM(P.UnitPrice) < 200

Select * from [Order Details]

Select od.ProductID,
       COUNT(*) as 'Sat�� Adedi', 
	   SUM(od.UnitPrice*od.Quantity) as 'Sat�� Toplam Tutar�' 
	   from [Order Details] as od 
	   group by od.ProductID  

Select od.ProductID,
	   COUNT(*) as 'Sat�� Adedi', 
	   SUM(od.UnitPrice*od.Quantity) as 'Sat�� Toplam Tutar�' 
	   from [Order Details] as od 
	   group by od.ProductID 
	   having SUM(od.UnitPrice*od.Quantity) < 10000  
	   order by od.ProductID

--Subquery i�erisinde yaln�zca bir adet s�tun getirebiliriz. Joinlerde ise birden fazla s�tun getirilebilir. Buradaki amac�m�z, farkl� tablolar aras�nda ili�ki kurmak. Products tablosu i�erisindeki product name alan�na ula�abilmek i�in, order details i�erisindeki product id ile products i�erisinde product id alanlar�n� e�le�tirmem gerekmektedir. ID ler e�le�tikten sonra, product name alan�na eri�ebilirim. Gruplamay� ise order details i�erisinde yapmam gerekir ��nk� hesaplamay� bu tablo i�erisinde yap�yorum. 
Select (Select p.ProductName from Products as p where p.ProductID = od.ProductID) as 'Product Names', 
	   SUM(od.UnitPrice*od.Quantity) as 'Toplam Sat�� Tutar�' 
	   from [Order Details] as od 
	   group by od.ProductID 
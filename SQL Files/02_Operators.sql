--Select ile yaln�zca, tablo i�erisinde verileri okuyabiliriz, herhangi bir de�i�iklik yapmay�z. 

Select * from Orders 

Select Count(*) As TotalRecords From Orders --total kay�tlar� getirir. 

Select MAX(Orders.Freight) as 'En Y�ksek Kargo Maaliyeti' from Orders --max i�erisinde hangi s�tunu kullan�yorsam ona ait max ifadeyi getirir.

Select AVG(Orders.Freight) as 'Kargo maaliyetlerinin ortalamas�' from Orders -- avg i�erisinde b�t�n s�tunlar�n ortalamas�n� al�r.

Select SUM(Orders.Freight) as 'Toplam kargo maaliyetleri' from Orders --sum i�erisinde b�t�n s�tundaki verilerin topamlar�n� al�r.

--A�a��daki iki komut ayn� anlamlar� ta��maktad�r.
Select * from Orders as O where o.ShipCountry = 'Brazil' or
						        o.ShipCountry = 'France' or
								o.ShipCountry = 'Belgium'

Select * from Orders as O where o.ShipCountry in('Brasil', 'France', 'Belgium')

--NULL sorgusuyla birlikte i�erisinin dolu olup olmad���n� belirtiyoruz. 
Select Count(*) as 'Not Null Ship Region Number' from Orders as o where o.ShipRegion is not null
Select Count(*) as 'Null Ship Region Number' from Orders as o where o.ShipRegion is null 

Select * from Orders as o where o.EmployeeID % 2 = 1 --s�tun �zerinde istedi�imiz bi �ekilde ko�ul belirterek getirebiliriz.
Select * from Orders as o where o.EmployeeID % 2 = 0


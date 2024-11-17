--Select ile yalnýzca, tablo içerisinde verileri okuyabiliriz, herhangi bir deðiþiklik yapmayýz. 

Select * from Orders 

Select Count(*) As TotalRecords From Orders --total kayýtlarý getirir. 

Select MAX(Orders.Freight) as 'En Yüksek Kargo Maaliyeti' from Orders --max içerisinde hangi sütunu kullanýyorsam ona ait max ifadeyi getirir.

Select AVG(Orders.Freight) as 'Kargo maaliyetlerinin ortalamasý' from Orders -- avg içerisinde bütün sütunlarýn ortalamasýný alýr.

Select SUM(Orders.Freight) as 'Toplam kargo maaliyetleri' from Orders --sum içerisinde bütün sütundaki verilerin topamlarýný alýr.

--Aþaðýdaki iki komut ayný anlamlarý taþýmaktadýr.
Select * from Orders as O where o.ShipCountry = 'Brazil' or
						        o.ShipCountry = 'France' or
								o.ShipCountry = 'Belgium'

Select * from Orders as O where o.ShipCountry in('Brasil', 'France', 'Belgium')

--NULL sorgusuyla birlikte içerisinin dolu olup olmadýðýný belirtiyoruz. 
Select Count(*) as 'Not Null Ship Region Number' from Orders as o where o.ShipRegion is not null
Select Count(*) as 'Null Ship Region Number' from Orders as o where o.ShipRegion is null 

Select * from Orders as o where o.EmployeeID % 2 = 1 --sütun üzerinde istediðimiz bi þekilde koþul belirterek getirebiliriz.
Select * from Orders as o where o.EmployeeID % 2 = 0


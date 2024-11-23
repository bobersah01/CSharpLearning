Select c.CustomerID, c.CompanyName
		from Customers as c
		inner join Orders as o on o.CustomerID = c.CustomerID

--Bu sorgu i�erisinde, m��terilerin sipari�leri i�erisinde vermi� oldu�u en y�ksek rakam�, her m��terinin vermi� oldu�u toplam sipari� tutar�, toplam sipari� say�s�n� g�rebiliriz. 
Select  --Top 10 --yaln�zca ilk en tepedeki 10 kayd� g�sterir.
		o.CustomerID,
	    c.CompanyName, --max(c.CompanyName) ; min(c.CompanyName),
		Count(*) as TotalOrdersPerCustomer, 
		Max(od.UnitPrice*od.Quantity) as SingleMaxOrder,
		Sum(od.UnitPrice*od.Quantity) as TotalRevenuePerCustomer
		--Rank() Over (Partition By o.CustomerID Order By Sum(od.UnitPrice*od.Quantity)) as RankingTotalRevenuePerCustomer 
		from Orders as o
		inner join [Order Details] as od on o.OrderID = od.OrderID
		inner join Customers as c on o.CustomerID = c.CustomerID
		group by o.CustomerID, c.CompanyName --group by i�erisine companyname ekleyerek, max veya min aggregate fonksiyonuyla �ekmeme gerek kalm�yor, zaten hepsinden tek oldu�u i�in herhangi bir problem olmuyor. 
		order by TotalRevenuePerCustomer Desc
		offset 0 rows fetch first 10 rows only; --ilk sat�rdan itibaren 10 tane kay�t al demektir. 

--Yukar�daki komplex sorguyu yazmak amac�yla a�a��daki do�rulamay� yap�yorum. 
Select *
		from Orders as o
		where o.CustomerID = 'LAZYK'

--Yukar�daki komplex sorguyu yazmak amac�yla a�a��daki do�rulamay� yap�yorum. 
Select *,
		od.UnitPrice*od.Quantity as TotalSumPerOrder
		from [Order Details] as od
		where od.OrderID = 10482 or od.OrderID = 10545



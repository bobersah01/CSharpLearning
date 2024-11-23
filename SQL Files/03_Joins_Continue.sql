Select c.CustomerID, c.CompanyName
		from Customers as c
		inner join Orders as o on o.CustomerID = c.CustomerID

--Bu sorgu içerisinde, müþterilerin sipariþleri içerisinde vermiþ olduðu en yüksek rakamý, her müþterinin vermiþ olduðu toplam sipariþ tutarý, toplam sipariþ sayýsýný görebiliriz. 
Select  --Top 10 --yalnýzca ilk en tepedeki 10 kaydý gösterir.
		o.CustomerID,
	    c.CompanyName, --max(c.CompanyName) ; min(c.CompanyName),
		Count(*) as TotalOrdersPerCustomer, 
		Max(od.UnitPrice*od.Quantity) as SingleMaxOrder,
		Sum(od.UnitPrice*od.Quantity) as TotalRevenuePerCustomer
		--Rank() Over (Partition By o.CustomerID Order By Sum(od.UnitPrice*od.Quantity)) as RankingTotalRevenuePerCustomer 
		from Orders as o
		inner join [Order Details] as od on o.OrderID = od.OrderID
		inner join Customers as c on o.CustomerID = c.CustomerID
		group by o.CustomerID, c.CompanyName --group by içerisine companyname ekleyerek, max veya min aggregate fonksiyonuyla çekmeme gerek kalmýyor, zaten hepsinden tek olduðu için herhangi bir problem olmuyor. 
		order by TotalRevenuePerCustomer Desc
		offset 0 rows fetch first 10 rows only; --ilk satýrdan itibaren 10 tane kayýt al demektir. 

--Yukarýdaki komplex sorguyu yazmak amacýyla aþaðýdaki doðrulamayý yapýyorum. 
Select *
		from Orders as o
		where o.CustomerID = 'LAZYK'

--Yukarýdaki komplex sorguyu yazmak amacýyla aþaðýdaki doðrulamayý yapýyorum. 
Select *,
		od.UnitPrice*od.Quantity as TotalSumPerOrder
		from [Order Details] as od
		where od.OrderID = 10482 or od.OrderID = 10545



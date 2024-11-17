create DATABASE fullstacksampleDB
--use master -- komutu hangi database kullanmak istiyorsak 
create Table Students 
(
	StudentID INT IDENTITY(1,1) PRIMARY KEY, --öðrenci sayýsý 1 den baþlayacak ve 1 er 1 er artacaktýr.	
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	Email nvarchar(50) UNIQUE, --email adresi unique olmasý gerekmektedir, çünkü herkesin farklý e postalara sahip olmasý gerekmektedir.
	Birthdate DATETIME DEFAULT GETDATE()
)

insert into Students 
(Name, Surname, Email, Birthdate) values 
('Cemil', 'Þahin', 'cemil.sahin@hotmail.com', '01.12.1998'),
('Zeynep', 'Þahin', 'zeynep@gmail.com', '10.26.1998')

--name alaný eðer text ise sayý ifadesi giremem. hata alýrým. hangi tipte veri girersem onu kullanmam gerekecektir.
insert into Students
(Name, Surname, Email, Birthdate) values
(57, 64, 'kazým5864@gmail.com', '06.04.2007')

select Students.StudentID,
	   Students.Name,
	   Students.Surname,
	   Students.Email,
	   Students.Birthdate
	   from Students

--StudentID yani primary key alanýna veri eklemeye çalýþýyor ancak veriyi ekleyemiyorsak, bunun backend de bir karþýlýðý var. 
--Dolayýsýyla bunun bir sql içerisinde de bir kontrolü mevcuttur. Karýþýklýða yol açabilir. 

Update Students set Students.Name = 'Muazzez',
					Students.Surname = 'Abacý'
					where Students.StudentID = 5 --olmayan bir veriyi çaðýrýrken hata vermiyor, ancak tabloya da eklemiyor.

Delete from Students where Students.Name = 'Ömer' and
						   Students.Email = 'Bobersah@hotmail.com'


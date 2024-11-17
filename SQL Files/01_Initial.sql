create DATABASE fullstacksampleDB
--use master -- komutu hangi database kullanmak istiyorsak 
create Table Students 
(
	StudentID INT IDENTITY(1,1) PRIMARY KEY, --��renci say�s� 1 den ba�layacak ve 1 er 1 er artacakt�r.	
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	Email nvarchar(50) UNIQUE, --email adresi unique olmas� gerekmektedir, ��nk� herkesin farkl� e postalara sahip olmas� gerekmektedir.
	Birthdate DATETIME DEFAULT GETDATE()
)

insert into Students 
(Name, Surname, Email, Birthdate) values 
('Cemil', '�ahin', 'cemil.sahin@hotmail.com', '01.12.1998'),
('Zeynep', '�ahin', 'zeynep@gmail.com', '10.26.1998')

--name alan� e�er text ise say� ifadesi giremem. hata al�r�m. hangi tipte veri girersem onu kullanmam gerekecektir.
insert into Students
(Name, Surname, Email, Birthdate) values
(57, 64, 'kaz�m5864@gmail.com', '06.04.2007')

select Students.StudentID,
	   Students.Name,
	   Students.Surname,
	   Students.Email,
	   Students.Birthdate
	   from Students

--StudentID yani primary key alan�na veri eklemeye �al���yor ancak veriyi ekleyemiyorsak, bunun backend de bir kar��l��� var. 
--Dolay�s�yla bunun bir sql i�erisinde de bir kontrol� mevcuttur. Kar���kl��a yol a�abilir. 

Update Students set Students.Name = 'Muazzez',
					Students.Surname = 'Abac�'
					where Students.StudentID = 5 --olmayan bir veriyi �a��r�rken hata vermiyor, ancak tabloya da eklemiyor.

Delete from Students where Students.Name = '�mer' and
						   Students.Email = 'Bobersah@hotmail.com'


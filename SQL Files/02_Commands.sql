--Sistem üzerinde toplanan bütün loglarý görüntüleyebilmek için aþaðýdaki komutlar kullanýlýr. 

Select * from fn_dblog(NULL, NULL)

DBCC LOG (fullstackSampleDB, 3)

Select * from Students

--veritabaný içerisinde herhangi bir deðiþiklik yaptýðýmda, yaptýðým deðiþiklikleri geri alabilmek içinbegin transaction komutu kullanmam gerekecektir.
--Rollback ifadesi, yanlýþ yapýlan bir deðiþikliði iptal eder, öncesine döndürür.
--Commit ifadesi, yanlýþ deðilse direkt olarak ana tabloya iletir.,
--Commit atmadan önce rollback yapman gerekecektir. Yanlýþ birþeyi commit atarsan eski haline geri döndüremezsin.
Begin Transaction;
Update Students Set Students.Email = 'Zeynep.sahin@gmail.com' where Students.StudentID = 10 
Rollback;
Commit;

Create Table SampleTable 
(
	SampleID Int Primary Key,
	SampleName nvarchar(50) Not Null,
	SampleSurname nvarchar(50) Not Null
)

Create Table SampleSecondTable 
(
	SampleID Int Primary Key,
	SampleName2 nvarchar(50) Not Null,
	SampleSurname2 nvarchar(50) Not Null
)

--Oluþturulan tabloyu siliyoruz.
Drop Table SampleSecondTable

--Alter ile birlikte, tablolar içerisindeki sütunlarýn veri tiplerini, Null olup olmamasýný (ancak sütun içerisinde null veri varsa NOT NULL yapýlmasýna izin vermez. Çünkü içerisinde null olan verinin not null olduðunu belirtemeyiz.)
Alter Table SampleTable Alter Column SampleName nvarchar(100)

--Alter ile birlikte, tablolar içerisinde sütunlar eklenebilir. Bu iþlem manuel olarak da yapýlabilir. Kod ile de yapýlabilir.
Alter Table Students ADD Address nvarchar(100),
						 Phone nvarchar(11),
						 IdentityNumber nvarchar(11)

--Update Students Set Students.Phone = '05388231454' where Students.Phone = NULL
Alter Table Students Alter Column Address nvarchar(150) Not Null
								  	

--Sistem �zerinde toplanan b�t�n loglar� g�r�nt�leyebilmek i�in a�a��daki komutlar kullan�l�r. 

Select * from fn_dblog(NULL, NULL)

DBCC LOG (fullstackSampleDB, 3)

Select * from Students

--veritaban� i�erisinde herhangi bir de�i�iklik yapt���mda, yapt���m de�i�iklikleri geri alabilmek i�inbegin transaction komutu kullanmam gerekecektir.
--Rollback ifadesi, yanl�� yap�lan bir de�i�ikli�i iptal eder, �ncesine d�nd�r�r.
--Commit ifadesi, yanl�� de�ilse direkt olarak ana tabloya iletir.,
--Commit atmadan �nce rollback yapman gerekecektir. Yanl�� bir�eyi commit atarsan eski haline geri d�nd�remezsin.
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

--Olu�turulan tabloyu siliyoruz.
Drop Table SampleSecondTable

--Alter ile birlikte, tablolar i�erisindeki s�tunlar�n veri tiplerini, Null olup olmamas�n� (ancak s�tun i�erisinde null veri varsa NOT NULL yap�lmas�na izin vermez. ��nk� i�erisinde null olan verinin not null oldu�unu belirtemeyiz.)
Alter Table SampleTable Alter Column SampleName nvarchar(100)

--Alter ile birlikte, tablolar i�erisinde s�tunlar eklenebilir. Bu i�lem manuel olarak da yap�labilir. Kod ile de yap�labilir.
Alter Table Students ADD Address nvarchar(100),
						 Phone nvarchar(11),
						 IdentityNumber nvarchar(11)

--Update Students Set Students.Phone = '05388231454' where Students.Phone = NULL
Alter Table Students Alter Column Address nvarchar(150) Not Null
								  	

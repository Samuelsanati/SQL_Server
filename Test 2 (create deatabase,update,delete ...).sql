CREATE DATABASE Students
GO 
USE Students
GO
 
--///Specifications مشخصات
CREATE TABLE Specifications (
idSFS int NOT NULL ,
LastName varchar(50) NOT NULL,
FirstName varchar (50) NOT NULL,
Age int,
CONSTRAINT PK_Specifications PRIMARY KEY (idSFS,LastName)
);

GO

INSERT INTO Specifications (idSFS,LastName,FirstName,Age)
                    values (1,'Ali','Sanati',35),
					       (2,'Mahdi','Sarikhani',45),
						   (3,'Mahdi','Salimi',34),
						   (4,'Mohsen','Salimi',34),
						   (5,'Milad','Mohammadi',36)

GO

--///Scholl Profile مشخصات تحصیلی
--Discontinued Education مقطع-تحصیلی(DtEt)
--UniversityName نام دانشکاه (UN) 
--GPA معدل
--Diploma دیپلم
--Associate Degree کاردانی
--Master کارشناسی 
--Master's Degree کارشناسی ارشد
--Doctorate دکترا
--Postdoctoral فوق دکترا

CREATE TABLE SchollProfile (
idSP int NOT NULL ,
DtEt varchar(50) NOT NULL,
UN varchar (50) NOT NULL,
GPA  Float,
CONSTRAINT PK_SchollProfile PRIMARY KEY (idSP,UN,GPA)
);
GO
INSERT INTO SchollProfile (idSP,DtEt,UN,GPA)
                   values (1,'Ali Sanati','Associate Degree',17.5),
				          (2,'Mahdi Sarikhani','Doctorate',17),
						  (3,'Mahdi Salimi','Diploma',12.5),
						  (4,'Mohsen Salimi','Master',15.25),
						  (5,'Milad Mohammadi','Associate Degree',16.5)

SELECT Specifications.LastName, Specifications.idSFS
FROM Specifications
LEFT JOIN SchollProfile ON Specifications.idSFS =  Specifications.idSFS
ORDER BY Specifications.LastName;

GO 

SELECT [dbo].[SchollProfile].[idSP], [dbo].[Specifications].[idSFS]
FROM SchollProfile
INNER JOIN Specifications ON SchollProfile.idSP=Specifications.idSFS;

USE [Students]
GO
UPDATE Specifications
SET FirstName = 'parastoo', LastName = 'Damarcheli'
WHERE idSFS = 1;

USE [Students]
GO
DELETE FROM Specifications WHERE LastName = 'Damarcheli';
GO

USE [Students]
GO
INSERT INTO [dbo].[Specifications] ([idSFS],[LastName] , [FirstName],[Age] )
VALUES (1, 'Elnaz', 'Mahdavi',25);
GO

USE [Students]
GO
SELECT * FROM [dbo].[SchollProfile]
WHERE [idSP]=1;
GO

USE [Students]
GO
SELECT * FROM [dbo].[SchollProfile]
WHERE [GPA] = 2
GO

USE [Students]
GO


SELECT * FROM [dbo].[SchollProfile]
WHERE [idSP] > 3;
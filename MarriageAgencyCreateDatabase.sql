IF DB_ID('MarriageAgency') IS NOT NULL
BEGIN
	USE master
	ALTER DATABASE MarriageAgency SET single_user with rollback immediate;
	DROP DATABASE MarriageAgency;
END;
GO

CREATE DATABASE MarriageAgency;
GO

USE MarriageAgency;
GO

CREATE TABLE Religions
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (50) NOT NULL
);
GO

CREATE TABLE Education
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (100) NOT NULL
);
GO

CREATE TABLE BodyBuilds
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (20) DEFAULT NULL
);
GO

CREATE TABLE ZodiacSigns
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (20) DEFAULT NULL
);
GO

CREATE TABLE Countries
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar (50) DEFAULT NULL
);
GO

CREATE TABLE Cities
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(50) DEFAULT NULL
);
GO

CREATE TABLE Streets
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(100) DEFAULT NULL
);
GO

CREATE TABLE Houses
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(20) DEFAULT NULL
);
GO

CREATE TABLE Apartments
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(20) DEFAULT NULL
);
GO

CREATE TABLE Hairs
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(50) DEFAULT NULL
);
GO

CREATE TABLE Skins
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(50) DEFAULT NULL
);
GO

CREATE TABLE Eyes
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(50) DEFAULT NULL
);
GO

CREATE TABLE Genders
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(20)
);
GO

--
-- ���������� ����������� ��������
--

INSERT Religions(Name) VALUES ('�������')
INSERT Religions(Name) VALUES ('�����������')
INSERT Religions(Name) VALUES ('����������')
INSERT Religions(Name) VALUES ('�������������')
INSERT Religions(Name) VALUES ('��������������')
INSERT Religions(Name) VALUES ('�����')
INSERT Religions(Name) VALUES ('������')
INSERT Religions(Name) VALUES ('���������������')
INSERT Religions(Name) VALUES ('�������')
INSERT Religions(Name) VALUES ('�������')

INSERT Eyes(Name) VALUES ('�������')
INSERT Eyes(Name) VALUES ('�����')
INSERT Eyes(Name) VALUES ('��������')
INSERT Eyes(Name) VALUES ('�������')
INSERT Eyes(Name) VALUES ('�����')
INSERT Eyes(Name) VALUES ('����-�������')
INSERT Eyes(Name) VALUES ('�������')

INSERT Hairs(Name) VALUES ('������')
INSERT Hairs(Name) VALUES ('�����')
INSERT Hairs(Name) VALUES ('�����')
INSERT Hairs(Name) VALUES ('�����')
INSERT Hairs(Name) VALUES ('�������')
INSERT Hairs(Name) VALUES ('�����')

INSERT Skins(Name) VALUES ('���������')
INSERT Skins(Name) VALUES ('�����������')
INSERT Skins(Name) VALUES ('�����-�����������')
INSERT Skins(Name) VALUES ('������������������')
INSERT Skins(Name) VALUES ('�������������')
INSERT Skins(Name) VALUES ('����������������')

INSERT Genders(Name) VALUES ('�������')
INSERT Genders(Name) VALUES ('�������')

INSERT BodyBuilds(Name) VALUES('���������')
INSERT BodyBuilds(Name) VALUES('����������')
INSERT BodyBuilds(Name) VALUES('�������')
INSERT BodyBuilds(Name) VALUES('������')

INSERT ZodiacSigns(Name) VALUES('����')
INSERT ZodiacSigns(Name) VALUES('�����')
INSERT ZodiacSigns(Name) VALUES('��������')
INSERT ZodiacSigns(Name) VALUES('���')
INSERT ZodiacSigns(Name) VALUES('���')
INSERT ZodiacSigns(Name) VALUES('����')
INSERT ZodiacSigns(Name) VALUES('��������')
INSERT ZodiacSigns(Name) VALUES('�������')
INSERT ZodiacSigns(Name) VALUES('�������')
INSERT ZodiacSigns(Name) VALUES('�������')
INSERT ZodiacSigns(Name) VALUES('����')
GO

CREATE TABLE Addresses
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryFk bigint DEFAULT NULL,
	CityFk bigint DEFAULT NULL,
	StreetFk bigint DEFAULT NULL,
	HouseFk bigint DEFAULT NULL,
	ApartmentsFk bigint DEFAULT NULL

	FOREIGN KEY (CountryFk) REFERENCES Countries(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (CityFk) REFERENCES Cities(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (StreetFk) REFERENCES Streets(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (HouseFk) REFERENCES Houses(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ApartmentsFk) REFERENCES Apartments(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE Professions
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(100) DEFAULT NULL,
	Salary int DEFAULT NULL
);
GO

CREATE TABLE Nationalities
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(50) DEFAULT NULL
);
GO

CREATE TABLE ExternalCharacteristics
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Growth int DEFAULT NULL,
	Weigt int DEFAULT NULL,
	HairColourFk int DEFAULT NULL,
	SkinColourFk int DEFAULT NULL,
	EyeColorFk int DEFAULT NULL,
	BodyBuildFk int DEFAULT NULL

	FOREIGN KEY (HairColourFk) REFERENCES Hairs(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (SkinColourFk) REFERENCES Skins(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (EyeColorFk) REFERENCES Eyes(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (BodyBuildFk) REFERENCES BodyBuilds(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE Hobby
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(100) DEFAULT NULL
);
GO

CREATE TABLE BadHabits
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(100) DEFAULT NULL
);
GO

CREATE TABLE BodyModifications
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name nvarchar(100) DEFAULT NULL
);
GO

CREATE TABLE People
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Age int NOT NULL,
	ZodiacSignFk int NOT NULL,
	EducationFk int NOT NULL,
	GenderFk int NOT NULL,
	AddressFk bigint DEFAULT NULL,
	ProfessionFk bigint DEFAULT NULL,
	NationalityFk bigint DEFAULT NULL,
	ExternalCharacteristicsFk bigint NOT NULL,
	HobbyFk int DEFAULT NULL,
	BadHabitsFk int DEFAULT NULL,
	BodyModificationsFk int DEFAULT NULL,
	QuantityOfLanguages int DEFAULT 1,
	ReligionFk int DEFAULT NULL,
	Photo nvarchar(256) DEFAULT NULL,
	Pair bit DEFAULT NULL,

	FOREIGN KEY (ZodiacSignFk) REFERENCES ZodiacSigns(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (EducationFk) REFERENCES Education(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (GenderFk) REFERENCES Genders(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (AddressFk) REFERENCES Addresses(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ProfessionFk) REFERENCES Professions(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (NationalityFk) REFERENCES Nationalities(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ExternalCharacteristicsFk) REFERENCES ExternalCharacteristics(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (HobbyFk) REFERENCES Hobby(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (BadHabitsFk) REFERENCES BadHabits(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (BodyModificationsFk) REFERENCES BodyModifications(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ReligionFk) REFERENCES Religions(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE Requirements
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Age int DEFAULT NULL,
	GenderFk int NOT NULL,
	ZodiacSignFk int DEFAULT NULL,
	EducationFk int DEFAULT NULL,
	AddressFk bigint DEFAULT NULL,
	ProfessionFk bigint DEFAULT NULL,
	NationalityFk bigint DEFAULT NULL,
	ExternalCharacteristicsFk bigint DEFAULT NULL,
	HobbyFk int DEFAULT NULL,
	BadHabitsFk int DEFAULT NULL,
	BodyModificationsFk int DEFAULT NULL,
	QuantityOfLanquages int DEFAULT 1,
	ReligionFk int DEFAULT NULL

	FOREIGN KEY (GenderFk) REFERENCES Genders(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (AddressFk) REFERENCES Addresses(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ProfessionFk) REFERENCES Professions(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (NationalityFk) REFERENCES Nationalities(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ExternalCharacteristicsFk) REFERENCES ExternalCharacteristics(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (HobbyFk) REFERENCES Hobby(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (BadHabitsFk) REFERENCES BadHabits(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (BodyModificationsFk) REFERENCES BodyModifications(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (ReligionFk) REFERENCES Religions(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE RequirementsPeople
(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PeopleFk bigint NOT NULL,
	RequirementsFk bigint NOT NULL,
);
GO

CREATE TABLE Pages
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	UserFk bigint NOT NULL,
	NickName nvarchar(100) NOT NULL,
	VKId bigint DEFAULT NULL,
	RatePage int DEFAULT NULL,
	CountViews int DEFAULT NULL,
	GiftQuantity int DEFAULT NULL

	FOREIGN KEY (UserFk) REFERENCES People(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE UserMessages
(
	Id bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ContentsOf nvarchar(500),
	PageFk bigint NOT NULL

	FOREIGN KEY (PageFk) REFERENCES Pages(Id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
GO

CREATE TABLE CountOfMen
(
	CountOfMenField bigint DEFAULT NULL,
);
GO

CREATE TABLE CountOfWomen
(
	CountOfWomenField bigint DEFAULT NULL,
);
GO

CREATE TRIGGER GenderDivision
ON People
AFTER INSERT
AS
BEGIN
IF((SELECT G.Id FROM People P JOIN Genders G ON P.GenderFk = G.Id WHERE P.Id = IDENT_CURRENT('People')) = (SELECT G.Id FROM Genders G WHERE G.Name = '�������'))
	IF((SELECT C.CountOfMenField FROM CountOfMen C ) IS NOT NULL)
		UPDATE CountOfMen SET CountOfMenField = CountOfMenField + 1;
	ELSE
		INSERT CountOfMen(CountOfMenField) VALUES(1);
ELSE
	IF((SELECT C.CountOfWomenField FROM CountOfWomen C) IS NOT NULL)
		UPDATE CountOfWomen SET CountOfWomenField = CountOfWomenField + 1;
	ELSE
		INSERT CountOfWomen(CountOfWomenField) VALUES(1);
end;
GO


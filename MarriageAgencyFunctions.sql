USE MarriageAgency;
GO

-- b) Реализовать триггеры;

--CREATE TRIGGER GenderDivision
--ON People
--AFTER INSERT
--AS
--BEGIN
--IF((SELECT G.Id FROM People P JOIN Genders G ON P.GenderFk = G.Id WHERE P.Id = IDENT_CURRENT('People')) = (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'))
--	IF((SELECT C.CountOfMenField FROM CountOfMen C ) IS NOT NULL)
--		UPDATE CountOfMen SET CountOfMenField = CountOfMenField + 1;
--	ELSE
--		INSERT CountOfMen(CountOfMenField) VALUES(1);
--ELSE
--	IF((SELECT C.CountOfWomenField FROM CountOfWomen C) IS NOT NULL)
--		UPDATE CountOfWomen SET CountOfWomenField = CountOfWomenField + 1;
--	ELSE
--		INSERT CountOfWomen(CountOfWomenField) VALUES(1);
--END;
--GO

SELECT *
FROM CountOfMen, CountOfWomen;
GO

--с) Нужно чтобы была следующая функциональность, реализованная через сохранненые процедуры:
  
-- 1) Показ партнеров из страны, заданной в качестве параметра;

CREATE PROCEDURE CountryParam
				@name nvarchar(50)
AS
SELECT P.FirstName, P.LastName, P.Age,
	G.Name,
	Cu.Name, Ci.Name, St.Name,
	Pr.Name, Pr.Salary,
	N.Name,
	E.Growth, E.Weigt,
	Hr.Name, Sk.Name, Ey.Name,
	H.Name,
	P.Photo, P.Pair
FROM People P
	JOIN Addresses A ON P.AddressFk = A.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
	JOIN Nationalities N ON P.NationalityFk = N.Id
	JOIN ExternalCharacteristics E ON P.ExternalCharacteristicsFk = E.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Countries Cu ON A.CountryFk = Cu.Id
	JOIN Cities Ci ON A.CityFk = Ci.Id
	JOIN Streets St ON A.StreetFk = St.Id
	JOIN Hairs Hr ON E.HairColourFk = Hr.Id
	JOIN Skins Sk ON E.SkinColourFk = Sk.Id
	JOIN Eyes Ey ON E.EyeColorFk = Ey.Id
WHERE Cu.Name = @name;
GO


EXEC CountryParam @name = 'Украина';
GO

--      2) Показ партнеров по зарплате;

CREATE PROCEDURE ZpParam
				@zp int
AS
SELECT P.FirstName, P.LastName, P.Age,
	G.Name,
	Cu.Name, Ci.Name, St.Name,
	Pr.Name, Pr.Salary,
	N.Name,
	E.Growth, E.Weigt,
	Hr.Name, Sk.Name, Ey.Name,
	H.Name,
	P.Photo, P.Pair
FROM People P
	JOIN Addresses A ON P.AddressFk = A.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
	JOIN Nationalities N ON P.NationalityFk = N.Id
	JOIN ExternalCharacteristics E ON P.ExternalCharacteristicsFk = E.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Countries Cu ON A.CountryFk = Cu.Id
	JOIN Cities Ci ON A.CityFk = Ci.Id
	JOIN Streets St ON A.StreetFk = St.Id
	JOIN Hairs Hr ON E.HairColourFk = Hr.Id
	JOIN Skins Sk ON E.SkinColourFk = Sk.Id
	JOIN Eyes Ey ON E.EyeColorFk = Ey.Id
WHERE Pr.Salary >= @zp;
GO

EXEC ZpParam @zp = 10000;
GO

--      3) Показ партнеров по внешним характеристикам;

CREATE PROCEDURE ExtCharParam
				@gr int, @wei int, @hair nvarchar(20),
				@skin nvarchar(20), @eyes nvarchar(20)
AS
SELECT P.FirstName, P.LastName, P.Age,
	G.Name,
	Cu.Name, Ci.Name, St.Name,
	Pr.Name, Pr.Salary,
	N.Name,
	E.Growth, E.Weigt,
	Hr.Name, Sk.Name, Ey.Name,
	H.Name,
	P.Photo, P.Pair
FROM People P
	JOIN Addresses A ON P.AddressFk = A.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
	JOIN Nationalities N ON P.NationalityFk = N.Id
	JOIN ExternalCharacteristics E ON P.ExternalCharacteristicsFk = E.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Countries Cu ON A.CountryFk = Cu.Id
	JOIN Cities Ci ON A.CityFk = Ci.Id
	JOIN Streets St ON A.StreetFk = St.Id
	JOIN Hairs Hr ON E.HairColourFk = Hr.Id
	JOIN Skins Sk ON E.SkinColourFk = Sk.Id
	JOIN Eyes Ey ON E.EyeColorFk = Ey.Id
WHERE E.Growth = @gr AND E.Weigt = @wei AND Hr.Name = @hair AND
	Sk.Name = @skin AND Ey.Name = @eyes;
GO	

--      4) Показ партнеров по комбинации параметров;

CREATE PROCEDURE ShowPartnersAboutCombinationsPar
				@country nvarchar(50), @wei int, @hair nvarchar(20), @city nvarchar(50)
AS
SELECT P.FirstName, P.LastName, Cn.Name AS Country, Ct.Name AS City, Ex.Weigt, H.Name AS Hair
FROM People P
	JOIN Addresses Ad ON P.AddressFk = Ad.Id
	JOIN Countries Cn ON Ad.CountryFk = Cn.Id
	JOIN Cities Ct ON Ad.CityFk = Ct.Id
	JOIN ExternalCharacteristics Ex ON P.ExternalCharacteristicsFk = Ex.Id
	JOIN Hairs H ON Ex.HairColourFk = H.Id
WHERE @country = Ct.Name AND
	@wei = Ex.Weigt AND
	@hair = H.Name AND
	@city = Ct.Name;
GO
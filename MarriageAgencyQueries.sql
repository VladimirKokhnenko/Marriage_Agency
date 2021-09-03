USE MarriageAgency
GO

-- Запросы

-- 1. Показать первых 10 пользователей с самым высоким рейтингом анкеты (Anketa_Rate).

SELECT TOP 5 Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
ORDER BY Pg.RatePage DESC;
GO

-- 2. Показать 10 пользователей, чьи анкеты просматривали чаще всего (Anketa_View).

SELECT TOP 5 Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.CountViews
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
ORDER BY Pg.CountViews DESC;
GO

-- 3. Показать всех пользователей с высшим образованием, которые не курят, не пьют и не употребляют наркотики.

SELECT Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.CountViews, Ed.Name AS Education, Bd.Name AS BadHabbits
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Education Ed ON P.EducationFk = Ed.Id
	JOIN BadHabits Bd ON P.BadHabitsFk = Bd.Id
	JOIN Genders G ON P.GenderFk = G.Id
WHERE  Bd.Id IN (SELECT B.Id FROM BadHabits B WHERE B.Name = 'Нет')
	AND Ed.Id IN (SELECT E.Id FROM Education E JOIN People P ON P.EducationFk = E.Id WHERE E.Name = 'Высшее');
GO

-- 4. Показать всех стройных голубоглазых блондинок, затем всех спортивных кареглазых брюнетов, а в конце их общее количество (UNION).

CREATE VIEW BlondesAndBrunettes
AS
SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN ExternalCharacteristics Ex ON P.ExternalCharacteristicsFk = Ex.Id
	JOIN Eyes Ey ON Ex.EyeColorFk = Ey.Id
	JOIN BodyBuilds B ON Ex.BodyBuildFk = B.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Hairs H ON Ex.HairColourFk = H.Id
WHERE Ey.Name = 'Голубые' AND B.Name = 'Спортивное' AND G.Name = 'Женский' AND H.Name = 'Блондин'
UNION
SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN ExternalCharacteristics Ex ON P.ExternalCharacteristicsFk = Ex.Id
	JOIN Eyes Ey ON Ex.EyeColorFk = Ey.Id
	JOIN BodyBuilds B ON Ex.BodyBuildFk = B.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Hairs H ON Ex.HairColourFk = H.Id
WHERE Ey.Name = 'Карие' AND G.Name = 'Мужской' AND B.Name = 'Спортивное' AND H.Name = 'Брюнет';
GO

SELECT *
FROM BlondesAndBrunettes B
UNION
SELECT '', '', '', '', '', 'Всего', COUNT(*) AS 'Count'
FROM BlondesAndBrunettes
ORDER BY B.VKId DESC;
GO

-- 5. Показать всех программистов с пирсингом, которые к тому же умеют вышивать крестиком (Moles, Framework и Interes)

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
	JOIN BodyModifications B ON P.BodyModificationsFk = B.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Genders G ON P.GenderFk = G.Id
WHERE H.Name = 'Вышивание крестиком' AND Pr.Name = 'Программист' AND B.Name = 'Пирсинг';
GO
-- 6. Показать сколько подарков подарили каждому пользователю, у которого знак зодиака Рыбы.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.GiftQuantity
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN ZodiacSigns Z ON P.ZodiacSignFk = Z.Id
WHERE Z.Name = 'Рыбы';
GO

-- 7. Показать как много зарабатывают себе на жизнь полиглоты (знающие более 5 языков), совершенно не умеющих готовить.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pr.Salary
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
WHERE P.QuantityOfLanguages > 5 AND Pr.Name != 'Повар';
GO

-- 8. Показать всех буддистов, живут на вокзале, и в свободное время катаются на скейте.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, S.Name AS Street, H.Name AS Hobby
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Religions R ON P.ReligionFk = R.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Addresses A ON P.AddressFk = A.Id
	JOIN Streets S ON A.StreetFk = S.Id
WHERE S.Name = 'Вокзал' AND H.Name = 'Скейт';
GO

-- 9. Показать 5 самых популярных слов, отправленных в личных сообщениях (слова на выбор), и их общее количество.

CREATE VIEW Mes
AS
SELECT TOP 5 U.ContentsOf, COUNT(U.ContentsOf) AS CountMessages
FROM UserMessages U
GROUP BY U.ContentsOf
ORDER BY CountMessages DESC;
GO

SELECT *
FROM Mes
UNION
SELECT 'Всего', COUNT(*) AS CountMessages
FROM UserMessages U
ORDER BY CountMessages;
GO

--10. Показать возрастную аудиторию пользователей в виде:
--возраст	кол-во	%
--до 18		2000	40
--18-24		1500	30
--24-30		1000	20
--от 30		500		10

DECLARE @qP int = (SELECT COUNT(*) FROM People P);

SELECT 1 AS Номер, 'до 18' AS Возраст, COUNT(*) AS Количество, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age < 18
UNION
SELECT 2 AS Номер, '18-24' AS Возраст, COUNT(*) AS Количество, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age >= 18 AND P.Age <= 24
UNION
SELECT 3 AS Номер, '24-30' AS Возраст, COUNT(*) AS Количество, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age > 24 AND P.Age <= 30
UNION
SELECT 4 AS Номер, '30' AS Возраст, COUNT(*) AS Количество, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age > 30;
GO

SELECT P.Age, COUNT(*)
FROM People P
GROUP BY P.Age;
GO

--11. Сделать запрос с параметрами, который одновременно позволяет выбрать
-- ник (не обязательно точный)
-- пол (1,2)
-- минимальный возраст
-- максимальный возраст
-- минимальный рост
-- максимальный рост
-- минимальный вес
-- максимальный вес
--и показывает первых 50 найденных пользователей, со всеми этими данными.

DECLARE @nic nvarchar(50) = 'la';
DECLARE @gender nvarchar(50) = 'Мужской';
DECLARE @minAge int = 24;
DECLARE @maxAge int = 50;
DECLARE @minGrowth int = 160;
DECLARE @maxGrowth int = 180;
DECLARE @minWeight int = 57;
DECLARE @maxWeight int = 80;

SELECT TOP 50 Pg.NickName, G.Name AS Gender, P.Age, Ex.Growth, Ex.Weigt
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN ExternalCharacteristics Ex ON P.ExternalCharacteristicsFk = Ex.Id
	JOIN Genders G ON P.GenderFk = G.Id
WHERE Pg.NickName LIKE CONCAT((CONCAT('%', @nic)), '%') AND
	G.Name = @gender AND
	@minAge <= P.Age AND
	@maxAge >= P.Age AND
	@minGrowth <= Ex.Growth AND
	@maxGrowth >= Ex.Growth AND
	@minWeight <= Ex.Weigt AND
	@maxWeight >= Ex.Weigt;
GO

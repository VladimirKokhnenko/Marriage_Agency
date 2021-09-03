USE MarriageAgency
GO

-- �������

-- 1. �������� ������ 10 ������������� � ����� ������� ��������� ������ (Anketa_Rate).

SELECT TOP 5 Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
ORDER BY Pg.RatePage DESC;
GO

-- 2. �������� 10 �������������, ��� ������ ������������� ���� ����� (Anketa_View).

SELECT TOP 5 Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.CountViews
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
ORDER BY Pg.CountViews DESC;
GO

-- 3. �������� ���� ������������� � ������ ������������, ������� �� �����, �� ���� � �� ����������� ���������.

SELECT Pg.VKId, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.CountViews, Ed.Name AS Education, Bd.Name AS BadHabbits
FROM Pages Pg
	JOIN People P ON Pg.UserFk = P.Id
	JOIN Education Ed ON P.EducationFk = Ed.Id
	JOIN BadHabits Bd ON P.BadHabitsFk = Bd.Id
	JOIN Genders G ON P.GenderFk = G.Id
WHERE  Bd.Id IN (SELECT B.Id FROM BadHabits B WHERE B.Name = '���')
	AND Ed.Id IN (SELECT E.Id FROM Education E JOIN People P ON P.EducationFk = E.Id WHERE E.Name = '������');
GO

-- 4. �������� ���� �������� ������������ ���������, ����� ���� ���������� ���������� ��������, � � ����� �� ����� ���������� (UNION).

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
WHERE Ey.Name = '�������' AND B.Name = '����������' AND G.Name = '�������' AND H.Name = '�������'
UNION
SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN ExternalCharacteristics Ex ON P.ExternalCharacteristicsFk = Ex.Id
	JOIN Eyes Ey ON Ex.EyeColorFk = Ey.Id
	JOIN BodyBuilds B ON Ex.BodyBuildFk = B.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Hairs H ON Ex.HairColourFk = H.Id
WHERE Ey.Name = '�����' AND G.Name = '�������' AND B.Name = '����������' AND H.Name = '������';
GO

SELECT *
FROM BlondesAndBrunettes B
UNION
SELECT '', '', '', '', '', '�����', COUNT(*) AS 'Count'
FROM BlondesAndBrunettes
ORDER BY B.VKId DESC;
GO

-- 5. �������� ���� ������������� � ���������, ������� � ���� �� ����� �������� ��������� (Moles, Framework � Interes)

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
	JOIN BodyModifications B ON P.BodyModificationsFk = B.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Genders G ON P.GenderFk = G.Id
WHERE H.Name = '��������� ���������' AND Pr.Name = '�����������' AND B.Name = '�������';
GO
-- 6. �������� ������� �������� �������� ������� ������������, � �������� ���� ������� ����.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pg.GiftQuantity
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN ZodiacSigns Z ON P.ZodiacSignFk = Z.Id
WHERE Z.Name = '����';
GO

-- 7. �������� ��� ����� ������������ ���� �� ����� ��������� (������� ����� 5 ������), ���������� �� ������� ��������.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, Pr.Salary
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Professions Pr ON P.ProfessionFk = Pr.Id
WHERE P.QuantityOfLanguages > 5 AND Pr.Name != '�����';
GO

-- 8. �������� ���� ���������, ����� �� �������, � � ��������� ����� �������� �� ������.

SELECT Pg.VKId, P.FirstName, P.LastName, Pg.NickName, P.Age, G.Name AS Gender, Pg.RatePage, S.Name AS Street, H.Name AS Hobby
FROM People P
	JOIN Pages Pg ON Pg.UserFk = P.Id
	JOIN Genders G ON P.GenderFk = G.Id
	JOIN Religions R ON P.ReligionFk = R.Id
	JOIN Hobby H ON P.HobbyFk = H.Id
	JOIN Addresses A ON P.AddressFk = A.Id
	JOIN Streets S ON A.StreetFk = S.Id
WHERE S.Name = '������' AND H.Name = '�����';
GO

-- 9. �������� 5 ����� ���������� ����, ������������ � ������ ���������� (����� �� �����), � �� ����� ����������.

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
SELECT '�����', COUNT(*) AS CountMessages
FROM UserMessages U
ORDER BY CountMessages;
GO

--10. �������� ���������� ��������� ������������� � ����:
--�������	���-��	%
--�� 18		2000	40
--18-24		1500	30
--24-30		1000	20
--�� 30		500		10

DECLARE @qP int = (SELECT COUNT(*) FROM People P);

SELECT 1 AS �����, '�� 18' AS �������, COUNT(*) AS ����������, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age < 18
UNION
SELECT 2 AS �����, '18-24' AS �������, COUNT(*) AS ����������, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age >= 18 AND P.Age <= 24
UNION
SELECT 3 AS �����, '24-30' AS �������, COUNT(*) AS ����������, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age > 24 AND P.Age <= 30
UNION
SELECT 4 AS �����, '30' AS �������, COUNT(*) AS ����������, COUNT(*) * 100 / @qP AS '%' 
FROM People P
WHERE P.Age > 30;
GO

SELECT P.Age, COUNT(*)
FROM People P
GROUP BY P.Age;
GO

--11. ������� ������ � �����������, ������� ������������ ��������� �������
-- ��� (�� ����������� ������)
-- ��� (1,2)
-- ����������� �������
-- ������������ �������
-- ����������� ����
-- ������������ ����
-- ����������� ���
-- ������������ ���
--� ���������� ������ 50 ��������� �������������, �� ����� ����� �������.

DECLARE @nic nvarchar(50) = 'la';
DECLARE @gender nvarchar(50) = '�������';
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

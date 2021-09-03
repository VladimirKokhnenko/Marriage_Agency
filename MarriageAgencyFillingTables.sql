USE MarriageAgency;
GO

-- ����������

-- �������

INSERT Education(Name) VALUES ('������� ����������������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Streets(Name) VALUES ('��������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('�����������', 15000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (160, 55, (SELECT H.Id FROM Hairs H WHERE H.Name = '�����'), (SELECT H.Id FROM Skins H WHERE H.Name = '���������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '����������')); 
INSERT Hobby(Name) VALUES ('�����');
INSERT BadHabits(Name) VALUES ('�������������');
INSERT BodyModifications(Name) VALUES ('�������');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('�����', '�������', 26, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '���'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 1, (SELECT R.Id FROM Religions R WHERE R.Name = '������������'), 'C:/Photo');

-- ������������

INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (40000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('�������');
INSERT Requirements(Age, GenderFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk,NickName, VKId , RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Banshee', 100, 1, 11, 1);

INSERT UserMessages(ContentsOf, PageFk) VALUES('������, ��� ����?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('��������', IDENT_CURRENT('Pages'));
GO
-- �������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Streets(Name) VALUES ('������������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('�����', 20000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (165, 70, (SELECT H.Id FROM Hairs H WHERE H.Name = '������'), (SELECT H.Id FROM Skins H WHERE H.Name = '�����������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '�������')); 
INSERT Hobby(Name) VALUES ('�����');
INSERT BadHabits(Name) VALUES ('���');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('����������', '���������', 28, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '���'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, (SELECT R.Id FROM Religions R WHERE R.Name = '������������'), 'C:/Photo');

-- ������������

INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Muffin', 101, 2, 12, 2);

INSERT UserMessages(ContentsOf, PageFk) VALUES('������, ��� ����?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('��������', IDENT_CURRENT('Pages'));
GO
-- �������

INSERT Education(Name) VALUES ('�������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Streets(Name) VALUES ('����������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('��������', 25000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (163, 57, (SELECT H.Id FROM Hairs H WHERE H.Name = '�������'), (SELECT H.Id FROM Skins H WHERE H.Name = '�����������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�������'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '������')); 
INSERT Hobby(Name) VALUES ('����������');
INSERT BadHabits(Name) VALUES ('�������������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('�����', '��������', 24, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '����'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 3, 'C:/Photo');

-- ������������

INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Funny Bunny', 102, 3, 13, 3);

INSERT UserMessages(ContentsOf, PageFk) VALUES('������, ��� ����?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('��������', IDENT_CURRENT('Pages'));
GO
-- �������

INSERT Education(Name) VALUES ('�������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Streets(Name) VALUES ('����������� �����������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('����������', 25000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (163, 57, (SELECT H.Id FROM Hairs H WHERE H.Name = '�������'), (SELECT H.Id FROM Skins H WHERE H.Name = '�����������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�������'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '����������')); 
INSERT Hobby(Name) VALUES ('����������');
INSERT BadHabits(Name) VALUES ('����������');
INSERT BodyModifications(Name) VALUES ('����');
INSERT People(FirstName, LastName, Age, GenderFk, EducationFk, ZodiacSignFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('������', '��������', 28, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Education'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '����'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 1, 'C:/Photo');

-- ������������
INSERT Education(Name) VALUES ('���');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('�������');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'), IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'LadyLuck', 103, 4, 14, 4);

INSERT UserMessages(ContentsOf, PageFk) VALUES('���', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
GO
--
--�������
--

-- �������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Streets(Name) VALUES ('����������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('���������', 30000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = '������'), (SELECT H.Id FROM Skins H WHERE H.Name = '������������������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '����������')); 
INSERT Hobby(Name) VALUES ('�������');
INSERT BadHabits(Name) VALUES ('�������������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('�������', '�����', 31, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '��������'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, 'C:/Photo');

-- ������������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Lava', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('���', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('������� ���', IDENT_CURRENT('Pages'));
GO
-- �������
INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Streets(Name) VALUES ('������������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('����������', 50000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = '������'), (SELECT H.Id FROM Skins H WHERE H.Name = '������������������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '���������')); 
INSERT Hobby(Name) VALUES ('������');
INSERT BadHabits(Name) VALUES ('���');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('����', '�����', 35, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '�������'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 7, 'C:/Photo');

-- ������������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Chewbacca', 105, 6, 16, 6);
INSERT UserMessages(ContentsOf, PageFk) VALUES('� ������ �����', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('���������', IDENT_CURRENT('Pages'));
GO

-- �������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Streets(Name) VALUES ('�����������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('�����������', 100000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (170, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = '�����'), (SELECT H.Id FROM Skins H WHERE H.Name = '������������������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '����������')); 
INSERT Hobby(Name) VALUES ('������');
INSERT BadHabits(Name) VALUES ('���');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('������', '����������', 27, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '�������'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 7, 'C:/Photo');

-- ������������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('����');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (100000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Tiger Toec', 107, 7, 17, 7);
INSERT UserMessages(ContentsOf, PageFk) VALUES('�������', IDENT_CURRENT('Pages'));
GO

-- �������

INSERT Education(Name) VALUES ('�������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('��������');
INSERT Streets(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('����', 55);
INSERT Nationalities(Name) VALUES ('�����');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = '������'), (SELECT H.Id FROM Skins H WHERE H.Name = '������������������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '���������')); 
INSERT Hobby(Name) VALUES ('�������');
INSERT BadHabits(Name) VALUES ('����������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('������', '�������', 40, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '��������'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, 'C:/Photo');

-- ������������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Dusa', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('��� ����?', IDENT_CURRENT('Pages'));
GO

INSERT Education(Name) VALUES ('���');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('���������');
INSERT Streets(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('�������', 55);
INSERT Nationalities(Name) VALUES ('�������');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = '������'), (SELECT H.Id FROM Skins H WHERE H.Name = '������������������'), (SELECT H.Id FROM Eyes H WHERE H.Name = '�����'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = '����������')); 
INSERT Hobby(Name) VALUES ('�����');
INSERT BadHabits(Name) VALUES ('����������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('�������', '��������', 40, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = '��������'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2,  (SELECT R.Id FROM Religions R WHERE R.Name = '�������'), 'C:/Photo');

-- ������������

INSERT Education(Name) VALUES ('������');
INSERT Countries(Name) VALUES ('�������');
INSERT Cities(Name) VALUES ('������');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('��������');
INSERT BodyModifications(Name) VALUES ('���');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = '�������'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Dusa', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('������ �����', IDENT_CURRENT('Pages'));
GO
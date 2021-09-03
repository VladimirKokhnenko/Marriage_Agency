USE MarriageAgency;
GO

-- Заполнение

-- Человек

INSERT Education(Name) VALUES ('Среднее профессиональное');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Streets(Name) VALUES ('Довженко');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Парикхмахер', 15000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (160, 55, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Рыжий'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Кельтский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Спортивное')); 
INSERT Hobby(Name) VALUES ('Танцы');
INSERT BadHabits(Name) VALUES ('Табакокурение');
INSERT BodyModifications(Name) VALUES ('Пирсинг');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('Ирина', 'Петрова', 26, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Рак'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 1, (SELECT R.Id FROM Religions R WHERE R.Name = 'Христианство'), 'C:/Photo');

-- Предпочтения

INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (40000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT BodyModifications(Name) VALUES ('Пирсинг');
INSERT Requirements(Age, GenderFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk,NickName, VKId , RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Banshee', 100, 1, 11, 1);

INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет, как дела?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Кукусики', IDENT_CURRENT('Pages'));
GO
-- Человек

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Streets(Name) VALUES ('Ришельевская');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Повар', 20000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (165, 70, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Брюнет'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Нордический'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Плотное')); 
INSERT Hobby(Name) VALUES ('Танцы');
INSERT BadHabits(Name) VALUES ('Нет');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('Александра', 'Корниенко', 28, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Рак'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, (SELECT R.Id FROM Religions R WHERE R.Name = 'Христианство'), 'C:/Photo');

-- Предпочтения

INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Muffin', 101, 2, 12, 2);

INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет, как дела?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Кукусики', IDENT_CURRENT('Pages'));
GO
-- Человек

INSERT Education(Name) VALUES ('Среднее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Streets(Name) VALUES ('Пушкинская');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Дизайнер', 25000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (163, 57, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Блондин'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Нордический'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Голубые'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Полное')); 
INSERT Hobby(Name) VALUES ('Фотография');
INSERT BadHabits(Name) VALUES ('Табакокурение');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Алина', 'Овсиенко', 24, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Рыбы'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 3, 'C:/Photo');

-- Предпочтения

INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Funny Bunny', 102, 3, 13, 3);

INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет, как дела?', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Привет', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Кукусики', IDENT_CURRENT('Pages'));
GO
-- Человек

INSERT Education(Name) VALUES ('Среднее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Streets(Name) VALUES ('Архитектора Городецкого');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Переводчик', 25000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (163, 57, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Блондин'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Нордический'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Голубые'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Спортивное')); 
INSERT Hobby(Name) VALUES ('Фотография');
INSERT BadHabits(Name) VALUES ('Алкоголизм');
INSERT BodyModifications(Name) VALUES ('Тату');
INSERT People(FirstName, LastName, Age, GenderFk, EducationFk, ZodiacSignFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Галина', 'Макарова', 28, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Education'), (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Овен'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 1, 'C:/Photo');

-- Предпочтения
INSERT Education(Name) VALUES ('Нет');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (50000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT BodyModifications(Name) VALUES ('Пирсинг');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (30, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'), IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'LadyLuck', 103, 4, 14, 4);

INSERT UserMessages(ContentsOf, PageFk) VALUES('Хай', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
GO
--
--Мужчины
--

-- Человек

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Streets(Name) VALUES ('Пушкинская');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Строитель', 30000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Брюнет'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Среднеземноморский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Спортивное')); 
INSERT Hobby(Name) VALUES ('Рыбалка');
INSERT BadHabits(Name) VALUES ('Табакокурение');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Висилий', 'Попов', 31, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Скорпион'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, 'C:/Photo');

-- Предпочтения

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Lava', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('Хай', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Здрасте вам', IDENT_CURRENT('Pages'));
GO
-- Человек
INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Streets(Name) VALUES ('Михайловская');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Архитектор', 50000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Брюнет'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Среднеземноморский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Худощавое')); 
INSERT Hobby(Name) VALUES ('Туризм');
INSERT BadHabits(Name) VALUES ('Нет');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Иван', 'Котов', 35, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Стрелец'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 7, 'C:/Photo');

-- Предпочтения

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Chewbacca', 105, 6, 16, 6);
INSERT UserMessages(ContentsOf, PageFk) VALUES('С добрым утром', IDENT_CURRENT('Pages'));
INSERT UserMessages(ContentsOf, PageFk) VALUES('Приветики', IDENT_CURRENT('Pages'));
GO

-- Человек

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Streets(Name) VALUES ('Глубочицкая');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Программист', 100000);
INSERT Nationalities(Name) VALUES ('Украинец');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (170, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Шатен'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Среднеземноморский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Спортивное')); 
INSERT Hobby(Name) VALUES ('Туризм');
INSERT BadHabits(Name) VALUES ('Нет');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Максим', 'Литвиненко', 27, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Водолей'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 7, 'C:/Photo');

-- Предпочтения

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Киев');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (100000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Tiger Toec', 107, 7, 17, 7);
INSERT UserMessages(ContentsOf, PageFk) VALUES('Здорова', IDENT_CURRENT('Pages'));
GO

-- Человек

INSERT Education(Name) VALUES ('Среднее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Николаев');
INSERT Streets(Name) VALUES ('Вокзал');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Бомж', 55);
INSERT Nationalities(Name) VALUES ('Азиат');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Брюнет'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Среднеземноморский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Худощавое')); 
INSERT Hobby(Name) VALUES ('Бутылки');
INSERT BadHabits(Name) VALUES ('Алкоголизм');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, Photo)
VALUES ('Даниил', 'Мячиков', 40, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Скорпион'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2, 'C:/Photo');

-- Предпочтения

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Dusa', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('Как дела?', IDENT_CURRENT('Pages'));
GO

INSERT Education(Name) VALUES ('Нет');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Мариуполь');
INSERT Streets(Name) VALUES ('Вокзал');
INSERT Addresses(CountryFk, CityFk, StreetFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'), IDENT_CURRENT('Streets'));
INSERT Professions(Name, Salary) VALUES ('Дворник', 55);
INSERT Nationalities(Name) VALUES ('Русский');
INSERT ExternalCharacteristics(Growth, Weigt, HairColourFk, SkinColourFk, EyeColorFk, BodyBuildFk)
VALUES (180, 80, (SELECT H.Id FROM Hairs H WHERE H.Name = 'Брюнет'), (SELECT H.Id FROM Skins H WHERE H.Name = 'Среднеземноморский'), (SELECT H.Id FROM Eyes H WHERE H.Name = 'Карие'), (SELECT B.Id FROM BodyBuilds B WHERE B.Name = 'Спортивное')); 
INSERT Hobby(Name) VALUES ('Скейт');
INSERT BadHabits(Name) VALUES ('Алкоголизм');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT People(FirstName, LastName, Age, GenderFk, ZodiacSignFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, ExternalCharacteristicsFk, HobbyFk, BadHabitsFk, BodyModificationsFk, QuantityOfLanguages, ReligionFk, Photo)
VALUES ('Василий', 'Сомойлов', 40, (SELECT G.Id FROM Genders G WHERE G.Name = 'Мужской'),  (SELECT Z.Id FROM ZodiacSigns Z WHERE Z.Name = 'Скорпион'), IDENT_CURRENT('Education'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('ExternalCharacteristics'), IDENT_CURRENT('Hobby'), IDENT_CURRENT('BadHabits'), IDENT_CURRENT('BodyModifications'), 2,  (SELECT R.Id FROM Religions R WHERE R.Name = 'Буддизм'), 'C:/Photo');

-- Предпочтения

INSERT Education(Name) VALUES ('Высшее');
INSERT Countries(Name) VALUES ('Украина');
INSERT Cities(Name) VALUES ('Одесса');
INSERT Addresses(CountryFk, CityFk) VALUES (IDENT_CURRENT('Countries'), IDENT_CURRENT('Cities'));
INSERT Professions(Salary) VALUES (10000);
INSERT Nationalities(Name) VALUES ('Украинка');
INSERT BodyModifications(Name) VALUES ('Нет');
INSERT Requirements(Age, GenderFk, EducationFk, AddressFk, ProfessionFk, NationalityFk, BodyModificationsFk)
VALUES (25, (SELECT G.Id FROM Genders G WHERE G.Name = 'Женский'),  IDENT_CURRENT('Educations'), IDENT_CURRENT('Addresses'), IDENT_CURRENT('Professions'), IDENT_CURRENT('Nationalities'), IDENT_CURRENT('BodyModifications'));

INSERT RequirementsPeople(PeopleFk, RequirementsFk) VALUES (IDENT_CURRENT('People'), IDENT_CURRENT('Requirements'));
INSERT Pages(UserFk, NickName, VKId, RatePage, CountViews, GiftQuantity) VALUES (IDENT_CURRENT('People'), 'Dusa', 104, 5, 15, 5);
INSERT UserMessages(ContentsOf, PageFk) VALUES('Добрый вечер', IDENT_CURRENT('Pages'));
GO
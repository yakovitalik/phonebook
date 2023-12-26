-- Создание таблиц
CREATE TABLE IF NOT EXISTS users(
                      id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                      username varchar(100) NOT NULL UNIQUE ,
                      password varchar NOT NULL UNIQUE
);

INSERT INTO users (username, "password") VALUES ('user1', 'password1');
INSERT INTO users (username, "password") VALUES ('user2', 'password2');

CREATE TABLE IF NOT EXISTS department(
                                       id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                                       title varchar(200) NOT NULL UNIQUE,
                                       parent_department varchar(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee(
                                    id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
                                    username varchar(100) NOT NULL,
                                    position varchar NOT NULL,
                                    phone_number varchar(30),
                                    mobile_number varchar(30),
                                    email varchar(60) UNIQUE,
                                    department int REFERENCES department (id)
);
-------------------------------------------------------------------------------------------
-- Создаем тестовые данные
-- Подразделения верхнего уровня
INSERT INTO department (title, parent_department) VALUES ('Руководство', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Управление эксплуатации', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Управление логистики', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Управление реализации', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Финансовое управление', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Управление по работе с персоналом', 'Компания');
INSERT INTO department (title, parent_department) VALUES ('Бухгалтерия', 'Компания');

-- Подразделения второго уровня
INSERT INTO department (title, parent_department) VALUES ('Отдел ремонтов', 'Управление эксплуатации');
INSERT INTO department (title, parent_department) VALUES ('Производственно-технический отдел', 'Управление эксплуатации');
INSERT INTO department (title, parent_department) VALUES ('Отдел закупок', 'Управление логистики');
INSERT INTO department (title, parent_department) VALUES ('Отдел транспорта', 'Управление логистики');
INSERT INTO department (title, parent_department) VALUES ('Экономический отдел', 'Финансовое управление');
INSERT INTO department (title, parent_department) VALUES ('Отдел бизнес-планирования', 'Финансовое управление');

-- Сотрудники
INSERT INTO employee (username, position, phone_number, mobile_number, email, department)
VALUES ('Антонов Иван Николаевич', 'Генеральный директор', '+7 (4722) 28-52-11', '89803985211', 'antonov.in@compmail.ru', 1);
VALUES ('Иванов Василий Андреевич', 'Главный инженер', '+7 (4722) 28-52-12', '89803985212', 'ivanov.va@compmail.ru', 1);
VALUES ('Васильев Андрей Иванович', 'Начальник управления', '+7 (4722) 28-52-13', '89803985213', 'vasilev.ai@compmail.ru', 2);
VALUES ('Лукъянов Иван Михайлович', 'Начальник управления', '+7 (4722) 28-52-14', '89803985214', 'lukyanov.im@compmail.ru', 3);
VALUES ('Гатилов Александр Андреевич', 'Начальник управления', '+7 (4722) 28-52-15', '89803985215', 'gatilov.aa@compmail.ru', 4);
VALUES ('Петров Роман Эдуардович', 'Начальник управления', '+7 (4722) 28-52-16', '89803985216', 'petrov.re@compmail.ru', 5);
VALUES ('Симонов Валентин Петрович', 'Начальник управления', '+7 (4722) 28-52-17', '89803985217', 'simonov.vp@compmail.ru', 6);
VALUES ('Мамонтов Илья Николаевич', 'Главный бухгалтер', '+7 (4722) 28-52-18', '89803985218', 'mamontov.in@compmail.ru', 7);

VALUES ('Новоселов Александр Николаевич', 'Начальник отдела', '+7 (4722) 28-52-19', '89803985219', 'novoselov.an@compmail.ru', 8);
VALUES ('Сидоров Андрей Иванович', 'Ведущий инженер', '+7 (4722) 28-52-20', '89803985220', 'sidorov.ai@compmail.ru', 8);
VALUES ('Протопов Григорий Васильевич', 'Инженер 1 категории', '+7 (4722) 28-52-21', '89803985221', 'protopov.gv@compmail.ru', 8);

VALUES ('Халматов Антон Иванович', 'Начальник отдела', '+7 (4722) 28-52-22', '89803985222', 'halmatov.ai@compmail.ru', 9);
VALUES ('Перепитчай Геннадий Андреевич', 'Ведущий инженер', '+7 (4722) 28-52-23', '89803985223', 'perepitchai.ga@compmail.ru', 9);
VALUES ('Андросов Виктор Иванович', 'Инженер 1 категории', '+7 (4722) 28-52-24', '89803985224', 'androsov.vi@compmail.ru', 9);

VALUES ('Притвина Алена Васильевна', 'Начальник отдела', '+7 (4722) 28-52-25', '89803985225', 'pritvina.av@compmail.ru', 10);
VALUES ('Шишкин Николай Иванович', 'Ведущий специалист', '+7 (4722) 28-52-26', '89803985226', 'shishkin.ni@compmail.ru', 10);
VALUES ('Милитова Антонина Сергеевна', 'Специалист 1 категории', '+7 (4722) 28-52-27', '89803985227', 'militova.as@compmail.ru', 10);

VALUES ('Гончарова Ольга Ивановна', 'Начальник отдела', '+7 (4722) 28-52-28', '89803985228', 'goncharova.oi@compmail.ru', 11);
VALUES ('Беспалова Анна Викторовна', 'Ведущий специалист', '+7 (4722) 28-52-29', '89803985229', 'bespalova.av@compmail.ru', 11);
VALUES ('Никитина Виктория Валерьевна', 'Специалист 1 категории', '+7 (4722) 28-52-30', '89803985230', 'nikitina.vv@compmail.ru', 11);

VALUES ('Леонтьева Ксения Николаевна', 'Начальник отдела', '+7 (4722) 28-52-31', '89803985231', 'leonteva.kn@compmail.ru', 12);
VALUES ('Сидоров Виктор Андреевич', 'Ведущий экономист', '+7 (4722) 28-52-32', '89803985232', 'sidorov.va@compmail.ru', 12);
VALUES ('Герасимов Михаил Викторович', 'Экономист 1 категории', '+7 (4722) 28-52-33', '89803985233', 'gerasimov.mv@compmail.ru', 12);

VALUES ('Никонова Ирина Валерьевна', 'Начальник отдела', '+7 (4722) 28-52-34', '89803985234', 'nikonova.iv@compmail.ru', 13);
VALUES ('Звягинцева Анна Николаевна', 'Ведущий специалист', '+7 (4722) 28-52-35', '89803985235', 'zvyagintseva.an@compmail.ru', 13);
VALUES ('Вендин Алексей Николаевич', 'Специалист 1 категории', '+7 (4722) 28-52-36', '89803985236', 'vendin.an@compmail.ru', 13);
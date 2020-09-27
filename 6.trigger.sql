
-- триггер для проверки возраста пользователя перед обновлением
CREATE TRIGGER check_user_age_before_update BEFORE INSERT ON worker
FOR EACH ROW
begin
    IF NEW.birthday >= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Birthday must be in the past!';
    END IF;
END;

-- Проверка
-- не подходящая дата
INSERT INTO `worker` 
VALUES 
('17','Гривень','Олеся','Олесевич','f','2022-03-16','griv.d.d@mail.ru','9035111127');




-- триггер для проверки наличия только одного генерального директора перед обновлением
CREATE TRIGGER In_The_End_There_Can_Be_Only_One  -- (с)Highlander
BEFORE INSERT 
ON profiles FOR EACH ROW
begin
    IF NEW.position ='Генеральный директор' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There can be only one CEO!';
    END IF;
END;

-- Проверка
-- не подходящая должность
INSERT INTO `worker` 
VALUES 
('17','Гривень','Олеся','Олесевич','f','1988-03-16','griv.d.d@mail.ru','9035111127');

INSERT INTO `profiles` 
VALUES 
('17','15','16','3',NULL,'4',NULL,'Генеральный директор','2012-12-10 09:28:07','Организация производства','planning','30',NOW());
































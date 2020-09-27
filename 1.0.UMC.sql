-- united manufacturing corporation
-- объединенная производственная корпорация (ОПК)
-- база данных ОПК предназначена для структурирования подразделений, внутриструктурной кооперации,
-- с упором на личные характеристики рабочего. чтобы легко можно посмотреть, 
-- кто поможет в решении задач; 
-- предусмотрено формирование таблицы "hard skills"


DROP DATABASE IF EXISTS u_m_c;
CREATE DATABASE u_m_c;


USE u_m_c;

--  Таблица "сотрудник" с его личными данными
DROP TABLE IF EXISTS worker; 
CREATE TABLE worker (
	id SERIAL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50) ,
    patronymic VARCHAR(50)  COMMENT 'Отчество',
    gender CHAR(1),
    birthday DATE,
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    INDEX users_phone_idx(phone), 
    INDEX users_email_idx(email), 
    INDEX profiles_birthday_idx(birthday),
    INDEX users_firstname_lastname_patronymic_idx(firstname, lastname, patronymic)
);

--  Таблица с типами медиа данными (возможные типы данных в БД)
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);

--  Таблица с медиа
DROP TABLE IF EXISTS media;     
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES worker(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);


DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES worker(id),
  	PRIMARY KEY (`id`)
);

--  Таблица с фото
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

--  Таблица документов
DROP TABLE IF EXISTS `docs`;
CREATE TABLE `docs` (
	user_id BIGINT UNSIGNED NOT NULL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	`name` varchar(255),
	type_doc JSON, -- документы разных типов
	theme text,  --  у документов будет своя тема
	body text,
	INDEX docs_name (`name`),
	FOREIGN KEY (user_id) REFERENCES worker(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

--  Таблица hard skills сотрудников и подразделений
DROP TABLE IF EXISTS hard_skills; 
CREATE TABLE hard_skills (
	`position` VARCHAR(255),     -- должность
	responsibility VARCHAR(255)  COMMENT 'Зоны ответственности',
	worker_skills VARCHAR(255)  COMMENT 'hard_skills рабочего',
	INDEX responsibility ( responsibility),
	INDEX worker_skills ( worker_skills),
	INDEX `position` ( `position`)
);


DROP TABLE IF EXISTS department; -- департамент
CREATE TABLE department (
	id SERIAL PRIMARY KEY, 
    dep_name VARCHAR(255),
    body text,
    dep_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности департамента',
    dep_manager_doc VARCHAR(255), -- основопологающие инструкции
    INDEX dep_name ( dep_name),
    FOREIGN KEY (dep_responsibility) REFERENCES hard_skills(responsibility), -- ссылка на зону ответственности
    FOREIGN KEY (dep_manager_doc) REFERENCES docs(`name`)
);


DROP TABLE IF EXISTS division; -- Отдел
CREATE TABLE division (
	id SERIAL PRIMARY KEY, 
    div_name VARCHAR(255),
    dep_owner VARCHAR(255), -- к какому департаменту принадлежит
    body text,
    div_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности рабочего',
    div_manager_doc VARCHAR(255), -- основопологающие инструкции
    FOREIGN KEY (dep_owner) REFERENCES department(dep_name),
    FOREIGN KEY (div_responsibility) REFERENCES hard_skills(responsibility),
    FOREIGN KEY (div_manager_doc) REFERENCES docs(`name`)

);


DROP TABLE IF EXISTS `profiles`;  -- профиль рабочего с расширенным функционалом
CREATE TABLE `profiles` (
	user_id BIGINT UNSIGNED NOT NULL,
	
	manager BIGINT UNSIGNED  COMMENT 'начальник',
	subordinate BIGINT UNSIGNED  COMMENT 'подчиненный',
	
	department_own BIGINT UNSIGNED  COMMENT 'Принадлежность к департамент',
    department_subordinate BIGINT UNSIGNED COMMENT 'Подчиненный департамент',
    division_own BIGINT UNSIGNED  COMMENT 'Принадлежность к отделу',
	division_subordinate BIGINT UNSIGNED  COMMENT 'Подчиненный отдел',

    `position` VARCHAR(255),     -- должность  !!!!ссылка на  hard_skills !!!!
    `experience` DATETIME,   -- когда начал работать (стаж)  
    
   
    worker_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности рабочего', 
    worker_skills VARCHAR(255)  COMMENT 'hard_skills рабочего', 
    
	photo_id BIGINT UNSIGNED ,
    created_at DATETIME DEFAULT NOW(),

   
    PRIMARY KEY (user_id, manager, subordinate),
    FOREIGN KEY (manager) REFERENCES worker(id),
    FOREIGN KEY (user_id) REFERENCES worker(id),
    FOREIGN KEY (subordinate) REFERENCES worker(id),
    
    FOREIGN KEY (department_own) REFERENCES department(id),  -- ссылка на номер департамента
    FOREIGN KEY (department_subordinate) REFERENCES department(id),    
    FOREIGN KEY (division_own) REFERENCES division(id),
    FOREIGN KEY (division_subordinate) REFERENCES division(id),
    
    FOREIGN KEY (worker_responsibility) REFERENCES hard_skills(responsibility),   -- !!!!ссылка на  hard_skills !!!!
    FOREIGN KEY (worker_skills) REFERENCES hard_skills(worker_skills),				--  !!!!ссылка на  hard_skills !!!!
    FOREIGN KEY (`position`) REFERENCES hard_skills(`position`),	
    
    FOREIGN KEY (photo_id) REFERENCES media(id) 
);
	
  





















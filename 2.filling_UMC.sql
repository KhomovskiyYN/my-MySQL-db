-- скрипт наполнения БД данными;



USE u_m_c;



/*
DROP TABLE IF EXISTS worker; -- сам рабочий
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
*/

INSERT INTO `worker` 
VALUES 
('1','Артамонов','Александр','Александорович','m','1976-03-16','artam.a.a@mail.ru','9031111111'),
('2','Холодков','Борис','Борисович','m','1986-04-01','holod.b.b@mail.ru','9032111112'),
('3','Цезарев','Виктор','Викторович','m','1987-07-12','cezar.v.v@mail.ru','9033111113'),
('4','Поселков','Владимир','Владимирович','m','1987-06-13','posel.v.v@mail.ru','9033111114'),
('5','Добронрав','Геннадий','Геннадьевич','m','1988-11-02','dobro.g.g@mail.ru','9034111115'),
('6','Заборчик','Григорий','Григорьевич','m','1988-10-03','zab.g.g@mail.ru','9034111116'),
('7','Слепаков','Давид','Давидович','m','1990-12-15','slep.d.d@mail.ru','9035111117'),
('8','Грызунов','Даниил','Данилович','m','1991-10-19','griz.d.d@mail.ru','9035111118'),
('9','Агентов','Демид','Демидович','m','1990-09-10','agent.d.d@mail.ru','9035111119'),
('10','Польский','Джан','Джанович','m','1991-11-05','pols.d.d@mail.ru','9035111121'),
('11','Разогретов','Герман','Германович','m','1989-08-22','razok.g.g@mail.ru','9034111122'),
('12','Решетникова','Дарья','Дарьевич','f','1991-10-19','reshe.d.d@mail.ru','9035111123'),
('13','Манинова','Бажена','Баженович','f','1985-11-26','many.b.b@mail.ru','9032111124'),
('14','Заманинова','Варвара','Варварович','f','1988-12-25','zaman.v.v@mail.ru','9033111125'),
('15','Рублев','Генри','Генриевич','m','1976-03-16','rubl.g.g@mail.ru','9034111126'),
('16','Копейкова','Даяна','Даянович','f','1976-03-16','kop.d.d@mail.ru','9035111127');


/*
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);
*/

INSERT INTO `media_types` 
VALUES 
(1,'Photo','2003-07-09 10:08:05',null),
(2,'Music','2009-06-19 20:08:09',null),
(3,'Video','1984-04-18 01:55:09',null),
(4,'Docs','2001-04-17 06:47:52',null);
 

/*
DROP TABLE IF EXISTS media;     -- 
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
*/
INSERT INTO `media`
VALUES 
('1', '1', '1', 'Id quisquam laboriosam perferendis qui. Modi qui id non eveniet optio nihil. Rerum et a aut autem nisi.', 'voluptas', 954, NULL, '2001-07-20 03:07:15', '1992-11-15 06:35:28'),
('2', '2', '2', 'Quam eaque ut nulla qui. Sed et atque officiis minima ducimus exercitationem. Dolores est ipsam incidunt dolores eligendi reiciendis.', 'quia', 16161620, NULL, '1977-05-07 05:39:13', '1995-10-24 20:33:10'),
('3', '3', '3', 'Quo voluptatem qui qui ut occaecati laudantium saepe. Et fugiat eveniet est eos. Praesentium ullam quia quod et sint non aut. Inventore voluptates labore quia et quos earum culpa.', 'illum', 9950, NULL, '1994-02-23 16:29:04', '2017-10-20 12:52:51'),
('4', '4', '4', 'Culpa soluta qui alias distinctio facilis a reprehenderit. Rerum rerum molestiae omnis ad rerum. Porro quibusdam harum perferendis. Repellat deserunt deserunt ducimus autem velit.', 'voluptatem', 182212, NULL, '2012-09-08 09:32:00', '2010-11-01 00:11:48'),
('5', '4', '5', 'Id quis et incidunt minus nobis quasi deleniti est. Nisi in ut qui voluptate officia. In itaque ut numquam ullam tenetur porro reiciendis.', 'laborum', 3139, NULL, '1998-05-10 09:28:07', '1999-12-26 23:19:45'),
('6', '1', '6', 'Eum ut ut ut aut. Itaque quam facilis doloremque aut omnis ut. Reprehenderit molestiae sint qui minima.', 'accusantium', 0, NULL, '2016-08-18 00:05:54', '2017-09-12 11:49:18'),
('7', '2', '7', 'Temporibus iure voluptas quia aliquid eius sit qui est. Dolor et repellendus qui officia ut aut nihil ullam. Blanditiis animi omnis voluptatem sed quidem iure impedit. Sit voluptas dolores rerum voluptas.', 'placeat', 322, NULL, '2000-02-22 07:28:00', '1976-02-27 04:51:23'),
('8', '3', '8', 'Esse voluptas minima magnam enim ullam. Quaerat voluptatem non adipisci non sapiente non. Numquam blanditiis modi molestiae tempore ipsum beatae magnam. Et dolores aut voluptatum voluptas cum.', 'molestiae', 598756, NULL, '1971-07-31 09:42:37', '1978-11-22 14:07:08'),
('9', '4', '9', 'Tenetur impedit reiciendis consequatur saepe. Praesentium numquam aut neque animi non architecto corporis. Dolor voluptas saepe reiciendis. Sapiente maiores voluptatem quam sequi ut animi et. Dignissimos animi placeat tempore amet non nihil.', 'ipsum', 89553868, NULL, '1983-07-29 16:17:22', '1986-07-15 18:37:14'),
('10', '4', '10', 'Omnis dignissimos dolores ipsum consectetur in sunt quis. Voluptatem veniam ut distinctio facilis qui. Molestiae tenetur minima quia impedit.', 'deserunt', 97, NULL, '1992-10-03 00:13:27', '1999-07-11 22:41:21'),
('11', '1', '11', 'A vel quasi error cupiditate. Quasi ipsam ab earum voluptatem sed. Qui libero porro eum. Qui aliquam dolorum incidunt consequatur.', 'dolorum', 9, NULL, '2006-06-23 20:37:17', '1998-05-06 23:39:24'),
('12', '2', '12', 'Modi tempora voluptas fugit qui qui veritatis. Temporibus id velit laudantium velit vel. At assumenda commodi aut sit ipsam eos. Quod dolores rem ut omnis perspiciatis quisquam.', 'voluptas', 0, NULL, '2003-03-30 04:50:03', '2015-10-02 10:25:47'),
('13', '3', '13', 'Maxime pariatur nesciunt dignissimos quas ipsa quae nihil. Ut repudiandae est tempore libero voluptatem quisquam. Repudiandae quis repellat qui deserunt.', 'iste', 6167536, NULL, '1991-01-24 01:45:59', '1981-09-09 08:32:46'),
('14', '4', '14', 'Alias cumque quos molestiae dolor esse tenetur optio. Veniam corrupti earum beatae porro. Nemo qui nisi alias molestias eum ullam. Quia qui quo in placeat.', 'repellat', 0, NULL, '1971-12-14 02:57:31', '1999-07-11 18:00:09'),
('15', '1', '1', ' Rerum et a aut autem nisi.', 'voluptas', 954, NULL, '2001-07-20 03:07:15', '1992-11-15 06:35:28'),
('16', '1', '2', ' Dolores est ipsam incidunt dolores eligendi reiciendis.', 'quia', 16161620, NULL, '1977-05-07 05:39:13', '1995-10-24 20:33:10'),
('17', '1', '3', ' Inventore voluptates labore quia et quos earum culpa.', 'illum', 9950, NULL, '1994-02-23 16:29:04', '2017-10-20 12:52:51'),
('18', '1', '4', ' Porro quibusdam harum perferendis. Repellat deserunt deserunt ducimus autem velit.', 'voluptatem', 182212, NULL, '2012-09-08 09:32:00', '2010-11-01 00:11:48'),
('19', '1', '5', ' In itaque ut numquam ullam tenetur porro reiciendis.', 'laborum', 3139, NULL, '1998-05-10 09:28:07', '1999-12-26 23:19:45'),
('20', '1', '6', ' Reprehenderit molestiae sint qui minima.', 'accusantium', 0, NULL, '2016-08-18 00:05:54', '2017-09-12 11:49:18'),
('21', '1', '7', ' Sit voluptas dolores rerum voluptas.', 'placeat', 322, NULL, '2000-02-22 07:28:00', '1976-02-27 04:51:23'),
('22', '1', '8', ' Et dolores aut voluptatum voluptas cum.', 'molestiae', 598756, NULL, '1971-07-31 09:42:37', '1978-11-22 14:07:08'),
('23', '1', '9', ' Dolor voluptas saepe reiciendis. Sapiente maiores voluptatem quam sequi ut animi et. Dignissimos animi placeat tempore amet non nihil.', 'ipsum', 89553868, NULL, '1983-07-29 16:17:22', '1986-07-15 18:37:14'),
('24', '1', '10', ' Molestiae tenetur minima quia impedit.', 'deserunt', 97, NULL, '1992-10-03 00:13:27', '1999-07-11 22:41:21'),
('25', '1', '11', ' Qui aliquam dolorum incidunt consequatur.', 'dolorum', 9, NULL, '2006-06-23 20:37:17', '1998-05-06 23:39:24'),
('26', '1', '12', ' Quod dolores rem ut omnis perspiciatis quisquam.', 'voluptas', 0, NULL, '2003-03-30 04:50:03', '2015-10-02 10:25:47'),
('27', '1', '13', ' Repudiandae quis repellat qui deserunt.', 'iste', 6167536, NULL, '1991-01-24 01:45:59', '1981-09-09 08:32:46'),
('28', '1', '14', ' Nemo qui nisi alias molestias eum ullam. Quia qui quo in placeat.', 'repellat', 0, NULL, '1971-12-14 02:57:31', '1999-07-11 18:00:09'),
('29', '1', '15', ' Repudiandae quis repellat qui deserunt.', 'iste', 6167536, NULL, '1991-01-24 01:45:59', '1981-09-09 08:32:46'),
('30', '1', '16', ' Quia qui quo in placeat.', 'repellat', 0, NULL, '1971-12-14 02:57:31', '1999-07-11 18:00:09');

/*
DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES worker(id),
  	PRIMARY KEY (`id`)
);
*/
INSERT INTO `photo_albums`
VALUES 
('1', 'ullam', '1'),
('2', 'autem', '2'),
('3', 'maxime', '3'),
('4', 'fugit', '4'),
('5', 'sit', '5'),
('6', 'est', '6'),
('7', 'doloribus', '7'),
('8', 'ea', '8'),
('9', 'et', '9'),
('10', 'tenetur', '10'),
('11', 'nemo', '11'),
('12', 'voluptatem', '12'),
('13', 'dolorem', '13'),
('14', 'voluptas', '14'),
('15', 'asperiores', '15'),
('16', 'ipsum', '16');


/*
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

*/
INSERT INTO `photos` 
VALUES
('1', '1', '15'),
('2', '2', '16'),
('3', '3', '17'),
('4', '4', '18'),
('5', '5', '19'),
('6', '6', '20'),
('7', '7', '21'),
('8', '8', '22'),
('9', '9', '23'),
('10', '10', '24'),
('11', '11', '25'),
('12', '12', '26'),
('13', '13', '27'),
('14', '14', '28'),
('15', '15', '29'),
('16', '16', '30');



/*
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
*/
INSERT INTO `docs` 
VALUES 
('1','4','dolorem',NULL,NULL,'Iste corrupti aut eligendi dolor nihil sit voluptatem. Harum architecto nesciunt ratione. Minus et consequuntur est amet consequatur. Eveniet dolor dolorem inventore sint minus quaerat distinctio ut.'),
('2','4','quibusdam',NULL,NULL,'Fuga ullam quas reprehenderit consequatur accusamus ut. Sunt sequi accusamus exercitationem esse ut aperiam. Voluptatem in perferendis nihil praesentium voluptatum blanditiis. Voluptas recusandae non pariatur adipisci mollitia explicabo. Ad nostrum sunt nihil molestias quasi deleniti.'),
('3','4','voluptas',NULL,NULL,'Eveniet ut est dolore et voluptas eum corrupti. Dolores repellendus rerum dolor est unde. Laborum delectus ullam vitae eos inventore eaque fugit. Sed eum culpa neque facere qui suscipit aut veniam.'),
('4','4','pariatur',NULL,NULL,'Debitis et nisi sapiente molestiae eligendi fugiat dolor sed. Occaecati sint amet fuga aut magni fugit aperiam. Quis earum impedit enim assumenda ut odio qui. Velit et iste quam.'),
('5','4','consequuntur',NULL,NULL,'Eveniet consequatur quibusdam dolores. Et soluta minus ea id alias quia. Et molestiae quis iure nam qui velit odio neque. Aspernatur ipsum necessitatibus aut et.'),
('6','4','aliquid',NULL,NULL,'Nulla quis doloremque architecto eligendi excepturi et hic. Blanditiis minus porro repellendus enim voluptas ea. Vel incidunt mollitia nesciunt dolorem debitis aut. Voluptas excepturi quis id non laudantium.'),
('7','4','alias',NULL,NULL,'Modi soluta fugiat et blanditiis et eos aliquam nulla. Iste temporibus ea non earum ut sed ad.'),
('8','4','ea',NULL,NULL,'Vero ipsa aperiam quidem harum et amet. Totam suscipit eos et nemo praesentium explicabo. Occaecati nisi ut perspiciatis numquam voluptate exercitationem reprehenderit.'),
('9','4','veritatis',NULL,NULL,'Consectetur ea voluptatibus possimus est quaerat exercitationem dolorem autem. Dolor error aut ducimus porro atque. Modi et libero quibusdam libero. Omnis ratione voluptas est est.'),
('10','4','omnis',NULL,NULL,'Aut ut dolor in tempora dolore alias. Aspernatur cupiditate veniam reiciendis eos. Rerum accusamus dolores ea molestiae quod officia.'),
('11','4','maiores',NULL,NULL,'Est odio omnis id temporibus sint omnis. Dolorem quo ratione fuga eum aperiam doloremque. Dolore cum quaerat ut laboriosam. Qui et hic vel rem.');


/*
DROP TABLE IF EXISTS hard_skills; -- hard skills
CREATE TABLE hard_skills (
	`position` VARCHAR(50),     -- должность рабочего
	responsibility VARCHAR(255)  COMMENT 'Зоны ответственности',
	worker_skills VARCHAR(255)  COMMENT 'hard_skills рабочего',
	-- INDEX hard_sk (`position`, responsibility, worker_skills)
	INDEX responsibility ( responsibility),
	INDEX worker_skills ( worker_skills),
	INDEX `position` ( `position`)
);
*/
INSERT INTO `hard_skills` 
VALUES 
('Генеральный директор','Управление предприятием','царь - бог'),
('Директор по производству','Организация производства','Серый кардинал - всея производства'),
('Директор по инвестициям','Организация денежных потоков внутри предприятия','Белый кардинал - всея казначейства'),

('Руководитель департамента производства','Организация производства','manufacture'),
('Руководитель департамента развития производства','организация развития', 'зоркий взгляд в будующее'),
('Руководитель департамента инвестиционного анализа','прогнозиролвание инвестирования', 'хладнокровные денежные манипуляции'),

('Начальник отдела производственной кооперации','организация кооперационного взаимодействия','cooperation'),
('Начальник отдела подготовки производства','организация подготовки производства','знание производственной базы'),
('Начальник отдела преобразования производства','трансформация производства','анализ перспективных направлений'),
('Начальник отдела реализации инвест проектов','исполнение целевого инвестирования','контроль денежного потока'),

('Главный специалист отдела производственной кооперации','взаимодействие с предприятиями','communication'),
('Главный специалист отдела подготовки производства','производственное планирование','planning'),
('Главный специалист отдела преобразования производства','взаимодействие с предприятиями','communication'),
('Главный специалист отдела реализации инвест проектов','инвест планирование','planning');






/*
DROP TABLE IF EXISTS department; -- департамент
CREATE TABLE department (
	id SERIAL PRIMARY KEY, 
    dep_name VARCHAR(50),
    body text,
    dep_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности департамента',
    dep_manager_doc VARCHAR(50), -- основопологающие инструкции
    FOREIGN KEY (dep_responsibility) REFERENCES hard_skills(responsibility), -- ссылка на зону ответственности
    FOREIGN KEY (dep_manager_doc) REFERENCES docs(`name`)
);
*/

INSERT INTO `department` 
VALUES 
('1','Департамент производства','Занимается организацией производства','Организация производства','voluptas'),
('2','Департамент развития производства','Занимается организацией развития','организация развития', 'pariatur'),
('3','Департамент инвестиционного анализа','Занимается прогнозированием инвестирования', 'прогнозиролвание инвестирования','dolorem');


/*
DROP TABLE IF EXISTS division; -- Отдел
CREATE TABLE division (
	id SERIAL PRIMARY KEY, 
    div_name VARCHAR(50),
    dep_owner VARCHAR(50), -- к какому департаменту принадлежит
    body text,
    div_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности рабочего',
    div_manager_doc VARCHAR(50), -- основопологающие инструкции
    FOREIGN KEY (div_responsibility) REFERENCES hard_skills(responsibility),
    FOREIGN KEY (div_manager_doc) REFERENCES docs(`name`)

);
*/
INSERT INTO `division` 
VALUES 
('1','Отдел производственной кооперации','Департамент производства','Занимается организацией кооперационного взаимодействия','организация кооперационного взаимодействия','voluptas'),
('2','Отдел подготовки производства','Департамент производства','Занимается организацией подготовки производства','организация подготовки производства', 'pariatur'),
('3','Отдел преобразования производства','Департамент развития производства','Занимается трансформация производства', 'трансформация производства','dolorem'),
('4','Отдел реализации инвест проектов','Департамент инвестиционного анализа','Занимается исполнение целевого инвестирования', 'исполнение целевого инвестирования','dolorem');


/*
DROP TABLE IF EXISTS `profiles`;  -- профиль рабочего с расширенным функционалом
CREATE TABLE `profiles` (
	user_id BIGINT UNSIGNED NOT NULL,
	
	manager BIGINT UNSIGNED NOT NULL  COMMENT 'начальник',
	subordinate BIGINT UNSIGNED NOT NULL  COMMENT 'подчиненный',
	
	department_own BIGINT UNSIGNED NOT NULL  COMMENT 'Принадлежность к департамент',
    department_subordinate BIGINT UNSIGNED NOT NULL  COMMENT 'Подчиненный департамент',
    division_own BIGINT UNSIGNED NOT NULL  COMMENT 'Принадлежность к отделу',
	division_subordinate BIGINT UNSIGNED NOT NULL  COMMENT 'Подчиненный отдел',

    `position` VARCHAR(50),     -- должность  !!!!ссылка на  hard_skills !!!!
    `experience` DATETIME,   -- стаж  !!! разница между настоящей датой и 
    
   
    worker_responsibility VARCHAR(255)  COMMENT 'Зоны ответственности рабочего', 
    worker_skills VARCHAR(255)  COMMENT 'hard_skills рабочего', 
    
	photo_id BIGINT UNSIGNED NULL,
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
*/
INSERT INTO `profiles` 
VALUES 
('1','1','2',NULL,NULL,NULL,NULL,'Генеральный директор','2008-01-01 09:28:07','Управление предприятием','царь - бог','15',NOW()),
('2','1','3',NULL,'1',NULL,NULL,'Директор по производству','2009-02-02 09:28:07','Организация производства','Серый кардинал - всея производства','16',NOW()),
('3','2','5','1','1',NULL,'1','Руководитель департамента производства','2010-04-04 09:28:07','Организация производства','manufacture','17',NOW()),
('4','2','11','2','2',NULL,'3','Руководитель департамента развития производства','2010-05-05 09:28:07','организация развития', 'зоркий взгляд в будующее','18',NOW()),
('5','3','8','1',NULL,'1','1','Начальник отдела производственной кооперации','2011-07-07 09:28:07','организация кооперационного взаимодействия','cooperation','19',NOW()),
('6','3','9','1',NULL,'2','2','Начальник отдела подготовки производства','2011-07-17 09:28:07','организация подготовки производства','знание производственной базы','20',NOW()),
('7','5','7','1',NULL,'1',NULL,'Главный специалист отдела производственной кооперации','2012-08-20 09:28:07','взаимодействие с предприятиями','communication','21',NOW()),
('8','5','8','1',NULL,'1',NULL,'Главный специалист отдела производственной кооперации','2012-09-10 09:28:07','взаимодействие с предприятиями','communication','22',NOW()),
('9','6','9','1',NULL,'2',NULL,'Главный специалист отдела подготовки производства','2012-10-10 09:28:07','производственное планирование','planning','23',NOW()),
('10','6','10','1',NULL,'2',NULL,'Главный специалист отдела подготовки производства','2012-10-20 09:28:07','производственное планирование','planning','24',NOW()),
('11','4','12','2',NULL,'3','3','Начальник отдела преобразования производства','2011-07-18 09:28:07','трансформация производства','анализ перспективных направлений','25',NOW()),
('12','11','12','2',NULL,'3',NULL,'Главный специалист отдела преобразования производства','1998-05-10 09:28:07','взаимодействие с предприятиями','communication','26',NOW()),
('13','1','14',NULL,'3',NULL,NULL,'Директор по инвестициям','2009-03-03 09:28:07','Организация денежных потоков внутри предприятия','Белый кардинал - всея казначейства','27',NOW()),
('14','13','15','3','3',NULL,'4','Руководитель департамента инвестиционного анализа','2010-06-06 09:28:07','прогнозиролвание инвестирования', 'хладнокровные денежные манипуляции','28',NOW()),
('15','14','16','3',NULL,'4','4','Начальник отдела реализации инвест проектов','2011-07-18 09:28:07','исполнение целевого инвестирования','контроль денежного потока','29',NOW()),
('16','15','16','3',NULL,'4',NULL,'Главный специалист отдела реализации инвест проектов','2012-12-10 09:28:07','инвест планирование','planning','30',NOW());










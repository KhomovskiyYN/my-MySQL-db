-- Cкрипты характерных выборок

USE u_m_c;


-- Выборка Имени рабочего и его должности(скрипт характерных выборок, включающий группировку)
SELECT 
	w.firstname, w.lastname,
	p.position
FROM 
	`worker` as w,
	`profiles` as p
WHERE w.id = p.user_id
ORDER BY w.id;


-- скрипт выборки: сколько мужчин на каждой должности (c использованием JOIN)
SELECT
	COUNT(*) ,
	w.GENDER,
	p.`position` 
FROM 
	`worker` as w
JOIN
	`profiles` as p
ON 
	w.id = p.user_id
	and 
	w.gender = 'm'
GROUP BY p.`position`;


-- скрипт выборки: у какого рабочего максимальный стаж (c использованием вложенного запроса)
SELECT 
	w.FIRSTNAME,
	w.LASTNAME, 
	p.experience
FROM 
	worker as w, profiles as p
WHERE	
	w.id = p.USER_ID 
	and
	w.id = (
		SELECT 			-- вложенный запрос вы даёт id (12) человека с наибольшим стажем
			 profiles.user_id
		FROM 
			profiles
		ORDER BY experience
		LIMIT 1
		)
LIMIT 1;











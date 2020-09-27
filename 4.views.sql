-- Представления

USE u_m_c;


-- 1. определить коллег, работающих в твоем департаменте
CREATE or replace VIEW view_coworker 
AS 
	SELECT 
		w.FIRSTNAME,
		w.LASTNAME,
		p.DEPARTMENT_OWN 
	FROM worker as w
	JOIN profiles as p
		on w.id = p.user_id
	
-- Проверка		
select * from VIEW_COWORKER where department_own = '1' -- в кавычках номер департамента




-- 2. определить коллег, с кем у вас ПОХОЖИЙ функционал(worker_responsibility) (кто может помочь вам)
CREATE or replace VIEW like_you_responsibility 
AS 
	SELECT 
		w.FIRSTNAME,
		w.LASTNAME,
		p.worker_responsibility
	FROM worker as w
	JOIN profiles as p 
	ON  w.id = p.user_id
	where 
	worker_responsibility like '%произв%'

-- Проверка	
select * from like_you_responsibility










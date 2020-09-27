
-- Разработка хранимой процедуры

-- Описание: 
-- в хранимой процедуре находится рабочий с нужным функционалом



drop procedure if exists sp_required_employee;

delimiter //
create procedure sp_required_employee(in choice_responsibility VARCHAR(255) )  
  begin
	  
	SELECT  
		w.FIRSTNAME,
		w.LASTNAME,
		p.worker_responsibility
	FROM worker as w
	JOIN profiles as p 
	ON  w.id = p.user_id
	where 
	worker_responsibility like choice_responsibility;
	
  END//
DELIMITER ;   

-- Примеры Вызова  процедуры:

call sp_required_employee ('взаимодействие с предприятиями')

call sp_required_employee ('производ%')


	



















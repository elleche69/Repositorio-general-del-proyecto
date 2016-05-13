CREATE OR REPLACE TRIGGER horasS_extra
AFTER UPDATE ON PARTESTRABAJOBD
FOR EACH ROW 
DECLARE
Cursor CR is select  24 * (to_date(hora_llegada, 'hh24:mi') 
             - to_date(hora_salida, 'hh24:mi')) diff_hours 
       from lineasbd where NUM_PARTE = :new.NUM_PARTE;
l_employee_id  CR%ROWTYPE;       
p INTEGER := -6;       
       
Begin

OPEN CR;

LOOP
  FETCH CR INTO l_employee_id;
  p := p + l_employee_id.DIFF_HOURS;

EXIT WHEN CR%NOTFOUND;
END LOOP;
if p-8  > 0
then 
insert into horasextra values(:new.num_parte, p - 8);
end if;
end;



alter trigger horass_extra enable;
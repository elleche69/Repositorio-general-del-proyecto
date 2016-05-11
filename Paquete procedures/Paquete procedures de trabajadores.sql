CREATE OR REPLACE PACKAGE gest_trabajador IS(
TYPE trabajadores_cursor IS REF CURSOR;)

PROCEDURE buscar_trabajador_por_letra (
  p_letra IN CHAR);
  
PROCEDURE buscar_trabajador_tres_letras (
  p_letras IN VARCHAR2);
  
PROCEDURE buscar_trabajador_por_provincia (
  p_provincia IN CENTROTRABAJO.PROVINCIA%TYPE);
  
PROCEDURE buscar_trabajador_por_ciudad (
  p_ciudad IN CENTROTRABAJO.CIUDAD%TYPE);
  
PROCEDURE buscar_trabajador_con_tpersonal (
  p_tel_personal IN TRABAJADOR.TEL_PERSONAL%TYPE);
  
PROCEDURE buscar_trabajador_por_apellido1 (
  p_apellido1 IN TRABAJADOR.APELLIDO1%TYPE);
  
END;
CREATE OR REPLACE PACKAGE BODY gest_trabajador IS

	PROCEDURE buscar_trabajador_por_letra(
	p_letra IN CHAR,
	p_todos_trabajadores OUT trabajadores_cursor) IS
	BEGIN 
	OPEN p_todos_trabajadores FOR(SELECT * FROM TRABAJADOR WHERE NOMBRE LIKE (P_LETRA%));
	END;
	
	PROCEDURE buscar_trabajador_tres_letras(
	p_letras in varchar2,
	p_todos_trabajadores OUT trabajadores_cursor) IS
	BEGIN 
	OPEN p_todos_trabajadores FOR (SELECT * FROM TRABAJADOR WHERE NOMBRE LIKE(P_LETRAS%));
	END;
	
	PROCEDURE buscar_trabajador_por_provincia(
	p_provincia IN CENTROTRABAJO.PROVINCIA%TYPE,
	p_todos_trabajadores OUT trabajadores_cursor
	) IS 
	BEGIN 
	OPEN p_todos_trabajadores FOR(SELECT T.* FROM TRABAJADOR T, CENTROTRABAJO C WHERE T.ID=C.ID AND C.PROVINCIA=P_PROVINCIA);
	END;
	
	PROCEDURE buscar_trabajador_por_ciudad(
	p_ciudad IN CENTROTRABAJO.ciudad%type,
	p_todos_trabajadores OUT trabajadores_cursor
	) IS 
	BEGIN 
	OPEN p_todos_trabajadores FOR(SELECT T.* FROM TRABAJADOR T, CENTROTRABAJO C WHERE T.ID=C.ID AND c.ciudad=p_ciudad);
	END;
	
	PROCEDURE buscar_trabajador_con_tpersonal (
	p_tel_personal IN TRABAJADOR.TEL_PERSONAL%TYPE
	NO_ENCOTRADO EXCEPTION
	)IS
	BEGIN 
	SELECT * FROM TRABAJADOR WHERE TEL_PERSONAL=p_tel_personal;
	IF SQL%NOTFOUND THEN 
	RAISE NO_ENCONTRADO;
	END;
	
	PROCEDURE buscar_trabajador_por_apellido1(
	p_apellido1 IN trabajador.apellido1%type,
	p_todos_trabajadores OUT trabajadores_cursor
	) IS
	BEGIN
	OPEN p_todos_trabajadores FOR(SELECT * FROM TRABAJADOR WHERE APELLIDO1=P_APELLIDO1);
	END;
	
	END gest_trabajador;
	 
	



Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Cont
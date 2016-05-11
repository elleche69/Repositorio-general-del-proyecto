CREATE OR REPLACE PACKAGE gest_centro IS
TYPE centros_cursor IS REF CURSOR
TYPE trabajadores_cursor IS REF CURSOR;
  
PROCEDURE visualizar_lista_centros (
  p_todos_centros OUT centros_cursor);
  
PROCEDURE visualizar_datos_centros_id (
  p_id IN CENTROTRABAJO.ID%TYPE);
  
PROCEDURE buscar_centro_por_nombre (
  p_nombre IN CENTROTRABAJO.NOMBRE%TYPE,
  p_id OUT CENTROTRABAJO.ID%TYPE);
  
PROCEDURE visualizar_datos_centros_nombre (
  p_nombre IN CENTROTRABAJO.NOMBRE%TYPE);
  
PROCEDURE visualizar_trabs_en_centro (
  p_id IN CENTROTRABAJO.ID%TYPE);
  
END;

CREATE OR REPLACE PACKAGE BODY gest_centro IS
  
PROCEDURE visualizar_lista_centros (
  p_todos_centros OUT centros_cursor) IS
  BEGIN
    OPEN p_todos_centros FOR
    (SELECT * FROM CENTROTRABAJO);
  END visualizar_lista_centros;
  
PROCEDURE visualizar_datos_centros (
  p_id IN CENTROTRABAJO.ID%TYPE) IS
  BEGIN 
    SELECT * FROM CENTROTRABAJO
    WHERE id = p_id;
  END visualizar_datos_centros_id;

FUNCTION buscar_centro_por_nombre (
  p_nombre IN CENTROTRABAJO.NOMBRE%TYPE) RETURN NUMBER IS p_id CENTROTRABAJO.ID%TYPE;
  BEGIN
    SELECT ID INTO p_id
    FROM CENTROTRABAJO
    WHERE NOMBRE = LOWER(p_nombre);
  END buscar_centro_por_nombre;
  
PROCEDURE visualizar_datos_centros_nombre (
  p_nombre IN CENTROTRABAJO.NOMBRE%TYPE) IS
  EXEC buscar_centro_por_nombre (p_nombre) RETURN NUMBER AS p_id;
  BEGIN  
    SELECT C.ID, C.NOMBRE CNOM, C.CALLE, C.NUMERO, C.COD_POSTAL, C.CIUDAD, C.PROVINCIA, C.TELEFONO, COUNT(T.DNI) AS "NUMERO TRABAJADORES"
    FROM CENTROTRABAJO C, TRABAJADOR T
    WHERE C.ID = T.ID
    AND C.ID = p_id;
  END visualizar_datos_centros_nombre;
  
PROCEDURE visualizar_trabs_en_centro (
  p_trabajadores_en_centro OUT trabajadores_cursor) IS
  BEGIN
    OPEN p_trabajadores_en_centro FOR
    (SELECT C.ID, T.DNI, T.NOMBRE, T.APELLIDO1 AS "PRIMER APELLIDO", T.APELLIDO2 AS "SEGUNDO APELLIDO"
    FROM CENTROTRABAJO C, TRABAJADOR T
    WHERE C.ID = T.ID
    AND C.ID = p_id);
  END visualizar_trabs_en_centro;
  
END;
  
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help
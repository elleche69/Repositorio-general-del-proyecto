CREATE TABLE INFORMESXMLType
( 
  id number PRIMARY KEY,
  PARTE XMLType,
  MES_AÑO VARCHAR2(12)
);


//El programa tiene un boton de "Generar informe del mes anterior" que como su nombre indica al pulsarlo
genera el xml de los partes del mes anterior (los genera del mes anterior para estar seguros de que cuando
el xml se genera estan todos los partes del mes), este boton solo esta activo cuando no hay ningun informe
de el mes anterior (para que no generen 200000 del mismo mes).

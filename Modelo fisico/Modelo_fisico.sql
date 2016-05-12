  CREATE TABLE CENTROTRABAJO (
  ID NUMBER(3),
  NOMBRE VARCHAR2(20),
  CALLE VARCHAR2(35),
  NUMERO NUMBER(3),
  COD_POSTAL VARCHAR2(5),
  CIUDAD VARCHAR2(20),
  PROVINCIA VARCHAR2(20),
  TELEFONO VARCHAR2(9),
  CONSTRAINT CTR_ID_PK PRIMARY KEY(ID),
  CONSTRAINT CTR_CP_CK CHECK (TO_NUMBER(COD_POSTAL) > 0 AND TO_NUMBER(COD_POSTAL) < 99999)
  );
  
  
  
  
  CREATE TABLE TRABAJADOR (
  DNI VARCHAR2(9),
  NOMBRE VARCHAR2(15),
  APELLIDO1 VARCHAR2(15),
  APELLIDO2 VARCHAR2(15),
  CALLE VARCHAR2(35),
  PORTAL VARCHAR2(3),
  PISO NUMBER(2),
  MANO VARCHAR2(2),
  TEL_EMPRESA VARCHAR2(9),
  TEL_PERSONAL VARCHAR2(9) NULL,
  FECHA_NAC DATE NULL,
  TIPO VARCHAR2(1),
  SALARIO NUMBER(6,2) NULL,
  ID NUMBER(3),
  CONSTRAINT TRA_DNI_PK PRIMARY KEY(DNI),
  CONSTRAINT TRA_ID_FK FOREIGN KEY(ID) REFERENCES CENTROTRABAJO,
  CONSTRAINT TRA_TIPO_CK CHECK (TIPO IN ('L','A')),
  CONSTRAINT TRA_POR_CK CHECK (TO_NUMBER(PORTAL) > 0 AND TO_NUMBER(PORTAL) < 999),
  CONSTRAINT TRA_PIS_CK CHECK (PISO > 0 AND PISO < 99)
  );
    
    
    
    
  CREATE TABLE USUARIOBD(
  USERNAME Varchar2(30),
  CONTRASEÑA Varchar2(20),
  DNI_TRAB Varchar2(9),    
  CONSTRAINT user_pk PRIMARY KEY (USERNAME),
  CONSTRAINT dni_fk FOREIGN KEY  (DNI_TRAB) REFERENCES TRABAJADOR
  );
  
                
    
  CREATE TABLE VEHICULO (
  MATRICULA VARCHAR2(8),
  MODELO VARCHAR2(15),
  MARCA VARCHAR2(15),
  CONSTRAINT VEH_MAT_PK PRIMARY KEY(MATRICULA)
  ); 
    
    
    
  CREATE TABLE ALBARAN (
  NUM_ALBARAN NUMBER(10),
  CONSTRAINT ALB_NUA_PK PRIMARY KEY(NUM_ALBARAN)
  ); 
    
    
  CREATE TABLE PARTESTRABAJO (
  NUM_PARTE NUMBER(6),
  KM_INICIO NUMBER(6),
  KM_FINAL NUMBER(6),
  GASTOS_GASOIL NUMBER(5) NULL,
  GASTOS_PEAJES NUMBER(5) NULL,
  GASTOS_DIETAS NUMBER(5) NULL,
  OTROS_GASTOS NUMBER(5) NULL,
  INCIDENCIAS VARCHAR2(250) NULL,
  ESTADO VARCHAR2(11),
  FECHA DATE,
  DNI_ADMIN VARCHAR2(9) NULL,
  DNI_LOGIS VARCHAR2(9),
  MATRICULA VARCHAR2(8),
  CONSTRAINT PAT_NUP_PK PRIMARY KEY(NUM_PARTE),
  CONSTRAINT PAT_ADM_FK FOREIGN KEY(DNI_ADMIN) REFERENCES TRABAJADOR,
  CONSTRAINT PAT_LOG_FK FOREIGN KEY(DNI_LOGIS) REFERENCES TRABAJADOR,
  CONSTRAINT PAT_ESTADO_CK CHECK (ESTADO IN ('ABIERTO', 'CERRADO','CONFIRMADO')),
  CONSTRAINT PAT_KMF_CK CHECK (KM_FINAL > KM_INICIO),
  CONSTRAINT LIN_MAT_FK FOREIGN KEY(MATRICULA) REFERENCES VEHICULO
  );   
    
    
  CREATE TABLE LINEA (
  ID NUMBER(10),
  HORA_SALIDA VARCHAR2(4),
  HORA_LLEGADA VARCHAR2(4),
  NUM_PARTE NUMBER(6),
  NUM_ALBARAN NUMBER(10),
  CONSTRAINT LIN_ID_PK PRIMARY KEY(ID),
  CONSTRAINT LIN_NUP_FK FOREIGN KEY(NUM_PARTE) REFERENCES PARTESTRABAJO,    
  CONSTRAINT LIN_NUA_FK FOREIGN KEY(NUM_ALBARAN) REFERENCES ALBARAN,
  CONSTRAINT LIN_HLL_CK CHECK (HORA_LLEGADA > HORA_SALIDA)
  );
    
    
    
  CREATE TABLE HORASEXTRA(
  ID_PARTE NUMBER(6) PRIMARY KEY,
  HORAS_EXTRA NUMBER(4),
  CONSTRAINT HOR_IDP_FK FOREIGN KEY(ID_PARTE) REFERENCES PARTESTRABAJO
  );
    
    
    
    
    
    
    
    
    
    
    
    

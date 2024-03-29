DROP DATABASE IF EXISTS KARAOKE_V2;
CREATE DATABASE KARAOKE_V2;
USE KARAOKE_V2;

CREATE TABLE EMPLEADO (
    ID_EMP INT PRIMARY KEY NOT NULL,
    USUARIO VARCHAR(50) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    FEC_NAC DATE NOT NULL,
    EMAIL VARCHAR(100),
    DIRECCION VARCHAR(100),
    TLF VARCHAR(11) NOT NULL,
    TIPO_EMP ENUM('RECEPCIONISTA','PERSONAL') NOT NULL,	
    JEFE_ID INT,
    FOREIGN KEY (JEFE_ID) REFERENCES EMPLEADO(ID_EMP)
);

CREATE TABLE SISTEMA (
    ID_SIS INT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    NUM_V VARCHAR(10)NOT NULL, -- VERSION
    FEC_LANZAMIENTO DATE NOT NULL
);
CREATE TABLE REGISTRO_EMPLEADO (
SIS_ID INT,
EMP_ID INT,
TURNO ENUM('MAÑANA', 'TARDE', 'NOCTURNO') NOT NULL,
PRIMARY KEY(SIS_ID,EMP_ID),
FOREIGN KEY(SIS_ID) REFERENCES SISTEMA(ID_SIS),
FOREIGN KEY(EMP_ID) REFERENCES EMPLEADO(ID_EMP)
);

CREATE TABLE CLIENTE (
    ID_CLI INT PRIMARY KEY NOT NULL,
    ALIAS_CLI VARCHAR(100) NOT NULL,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    EMAIL VARCHAR(50),
    TLF VARCHAR(12)
);

CREATE TABLE CANCION (
    NUM_CAN INT PRIMARY KEY NOT NULL,
    GENERO VARCHAR(30) NOT NULL,
    TITULO VARCHAR(100) NOT NULL,
    ARTISTA VARCHAR(200),
    ANHO INT NOT NULL,
    ENLACE VARCHAR(400)
);

CREATE TABLE CANTA_CANCION (
    CLI_ID INT,
    CAN_NUM INT,
    LIKE_DISLIKE ENUM ('LIKE','DISLIKE'),
    FEC_CANTO DATE,
    PRIMARY KEY (CLI_ID, CAN_NUM),
    FOREIGN KEY (CLI_ID) REFERENCES CLIENTE(ID_CLI),
    FOREIGN KEY (CAN_NUM) REFERENCES CANCION(NUM_CAN)
);

CREATE TABLE VALORACIONES (
    ID_VAL INT PRIMARY KEY NOT NULL,
    COMENTARIO VARCHAR(200),
    PUNTUACION INT CHECK(PUNTUACION >=1 AND PUNTUACION <=5), -- DE 1-5 CUANTO LE GUSTO EL LUGAR
    CLI_ID INT,
    FOREIGN KEY (CLI_ID) REFERENCES CLIENTE(ID_CLI)
);

CREATE TABLE AUXILIAR_SALA(
	TIPO_SALA INT PRIMARY KEY NOT NULL,
	CANTIDAD INT NOT NULL,
	TAMANHO ENUM('GRANDE','MEDIANA','PEQUEÑA') NOT NULL
);

CREATE TABLE SALA (
   ID_SALA INT PRIMARY KEY, 
   DESCR VARCHAR(30) NOT NULL,
   TIPO_SALA INT,
   FOREIGN KEY(TIPO_SALA)REFERENCES AUXILIAR_SALA(TIPO_SALA)
);

CREATE TABLE EQUIPAMIENTO (
   ID_EQUI INT PRIMARY KEY NOT NULL, 
   TIPO VARCHAR(50) NOT NULL, 
   MARCA VARCHAR(50) NOT NULL,
   ANHO_COMPRA DATE NOT NULL
);

CREATE TABLE EQUIPAMIENTO_SALA (
   ID_EQUI INT,
   ID_SALA INT,
   PRIMARY KEY (ID_EQUI, ID_SALA),
   FOREIGN KEY (ID_EQUI) REFERENCES EQUIPAMIENTO(ID_EQUI),
   FOREIGN KEY (ID_SALA) REFERENCES SALA(ID_SALA)
);

CREATE TABLE FACTURA (
  NUM_FACT INT PRIMARY KEY, 
  FECHA DATE, 
  MONTO DECIMAL(10,2), 
  CLI_ID INT, 
  FOREIGN KEY (CLI_ID) REFERENCES CLIENTE(ID_CLI)
);

DROP DATABASE IF EXISTS karaoke;
CREATE DATABASE karaoke;
use karaoke;


-- Tabla usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    tlf VARCHAR(15),
    fec_nac DATE,
    fec_registro DATE,
    tipo VARCHAR(10)
);

-- Tabla reseñas
CREATE TABLE critica (
    cod_critica INT PRIMARY KEY,
    descripcion TEXT,
    -- fec_publicacion DATE,
    aplicacion VARCHAR(50),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE publica_critica(
	cod_critica int,
    id_usuario int,
    fec_publicacion DATE,
    FOREIGN KEY (cod_critica) REFERENCES critica(cod_critica),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla sala
CREATE TABLE sala (
    num_sala INT PRIMARY KEY,
    capacidad INT,
    descripcion VARCHAR(255),
    precio_hora DECIMAL(10, 2),
    disponibilidad BOOLEAN,
    tipo VARCHAR(10),
    id_usuario int,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla empleado
CREATE TABLE empleado (
    cod_personal INT PRIMARY KEY,
    nombre_personal VARCHAR(50),
    apellido VARCHAR(50),
    fec_contrato DATE,
    num_sala INT,
    cod_jefe INT,
    -- FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (num_sala) REFERENCES sala(num_sala),
	FOREIGN KEY (cod_jefe) REFERENCES empleado(cod_personal)
);

-- Tabla reserva_sala (Relación N:M entre empleado y sala)
CREATE TABLE atiende_sala (
    -- id_usuario INT,
    cod_personal INT,
    num_sala INT,
    fec_atencion DATE,
    -- FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (cod_personal) REFERENCES empleado(cod_personal),
    FOREIGN KEY (num_sala) REFERENCES sala(num_sala)
);

-- Tabla canciones
CREATE TABLE canciones (
    id_cancion INT PRIMARY KEY,
    nombre VARCHAR(100),
    artista VARCHAR(50),
    album VARCHAR(50),
    genero VARCHAR(30),
    año INT,
    duracion TIME
);

-- Tabla escucha_cancion (Relación N:M entre usuario y canciones)
CREATE TABLE escucha_cancion (
    id_usuario INT,
    id_cancion INT,
    fecha_escucha DATE,
    PRIMARY KEY (id_usuario, id_cancion),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);

select * from usuario;
select * from critica;
select * from sala;
select * from atiende_sala;
select * from empleado;
select * from canciones;
select * from escucha_cancion;

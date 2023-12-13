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
CREATE TABLE reseñas (
    cod_reseña INT PRIMARY KEY,
    id_usuario INT,
    descripcion TEXT,
    fec_publicacion DATE,
    nombre_aplicacion VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla sala
CREATE TABLE sala (
    num_cabina INT PRIMARY KEY,
    capacidad INT,
    descripcion VARCHAR(255),
    precio_hora DECIMAL(10, 2),
    disponibilidad BOOLEAN,
    tipo VARCHAR(10)
);

-- Tabla reserva_sala (Relación N:M entre usuario y sala)
CREATE TABLE reserva_sala (
    codigo_reserva INT PRIMARY KEY,
    id_usuario INT,
    num_cabina INT,
    fec_reserva DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (num_cabina) REFERENCES sala(num_cabina)
);

-- Tabla empleado
CREATE TABLE empleado (
    cod_personal INT PRIMARY KEY,
    nombre_personal VARCHAR(50),
    apellido VARCHAR(50),
    fec_contrato DATE,
    id_usuario INT,
    cod_jefe INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (cod_jefe) REFERENCES empleado(cod_personal)
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



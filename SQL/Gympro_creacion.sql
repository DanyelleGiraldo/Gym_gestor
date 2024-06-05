create database gympro;
use gympro;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(15),
    fecha_nacimiento DATE,
    calle VARCHAR(100),
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(10)
);

CREATE TABLE instructores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(15),
    especialidad VARCHAR(255)
);

CREATE TABLE tipo_membresia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE membresia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_id INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (tipo_id) REFERENCES tipo_membresia(id)
);


CREATE TABLE clases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    horario TIME,
    cupo_max INT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructores(id)
);

CREATE TABLE membresia_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    membresia_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (membresia_id) REFERENCES membresia(id)
);

CREATE TABLE clase_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    clase_id INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (clase_id) REFERENCES clases(id)
);



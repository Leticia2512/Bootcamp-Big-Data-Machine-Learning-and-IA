
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS bootcamps;
DROP TABLE IF EXISTS modulos;
DROP TABLE IF EXISTS inscripciones;
DROP TABLE IF EXISTS profesores;

-- Crear la tabla alumnos
CREATE TABLE alumnos (
    alumno_id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL
);

-- Crear la tabla bootcamps
CREATE TABLE bootcamps (
    bootcamp_id VARCHAR(50) PRIMARY KEY,
    alumno_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    modalidad VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id)
);
 
-- Crear la tabla modulos
CREATE TABLE modulos (
    modulo_id VARCHAR(50) PRIMARY KEY,
    bootcamp_id VARCHAR(50) NOT NULL,
    profesor_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id),
    FOREIGN KEY (profesor_id) REFERENCES profesores(profesor_id)
);

-- Crear la tabla inscripciones
CREATE TABLE inscripciones (
    inscripcion_id SERIAL PRIMARY KEY,
    alumno_id INT NOT NULL,
    bootcamp_id VARCHAR(50) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id)
);

-- Crear la tabla profesores
CREATE TABLE profesores (
    profesor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL
);

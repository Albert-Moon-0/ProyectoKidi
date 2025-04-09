DROP DATABASE IF EXISTS Kidi;
CREATE DATABASE Kidi;
USE Kidi;

CREATE TABLE USUARIO (
ID_U INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_U VARCHAR (40),
CORREO_U VARCHAR (30),
CONTRASEÑA_U VARCHAR (15),
EDAD_U INT
);

CREATE TABLE ESPAÑOL (
ID_E INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_E VARCHAR (30)
);
CREATE TABLE EJERCICIOS_E (
ID_EE INT NOT NULL PRIMARY KEY auto_increment,
DESC_EE VARCHAR (50),
PUNTAJE_EE INT,
FECHA_EE date,
ID_E INT,
FOREIGN KEY (ID_E) REFERENCES ESPAÑOL (ID_E)
);
CREATE TABLE LECTURAS_E (
ID_LE INT NOT NULL PRIMARY KEY auto_increment,
DESC_LE VARCHAR (50),
NOMBRE_LE VARCHAR (30),
ID_E INT,
FOREIGN KEY (ID_E) REFERENCES ESPAÑOL (ID_E)
);
CREATE TABLE JUEGOS_E (
ID_JE INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_JE VARCHAR (30),
PUNTAJE_JE INT,
FECHA_JE date,
ID_E INT,
FOREIGN KEY (ID_E) REFERENCES ESPAÑOL (ID_E)
);

CREATE TABLE ELIGE (
ID_U INT,
ID_E INT,
FOREIGN KEY (ID_U) REFERENCES USUARIO (ID_U),
FOREIGN KEY (ID_E) REFERENCES ESPAÑOL (ID_E)
);


CREATE TABLE INGLES (
ID_I INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_I VARCHAR (30)
);
CREATE TABLE LECCIONES_I (
ID_LI INT NOT NULL PRIMARY KEY auto_increment,
DESC_LI VARCHAR (50),
NOMBRE_LI VARCHAR (30),
ID_I INT,
FOREIGN KEY (ID_I) REFERENCES INGLES (ID_I)
);

CREATE TABLE EJERCICIOS_I (
ID_EI INT NOT NULL PRIMARY KEY auto_increment,
DESC_EI VARCHAR (50),
PUNTAJE_EI INT,
FECHA_EI date,
ID_I INT,
FOREIGN KEY (ID_I) REFERENCES INGLES (ID_I)
);
CREATE TABLE LECTURAS_I (
ID_LI INT NOT NULL PRIMARY KEY auto_increment,
DESC_LI VARCHAR (50),
NOMBRE_LI VARCHAR (30),
ID_I INT,
FOREIGN KEY (ID_I) REFERENCES INGLES (ID_I)
);
CREATE TABLE JUEGOS_I (
ID_JI INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_JI VARCHAR (30),
PUNTAJE_JI INT,
FECHA_JI date,
ID_I INT,
FOREIGN KEY (ID_I) REFERENCES INGLES (ID_I)
);

CREATE TABLE ESCOGE (
ID_U INT,
ID_I INT,
FOREIGN KEY (ID_U) REFERENCES USUARIO (ID_U),
FOREIGN KEY (ID_I) REFERENCES INGLES (ID_I)
);


CREATE TABLE MATEMATICAS (
ID_M INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_M VARCHAR (30)
);
CREATE TABLE EJERCICIOS_M (
ID_EM INT NOT NULL PRIMARY KEY auto_increment,
DESC_EM VARCHAR (50),
PUNTAJE_EM INT,
FECHA_EM date,
ID_M INT,
FOREIGN KEY (ID_M) REFERENCES MATEMATICAS (ID_M)
);
CREATE TABLE LECCIONES_M (
ID_LM INT NOT NULL PRIMARY KEY auto_increment,
DESC_LM VARCHAR (50),
NOMBRE_LM VARCHAR (30),
ID_M INT,
FOREIGN KEY (ID_M) REFERENCES MATEMATICAS (ID_M)
);
CREATE TABLE JUEGOS_M (
ID_JM INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_JM VARCHAR (30),
PUNTAJE_JM INT,
FECHA_JM date,
ID_M INT,
FOREIGN KEY (ID_M) REFERENCES MATEMATICAS (ID_M)
);

CREATE TABLE SELECCIONA (
ID_U INT,
ID_M INT,
FOREIGN KEY (ID_U) REFERENCES USUARIO (ID_U),
FOREIGN KEY (ID_M) REFERENCES MATEMATICAS (ID_M)
);


CREATE TABLE ACTIVIDADES (
ID_ACT INT NOT NULL PRIMARY KEY auto_increment,
DESC_ACT varchar (50)
);

CREATE TABLE REALIZA (
ID_U INT,
ID_ACT INT,
PUNTAJE_ACT DOUBLE,
FOREIGN KEY (ID_U) REFERENCES USUARIO (ID_U),
FOREIGN KEY (ID_ACT) REFERENCES ACTIVIDADES (ID_ACT)
);

-- Insertando datos en la tabla USUARIO
INSERT INTO USUARIO (ID_U, NOMBRE_U, CORREO_U, CONTRASEÑA_U, EDAD_U) VALUES
(1, 'Juan Perez', 'juan.perez@gmail.com', 'Jpepe123', 10),
(2, 'Fernando', 'fernandoM@gmail.com', 'Fmoran12', 12),
(3, 'Gerardo', 'gerardoM@gmail.com', 'Gmoran12', 11);

-- Insertando datos en la tabla ESPAÑOL
INSERT INTO ESPAÑOL (ID_E, NOMBRE_E) VALUES
(1, 'Gramatica'),
(2, 'Vocabulario'),
(3, 'Ortografía');

-- Insertando datos en la tabla EJERCICIOS_E
INSERT INTO EJERCICIOS_E (ID_EE, DESC_EE, PUNTAJE_EE, FECHA_EE, ID_E) VALUES
(1, 'Ejercicio Futuro Simple', 10, '2024-10-01', 1),
(2, 'Ejercicio Pasado Simple', 15, '2024-10-02', 2),
(3, 'Ejercicio Presente Simple', 15, '2024-10-02', 2);


-- Insertando datos en la tabla LECTURAS_E
INSERT INTO LECTURAS_E (ID_LE, DESC_LE, NOMBRE_LE, ID_E) VALUES
(1, 'Lectura sobre gramática básica', 'Gramática 1', 1),
(2, 'Lectura sobre vocabulario en español', 'Vocabulario 1', 2),
(3, 'Lectura de ortografía', 'Ortografía 1', 3);

-- Insertando datos en la tabla JUEGOS_E
INSERT INTO JUEGOS_E (ID_JE, NOMBRE_JE, PUNTAJE_JE, FECHA_JE, ID_E) VALUES
(1, 'Juego de gramática', 20, '2024-10-05', 1),
(2, 'Juego de vocabulario', 25, '2024-10-06', 2),
(3, 'Juego de ortografía', 30, '2024-10-07', 3);

-- Insertando datos en la tabla ELIGE
INSERT INTO ELIGE (ID_U, ID_E) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Insertando datos en la tabla INGLES
INSERT INTO INGLES (ID_I, NOMBRE_I) VALUES
(1, 'Grammar'),
(2, 'Vocabulary'),
(3, 'Spelling');

-- Insertando datos en la tabla LECCIONES_I
INSERT INTO LECCIONES_I (ID_LI, DESC_LI, NOMBRE_LI, ID_I) VALUES
(1, 'Verb to be', 'Verb to be', 1),
(2, 'Colors', 'Colors', 2),
(3, 'Verbs', 'Verbs', 3);

-- Insertando datos en la tabla EJERCICIOS_I
INSERT INTO EJERCICIOS_I (ID_EI, DESC_EI, PUNTAJE_EI, FECHA_EI, ID_I) VALUES
(1, 'Excersise Verb to be', 10, '2024-10-01', 1),
(2, 'Excersise Verbs', 15, '2024-10-02', 2);


-- Insertando datos en la tabla LECTURAS_I
INSERT INTO LECTURAS_I (ID_LI, DESC_LI, NOMBRE_LI, ID_I) VALUES
(1, 'Reading on basic grammar', 'Grammar Read', 1),
(2, 'Vocabulary reading', 'Advanced Vocabulary', 2),
(3, 'Spelling reading', 'Spelling Read', 3);

-- Insertando datos en la tabla JUEGOS_I
INSERT INTO JUEGOS_I (ID_JI, NOMBRE_JI, PUNTAJE_JI, FECHA_JI, ID_I) VALUES
(1, 'Grammar game', 20, '2024-10-05', 1),
(2, 'Vocabulary game', 25, '2024-10-06', 2),
(3, 'Spelling game', 30, '2024-10-07', 3);

-- Insertando datos en la tabla ESCOGE
INSERT INTO ESCOGE (ID_U, ID_I) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertando datos en la tabla MATEMATICAS
INSERT INTO MATEMATICAS (ID_M, NOMBRE_M) VALUES
(1, 'Álgebra'),
(2, 'Geometría'),
(3, 'Cálculo');

-- Insertando datos en la tabla EJERCICIOS_M
INSERT INTO EJERCICIOS_M (ID_EM, DESC_EM, PUNTAJE_EM, FECHA_EM, ID_M) VALUES
(1, 'Ejercicio sumas y restas', 10, '2024-10-01', 1),
(2, 'Ejercicio multiplicaciones', 15, '2024-10-02', 2),
(3, 'Ejercicio de divisiones', 20, '2024-10-03', 3);

-- Insertando datos en la tabla LECCIONES_M
INSERT INTO LECCIONES_M (ID_LM, DESC_LM, NOMBRE_LM, ID_M) VALUES
(1, 'Lección de álgebra', 'Reconoce los numeros', 1),
(2, 'Lección de sumas y restas', 'Suma y resta', 1),
(3, 'Lección de multiplicaciones', 'Multiplicaciones', 1),
(4, 'Lección de divisiones', 'Divisiones', 1);


-- Insertando datos en la tabla JUEGOS_M
INSERT INTO JUEGOS_M (ID_JM, NOMBRE_JM, PUNTAJE_JM, FECHA_JM, ID_M) VALUES
(1, 'Juego de álgebra', 20, '2024-10-05', 1),
(2, 'Juego de geometría', 25, '2024-10-06', 2),
(3, 'Juego de cálculo', 30, '2024-10-07', 3);

-- Insertando datos en la tabla SELECCIONA
INSERT INTO SELECCIONA (ID_U, ID_M) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertando datos en la tabla ACTIVIDADES
INSERT INTO ACTIVIDADES (ID_ACT, DESC_ACT) VALUES
(1, 'Actividad de introducción'),
(2, 'Actividad intermedia'),
(3, 'Actividad avanzada');

-- Insertando datos en la tabla REALIZA
INSERT INTO REALIZA (ID_U, ID_ACT, PUNTAJE_ACT) VALUES
(1, 1, 8.8),
(1, 2, 9.8),
(2, 2, 7.7),
(3, 3, 9.9);

select * from Usuario;
select * from LECCIONES_M;
select * from EJERCICIOS_M;

SELECT * FROM REALIZA r
JOIN ACTIVIDADES a ON a.ID_ACT = r.ID_ACT 
WHERE r.ID_U = 1;
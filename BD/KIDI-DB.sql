DROP DATABASE IF EXISTS Kidi;
CREATE DATABASE Kidi;
USE Kidi;

CREATE TABLE ADMIN_ (
  ID_A INT PRIMARY KEY AUTO_INCREMENT,
  NOMBRE_A VARCHAR(40),
  CORREO_A VARCHAR(50) UNIQUE,
  CONTRA_A VARCHAR(150)
);
INSERT INTO ADMIN_ (NOMBRE_A, CORREO_A, CONTRA_A) VALUES
("Admin Kidi", "adminKidi@gmail.com", "$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2");

CREATE TABLE FOTO_PERFIL(
ID_FOTO INT PRIMARY KEY,
NOMBRE_FOTO VARCHAR(30)
);
INSERT INTO FOTO_PERFIL (ID_FOTO,NOMBRE_FOTO) VALUES
(1, "Ajolote.jpeg"),
(2, "Conejo.jpeg"),
(3, "Gato.jpeg"),
(4, "Gatorobot.jpeg"),
(5, "Oso.jpeg"),
(6, "Raton.jpeg"),
(7, "Vaca.jpeg");

CREATE TABLE TUTOR(
ID_T INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_T VARCHAR(30),
CORREO_T VARCHAR (50) UNIQUE,
CONTRA_T VARCHAR (150)
 );
INSERT INTO TUTOR (NOMBRE_T, CORREO_T, CONTRA_T) VALUES
("Pepe",  "Pepe@gmail.com", "$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2"),
("Victor", "Pepe2@gmail.com", "$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2");

CREATE TABLE USUARIO (
ID_U INT NOT NULL PRIMARY KEY auto_increment,
NOMBRE_U VARCHAR (40),
CORREO_U VARCHAR (30) UNIQUE,
CONTRASEÑA_U VARCHAR (150),
EDAD_U INT,
ID_FOTO INT,
ID_T INT,
FOREIGN KEY (ID_T) REFERENCES TUTOR (ID_T),
FOREIGN KEY (ID_FOTO) REFERENCES FOTO_PERFIL (ID_FOTO)
);
-- Insertando datos en la tabla USUARIO 1 Jpepe123, 2 Fmoran12, 3 Gmoran12
INSERT INTO USUARIO (NOMBRE_U, CORREO_U, CONTRASEÑA_U, EDAD_U, ID_FOTO, ID_T) VALUES
('Juan Perez', 'juan@gmail.com', '$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2', 10, 1, 1),
('Fernando', 'fernandoM@gmail.com', '$2a$12$47wosqZr6czMOOLt0eQbK.50xDgOKIcDnEz6rVC9O5QKwKjNQIdfe', 12, 2, 1),
('Alberto', 'albertoL@gmail.com', '$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2', 10, 3, 2),
('Samantha', 'samanthaJ@gmail.com', '$2a$12$E4WrkuJqW0dc5P3HRqsbcOM6IarT02gK1UXoFVPLPH6PdbTxig9z2', 11, 4, 2);


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


CREATE TABLE MATERIA_ACT (
ID_MAT INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE_MAT VARCHAR(30)
);


CREATE TABLE ACTIVIDADES (
ID_ACT INT NOT NULL PRIMARY KEY auto_increment,
DESC_ACT varchar (50),
ID_MAT INT,
FOREIGN KEY (ID_MAT) REFERENCES MATERIA_ACT(ID_MAT)
);

CREATE TABLE REALIZA (
ID_U INT,
ID_ACT INT,
PUNTAJE_ACT DOUBLE,
FOREIGN KEY (ID_U) REFERENCES USUARIO (ID_U),
FOREIGN KEY (ID_ACT) REFERENCES ACTIVIDADES (ID_ACT)
);

CREATE TABLE PREGUNTAS ( 
ID_PREGUNTA INTEGER PRIMARY KEY, 
ENUNCIADO TEXT NOT NULL, 
RESPUESTA_CORRECTA TEXT NOT NULL, 
ID_ACT INTEGER NOT NULL, 
FOREIGN KEY (ID_ACT) REFERENCES ACTIVIDADES(ID_ACT) 
); 

CREATE TABLE OPCIONES (
ID_OPCION INTEGER PRIMARY KEY, 
TEXTO_OPCION TEXT NOT NULL, 
ES_CORRECTA BOOLEAN, 
ID_PREGUNTA INTEGER NOT NULL, 
FOREIGN KEY (ID_PREGUNTA) REFERENCES PREGUNTAS(ID_PREGUNTA) 
); 



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

INSERT INTO MATERIA_ACT (ID_MAT, NOMBRE_MAT) VALUES
(1, 'Español'),
(2, 'Inglés'),
(3, 'Matemáticas');

INSERT INTO ACTIVIDADES (ID_ACT, DESC_ACT, ID_MAT) VALUES
(1, 'Números y sumas', 3),
(2, 'Sumas y restas', 3),
(3, 'Multiplicaciones', 3),
(4, 'Divisiones', 3),
(5, 'Figuras geométricas básicas', 3),
(6, 'Partes de una figura', 3),
(7, 'Verb to be', 2),
(8, 'Colors', 2),
(9, 'Basic verbs', 2),
(10, 'Tiempos gramaticales', 1);

-- Insertando datos en la tabla REALIZA
INSERT INTO REALIZA (ID_U, ID_ACT, PUNTAJE_ACT) VALUES
(1, 1, 8.8),
(1, 2, 9.8),
(2, 2, 7.7),
(3, 3, 9.9);

-- Preguntas para actividad 'Números y sumas' (ID_ACT = 1) 
INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES 
(1, '¿Cuánto es 2 + 2?', '4', 1), 
(2, '¿Cuánto es 3 + 5?', '8', 1),
(3, '¿Cuánto es 10 + 5?', '15', 1),
(4, '¿Cuánto es 7 + 6?', '13', 1),
(5, '¿Cuánto es 1 + 9?', '10', 1),
(6, '¿Cuánto es 4 + 4?', '8', 1),
(7, '¿Cuánto es 6 + 3?', '9', 1),
(8, '¿Cuánto es 0 + 7?', '7', 1),
(9, '¿Cuánto es 5 + 2?', '7', 1);

-- Opciones para la primera pregunta 
INSERT INTO OPCIONES (ID_OPCION, TEXTO_OPCION, ES_CORRECTA, ID_PREGUNTA) VALUES 
(1, '7', FALSE, 1), 
(216, '3', FALSE, 1), 
(2, '4', TRUE, 1), 
(3, '5', FALSE, 1);

-- Pregunta 2
INSERT INTO OPCIONES VALUES
(212, '8', TRUE, 2),
(213, '6', FALSE, 2),
(214, '9', FALSE, 2),
(215, '10', FALSE, 2);

-- Pregunta 3
INSERT INTO OPCIONES VALUES
(4, '14', FALSE, 3),
(5, '15', TRUE, 3),
(6, '16', FALSE, 3),
(7, '13', FALSE, 3);

-- Pregunta 4
INSERT INTO OPCIONES VALUES
(8, '13', TRUE, 4),
(9, '14', FALSE, 4),
(10, '12', FALSE, 4),
(11, '15', FALSE, 4);

-- Pregunta 5
INSERT INTO OPCIONES VALUES
(12, '10', TRUE, 5),
(13, '9', FALSE, 5),
(14, '11', FALSE, 5),
(15, '12', FALSE, 5);

-- Pregunta 6
INSERT INTO OPCIONES VALUES
(16, '6', FALSE, 6),
(17, '8', TRUE, 6),
(18, '7', FALSE, 6),
(19, '9', FALSE, 6);

-- Pregunta 7
INSERT INTO OPCIONES VALUES
(20, '9', TRUE, 7),
(21, '8', FALSE, 7),
(22, '7', FALSE, 7),
(23, '10', FALSE, 7);

-- Pregunta 8
INSERT INTO OPCIONES VALUES
(24, '6', FALSE, 8),
(25, '7', TRUE, 8),
(26, '8', FALSE, 8),
(27, '9', FALSE, 8);

-- Pregunta 9
INSERT INTO OPCIONES VALUES
(28, '7', TRUE, 9),
(29, '6', FALSE, 9),
(30, '5', FALSE, 9),
(31, '8', FALSE, 9);

-- Preguntas para actividad 'Números y sumas' (ID_ACT = 2)
INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES 
(82, '¿Cuánto es 2 - 2?', '0', 2), 
(83, '¿Cuánto es 5 + 5?', '10', 2),
(84, '¿Cuánto es 10 - 5?', '5', 2),
(85, '¿Cuánto es 7 - 6?', '1', 2),
(86, '¿Cuánto es 4 + 5?', '9', 2),
(87, '¿Cuánto es 4 + 4?', '8', 2),
(88, '¿Cuánto es 6 - 3?', '3', 2),
(89, '¿Cuánto es 7 - 0?', '7', 2),
(90, '¿Cuánto es 5 + 2?', '7', 2);

-- Opciones para la pregunta 82
INSERT INTO OPCIONES VALUES
(400, '7', FALSE, 82), 
(401, '3', FALSE, 82), 
(402, '0', TRUE, 82), 
(403, '5', FALSE, 82);

-- Pregunta 83
INSERT INTO OPCIONES VALUES
(404, '10', TRUE, 83),
(405, '6', FALSE, 83),
(406, '9', FALSE, 83),
(407, '11', FALSE, 83);

-- Pregunta 84
INSERT INTO OPCIONES VALUES
(408, '14', FALSE, 84),
(409, '5', TRUE, 84),
(410, '15', FALSE, 84),
(411, '13', FALSE, 84);

-- Pregunta 85
INSERT INTO OPCIONES VALUES
(412, '1', TRUE, 85),
(413, '12', FALSE, 85),
(414, '0', FALSE, 85),
(415, '15', FALSE, 85);

-- Pregunta 86
INSERT INTO OPCIONES VALUES
(416, '10', FALSE, 86),
(417, '9', TRUE, 86),
(418, '11', FALSE, 86),
(419, '12', FALSE, 86);

-- Pregunta 87
INSERT INTO OPCIONES VALUES
(420, '6', FALSE, 87),
(421, '8', TRUE, 87),
(422, '7', FALSE, 87),
(423, '9', FALSE, 87);

-- Pregunta 88
INSERT INTO OPCIONES VALUES
(424, '3', TRUE, 88),
(425, '8', FALSE, 88),
(426, '7', FALSE, 88),
(427, '10', FALSE, 88);

-- Pregunta 89
INSERT INTO OPCIONES VALUES
(428, '6', FALSE, 89),
(429, '7', TRUE, 89),
(430, '8', FALSE, 89),
(431, '9', FALSE, 89);

-- Pregunta 90
INSERT INTO OPCIONES VALUES
(432, '7', TRUE, 90),
(433, '6', FALSE, 90),
(434, '5', FALSE, 90),
(435, '8', FALSE, 90);


-- Preguntas para actividad ' Multiplicaciones' (ID_ACT = 3) 
INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(10, '¿Cuánto es 2 x 3?', '6', 3),
(11, '¿Cuánto es 4 x 5?', '20', 3),
(12, '¿Cuánto es 6 x 2?', '12', 3),
(13, '¿Cuánto es 3 x 3?', '9', 3),
(14, '¿Cuánto es 7 x 1?', '7', 3),
(15, '¿Cuánto es 8 x 2?', '16', 3),
(16, '¿Cuánto es 5 x 5?', '25', 3),
(17, '¿Cuánto es 9 x 0?', '0', 3),
(18, '¿Cuánto es 10 x 2?', '20', 3);

-- Pregunta 10
INSERT INTO OPCIONES VALUES
(32, '5', FALSE, 10),
(33, '6', TRUE, 10),
(34, '9', FALSE, 10),
(35, '8', FALSE, 10);

-- Pregunta 11
INSERT INTO OPCIONES VALUES
(36, '20', TRUE, 11),
(37, '15', FALSE, 11),
(38, '25', FALSE, 11),
(39, '18', FALSE, 11);

-- Pregunta 12
INSERT INTO OPCIONES VALUES
(40, '10', FALSE, 12),
(41, '12', TRUE, 12),
(42, '14', FALSE, 12),
(43, '16', FALSE, 12);

-- Pregunta 13
INSERT INTO OPCIONES VALUES
(44, '6', FALSE, 13),
(45, '9', TRUE, 13),
(46, '8', FALSE, 13),
(47, '10', FALSE, 13);

-- Pregunta 14
INSERT INTO OPCIONES VALUES
(48, '6', FALSE, 14),
(49, '7', TRUE, 14),
(50, '8', FALSE, 14),
(51, '9', FALSE, 14);

-- Pregunta 15
INSERT INTO OPCIONES VALUES
(52, '14', FALSE, 15),
(53, '16', TRUE, 15),
(54, '18', FALSE, 15),
(55, '20', FALSE, 15);

-- Pregunta 16
INSERT INTO OPCIONES VALUES
(56, '20', FALSE, 16),
(57, '25', TRUE, 16),
(58, '30', FALSE, 16),
(59, '15', FALSE, 16);

-- Pregunta 17
INSERT INTO OPCIONES VALUES
(60, '0', TRUE, 17),
(61, '9', FALSE, 17),
(62, '1', FALSE, 17),
(63, '10', FALSE, 17);

-- Pregunta 18
INSERT INTO OPCIONES VALUES
(64, '18', FALSE, 18),
(65, '20', TRUE, 18),
(66, '22', FALSE, 18),
(67, '25', FALSE, 18);

-- Preguntas para actividad "Divisiones" (ID_ACT = 4)
INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(19, '¿Cuánto es 6 ÷ 2?', '3', 4),
(20, '¿Cuánto es 10 ÷ 5?', '2', 4),
(21, '¿Cuánto es 12 ÷ 4?', '3', 4),
(22, '¿Cuánto es 9 ÷ 3?', '3', 4),
(23, '¿Cuánto es 15 ÷ 5?', '3', 4),
(24, '¿Cuánto es 20 ÷ 2?', '10', 4),
(25, '¿Cuánto es 8 ÷ 2?', '4', 4),
(26, '¿Cuánto es 18 ÷ 6?', '3', 4),
(27, '¿Cuánto es 16 ÷ 4?', '4', 4);
-- Pregunta 19
INSERT INTO OPCIONES VALUES
(68, '2', FALSE, 19),
(69, '3', TRUE, 19),
(70, '4', FALSE, 19),
(71, '5', FALSE, 19);

-- Pregunta 20
INSERT INTO OPCIONES VALUES
(72, '1', FALSE, 20),
(73, '2', TRUE, 20),
(74, '3', FALSE, 20),
(75, '4', FALSE, 20);

-- Pregunta 21
INSERT INTO OPCIONES VALUES
(76, '2', FALSE, 21),
(77, '3', TRUE, 21),
(78, '4', FALSE, 21),
(79, '5', FALSE, 21);

-- Pregunta 22
INSERT INTO OPCIONES VALUES
(80, '3', TRUE, 22),
(81, '2', FALSE, 22),
(82, '4', FALSE, 22),
(83, '1', FALSE, 22);

-- Pregunta 23
INSERT INTO OPCIONES VALUES
(84, '2', FALSE, 23),
(85, '3', TRUE, 23),
(86, '5', FALSE, 23),
(87, '4', FALSE, 23);

-- Pregunta 24
INSERT INTO OPCIONES VALUES
(88, '9', FALSE, 24),
(89, '10', TRUE, 24),
(90, '8', FALSE, 24),
(91, '12', FALSE, 24);

-- Pregunta 25
INSERT INTO OPCIONES VALUES
(92, '4', TRUE, 25),
(93, '2', FALSE, 25),
(94, '6', FALSE, 25),
(95, '3', FALSE, 25);

-- Pregunta 26
INSERT INTO OPCIONES VALUES
(96, '2', FALSE, 26),
(97, '3', TRUE, 26),
(98, '4', FALSE, 26),
(99, '5', FALSE, 26);

-- Pregunta 27
INSERT INTO OPCIONES VALUES
(100, '5', FALSE, 27),
(101, '4', TRUE, 27),
(102, '6', FALSE, 27),
(103, '3', FALSE, 27); 

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(28, '¿Cuál figura tiene tres lados?', 'Triángulo', 5),
(29, '¿Cuál figura tiene cuatro lados iguales?', 'Cuadrado', 5),
(30, '¿Cuál figura es redonda y no tiene lados?', 'Círculo', 5),
(31, '¿Cuál figura tiene seis lados?', 'Hexágono', 5),
(32, '¿Qué figura tiene cinco lados?', 'Pentágono', 5),
(33, '¿Qué figura tiene ocho lados?', 'Octágono', 5),
(34, '¿Qué figura parece una pelota?', 'Círculo', 5),
(35, '¿Qué figura tiene forma de señal de alto?', 'Octágono', 5),
(36, '¿Cuál figura parece una casa con techo triangular?', 'Pentágono', 5);
-- Pregunta 28
INSERT INTO OPCIONES VALUES
(104, 'Cuadrado', FALSE, 28),
(105, 'Rectángulo', FALSE, 28),
(106, 'Triángulo', TRUE, 28),
(107, 'Círculo', FALSE, 28);

-- Pregunta 29
INSERT INTO OPCIONES VALUES
(108, 'Rectángulo', FALSE, 29),
(109, 'Cuadrado', TRUE, 29),
(110, 'Rombo', FALSE, 29),
(111, 'Triángulo', FALSE, 29);

-- Pregunta 30
INSERT INTO OPCIONES VALUES
(112, 'Círculo', TRUE, 30),
(113, 'Cuadrado', FALSE, 30),
(114, 'Triángulo', FALSE, 30),
(115, 'Hexágono', FALSE, 30);

-- Pregunta 31
INSERT INTO OPCIONES VALUES
(116, 'Pentágono', FALSE, 31),
(117, 'Hexágono', TRUE, 31),
(118, 'Octágono', FALSE, 31),
(119, 'Heptágono', FALSE, 31);

-- Pregunta 32
INSERT INTO OPCIONES VALUES
(120, 'Hexágono', FALSE, 32),
(121, 'Pentágono', TRUE, 32),
(122, 'Octágono', FALSE, 32),
(123, 'Círculo', FALSE, 32);

-- Pregunta 33
INSERT INTO OPCIONES VALUES
(124, 'Hexágono', FALSE, 33),
(125, 'Octágono', TRUE, 33),
(126, 'Cuadrado', FALSE, 33),
(127, 'Pentágono', FALSE, 33);

-- Pregunta 34
INSERT INTO OPCIONES VALUES
(128, 'Círculo', TRUE, 34),
(129, 'Triángulo', FALSE, 34),
(130, 'Rombo', FALSE, 34),
(131, 'Rectángulo', FALSE, 34);

-- Pregunta 35
INSERT INTO OPCIONES VALUES
(132, 'Cuadrado', FALSE, 35),
(133, 'Triángulo', FALSE, 35),
(134, 'Octágono', TRUE, 35),
(135, 'Círculo', FALSE, 35);

-- Pregunta 36
INSERT INTO OPCIONES VALUES
(136, 'Rectángulo', FALSE, 36),
(137, 'Cuadrado', FALSE, 36),
(138, 'Pentágono', TRUE, 36),
(139, 'Triángulo', FALSE, 36);

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(37, '¿Cómo se llama el punto donde se unen dos lados?', 'Vértice', 6),
(38, '¿Cuántos lados tiene un triángulo?', '3', 6),
(39, '¿Cuál es la parte más larga de un rectángulo?', 'Lado', 6),
(40, '¿Cómo se llama la línea que divide un círculo en dos partes iguales?', 'Diámetro', 6),
(41, '¿Cómo se llama la parte que va de un lado al centro del círculo?', 'Radio', 6),
(42, '¿Qué parte de una figura indica su altura?', 'Altura', 6),
(43, '¿Qué parte de una figura se encuentra en la parte inferior?', 'Base', 6),
(44, '¿Qué parte se encuentra en las esquinas de una figura?', 'Vértice', 6),
(45, '¿Cómo se llaman las líneas que forman una figura?', 'Lados', 6);
-- Pregunta 37
INSERT INTO OPCIONES VALUES
(140, 'Centro', FALSE, 37),
(141, 'Vértice', TRUE, 37),
(142, 'Lado', FALSE, 37),
(143, 'Base', FALSE, 37);

-- Pregunta 38
INSERT INTO OPCIONES VALUES
(144, '4', FALSE, 38),
(145, '2', FALSE, 38),
(146, '3', TRUE, 38),
(147, '5', FALSE, 38);

-- Pregunta 39
INSERT INTO OPCIONES VALUES
(148, 'Vértice', FALSE, 39),
(149, 'Lado', TRUE, 39),
(150, 'Altura', FALSE, 39),
(151, 'Centro', FALSE, 39);

-- Pregunta 40
INSERT INTO OPCIONES VALUES
(152, 'Radio', FALSE, 40),
(153, 'Diámetro', TRUE, 40),
(154, 'Altura', FALSE, 40),
(155, 'Base', FALSE, 40);

-- Pregunta 41
INSERT INTO OPCIONES VALUES
(156, 'Lado', FALSE, 41),
(157, 'Vértice', FALSE, 41),
(158, 'Radio', TRUE, 41),
(159, 'Centro', FALSE, 41);

-- Pregunta 42
INSERT INTO OPCIONES VALUES
(160, 'Base', FALSE, 42),
(161, 'Altura', TRUE, 42),
(162, 'Diámetro', FALSE, 42),
(163, 'Centro', FALSE, 42);

-- Pregunta 43
INSERT INTO OPCIONES VALUES
(164, 'Centro', FALSE, 43),
(165, 'Lado', FALSE, 43),
(166, 'Base', TRUE, 43),
(167, 'Vértice', FALSE, 43);

-- Pregunta 44
INSERT INTO OPCIONES VALUES
(168, 'Lado', FALSE, 44),
(169, 'Vértice', TRUE, 44),
(170, 'Base', FALSE, 44),
(171, 'Centro', FALSE, 44);

-- Pregunta 45
INSERT INTO OPCIONES VALUES
(172, 'Lados', TRUE, 45),
(173, 'Vértices', FALSE, 45),
(174, 'Altura', FALSE, 45),
(175, 'Centro', FALSE, 45);

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(46, 'How do you say "Yo soy estudiante" in English?', 'I am a student', 7),
(47, 'How do you say "Ellos están en casa" in English?', 'They are at home', 7),
(48, 'What is the correct question form for "You are a teacher"?', 'Are you a teacher?', 7),
(49, 'How do you say "Nosotros no somos amigos" in English?', 'We are not friends', 7),
(50, 'What is the correct answer to the question "Are you happy?"', 'Yes, I am', 7),
(51, 'How do you say "Ella no está aquí" in English?', 'She is not here', 7),
(52, 'How do you say "Ellos son de México" in English?', 'They are from Mexico', 7),
(53, 'What is the correct negative form for "He is a doctor"?', 'He is not a doctor', 7),
(54, 'How do you say "Nosotros estamos ocupados" in English?', 'We are busy', 7);

-- Pregunta 46
INSERT INTO OPCIONES VALUES
(176, 'I am a student', TRUE, 46),
(177, 'I am student', FALSE, 46),
(178, 'I is a student', FALSE, 46),
(179, 'I are a student', FALSE, 46);

-- Pregunta 47
INSERT INTO OPCIONES VALUES
(180, 'They are home', FALSE, 47),
(181, 'They are at home', TRUE, 47),
(182, 'They is at home', FALSE, 47),
(183, 'They are in home', FALSE, 47);

-- Pregunta 48
INSERT INTO OPCIONES VALUES
(184, 'Are you a teacher?', TRUE, 48),
(185, 'You are a teacher?', FALSE, 48),
(186, 'You teacher are?', FALSE, 48),
(187, 'Are teacher you?', FALSE, 48);

-- Pregunta 49
INSERT INTO OPCIONES VALUES
(188, 'We not are friends', FALSE, 49),
(189, 'We are not friends', TRUE, 49),
(190, 'We not friends are', FALSE, 49),
(191, 'We is not friends', FALSE, 49);

-- Pregunta 50
INSERT INTO OPCIONES VALUES
(192, 'Yes, I am', TRUE, 50),
(193, 'Yes, am I', FALSE, 50),
(194, 'Yes, are I', FALSE, 50),
(195, 'Yes, I be', FALSE, 50);

-- Pregunta 51
INSERT INTO OPCIONES VALUES
(196, 'She is not here', TRUE, 51),
(197, 'She not is here', FALSE, 51),
(198, 'She here is not', FALSE, 51),
(199, 'She is here not', FALSE, 51);

-- Pregunta 52
INSERT INTO OPCIONES VALUES
(200, 'They are from Mexico', TRUE, 52),
(201, 'They from Mexico are', FALSE, 52),
(202, 'They is from Mexico', FALSE, 52),
(203, 'They Mexico from are', FALSE, 52);

-- Pregunta 53
INSERT INTO OPCIONES VALUES
(204, 'He is not a doctor', TRUE, 53),
(205, 'He a doctor is not', FALSE, 53),
(206, 'He is a not doctor', FALSE, 53),
(207, 'He not is a doctor', FALSE, 53);

-- Pregunta 54
INSERT INTO OPCIONES VALUES
(208, 'We are busy', TRUE, 54),
(209, 'We busy are', FALSE, 54),
(210, 'We be busy', FALSE, 54),
(211, 'We busy is', FALSE, 54);

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(55, 'How do you say "Rojo" in English?', 'Red', 8),
(56, 'What is the color of the sky on a clear day?', 'Blue', 8),
(57, 'How do you say "Verde" in English?', 'Green', 8),
(58, 'What is the color of a banana?', 'Yellow', 8),
(59, 'How do you say "Blanco" in English?', 'White', 8),
(60, 'What is the color of a strawberry?', 'Red', 8),
(61, 'How do you say "Negro" in English?', 'Black', 8),
(62, 'What color is the sun?', 'Yellow', 8),
(63, 'How do you say "Naranja" in English?', 'Orange', 8);

-- Pregunta 55
INSERT INTO OPCIONES VALUES
(220, 'Red', TRUE, 55),
(221, 'Green', FALSE, 55),
(222, 'Blue', FALSE, 55),
(223, 'Yellow', FALSE, 55);

-- Pregunta 56
INSERT INTO OPCIONES VALUES
(224, 'Red', FALSE, 56),
(225, 'Blue', TRUE, 56),
(226, 'Green', FALSE, 56),
(227, 'Yellow', FALSE, 56);

-- Pregunta 57
INSERT INTO OPCIONES VALUES
(228, 'Red', FALSE, 57),
(229, 'Green', TRUE, 57),
(230, 'Yellow', FALSE, 57),
(231, 'Blue', FALSE, 57);

-- Pregunta 58
INSERT INTO OPCIONES VALUES
(232, 'Red', FALSE, 58),
(233, 'Yellow', TRUE, 58),
(234, 'Green', FALSE, 58),
(235, 'Blue', FALSE, 58);

-- Pregunta 59
INSERT INTO OPCIONES VALUES
(236, 'White', TRUE, 59),
(237, 'Yellow', FALSE, 59),
(238, 'Red', FALSE, 59),
(239, 'Blue', FALSE, 59);

-- Pregunta 60
INSERT INTO OPCIONES VALUES
(240, 'Red', TRUE, 60),
(241, 'Green', FALSE, 60),
(242, 'Yellow', FALSE, 60),
(243, 'Blue', FALSE, 60);

-- Pregunta 61
INSERT INTO OPCIONES VALUES
(244, 'Black', TRUE, 61),
(245, 'Red', FALSE, 61),
(246, 'White', FALSE, 61),
(247, 'Blue', FALSE, 61);

-- Pregunta 62
INSERT INTO OPCIONES VALUES
(248, 'Yellow', TRUE, 62),
(249, 'Blue', FALSE, 62),
(250, 'Green', FALSE, 62),
(251, 'Red', FALSE, 62);

-- Pregunta 63
INSERT INTO OPCIONES VALUES
(252, 'Red', FALSE, 63),
(253, 'Green', FALSE, 63),
(254, 'Yellow', FALSE, 63),
(255, 'Orange', TRUE, 63);

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(64, 'How do you say "Correr" in English?', 'Run', 9),
(65, 'How do you say "Comer" in English?', 'Eat', 9),
(66, 'How do you say "Estudiar" in English?', 'Study', 9),
(67, 'How do you say "Dormir" in English?', 'Sleep', 9),
(68, 'How do you say "Leer" in English?', 'Read', 9),
(69, 'How do you say "Hablar" in English?', 'Talk', 9),
(70, 'What is the negative form of "I eat" in English?', 'I do not eat', 9),
(71, 'What is the correct question form of "You sleep" in English?', 'Do you sleep?', 9),
(72, 'How do you say "Escribir" in English?', 'Write', 9);

-- Pregunta 64
INSERT INTO OPCIONES VALUES
(260, 'Run', TRUE, 64),
(261, 'Walk', FALSE, 64),
(262, 'Jump', FALSE, 64),
(263, 'Talk', FALSE, 64);

-- Pregunta 65
INSERT INTO OPCIONES VALUES
(264, 'Eat', TRUE, 65),
(265, 'Drink', FALSE, 65),
(266, 'Cook', FALSE, 65),
(267, 'Sleep', FALSE, 65);

-- Pregunta 66
INSERT INTO OPCIONES VALUES
(268, 'Study', TRUE, 66),
(269, 'Play', FALSE, 66),
(270, 'Talk', FALSE, 66),
(271, 'Walk', FALSE, 66);

-- Pregunta 67
INSERT INTO OPCIONES VALUES
(272, 'Sleep', TRUE, 67),
(273, 'Eat', FALSE, 67),
(274, 'Talk', FALSE, 67),
(275, 'Run', FALSE, 67);

-- Pregunta 68
INSERT INTO OPCIONES VALUES
(276, 'Read', TRUE, 68),
(277, 'Write', FALSE, 68),
(278, 'Talk', FALSE, 68),
(279, 'Eat', FALSE, 68);

-- Pregunta 69
INSERT INTO OPCIONES VALUES
(280, 'Talk', TRUE, 69),
(281, 'Sleep', FALSE, 69),
(282, 'Study', FALSE, 69),
(283, 'Eat', FALSE, 69);

-- Pregunta 70
INSERT INTO OPCIONES VALUES
(284, 'I do not eat', TRUE, 70),
(285, 'I not eat', FALSE, 70),
(286, 'I no eat', FALSE, 70),
(287, 'I eats not', FALSE, 70);

-- Pregunta 71
INSERT INTO OPCIONES VALUES
(288, 'Do you sleep?', TRUE, 71),
(289, 'You sleep do?', FALSE, 71),
(290, 'Sleep you do?', FALSE, 71),
(291, 'Do sleep you?', FALSE, 71);

-- Pregunta 72
INSERT INTO OPCIONES VALUES
(292, 'Write', TRUE, 72),
(293, 'Read', FALSE, 72),
(294, 'Talk', FALSE, 72),
(295, 'Sleep', FALSE, 72);

INSERT INTO PREGUNTAS (ID_PREGUNTA, ENUNCIADO, RESPUESTA_CORRECTA, ID_ACT) VALUES
(73, 'Completa la oración: "Yo ____ todos los días a las 7." (Presente)', 'me levanto', 10),
(74, 'Selecciona la forma correcta del verbo "comer" en pasado simple.', 'comí', 10),
(75, 'Completa la oración: "Mañana ella ____ al médico." (Futuro)', 'irá', 10),
(76, 'Selecciona la forma correcta del verbo "correr" en pasado.', 'corrí', 10),
(77, 'Completa la oración: "Nosotros ____ para el examen." (Presente continuo)', 'estamos estudiando', 10),
(78, 'Completa la oración: "Ellos ____ a España el próximo mes." (Futuro)', 'viajarán', 10),
(79, 'Completa la oración: "Él ____ a la tienda todos los días." (Presente)', 'va', 10),
(80, 'Selecciona la forma correcta del verbo "hablar" en pasado.', 'hablé', 10),
(81, 'Completa la oración: "Ayer yo no ____ nada." (Pasado)', 'comí', 10);

-- Pregunta 73
INSERT INTO OPCIONES VALUES
(300, 'me levanto', TRUE, 73),
(301, 'me levanté', FALSE, 73),
(302, 'me levantaré', FALSE, 73),
(303, 'me estoy levantando', FALSE, 73);

-- Pregunta 74
INSERT INTO OPCIONES VALUES
(304, 'comí', TRUE, 74),
(305, 'como', FALSE, 74),
(306, 'comeré', FALSE, 74),
(307, 'comiendo', FALSE, 74);

-- Pregunta 75
INSERT INTO OPCIONES VALUES
(308, 'irá', TRUE, 75),
(309, 'fue', FALSE, 75),
(310, 'va', FALSE, 75),
(311, 'iría', FALSE, 75);

-- Pregunta 76
INSERT INTO OPCIONES VALUES
(312, 'corrí', TRUE, 76),
(313, 'corro', FALSE, 76),
(314, 'correré', FALSE, 76),
(315, 'corriendo', FALSE, 76);

-- Pregunta 77
INSERT INTO OPCIONES VALUES
(316, 'estamos estudiando', TRUE, 77),
(317, 'estudiamos', FALSE, 77),
(318, 'estudiaremos', FALSE, 77),
(319, 'estudiábamos', FALSE, 77);

-- Pregunta 78
INSERT INTO OPCIONES VALUES
(320, 'viajarán', TRUE, 78),
(321, 'viajaron', FALSE, 78),
(322, 'viajan', FALSE, 78),
(323, 'viajarían', FALSE, 78);

-- Pregunta 79
INSERT INTO OPCIONES VALUES
(324, 'va', TRUE, 79),
(325, 'fue', FALSE, 79),
(326, 'irá', FALSE, 79),
(327, 'iba', FALSE, 79);

-- Pregunta 80
INSERT INTO OPCIONES VALUES
(328, 'hablé', TRUE, 80),
(329, 'hablo', FALSE, 80),
(330, 'hablaré', FALSE, 80),
(331, 'hablando', FALSE, 80);

-- Pregunta 81
INSERT INTO OPCIONES VALUES
(332, 'comí', TRUE, 81),
(333, 'como', FALSE, 81),
(334, 'comeré', FALSE, 81),
(335, 'comiendo', FALSE, 81);


select * from Usuario;
select * from LECCIONES_M;
select * from EJERCICIOS_M;


-- Crear la base de datos
CREATE DATABASE SombrasEnElCastillo;

-- Usar base de datos
USE SombrasEnElCastillo;

-- Tabla Datos Personajes
CREATE TABLE Datos_personajes (
    id_datos INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    habitacion VARCHAR(100),
    edad NUMERIC,
    comida_favorita VARCHAR(100)
);
INSERT INTO Datos_personajes (id_datos, nombre, habitacion, edad, comida_favorita) VALUES
(1,'Mickey Mouse', 'Sala del Trono', 55, 'Queso'),
(2,'Robin Hood', 'Cuartos de los Sirvientes', 32, 'Chocolate'),
(3,'Tiana', 'Cocina Real', 28, 'Beignets'),
(4,'Hades', 'Mazmorras', 5000, 'Almas condenadas'),
(5,'Bella', 'Biblioteca', 26, 'Té con pastas'),
(6,'Capitán Garfio', 'Cuartel de la Guardia', 45, 'Pescado a la brasa'),
(7,'Jafar', 'Sala del Consejo', 50, 'Dátiles y especias'),
(8,'Mulán', 'Barracones de la Guardia', 30, 'Arroz con pato'),
(9,'Merlín', 'Torre del Alquimista', 300, 'Sopa de hierbas mágicas'),
(10,'Maléfica', 'Cámara de la Hechicera', 1000, 'Manzanas encantadas'),
(11,'Alicia', 'Jardín de Hierbas', 22, 'Galletas misteriosas'),
(12,'Pinocho', 'Taller de Juguetes', 10, 'Caramelos de madera');

-- Tabla de Personajes
CREATE TABLE Personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    id_datos_personales INT NOT NULL UNIQUE,
    rol_castillo ENUM('Detective', 'Rey', 'Juguetero','Herborista', 'Hechicera','Capitán de la Guardia', 'Bibliotecaria', 'Carcelero', 'Consejero','Sirviente','Alquimista', 'Caballero', 'Guardia', 'Cocinera'),
    relacion_protagonista TEXT,
    FOREIGN KEY (id_datos_personales) REFERENCES Datos_personajes(id_datos)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Personajes (id_datos_personales, rol_castillo, relacion_protagonista) VALUES
(1, 'Rey', 'Él mismo'),
(2, 'Sirviente', 'Un simple lacayo'),
(3, 'Cocinera', 'Amantes toxicos'),
(4, 'Carcelero', 'Un enemigo astuto que disfruta viendo al protagonista sufrir.'),
(5, 'Bibliotecaria', 'Se llevan bien, ella ayuda al protagonista a investigar sobre el veneno.'),
(6, 'Capitán de la Guardia', 'Desconfía del protagonista y lo vigila de cerca.'),
(7, 'Consejero', 'Se llevan mal, pero da buenos consejos'),
(8, 'Guardia', 'Amantes'),
(9, 'Alquimista', 'Mejores amigos'),
(10, 'Hechicera', 'No se fían el uno del otro, pero se respetan.'),
(11, 'Herborista', 'Sabe más de venenos de lo que admite.'),
(12, 'Juguetero', 'Tiene información clave, pero miente demasiado.');

-- Tabla de Objetos
CREATE TABLE Objetos (
    id_objeto INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT NOT NULL,
    descripcion VARCHAR(255)
);

INSERT INTO Objetos (nombre, descripcion) VALUES
('Candelabro de Hierro', 'Un pesado candelabro de hierro forjado que ilumina las sombrías estancias del castillo.'),
('Tapiz Real', 'Un tapiz bordado a mano que narra la historia de la familia noble que habita el castillo.'),
('Frasco de Veneno', 'Un pequeño frasco de vidrio oscuro con un líquido verde y un símbolo de calavera grabado en la etiqueta.'),
('Chocolatina', 'Una chocolatina envuelta en papel dorado, con un aroma dulce pero un misterioso ingrediente oculto.'),
('Cofre de Roble', 'Un antiguo cofre con refuerzos de hierro, utilizado para guardar oro y documentos importantes.'),
('Espada Ceremonial', 'Una espada decorativa con incrustaciones de rubíes, usada en ceremonias y proclamaciones.'),
('Trono Tallado', 'Un trono de madera maciza con inscripciones doradas, símbolo del poder del rey o señor feudal.'),
('Copón de Plata', 'Una copa elaborada de plata, utilizada en banquetes y ceremonias religiosas.'),
('Armadura Completa', 'Una reluciente armadura de acero expuesta en un rincón del gran salón.'),
('Reloj de Arena', 'Un reloj de arena con un marco de bronce, utilizado para medir el tiempo en reuniones importantes.'),
('Espejo de Cuarzo', 'Un espejo antiguo con marco dorado, cuya superficie ha comenzado a opacarse con los años.'),
('Pergamino Antiguo', 'Un pergamino enrollado con sellos de cera, conteniendo información valiosa o prohibida.')
;

-- Tabla de eventos
CREATE table Eventos(
    id_eventos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    evento TEXT,
    hora TIME
);
INSERT INTO Eventos (evento, hora) VALUES
	('Aparece una misteriosa chocolatina en la habitación de Mickey', '08:00:00'),
    ('Desaparece la chocolatina de la habitación de Mickey', '10:00:00'),
	('Mickey descubre muerto a Robin con restos de chocolate en la boca y confirma que fue él quien comió la chocolatina desaparecida, dicha chocolatina tenía un líquido VERDE en su interior. Mientras tanto, en la cocina, encuentra manchas de veneno en la mesa, lo que despierta nuevas sospechas.', '11:00:00'),
	('Jafar encuentra un frasco vacío con restos de veneno en la cocina y recuerda haber visto a Tiana cerca de la habitación de Mickey poco antes del incidente. Esto lo lleva a sospechar que ella podría estar involucrada.', '12:30:00'),
	('Merlín presencia una fuerte discusión entre Mulán y Tiana por un lío amoroso. Poco después, encuentra una nota en la biblioteca con la palabra "Traidor", lo que sugiere que la pelea podría estar relacionada con una traición más grande.', '13:45:00'),
	('Mulán encuentra una nota con la palabra "Traidor" en la biblioteca. Más tarde, Bella testifica que vio a Tiana discutiendo con un noble traidor, lo que la hace pensar que ambos eventos podrían estar conectados.', '11:15:00'),
	('Mickey al investigar más, se entera de que Bella vio a Tiana discutiendo con un noble sospechoso. Esto lo lleva a preguntarse si el veneno podría haber sido usado en esa confrontación.', '11:10:00'),
	('Jafar menciona haber visto a Tiana cerca de la habitación de Mickey en un momento sospechoso. Al mismo tiempo, Merlín recuerda la discusión entre Tiana y Mulán, lo que lo hace dudar de las verdaderas intenciones de ambas.', '14:10:00'),
    ('Mulán pasa por la cocina a desayunar, y ve que la cocinera tiene el delantal manchado de chocolate','09:00:00');

-- Tabla de Investigación
CREATE TABLE Investigacion (
    id_investigacion INT AUTO_INCREMENT PRIMARY KEY,
    pista VARCHAR(100),
    descubierto_por INT,
    relacionado_con INT,
    id_evento INT,
    FOREIGN KEY (descubierto_por) REFERENCES Personajes(id_personaje)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (relacionado_con) REFERENCES Personajes(id_personaje)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_eventos)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Investigacion (pista, descubierto_por, relacionado_con,id_evento) VALUES
('Restos de chocolate en la boca de Robin', 1, 2, 3),  -- Mickey descubre que Robin comió la chocolatina
('Frasco vacío con restos de veneno encontrado en la cocina', 7, 3, 4),  -- Jafar encuentra evidencia contra Tiana
('Mulán y Tiana discuten acaloradamente por un lio amoroso', 9, 8, 5), -- Merlín encuentra evidencia contra Mulán
('Mulán y Tiana discuten acaloradamente por un lio amoroso', 9, 3, 5), -- Merlín encuentra evidencia contra Tiana
('Nota con la palabra "Traidor" en la biblioteca', 8, NULL, 6),  -- Mulán encuentra algo sospechoso relacionado con Jafar
('Manchas de veneno en la mesa de la cocina', 1, 3, 3),  -- Mickey encuentra rastros que incriminan a Tiana
('Testimonio de Bella que vio a Tiana discutir con un noble traidor', 5, 3, 6),  -- Bella confirma su sospecha
('Jafar menciona haber visto a Tiana cerca de la habitación de Mickey', 7, 3,8 ),  -- Jafar trata de desviar la atención a Tiana
('Nota con la palabra "Traidor" en la biblioteca', 9, NULL, 5),
('Mancha de chocolate en el delantal de Tiana',8,3,9);

-- Tabla Interrogatorio
CREATE TABLE Interrogatorio (
    id_interrogatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_personaje_interrogado INT,
    declaracion TEXT,
    hora TIME,
    FOREIGN KEY (id_personaje_interrogado) REFERENCES Personajes(id_personaje)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO Interrogatorio (id_personaje_interrogado, declaracion, hora) VALUES
(2, 'Yo solo vi una sombra moverse en la cocina.', '10:45:00'),
(5, 'No sé nada sobre la chocolatina, pero vi a Jafar cerca del trono.', '13:10:00'),
(3, 'Preparé varias comidas, pero nadie más tocó la chocolatina.', '15:30:00'),
(6, 'Mis pociones no tienen nada que ver con esto, pero el veneno podría haber sido mágico.', '17:00:00'),
(9, 'Yo vi a Mulán discutir con Tiana sobre un dilema amoroso','12:00:00'),
(4, 'El rey está perdiendo el tiempo interrogándome.', '14:15:00'),
(8, 'A esa hora estaba en la herrería, pregúntale a Bella.', '18:50:00'),
(11, '¿Veneno? Eso suena costoso... ¿quién estaría dispuesto a pagar por algo así?', '14:05:00'),
(12, 'Oh, yo no diría nada... o tal vez sí... quién sabe.', '16:30:00');


-- Tabla de Relación: Personajes - Pistas
CREATE TABLE Objetos_en_posesion (
    id_objeto_en_posesion INT AUTO_INCREMENT PRIMARY KEY,
    id_objetos INT,
    id_personaje INT,
    ubicacion_objeto VARCHAR(50),
    FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (id_objetos) REFERENCES Objetos(id_objeto)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
INSERT INTO Objetos_en_posesion (id_objetos, id_personaje, ubicacion_objeto) VALUES
(1, 1, 'Sala del Trono'), -- Candelabro de Hierro en la sala del trono del Rey
(2, 1, 'Pasillo Principal'), -- Tapiz Real colgado en el pasillo principal
(3, 3, 'Estante oculto en la alacena de hierbas'), -- Frasco de Veneno escondido por la Cocinera
(4, 3, 'Cocina'), -- Chocolatina guardada por la Cocinera
(5, 1, 'Cámara del Tesoro'), -- Cofre de Roble en la cámara del tesoro del Rey
(6, 6, 'Cuartel de la Guardia'), -- Espada Ceremonial en el cuartel de la Guardia
(7, 1, 'Sala del Trono'), -- Trono Tallado en la sala del trono del Rey
(3, 8, 'En un cajón de la armeria'),
(8, 5, 'Biblioteca'), -- Copón de Plata en la Biblioteca de la Bibliotecaria
(9, 6, 'Cuartel de la Guardia'), -- Armadura Completa en el cuartel de la Guardia
(10, 7, 'Sala del Consejo'), -- Reloj de Arena en la sala del Consejo del Consejero
(11, 10, 'Cámara de la Hechicera'), -- Espejo de Cuarzo en la cámara de la Hechicera
(3, 9, 'En la zona de trabajo del ALquimista') ,
(12, 9, 'Torre del Alquimista'); -- Pergamino Antiguo en la torre del Alquimista

create table Solucion(
  id INT PRIMARY KEY,
  nombre_asesino blob
);
insert into Solucion 
  values  (1,aes_encrypt('Enhorabuena!, Tiana es la ASESINA','Tiana'));


-- QUERIES
SELECT * FROM Eventos WHERE hora='11:00';
SELECT * FROM Objetos WHERE Nombre LIKE '%veneno%' OR descripcion LIKE '%verde%';
SELECT Datos_personajes.nombre, Datos_personajes.comida_favorita, Objetos_en_posesion.ubicacion_objeto, Personajes.rol_castillo, Personajes.relacion_protagonista 
FROM Objetos_en_posesion 
LEFT JOIN Personajes ON Objetos_en_posesion.id_personaje = Personajes.id_personaje
INNER JOIN Datos_personajes ON Personajes.id_datos_personales = Datos_personajes.id_datos
WHERE Objetos_en_posesion.id_objetos = 3;
SELECT * FROM Investigacion WHERE pista LIKE'%Tiana%' OR pista LIKE'%MULÁN%' OR pista LIKE'%merlín%';
SELECT cast(aes_decrypt(nombre_asesino,'Tiana') as char) AS nombre_asesino from Solucion;

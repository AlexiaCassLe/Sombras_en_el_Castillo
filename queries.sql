-- QUERIES PARA DAR CON LA SOLUCIÓN
SELECT * FROM Eventos WHERE hora='11:00';
SELECT * FROM Objetos WHERE Nombre LIKE '%veneno%' OR descripcion LIKE '%verde%';
SELECT Datos_personajes.nombre, Datos_personajes.comida_favorita, Objetos_en_posesion.ubicacion_objeto, Personajes.rol_castillo, Personajes.relacion_protagonista 
FROM Objetos_en_posesion 
LEFT JOIN Personajes ON Objetos_en_posesion.id_personaje = Personajes.id_personaje
INNER JOIN Datos_personajes ON Personajes.id_datos_personales = Datos_personajes.id_datos
WHERE Objetos_en_posesion.id_objetos = 3;
SELECT * FROM Investigacion WHERE pista LIKE'%Tiana%' OR pista LIKE'%MULÁN%' OR pista LIKE'%merlín%';
SELECT cast(aes_decrypt(nombre_asesino,'Tiana') as char) AS nombre_asesino from Solucion;

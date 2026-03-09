--1. Se busco el reporte de crimen ocurrido el 15 de enero del 2018 
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = "SQL City"
AND type = "murder";
--2.Luego con las descripcion dada segun la primera busqueda procedemos a encontrar el primer testigo
SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC
LIMIT 1;
--3.Despues de haber encontrado al testigo, vamos a ver sus declaraciones
SELECT *
FROM interview
WHERE person_id = 14887;
--4.Segun las declaraciones del testigo, el criminal tenia membresia de oro, con ID 48Z
SELECT *
FROM get_fit_now_member
WHERE membership_status = "gold"
AND id LIKE "48Z%";
--5.Ya con dos sospechosos, y con sus id personales, vamos con la siguiente pista que nos dio el testigo 1, que es la placa del carro que contiene la cadena H42W
SELECT *
FROM drivers_license
WHERE plate_number LIKE "%H42W%";
--6. Ya con esta busqueda podemos encontrar 3 personas, vamos a guardarlo por el momento y busca la informacion de las dos personas anteriores
SELECT *
FROM person
where id= 67318
or id= 28819;
--7. El caso nos daba un segundo testigo, el cual tenia como nombre anabelle y la direccion de vivienda era la Franklin Ave
SELECT *
FROM person
WHERE name LIKE "%Annabel%"
AND address_street_name	="Franklin Ave";
--8,Ya habiendo identificado la persona buscamos su declaracion
SELECT *
FROM interview
WHERE person_id =16371;
--9,Con la declaracion de Ana, nos dijo que reconocio al asesino entrando al mismo gym que ella el 9 de enero
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date =20180109;
--10.Ya con esto podemos ver las ID que entraron ese dia al gym, y encontramos las dos que ya habiamos visto que tenian la cadena 48Z
--Ya habiendo buscado la informacion de esas dos personas identificadas durante todo el proceso, podemos ver que una de las licencias encontradas en el paso 5 coincide con una de las personas sospechosas
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
--Y al final el asesino era el Señor Jeremy Bowers        
# Laboratorio 2 – SQL Murder Mystery
Nombre: Juan Esteban Tobon Martinez
Curso: Estructura de Datos y Lab

# Resumen del Caso

El 15 de enero de 2018 ocurrió un asesinato en SQL City.  
Utilizando consultas SQL se investigó el reporte del crimen, las declaraciones de los testigos y la información almacenada en diferentes tablas de la base de datos.  
Tras analizar las pistas y relacionar los datos del gimnasio, las membresías y las licencias de conducir, se identificó al responsable del asesinato.

El culpable del crimen fue **Jeremy Bowers**.

---

# Investigacion

1. Buscar el reporte del crimen

Primero se buscó el reporte del crimen ocurrido el 15 de enero de 2018 en SQL City.

```sql
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = "SQL City"
AND type = "murder";
```

Este reporte indicó que existían dos testigos importantes.

2. Encontrar el primer testigo

La descripción indicaba que el primer testigo vivía en la última casa de Northwestern Dr.
```sql
SELECT *
FROM person
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC
LIMIT 1;
```
Esto permitió identificar al primer testigo.

3. Revisar la entrevista del primer testigo
```sql
SELECT *
FROM interview
WHERE person_id = 14887;
```

-El testigo declaró que el sospechoso:

-Tenía una bolsa del gimnasio Get Fit Now Gym

-Era miembro Gold

-Su número de membresía empezaba con 48Z

-La placa del vehículo contenía H42W

4. Buscar miembros del gimnasio

Con esta información se filtraron los miembros del gimnasio que cumplían estas condiciones.
```sql
SELECT *
FROM get_fit_now_member
WHERE membership_status = "gold"
AND id LIKE "48Z%";
```

Esto redujo la lista a dos sospechosos.

5. Buscar coincidencias con la placa del vehículo
```sql
SELECT *
FROM drivers_license
WHERE plate_number LIKE "%H42W%";
```

Esta consulta permitió identificar la licencia que coincidía con la descripción del testigo.

6. Comparar con los sospechosos encontrados
```sql
SELECT *
FROM person
WHERE id = 67318
OR id = 28819;
```

Al comparar la información de las licencias y los sospechosos se pudo determinar cuál coincidía con la placa del vehículo.

7. Identificar al segundo testigo

El segundo testigo se llamaba Annabel y vivía en Franklin Ave.
```sql
SELECT *
FROM person
WHERE name LIKE "%Annabel%"
AND address_street_name = "Franklin Ave";
```

8. Revisar la declaración del segundo testigo
```sql
SELECT *
FROM interview
WHERE person_id = 16371;
```

Annabel declaró que reconoció al asesino en el gimnasio el 9 de enero.

9. Revisar quién fue al gimnasio ese día
```sql
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109;
```

Al revisar las entradas del gimnasio se encontraron las membresías que coincidían con la pista 48Z.

10. Verificación del culpable

Finalmente se verificó el culpable utilizando la tabla de solución del juego.
```sql
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;
```


La plataforma confirmó que el culpable era Jeremy Bowers.

## Evidencia del proceso

### Paso 1
![Paso 1](evidencia/E1.png)

### Paso 2
![Paso 1](evidencia/E2.png)

### Paso 3
![Paso 3](evidencia/E3.png)

### Paso 4
![Paso 4](evidencia/E4.png)

### Paso 5
![Paso 5](evidencia/E5.png)

### Paso 6
![Paso 6](evidencia/E6.png)

### Paso 7
![Paso 7](evidencia/E7.png)

### Paso 8
![Paso 8](evidencia/E8.png)

### Paso 9
![Paso 9](evidencia/E9.png)

### Paso 10
![Paso 10](evidencia/E10.png)

# Conclusión

Después de analizar las pistas proporcionadas por los testigos y cruzar la información de diferentes tablas de la base de datos, se logró identificar al culpable del asesinato en SQL City.

El asesino fue Jeremy Bowers, cuya información coincidía con la membresía del gimnasio, la declaración de los testigos y la placa del vehículo descrita en la investigación
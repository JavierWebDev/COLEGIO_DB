# Base De Datos Colegio

## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

```sql
SELECT apellido1Alumno, apellido2Alumno, nombreAlumno
FROM alumno
ORDER BY apellido1Alumno DESC, apellido2Alumno DESC, nombreAlumno DESC;
+-----------------+-----------------+--------------+
| apellido1Alumno | apellido2Alumno | nombreAlumno |
+-----------------+-----------------+--------------+
| Pérez           | García          | Juan         |
| López           | Martínez        | María        |
| González        | Sánchez         | Pedro        |
+-----------------+-----------------+--------------+
```

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

```sql
SELECT nombreAlumno, apellido1Alumno, apellido2Alumno
FROM alumno
LEFT JOIN telefono_alumno ON id_alumno = id_telefonoAlumno
WHERE telefono_alumno.id_telefonoAlumno IS NULL;
+--------------+-----------------+-----------------+
| nombreAlumno | apellido1Alumno | apellido2Alumno |
+--------------+-----------------+-----------------+
| Pedro        | González        | Sánchez         |
+--------------+-----------------+-----------------+
```

3. Devuelve el listado de los alumnos que nacieron en 1999.

```sql
SELECT id_alumno, fechaNacimientoAlumno, nombreAlumno, apellido1Alumno, apellido2Alumno
FROM alumno
WHERE YEAR(fechaNacimientoAlumno) = 1999;
+-----------+-----------------------+--------------+-----------------+-----------------+
| id_alumno | fechaNacimientoAlumno | nombreAlumno | apellido1Alumno | apellido2Alumno |
+-----------+-----------------------+--------------+-----------------+-----------------+
|         1 | 1999-05-15            | Juan         | Pérez           | García          |
+-----------+-----------------------+--------------+-----------------+-----------------+
```

4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

```sql
SELECT id_profesor, nifProfesor, nombreProfesor, apellido1Profesor, apellido2Profesor
FROM profesor
LEFT JOIN telefono_profesor ON id_profesor = telefono_profesor.idProfesorTelefono
WHERE nifProfesor LIKE '%K';
+-------------+-------------+----------------+-------------------+-------------------+
| id_profesor | nifProfesor | nombreProfesor | apellido1Profesor | apellido2Profesor |
+-------------+-------------+----------------+-------------------+-------------------+
|           2 | 22222222K   | Ana            | García            | Martínez          |
+-------------+-------------+----------------+-------------------+-------------------+
```

5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

```sql
SELECT id_asignatura, nombreAsignatura, cuatrimestre, curso, idGradoAsignatura
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND idGradoAsignatura = 7;
+---------------+-------------------------+--------------+-------+-------------------+
| id_asignatura | nombreAsignatura        | cuatrimestre | curso | idGradoAsignatura |
+---------------+-------------------------+--------------+-------+-------------------+
|             3 | Arquitectura De Sofware |            1 |     3 |                 7 |
+---------------+-------------------------+--------------+-------+-------------------+
```

---

## Consultas multitabla (Composición interna)

1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

```sql
SELECT id_alumno, nombreAlumno, apellido1Alumno, apellido2Alumno
FROM alumno 
LEFT JOIN matricula_alumno ON id_alumno = matricula_alumno.idAsignaturaMatricula
WHERE alumno.idGeneroAlumno = 2;
+-----------+--------------+-----------------+-----------------+
| id_alumno | nombreAlumno | apellido1Alumno | apellido2Alumno |
+-----------+--------------+-----------------+-----------------+
|         2 | María        | López           | Martínez        |
+-----------+--------------+-----------------+-----------------+
```

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

```sql
SELECT id_asignatura, nombreAsignatura
FROM asignatura
WHERE idGradoAsignatura = 1;
+---------------+------------------+
| id_asignatura | nombreAsignatura |
+---------------+------------------+
|             1 | Programación     |
|             2 | Base de Datos    |
+---------------+------------------+
```

3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre deldepartamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

```sql
SELECT nombreProfesor, apellido1Profesor, apellido2Profesor, Departamento.nombreDepartamento
FROM profesor
JOIN departamento ON idDepartamentoProfesor = departamento.id_departamento
ORDER BY apellido1Profesor DESC, apellido2Profesor DESC, nombreProfesor DESC;
+----------------+-------------------+-------------------+------------------------------+
| nombreProfesor | apellido1Profesor | apellido2Profesor | nombreDepartamento           |
+----------------+-------------------+-------------------+------------------------------+
| Pedro          | Sánchez           | Gómez             | Departamento de Informática  |
| Ana            | García            | Martínez          | Departamento de Matemáticas  |
+----------------+-------------------+-------------------+------------------------------+
```

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

```sql
SELECT alumno.nifAlumno, asignatura.nombreAsignatura, curso_escolar.inicioCurso, curso_escolar.finCurso
FROM matricula_alumno
JOIN asignatura ON idAsignaturaMatricula = asignatura.id_asignatura
JOIN curso_escolar ON idCursoMatricula = curso_escolar.id_cursoEscolar
JOIN alumno ON idAlumnoMatricula = alumno.id_alumno
WHERE alumno.nifAlumno = '26902806M';
+-----------+------------------+-------------+----------+
| nifAlumno | nombreAsignatura | inicioCurso | finCurso |
+-----------+------------------+-------------+----------+
| 26902806M | Base de Datos    |        2015 |     2018 |
+-----------+------------------+-------------+----------+
```

5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

```sql
SELECT DISTINCT(nombreDepartamento)
FROM departamento
JOIN profesor ON id_departamento = profesor.idDepartamentoProfesor
JOIN asignatura ON profesor.id_profesor = asignatura.idProfesorAsignatura
JOIN grado ON asignatura.idGradoAsignatura = grado.id_grado
WHERE grado.id_grado = 1;
+------------------------------+
| nombreDepartamento           |
+------------------------------+
| Departamento de Informática  |
| Departamento de Matemáticas  |
+------------------------------+
```

6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

```sql
SELECT idAlumnoMatricula
FROM matricula_alumno
JOIN curso_escolar ON idCursoMatricula = curso_escolar.id_cursoEscolar
WHERE curso_escolar.inicioCurso IN ('2018','2019')
+-------------------+
| idAlumnoMatricula |
+-------------------+
|                 3 |
+-------------------+
```

---

## Consultas multitabla (Composición externa)

### Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

```sql
SELECT departamento.nombreDepartamento, apellido1Profesor, apellido2Profesor, nombreProfesor
FROM profesor
LEFT JOIN departamento ON idDepartamentoProfesor = departamento.id_departamento
ORDER BY departamento.nombreDepartamento DESC, apellido1Profesor DESC, apellido2Profesor DESC, nombreProfesor DESC;

```

2. Devuelve un listado con los profesores que no están asociados a un departamento.

```sql
SELECT id_profesor, apellido1Profesor, apellido2Profesor, nombreProfesor
FROM profesor
WHERE idDepartamentoProfesor IS NULL;
+-------------+-------------------+-------------------+----------------+
| id_profesor | apellido1Profesor | apellido2Profesor | nombreProfesor |
+-------------+-------------------+-------------------+----------------+
|           3 | Perez             | Velazques         | Jolver         |
+-------------+-------------------+-------------------+----------------+
```

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

```sql
SELECT nombreDepartamento
FROM departamento
LEFT JOIN profesor ON id_departamento = profesor.id_profesor
WHERE profesor.idDepartamentoProfesor IS NULL;
+------------------------+
| nombreDepartamento     |
+------------------------+
| Departamento de Logica |
+------------------------+
```

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

```sql

```

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

```sql
SELECT nombreAsignatura
FROM asignatura
WHERE idProfesorAsignatura IS NULL;
+------------------+
| nombreAsignatura |
+------------------+
| Ciberseguridad   |
+------------------+
```

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

```sql

```

---

## Consultas Resumen

1. Devuelve el número total de alumnas que hay.

```sql
SELECT COUNT(id_alumno) AS numAlumnas
FROM alumno
WHERE idGeneroAlumno = 2;
+------------+
| numAlumnas |
+------------+
|          1 |
+------------+
```

2. Calcula cuántos alumnos nacieron en 1999.

```sql
SELECT COUNT(id_alumno) AS numALumnos1999
FROM alumno
WHERE YEAR(fechaNacimientoAlumno) = 1999;
+----------------+
| numALumnos1999 |
+----------------+
|              1 |
+----------------+
```

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

```sql
SELECT departamento.nombreDepartamento, COUNT(id_profesor) AS numProfesxDep
FROM profesor
JOIN departamento ON profesor.idDepartamentoProfesor = departamento.id_departamento
GROUP BY nombreDepartamento;
+------------------------------+---------------+
| nombreDepartamento           | numProfesxDep |
+------------------------------+---------------+
| Departamento de Informática  |             1 |
| Departamento de Matemáticas  |             1 |
+------------------------------+---------------+
```

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

```sql
SELECT nombreDepartamento, COUNT(id_profesor) AS numProfesores
FROM departamento
LEFT JOIN profesor ON id_departamento = profesor.idDepartamentoProfesor
GROUP BY nombreDepartamento;
+------------------------------+---------------+
| nombreDepartamento           | numProfesores |
+------------------------------+---------------+
| Departamento de Informática  |             1 |
| Departamento de Matemáticas  |             1 |
| Departamento de Logica       |             0 |
+------------------------------+---------------+
```

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

```sql
SELECT nombreGrado, COUNT(asignatura.id_asignatura) AS numAsignaturas
FROM grado
LEFT JOIN asignatura ON id_grado = asignatura.idGradoAsignatura
GROUP BY nombreGrado;
+-----------------------------------+----------------+
| nombreGrado                       | numAsignaturas |
+-----------------------------------+----------------+
| Grado en Ingeniería Informática   |              3 |
| Grado en Ingeniería Ambiental     |              0 |
| Grado en Ingeniería De Sofware    |              2 |
+-----------------------------------+----------------+
```

6. 

---

## Subconsultas

1. Devuelve todos los datos del alumno más joven.

```sql
SELECT id_alumno, nifAlumno, nombreAlumno, apellido1Alumno, apellido2Alumno, fechaNacimientoAlumno, idGeneroAlumno
FROM alumno
WHERE fechaNacimientoAlumno = (
  SELECT MAX(fechaNacimientoAlumno)
  FROM alumno
);
+-----------+-----------+--------------+-----------------+-----------------+-----------------------+----------------+
| id_alumno | nifAlumno | nombreAlumno | apellido1Alumno | apellido2Alumno | fechaNacimientoAlumno | idGeneroAlumno |
+-----------+-----------+--------------+-----------------+-----------------+-----------------------+----------------+
|         4 | 26902806M | Carlos       | Gomez           | Rodriguez       | 2003-05-13            |              1 |
+-----------+-----------+--------------+-----------------+-----------------+-----------------------+----------------+
```

2. Devuelve un listado con los profesores que no están asociados a un departamento.

```sql
SELECT id_profesor, nombreProfesor, apellido1Profesor, idDepartamentoProfesor
FROM profesor
WHERE idDepartamentoProfesor IS NULL;
+-------------+----------------+-------------------+------------------------+
| id_profesor | nombreProfesor | apellido1Profesor | idDepartamentoProfesor |
+-------------+----------------+-------------------+------------------------+
|           3 | Jolver         | Perez             |                   NULL |
+-------------+----------------+-------------------+------------------------+
```

3. Devuelve un listado con los departamentos que no tienen profesores asociados.

```sql

```

4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

```

```



1. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
2. Devuelve un listado con todos los departamentos que no han impartido
  asignaturas en ningún curso escolar.


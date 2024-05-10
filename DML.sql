-- Insertando datos de ejemplo en las tablas genero, ciudad y tipo_telefono
INSERT INTO genero (id_genero, nombreGenero) VALUES
(1, 'Masculino'),
(2, 'Femenino');

INSERT INTO ciudad (id_ciudad, nombreCiudad) VALUES
('001', 'Ciudad A'),
('002', 'Ciudad B'),
('003', 'Ciudad C');

INSERT INTO tipo_telefono (id_tipoTelefono, descripcion) VALUES
(1, 'Fijo'),
(2, 'Móvil');

-- Insertando datos de ejemplo en la tabla alumno
INSERT INTO alumno (id_alumno, nifAlumno, nombreAlumno, apellido1Alumno, apellido2Alumno, fechaNacimientoAlumno, idGeneroAlumno) VALUES
(1, '12345678A', 'Juan', 'Pérez', 'García', '1999-05-15', 1),
(2, '87654321B', 'María', 'López', 'Martínez', '1998-10-20', 2),
(3, '11111111C', 'Pedro', 'González', 'Sánchez', '2000-02-28', 1),
(4, '26902806M', 'Carlos', 'Gomez', 'Rodriguez', '2003-05-13', 1);

-- Insertando datos de ejemplo en la tabla direccion_alumno
INSERT INTO direccion_alumno (id_direccionAlumno, sector, calle, ciudadAlumno, idAlumno) VALUES
(1, 'Zona Norte', 'Calle Mayor 123', '001', 1),
(2, 'Centro', 'Avenida Principal 456', '002', 2),
(3, 'Zona Sur', 'Calle Secundaria 789', '003', 3);

-- Insertando datos de ejemplo en la tabla telefono_alumno
INSERT INTO telefono_alumno (id_telefonoAlumno, numero, idTipoTelefono, idAlumnoTelefono) VALUES
(1, 123456789, 1, 1),
(2, 987654321, 2, 2);

-- Insertando datos de ejemplo en la tabla departamento

INSERT INTO departamento (id_departamento, nombreDepartamento) VALUES
(1, 'Departamento de Informática'),
(2, 'Departamento de Matemáticas'),
(3, 'Departamento de Logica');


-- Insertando datos de ejemplo en la tabla profesor
INSERT INTO profesor (id_profesor, nifProfesor, nombreProfesor, apellido1Profesor, apellido2Profesor, fechaNacimientoProfesor, idGeneroProfesor, idDepartamentoProfesor) VALUES
(1, '11111111A', 'Pedro', 'Sánchez', 'Gómez', '1980-03-25', 1, 1),
(2, '22222222K', 'Ana', 'García', 'Martínez', '1975-07-10', 2, 2),
(3, '88234343B', 'Jolver', 'Perez', 'Velazques', '1978-10-21', 2, NULL);

-- Insertando datos de ejemplo en la tabla telefono_profesor
INSERT INTO telefono_profesor (id_telefonoProfesor, numero, idTipoTelefono, idProfesorTelefono) VALUES
(1, 157756769, 1, 1),
(2, 717698671, 2, 2);

-- Insertando datos de ejemplo en la tabla direccion_profesor
INSERT INTO direccion_profesor (id_direccionProfesor, sector, calle, ciudadProfesor, idProfesor) VALUES
(1, 'Zona Sur', 'Calle Secundaria 789', '003', 1),
(2, 'Zona Este', 'Avenida Secundaria 012', '002', 2);

-- Insertando datos de ejemplo en la tabla grado
INSERT INTO grado (id_grado, nombreGrado) VALUES
(1, 'Grado en Ingeniería Informática'),
(2, 'Grado en Ingeniería Ambiental'),
(7, 'Grado en Ingeniería De Sofware');

-- Insertando datos de ejemplo en la tabla tipo_asignatura
INSERT INTO tipo_asignatura (id_tipoAsignatura, nobmreTipoAsignatura) VALUES
(1, 'Obligatoria'),
(2, 'Optativa');

-- Insertando datos de ejemplo en la tabla asignatura
INSERT INTO asignatura (id_asignatura, nombreAsignatura, creditos, curso, cuatrimestre, idProfesorAsignatura, idGradoAsignatura, idTipoAsignatura) VALUES
(1, 'Programación', 6.0, 1, 1, 1, 1, 1),
(2, 'Base de Datos', 6.0, 1, 2, 2, 1, 1),
(3, 'Arquitectura De Sofware', 6.0, 3, 1, 1, 7, 1),
(4, 'Ciberseguridad', 6.0, 3, 1, NULL, 7, 1),
(5, 'Programación Orientada A Objetos', 8.0, NULL, 2, 3, 1, 1);

-- Insertando datos de ejemplo en la tabla curso_escolar
INSERT INTO curso_escolar (id_cursoEscolar, inicioCurso, finCurso) VALUES
(1, '2015', '2018'),
(2, '2012', '2015'),
(3, '2018', '2021');

-- Insertando datos de ejemplo en la tabla matricula_alumno
INSERT INTO matricula_alumno (idAlumnoMatricula, idAsignaturaMatricula, idCursoMatricula) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 2, 1);
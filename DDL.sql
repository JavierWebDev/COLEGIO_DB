-- ************** TABLAS GENERALES *****************

-- Crear tabla genero

CREATE TABLE genero(
  id_genero INT(2) PRIMARY KEY,
  nombreGenero VARCHAR(50)
);

-- Crear tabla genero

CREATE TABLE ciudad(
  id_ciudad VARCHAR(5) PRIMARY KEY,
  nombreCiudad VARCHAR(50)
);

-- Crear tabla tipo_telefono

CREATE TABLE tipo_telefono(
  id_tipoTelefono TINYINT(1) PRIMARY KEY,
  descripcion VARCHAR(20)
);

-- *************** TABLAS ALUMNO *************************

-- Crear tabla alumno

CREATE TABLE alumno(
  id_alumno INT PRIMARY KEY,
  nifAlumno VARCHAR(9),
  nombreAlumno VARCHAR(25),
  apellido1Alumno VARCHAR(30),
  apellido2Alumno VARCHAR(30),
  fechaNacimientoAlumno DATE,
  idGeneroAlumno INT(2),
    CONSTRAINT FK_generoAlumno FOREIGN KEY (idGeneroAlumno) REFERENCES genero(id_genero)
);

-- Crear tabla direccion_alumno

CREATE TABLE direccion_alumno(
  id_direccionAlumno INT(10) PRIMARY KEY,
  sector VARCHAR(30),
  calle VARCHAR(25),
  ciudadAlumno VARCHAR(5),
  idAlumno INT,
    CONSTRAINT FK_CiudadAlumno FOREIGN KEY (ciudadAlumno) REFERENCES ciudad(id_ciudad),
    CONSTRAINT FK_AlumnoDireccion FOREIGN KEY (idAlumno) REFERENCES alumno(id_alumno)
);

-- Crear tabla telefono_alumno

CREATE TABLE telefono_alumno(
  id_telefonoAlumno INT PRIMARY KEY,
  numero BIGINT,
  idTipoTelefono TINYINT(1),
  idAlumnoTelefono INT,
    CONSTRAINT FK_tipoTelefono FOREIGN KEY (idTipoTelefono) REFERENCES tipo_telefono(id_tipoTelefono),
    CONSTRAINT FK_alumnoTelefono FOREIGN KEY (alumno) REFERENCES alumno(id_alumno)
);

-- *************** TABLAS PROFESOR *************************

-- Crear tabla departamento

CREATE TABLE departamento(
  id_departamento INT PRIMARY KEY,
  nombreDepartamento VARCHAR(100)
);

-- Crear tabla profesor

CREATE TABLE profesor(
  id_profesor INT PRIMARY KEY,
  nifProfesor VARCHAR(9),
  nombreProfesor VARCHAR(25),
  apellido1Profesor VARCHAR(30),
  apellido2Profesor VARCHAR(30),
  fechaNacimientoProfesor DATE,
  idGeneroProfesor INT(2),
  idDepartamentoProfesor INT,
    CONSTRAINT FK_GeneroProfesor FOREIGN KEY (idGeneroProfesor) REFERENCES genero(id_genero),
    CONSTRAINT FK_DepartamentoProfesor FOREIGN KEY (idDepartamentoProfesor) REFERENCES departamento(id_departamento)
);

-- Crear tabla direccion_profesor

CREATE TABLE direccion_profesor(
  id_direccionProfesor INT PRIMARY KEY,
  sector VARCHAR(30),
  calle VARCHAR(25),
  ciudadProfesor VARCHAR(5),
  idProfesor INT,
    CONSTRAINT FK_CiudadProfesor FOREIGN KEY (ciudadProfesor) REFERENCES ciudad(id_ciudad),
    CONSTRAINT FK_ProfesorDireccion FOREIGN KEY (idProfesor) REFERENCES alumno(id_alumno)
);

-- ****************** TABLAS ASIGNATURAS ************************









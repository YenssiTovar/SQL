USE master
GO
IF DB_ID(N'Docentes') IS NOT NULL
DROP DATABASE Docentes;
GO


CREATE TABLE classroom (
    idclassroom INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    ability INT,
	No_Butacas NVARCHAR(25),
    building NVARCHAR(50),
    location NVARCHAR(100),
	status_classroom bit (1),
	CONSTRAINT PKclassroom PRIMARY KEY(idclassroom)
	)
CREATE TABLE Student (
    idStudent INT PRIMARY KEY,
    lastname NVARCHAR(100),
    fistname NVARCHAR(100),
    birthdate DATE,
    enrollment NVARCHAR(255),
    phone NVARCHAR(15),
	NSS NVARCHAR(25),
	socialsecurity NVARCHAR(50),
	rfc NVARCHAR (50),
	Curp NVARCHAR(50),
   	CONSTRAINT PKStudent PRIMARY KEY(idStudent)
	)
CREATE TABLE Career (
    idCareer INT PRIMARY KEY,
    Nombre NVARCHAR(100),
	description NVARCHAR(255),
    duration INT,
    CONSTRAINT PKCareer PRIMARY KEY(idCareer)
	)
CREATE TABLE teacher (
    idteacher INT PRIMARY KEY,
    last_name NVARCHAR(100),
    carer NVARCHAR(100),
	phone NVARCHAR(25),
	teacher_address NVARCHAR (100),
    FechaContratacion DATE
	CONSTRAINT PKteacher PRIMARY KEY(idteacher)
	)
CREATE TABLE Exam (
    idExam INT PRIMARY KEY,
    Quealification NVARCHAR (20),
    HoraInicio TIME,
	Exam_Type NVARCHAR (25),
	Name_Students NVARCHAR (50),
    CONSTRAINT PKExamen PRIMARY KEY(idExam)
  )
CREATE TABLE Schedule (
    idSchedule INT PRIMARY KEY,
    Hora NVARCHAR(20),
	subjeto NVARCHAR (20),
    ClaseID INT
	CONSTRAINT PKSchedule PRIMARY KEY(idSchedule)
	)
CREATE TABLE Materia (
    idMateria INT PRIMARY KEY,
    Nombre_Asignatura NVARCHAR(100),
    Nombre NVARCHAR(255),
    Creditos INT,
	Clave NVARCHAR (10),
	Carrera NVARCHAR (15),
	Horario_Practicas NVARCHAR (15),
    PlanEstudioID INT
	CONSTRAINT PKMa0teria PRIMARY KEY(idMateria)
    )
CREATE TABLE StudyPlan (
    idStudyPlan INT PRIMARY KEY,
    startdate varchar (10),
	finaldate NVARCHAR (10),
	objective NVARCHAR (100)
    CONSTRAINT PKPStudyPlan PRIMARY KEY(idStudyPlan)
	)
CREATE TABLE Project (
    idProject INT PRIMARY KEY,
	Name_Project NVARCHAR (100),
	Name_students NVARCHAR(100),
	Qualification NVARCHAR (50),
    Descrption NVARCHAR(255),
    MateriaID INT
	CONSTRAINT PKProject PRIMARY KEY(idProject)
	)
CREATE TABLE tasks (
    idtasks INT PRIMARY KEY,
    MateriaID INT,
	Approving NVARCHAR (10),
	Task_Type NVARCHAR (10),
	name_student NVARCHAR (50),
	FechaEntrega DATE,
    Ponderacion INT
	CONSTRAINT PKTarea PRIMARY KEY(idTarea)
	)
CREATE TABLE turn (
    idTurn INT PRIMARY KEY,
    name_salon NVARCHAR(50),
    Descripcion NVARCHAR(255)
	CONSTRAINT PKTurno PRIMARY KEY(idTurno)
	)
CREATE TABLE advisory (
    idadvisory INT PRIMARY KEY,
    Fecha DATE,
	Nombre_Materia NVARCHAR (25),
	unit NVARCHAR (50),
    start_time TIME,
    final_schedule TIME,
    idteacher INT,
    idstudent INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKadvisory PRIMARY KEY(idadvisory)
);
CREATE TABLE Cublicle (
    idCubiculo INT PRIMARY KEY,
    name NVARCHAR(100),
    Building NVARCHAR(50),
	Perido Date,
	Number_Cubicle NVARCHAR (10),
    ability INT,
    CONSTRAINT PKCublicle PRIMARY KEY(idCublicle)
);
CREATE TABLE teacherevaluation (
    idteacherevaluation INT PRIMARY KEY,
    puntuality INT,
	name_teacher NVARCHAR (100),
	Fecha DATE,
    ConocimientoMateria INT,
    MetodosEnsenanza INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKEvaluacion PRIMARY KEY(idEvaluacion)
);
CREATE TABLE Tutor (
    idTutor INT PRIMARY KEY,
    name NVARCHAR(100),
	List_Student NVARCHAR (100),
    Comment NVARCHAR(100),
    Group_ID INT(15),
    CONSTRAINT PKTutor PRIMARY KEY(idTutor)
);
CREATE TABLE University (
    idUniversity INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Director_Name NVARCHAR(255),
	CP NVARCHAR (10),
	Adress NVARCHAR(50),
    Phone NVARCHAR(15),
    CONSTRAINT PKUniversity PRIMARY KEY(idUniversity)
)
CREATE TABLE AsesoriaAlumno (
    idAsesoriaAlumno INT PRIMARY KEY,
    idAsesoria INT,
	Unidad NVARCHAR (15),
	Fecha DATE,
    idAlumno INT,
	CONSTRAINT PKAsesoriaAlumno PRIMARY KEY(idAsesoriaAlumno)
);

--INDEX

-- Índice para la tabla Aula
CREATE INDEX IDX_Aula_IdAula ON Aula (idAula);

-- Índice para la tabla Alumno
CREATE INDEX IDX_Alumno_IdAlumno ON Alumno (idAlumno);

-- Índice para la tabla Carrera
CREATE INDEX IDX_Carrera_IdCarrera ON Carrera (idCarrera);

-- Índice para la tabla Docente
CREATE INDEX IDX_Docente_IdDocente ON Docente (idDocente);

-- Índice para la tabla Examen
CREATE INDEX IDX_Examen_IdExamen ON Examen (idExamen);

-- Índice para la tabla Horario
CREATE INDEX IDX_Horario_IdHorario ON Horario (idHorario);

-- Índice para la tabla Materia
CREATE INDEX IDX_Materia_IdMateria ON Materia (idMateria);

-- Índice para la tabla PlanEstudio
CREATE INDEX IDX_PlanEstudio_IdPlanEstudio ON PlanEstudio (idPlanEstudio);

-- Índice para la tabla Proyectos
CREATE INDEX IDX_Proyecto_IdProyecto ON Proyectos (idProyecto);

-- Índice para la tabla Tareas
CREATE INDEX IDX_Tarea_IdTarea ON Tareas (idTarea);

-- Índice para la tabla Turno
CREATE INDEX IDX_Turno_IdTurno ON Turno (idTurno);

-- Índice para la tabla Asesoria
CREATE INDEX IDX_Asesoria_IdAsesoria ON Asesoria (idAsesoria);

-- Índice para la tabla Cubiculo
CREATE INDEX IDX_Cubiculo_IdCubiculo ON Cubiculo (idCubiculo);

-- Índice para la tabla EvaluacionMaestro
CREATE INDEX IDX_Evaluacion_IdEvaluacion ON EvaluacionMaestro (idEvaluacion);

-- Índice para la tabla Tutor
CREATE INDEX IDX_Tutor_IdTutor ON Tutor (idTutor);

-- Índice para la tabla Universidad
CREATE INDEX IDX_Universidad_IdUniversidad ON Universidad (idUniversidad);


 --Relaciones 
 --nm
ALTER TABLE AsesoriaAlumno
ADD CONSTRAINT FKAsesoriaAlumno_Asesoria
FOREIGN KEY (idAsesoria)
REFERENCES Asesoria(idAsesoria);

ALTER TABLE AsesoriaAlumno
ADD CONSTRAINT FKAsesoriaAlumno_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);
--
--11

ALTER TABLE Kardex
ADD idAlumno INT;


ALTER TABLE Kardex
ADD CONSTRAINT FK_Kardex_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Horario
ADD idAlumno INT;


ALTER TABLE Horario
ADD CONSTRAINT FK_Horario_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Alumno
ADD idUniversidad INT;


ALTER TABLE Alumno
ADD CONSTRAINT FK_Alumno_Universidad
FOREIGN KEY (idUniversidad)
REFERENCES Universidad(idUniversidad);


ALTER TABLE Grupo
ADD idTurno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Turno
FOREIGN KEY (idTurno)
REFERENCES Turno(idTurno);


ALTER TABLE Cubiculo
ADD idDocente INT;


ALTER TABLE Cubiculo
ADD CONSTRAINT FK_Cubiculo_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Materia
ADD idReticula INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Grupo
ADD idReticula INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Reticula
ADD idPlanEstudio INT;


ALTER TABLE Reticula
ADD CONSTRAINT FK_Reticula_PlanEstudio
FOREIGN KEY (idPlanEstudio)
REFERENCES PlanEstudio(idPlanEstudio);


ALTER TABLE PlanEstudio
ADD idCarrera INT;


ALTER TABLE PlanEstudio
ADD CONSTRAINT FK_PlanEstudio_Carrera
FOREIGN KEY (idCarrera)
REFERENCES Carrera(idCarrera);
--

--1n

ALTER TABLE EvaluacionMaestro
ADD idAlumno INT;


ALTER TABLE EvaluacionMaestro
ADD CONSTRAINT FK_EvaluacionMaestro_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Asistencia
ADD idAlumno INT;


ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Aula
ADD idAlumno INT;


ALTER TABLE Aula
ADD CONSTRAINT FK_Aula_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idAlumno INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Proyecto
ADD idAlumno INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Examen
ADD idAlumno INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Grupo
ADD idAlumno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idDocente INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Proyecto
ADD idDocente INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Examen
ADD idDocente INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Docente
ADD UniversidadID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Universidad
FOREIGN KEY (idUniversidad)
REFERENCES Universidad(idUniversidad);


ALTER TABLE Docente
ADD idAlumno INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Docente
ADD TurnoID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Turno
FOREIGN KEY (idTurno)
REFERENCES Turno(idTurno);


ALTER TABLE Docente
ADD MateriaID INT;


ALTER TABLE Docente
ADD CONSTRAINT FK_Docente_Materia
FOREIGN KEY (idMateria)
REFERENCES Materia(idMateria);



ALTER TABLE Materia
ADD GrupoID INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Grupo
FOREIGN KEY (idGrupo)
REFERENCES Grupo(idGrupo);

-------poblar

-- Población de la tabla Aula
INSERT INTO classroom(idclassroom, Nombre, Capacidad, No_Butacas, building, location, status_Aula)
VALUES
(1, 'Aula 101', 50, '30 butacas', 'Edificio A', 'Piso 1', 1),
(2, 'Aula 201', 60, '40 butacas', 'Edificio B', 'Piso 2', 1),
(3, 'Aula 301', 70, '50 butacas', 'Edificio C', 'Piso 3', 1),
(4, 'Aula 401', 80, '60 butacas', 'Edificio D', 'Piso 4', 0);

-- Población de la tabla Alumno
INSERT INTO Alumno (idAlumno, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, NSS, Tipolenguamaterna, Periodo, Curp, Semestre, Genero, Asistencia, Tipo_Sangre, CarreraID, GrupoID)
VALUES
(1, 'Juan', 'Pérez', '1998-03-15', '123 Calle Principal', '555-123-4567', '1234567890', 'Español', '2023A', 'CURP1234567890', '4to Semestre', 'Masculino', 'Regular', 'A+', 1, 1),
(2, 'María', 'González', '1999-05-20', '456 Calle Secundaria', '555-987-6543', '9876543210', 'Español', '2023B', 'CURP9876543210', '3er Semestre', 'Femenino', 'Regular', 'B-', 2, 2),
(3, 'Pedro', 'Ramírez', '1997-07-10', '789 Calle Terciaria', '555-234-5678', '2345678901', 'Español', '2023A', 'CURP2345678901', '5to Semestre', 'Masculino', 'Regular', 'O+', 1, 1),
(4, 'Ana', 'López', '2000-01-05', '101 Calle Cuarta', '555-345-6789', '3456789012', 'Español', '2023B', 'CURP3456789012', '2do Semestre', 'Femenino', 'Regular', 'A-', 2, 2);

-- Población de la tabla Carrera
INSERT INTO Carrera (idCarrera, Nombre, Sementre, Descripcion, Duracion, Titulacion)
VALUES
(1, 'Ingeniería en Informática', 'Semestral', 'Descripción de la carrera de informática', 10, 'Tesis'),
(2, 'Licenciatura en Administración', 'Semestral', 'Descripción de la carrera de administración', 8, 'Tesis');

-- Población de la tabla Docente
INSERT INTO Docente (idDocente, Nombre, Apellido, Email, Tutor, ListaAlumnos, Especialidad, FechaContratacion)
VALUES
(1, 'Ricardo', 'Gómez', 'ricardo@example.com', 'Sí', 'Lista de alumnos', 'Informática', '2020-08-15'),
(2, 'Laura', 'Martínez', 'laura@example.com', 'No', 'Lista de alumnos', 'Administración', '2018-06-10');

-- Población de la tabla Examen
INSERT INTO Examen (idExamen, Calificacion, Fecha, HoraInicio, Tipo_Examen, Nombre_Alumno, DuracionMinutos, AulaID)
VALUES
(1, 'Aprobado', '2023-06-10', '08:00:00', 'Final', 'Juan Pérez', 120, 1),
(2, 'Reprobado', '2023-06-15', '14:00:00', 'Parcial', 'María González', 90, 2),
(3, 'Aprobado', '2023-06-12', '10:00:00', 'Final', 'Pedro Ramírez', 120, 3),
(4, 'Reprobado', '2023-06-20', '16:00:00', 'Parcial', 'Ana López', 90, 4);

-- Población de la tabla Horario
INSERT INTO Horario (idHorario, DiaSemana, Materia, HoraInicio, HoraFin, ClaseID)
VALUES
(1, 'Lunes', 'Matemáticas', '08:00:00', '10:00:00', 1),
(2, 'Martes', 'Historia', '10:00:00', '12:00:00', 2),
(3, 'Miércoles', 'Informática', '14:00:00', '16:00:00', 3),
(4, 'Jueves', 'Economía', '16:00:00', '18:00:00', 4);

-- Población de la tabla Materia
INSERT INTO Materia (idMateria, Nombre_Asignatura, Nombre, Creditos, Clave, Carrera, Horario_Practicas, PlanEstudioID)
VALUES
(1, 'Álgebra', 'Matemáticas', 5, 'MAT101', 'Ingeniería en Informática', 'Viernes 14:00-16:00', 1),
(2, 'Historia Mundial', 'Historia', 4, 'HIS101', 'Licenciatura en Administración', 'Lunes 08:00-10:00', 2),
(3, 'Programación en C', 'Informática', 6, 'INF101', 'Ingeniería en Informática', 'Miércoles 14:00-16:00', 1),
(4, 'Microeconomía', 'Economía', 4, 'ECO101', 'Licenciatura en Administración', 'Jueves 16:00-18:00', 2);

-- Población de la tabla PlanEstudio
INSERT INTO PlanEstudio (idPlanEstudio, CarreraID, Fecha, Descripcion, Nombre, Duracion)
VALUES
(1, 1, '2020', 'Plan de estudios para Ingeniería en Informática', 'Plan 2020', 10),
(2, 2, '2018', 'Plan de estudios para Licenciatura en Administración', 'Plan 2018', 8);

-- Población de la tabla Proyectos
INSERT INTO Proyectos (idProyecto, Nombre_Proyecto, Nombre_Alumno, Calificacion, Descripcion, FechaEntrega, MateriaID)
VALUES
(1, 'Proyecto de Programación', 'Juan Pérez', 'Aprobado', 'Desarrollo de una aplicación web', '2023-05-10', 3),
(2, 'Investigación Histórica', 'María González', 'Reprobado', 'Estudio de un período histórico', '2023-05-15', 2),
(3, 'Aplicación Android', 'Pedro Ramírez', 'Aprobado', 'Desarrollo de una app móvil', '2023-05-12', 3),
(4, 'Análisis Económico', 'Ana López', 'Reprobado', 'Informe de análisis económico', '2023-05-20', 4);

-- Población de la tabla Tareas
INSERT INTO Tareas (idTarea, MateriaID, Aprobatoria, Tipo_Tarea, Nombre_Alumno, Descripcion, FechaEntrega, Ponderacion)
VALUES
(1, 1, 'Sí', 'Programación', 'Juan Pérez', 'Desarrollo de un programa', '2023-05-10', 10),
(2, 2, 'No', 'Investigación', 'María González', 'Investigación histórica', '2023-05-15', 15),
(3, 3, 'Sí', 'Programación', 'Pedro Ramírez', 'Desarrollo de una app', '2023-05-12', 10),
(4, 4, 'No', 'Análisis', 'Ana López', 'Informe económico', '2023-05-20', 15);

-- Población de la tabla Turno
INSERT INTO Turno (idTurno, Nombre, Descripcion)
VALUES
(1, 'Matutino', 'Turno de mañana'),
(2, 'Vespertino', 'Turno de tarde');

-- Población de la tabla Asesoria
INSERT INTO Asesoria (idAsesoria, Fecha, Nombre_Materia, Unidad, HoraInicio, HoraFin, idDocente, idAlumno, Comentarios)
VALUES
(1, '2023-06-10', 'Matemáticas', 'Unidad 1', '08:00:00', '10:00:00', 1, 1, 'Comentarios de asesoría'),
(2, '2023-06-15', 'Historia', 'Unidad 2', '10:00:00', '12:00:00', 2, 2, 'Comentarios de asesoría'),
(3, '2023-06-12', 'Informática', 'Unidad 3', '14:00:00', '16:00:00', 1, 1, 'Comentarios de asesoría'),
(4, '2023-06-20', 'Economía', 'Unidad 1', '16:00:00', '18:00:00', 2, 2, 'Comentarios de asesoría');

-- Población de la tabla Cubiculo
INSERT INTO Cubiculo (idCubiculo, Nombre, Edificio, Periodo, Numero_Cubiculo, Capacidad)
VALUES
(1, 'Cubículo 101', 'Edificio A', '2023-06-10', 'C101', 10),
(2, 'Cubículo 201', 'Edificio B', '2023-06-15', 'C201', 15),
(3, 'Cubículo 301', 'Edificio C', '2023-06-12', 'C301', 20),
(4, 'Cubículo 401', 'Edificio D', '2023-06-20', 'C401', 25);

-- Población de la tabla EvaluacionMaestro
INSERT INTO EvaluacionMaestro (idEvaluacion, Puntualidad, Nombre_Maestro, Fecha, ConocimientoMateria, MetodosEnsenanza, Comentarios)
VALUES
(1, 5, 'Ricardo Gómez', '2023-06-10', 4, 4, 'Buen maestro'),
(2, 4, 'Laura Martínez', '2023-06-15', 3, 3, 'Regular'),
(3, 5, 'Ricardo Gómez', '2023-06-12', 4, 4, 'Muy buen maestro'),
(4, 3, 'Laura Martínez', '2023-06-20', 2, 2, 'Necesita mejorar');

-- Población de la tabla Tutor
INSERT INTO Tutor (idTutor, Nombre, lista_Alumnos, Apellido, Email, Telefono, Especialidad)
VALUES
(1, 'Tutor1', 'Lista de alumnos 1', 'Apellido1', 'tutor1@example.com', '555-123-4567', 'Especialidad 1'),
(2, 'Tutor2', 'Lista de alumnos 2', 'Apellido2', 'tutor2@example.com', '555-234-5678', 'Especialidad 2');

-- Población de la tabla Universidad
INSERT INTO Universidad (idUniversidad, Nombre, Direccion, CP, Nombre_DIrector, Ciudad, Pais, Telefono)
VALUES
(1, 'Universidad A', 'Dirección A', 'CP12345', 'Director A', 'Ciudad A', 'País A', '555-111-2222'),
(2, 'Universidad B', 'Dirección B', 'CP54321', 'Director B', 'Ciudad B', 'País B', '555-333-4444');



-- SELECT para la tabla Aula
SELECT * FROM Aula;

-- SELECT para la tabla Alumno
SELECT * FROM Alumno;

-- SELECT para la tabla Carrera
SELECT * FROM Carrera;

-- SELECT para la tabla Docente
SELECT * FROM Docente;

-- SELECT para la tabla Examen
SELECT * FROM Examen;

-- SELECT para la tabla Horario
SELECT * FROM Horario;

-- SELECT para la tabla Materia
SELECT * FROM Materia;

-- SELECT para la tabla PlanEstudio
SELECT * FROM PlanEstudio;

-- SELECT para la tabla Proyectos
SELECT * FROM Proyectos;

-- SELECT para la tabla Tareas
SELECT * FROM Tareas;

-- SELECT para la tabla Turno
SELECT * FROM Turno;

-- SELECT para la tabla Asesoria
SELECT * FROM Asesoria;

-- SELECT para la tabla Cubiculo
SELECT * FROM Cubiculo;

-- SELECT para la tabla EvaluacionMaestro
SELECT * FROM EvaluacionMaestro;

-- SELECT para la tabla Tutor
SELECT * FROM Tutor;

-- SELECT para la tabla Universidad
SELECT * FROM Universidad;





SELECT * 
FROM Alumno
WHERE CarreraID = (SELECT idCarrera FROM Carrera WHERE Nombre = 'Ingeniería en Informática');




SELECT Docente.*
FROM Docente
INNER JOIN Materia ON Docente.idDocente = Materia.idClase
WHERE Materia.Nombre_Asignatura = 'Algebra';


SELECT Nombre, Apellido, AVG(Calificacion) AS PromedioCalificaciones
FROM Examen
WHERE Nombre_Alumno = 'Juan Perez'
GROUP BY Nombre, Apellido;


SELECT Horario.*
FROM Horario
INNER JOIN Alumno ON Horario.idClase = Alumno.idGrupo
WHERE Alumno.Nombre = 'Juan';


SELECT Materia.*
FROM Materia
INNER JOIN PlanEstudio ON Materia.idPlanEstudio = PlanEstudio.idPlanEstudio
WHERE PlanEstudio.Nombre = 'Plan 2018';



SELECT Examen.*
FROM Examen
INNER JOIN Materia ON Examen.idMateria = Materia.idMateria
WHERE Materia.Nombre_Asignatura = 'Matematicas';




SELECT Docente.*
FROM Docente
INNER JOIN Universidad ON Docente.idUniversidad = Universidad.idUniversidad
WHERE Universidad.Nombre = 'Universidad A';





ALTER TABLE Cubiculo
ADD idDocente INT;

ALTER TABLE Cubiculo
ADD CONSTRAINT FK_Cubiculo_Docente
FOREIGN KEY (idDocente)
REFERENCES Docente(idDocente);


ALTER TABLE Materia
ADD idReticula INT;


ALTER TABLE Materia
ADD CONSTRAINT FK_Materia_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Grupo
ADD idReticula INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Reticula
FOREIGN KEY (idReticula)
REFERENCES Reticula(idReticula);


ALTER TABLE Reticula
ADD idPlanEstudio INT;


ALTER TABLE Reticula
ADD CONSTRAINT FK_Reticula_PlanEstudio
FOREIGN KEY (idPlanEstudio)
REFERENCES PlanEstudio(idPlanEstudio);


ALTER TABLE PlanEstudio
ADD idCarrera INT;


ALTER TABLE PlanEstudio
ADD CONSTRAINT FK_PlanEstudio_Carrera
FOREIGN KEY (idCarrera)
REFERENCES Carrera(idCarrera);
--

--1n

ALTER TABLE EvaluacionMaestro
ADD idAlumno INT;


ALTER TABLE EvaluacionMaestro
ADD CONSTRAINT FK_EvaluacionMaestro_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Asistencia
ADD idAlumno INT;


ALTER TABLE Asistencia
ADD CONSTRAINT FK_Asistencia_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Aula
ADD idAlumno INT;


ALTER TABLE Aula
ADD CONSTRAINT FK_Aula_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idAlumno INT;


ALTER TABLE Tarea
ADD CONSTRAINT FK_Tarea_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Proyecto
ADD idAlumno INT;


ALTER TABLE Proyecto
ADD CONSTRAINT FK_Proyecto_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Examen
ADD idAlumno INT;


ALTER TABLE Examen
ADD CONSTRAINT FK_Examen_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Grupo
ADD idAlumno INT;


ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_Alumno
FOREIGN KEY (idAlumno)
REFERENCES Alumno(idAlumno);


ALTER TABLE Tarea
ADD idDocente INT;



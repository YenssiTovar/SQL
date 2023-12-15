USE master
GO
IF DB_ID(N'Docentes') IS NOT NULL
DROP DATABASE Docentes;
GO


CREATE TABLE Aula (
    idAula INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Capacidad INT,
	No_Butacas NVARCHAR(25),
    Edificio NVARCHAR(50),
    Ubicacion NVARCHAR(100),
	status_Aula bit (1),
	CONSTRAINT PKAula PRIMARY KEY(idAula)
	)
CREATE TABLE Alumno (
    idAlumno INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    FechaNacimiento DATE,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15),
	NSS NVARCHAR(25),
	Tipolenguamaterna NVARCHAR(50),
	Periodo NVARCHAR (50),
	Curp NVARCHAR(50),
    Semestre NVARCHAR(50),
	Genero NVARCHAR(10),
    Asistencia NVARCHAR(50),
	Tipo_Sangre NVARCHAR(10),
    CarreraID INT,
    GrupoID INT,
	CONSTRAINT PKAlumno PRIMARY KEY(idAlumno)
	)
CREATE TABLE Carrera (
    idCarrera INT PRIMARY KEY,
    Nombre NVARCHAR(100),
	Sementre NVARCHAR(10),
    Descripcion NVARCHAR(255),
    Duracion INT,
    Titulacion NVARCHAR(50),
	CONSTRAINT PKCarrera PRIMARY KEY(idCarrera)
	)
CREATE TABLE Docente (
    idDocente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Email NVARCHAR(100),
	Tutor NVARCHAR(25),
	ListaAlumnos NVARCHAR (100),
    Especialidad NVARCHAR(100),
    FechaContratacion DATE
	CONSTRAINT PKDocente PRIMARY KEY(idDocente)
	)
CREATE TABLE Examen (
    idExamen INT PRIMARY KEY,
    Calificacion NVARCHAR (20),
    Fecha DATE,
    HoraInicio TIME,
	Tipo_Examen NVARCHAR (25),
	Nombre_Alumno NVARCHAR (50),
    DuracionMinutos INT,
    AulaID INT
	CONSTRAINT PKExamen PRIMARY KEY(idExamen)
  )
CREATE TABLE Horario (
    idHorario INT PRIMARY KEY,
    DiaSemana NVARCHAR(20),
	Materia NVARCHAR (20),
    HoraInicio TIME,
    HoraFin TIME,
    ClaseID INT
	CONSTRAINT PKHorario PRIMARY KEY(idHorario)
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
CREATE TABLE PlanEstudio (
    idPlanEstudio INT PRIMARY KEY,
    CarreraID INT,
	Fecha NVARCHAR (10),
	Descripcion NVARCHAR (100),
    Nombre NVARCHAR(100),
    Duracion INT
	CONSTRAINT PKPlanEstudio PRIMARY KEY(idPlanEstudio)
	)
CREATE TABLE Proyectos (
    idProyecto INT PRIMARY KEY,
	Nombre_Proyecto NVARCHAR (100),
	Nombre_Alumno NVARCHAR(100),
	Calificacion NVARCHAR (50),
    Descripcion NVARCHAR(255),
    FechaEntrega DATE,
    MateriaID INT
	CONSTRAINT PKProyecto PRIMARY KEY(idProyecto)
	)
CREATE TABLE Tareas (
    idTarea INT PRIMARY KEY,
    MateriaID INT,
	Aprobatoria NVARCHAR (10),
	Tipo_Tarea NVARCHAR (10),
	Nombre_Alumno NVARCHAR (50),
	Descripcion NVARCHAR(255),
    FechaEntrega DATE,
    Ponderacion INT
	CONSTRAINT PKTarea PRIMARY KEY(idTarea)
	)
CREATE TABLE Turno (
    idTurno INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Descripcion NVARCHAR(255)
	CONSTRAINT PKTurno PRIMARY KEY(idTurno)
	)
CREATE TABLE Asesoria (
    idAsesoria INT PRIMARY KEY,
    Fecha DATE,
	Nombre_Materia NVARCHAR (25),
	Unidad NVARCHAR (50),
    HoraInicio TIME,
    HoraFin TIME,
    idDocente INT,
    idAlumno INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKAsesoria PRIMARY KEY(idAsesoria)
);
CREATE TABLE Cubiculo (
    idCubiculo INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Edificio NVARCHAR(50),
	Periodo Date,
	Numero_Cubiculo NVARCHAR (10),
    Capacidad INT,
    CONSTRAINT PKCubiculo PRIMARY KEY(idCubiculo)
);
CREATE TABLE EvaluacionMaestro (
    idEvaluacion INT PRIMARY KEY,
    Puntualidad INT,
	Nombre_Maestro NVARCHAR (100),
	Fecha DATE,
    ConocimientoMateria INT,
    MetodosEnsenanza INT,
    Comentarios NVARCHAR(500),
    CONSTRAINT PKEvaluacion PRIMARY KEY(idEvaluacion)
);
CREATE TABLE Tutor (
    idTutor INT PRIMARY KEY,
    Nombre NVARCHAR(100),
	lista_Alumnos NVARCHAR (100),
    Apellido NVARCHAR(100),
    Email NVARCHAR(100),
    Telefono NVARCHAR(15),
    Especialidad NVARCHAR(100),
    CONSTRAINT PKTutor PRIMARY KEY(idTutor)
);
CREATE TABLE Universidad (
    idUniversidad INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
	CP NVARCHAR (10),
	Nombre_DIrector NVARCHAR (50),
    Ciudad NVARCHAR(50),
    Pais NVARCHAR(50),
    Telefono NVARCHAR(15),
    CONSTRAINT PKUniversidad PRIMARY KEY(idUniversidad)
)
CREATE TABLE AsesoriaAlumno (
    idAsesoriaAlumno INT PRIMARY KEY,
    idAsesoria INT,
	Unidad NVARCHAR (15),
	Fecha DATE,
    idAlumno INT,
	CONSTRAINT PKAsesoriaAlumno PRIMARY KEY(idAsesoriaAlumno)
);

CREATE TABLE [User]
(   
	 idUser int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 [password] varchar(50) NOT NULL,
	 email  varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 CONSTRAINT PK_User PRIMARY KEY (idUser)
);

CREATE TABLE Career (
idCareer int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
duration varchar(20) NOT NULL,
[description] varchar(20) NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Career Primary KEY(idCareer)
);

CREATE TABLE ActivityType (
idActivityType int IDENTITY(1,1),
[description] varchar(100) NOT NULL,
activityname varchar(100) NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_ActivityType Primary KEY(idActivityType)
);

CREATE TABLE EvaluationDetail (
idEvaluationDetail int IDENTITY(1,1),
assessment varchar(50) NOT NULL,
criterion varchar(100) NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_EvaluationDetail Primary KEY(idEvaluationDetail)
);
CREATE TABLE ActivityDetail (
idActivityDetail int IDENTITY(1,1),
activitydetailsdescription varchar(100) NOT NULL,
idEvaluationDetail int NULL,
idComplementaryActivity int NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_ActivityDetail Primary KEY(idActivityDetail)
);

CREATE TABLE Objective (    
 idObjective int IDENTITY (1,1), 
 objetivename varchar(50) NOT NULL, 
 status bit NOT NULL DEFAULT 1, 
 idUserCreate int NULL,
 dateCreate date NULL,
 idUserModified int NULL,
 dateModified date NULL
 CONSTRAINT PK_Objective PRIMARY KEY (idObjective)
); 

CREATE TABLE TypePosition (    
 idTypePosition int IDENTITY (1,1), 
 [level] varchar(50) NOT NULL, 
  typepositionname varchar(50) NOT NULL,  
 [status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
 CONSTRAINT PK_TypePosition PRIMARY KEY (idTypePosition) 
); 

CREATE TABLE Proof(
idProof int IDENTITY (1,1), 
[date] date NOT NULL,
reason varchar(50) NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
  CONSTRAINT PK_Proof PRIMARY KEY (idProof)
); 

CREATE TABLE Purpose
(   
	 idPurpose int IDENTITY (1,1),
	investigation varchar(50) NOT NULL,
	purposename varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 idUserCreate int NULL,
    dateCreate date NULL,
    idUserModified int NULL,
     dateModified date NULL
	 CONSTRAINT PK_Purpose PRIMARY KEY (idPurpose)
);
CREATE TABLE Sector 
(  
idSector int IDENTITY (1,1), 
sectorname varchar(30) NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Sector PRIMARY KEY (idSector) 
); 
CREATE TABLE [Subject]
(   
	 idSubject int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 credit varchar(30) NOT NULL,
	 unit varchar(50) NOT NULL,
	 characteristic varchar(50) NOT NULL,
	 keyMatter varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 idUserCreate int NULL,
     dateCreate date NULL,
     idUserModified int NULL,
     dateModified date NULL
	 CONSTRAINT PK_Subject PRIMARY KEY (idSubject)
);
CREATE TABLE Territory
(   
	 idTerritory int IDENTITY (1,1),
	 territoryname varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 idUserCreate int NULL,
     dateCreate date NULL,
     idUserModified int NULL,
     dateModified date NULL
	 CONSTRAINT PK_Territory PRIMARY KEY (idTerritory)
);

CREATE TABLE [Zone] (
idZone int IDENTITY (1,1) ,
zonename varchar(30)NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_Zone Primary KEY(idZone) 
);
--------------------------------------
CREATE TABLE Company (
idCompany int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
email varchar(50) NOT NULL,
phone char(10) NOT NULL,
[address] varchar(50) NOT NULL,
identificationNumber varchar(50) NOT NULL,
idSector int NOT NULL,---Sector
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Company Primary KEY(idCompany)
);

CREATE TABLE Employee (
idEmployee int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
lastname varchar (50) NOT NULL,
[mothersLastName] varchar(50)NOT NULL,
gender varchar(50) NOT NULL,
phone char(10) NOT NULL,
email varchar(50) NOT NULL,
[address] varchar(100)NOT NULL, 
socialSecurity char(11)NOT NULL,
dateOfHire date NOT NULL,
idSubject int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Employee Primary KEY(idEmployee)
);



 CREATE TABLE Student
(   
	 idStudent int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 lastName varchar(50) NOT NULL,
	 mothersthestName varchar(50) NOT NULL,
	 enrollment varchar(50) NOT NULL,
	 birthdate date NOT NULL,
	 curp char (18 )NOT NULL,
	 phone char (10 )NOT NULL,
	 rfc char (13 )NOT NULL,
	 socialSegurity char (11) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 IdUserCreate int null,
	 creationdate date NULL,
	 IdUserModify int null,
	 modified date null
	 CONSTRAINT PK_Student PRIMARY KEY (idStudent)
);

Create table Visit 
(
idVisit int IDENTITY (1,1) ,
numberofstudent int NOT NULL, 
duration varchar(50) NOT NULL, 
objetive varchar(100)NOT NULL ,
aplicacion date NOT NULL, 
datevisit date NOT NULL,
requiretransportation varchar(10) NOT NULL ,
result varchar(150)NOT NULL ,
idCompany int NOT NULL ,
idZone int NOT NULL,
idEmployee int NOT NULL,
idStudent int NOT NULL,
status bit NOT NULL DEFAULT 1 ,
idUsercreate int NOT NULL ,
datecreate date NOT NULL,
idusermodified int NOT NULL ,
datemodified date NOT NULL ,
CONSTRAINT PK_Visit Primary KEY(idVisit) 
);


 CREATE TABLE ComplementaryActivity 
(    
 idComplementaryActivity int IDENTITY (1,1), 
 activityname varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idStudent int NOT NULL, 
 idActivityType int NOT NULL,--student-------------
 idusercreate int NULL, 
 datecreate date NULL, 
 idusermodified int NULL, 
 datemodified date NULL 
 CONSTRAINT PK_ComplementaryActivity PRIMARY KEY (idComplementaryActivity) 
 );

 CREATE TABLE Agreement (
idAgreement int IDENTITY  (1,1),
acronym varchar(50) NOT NULL,
objetive varchar(25)NOT NULL,
idObjetive int NOT NULL,---Objetive
idTerritory int NOT NULL,---Territory
statusAgreement varchar(50) NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Agreement Primary KEY(idAgreement)
);

CREATE TABLE Empreneur(
idEmpreneur int IDENTITY(1,1),
request varchar(50) NOT NULL,
objetive varchar(50) NOT NULL,
codeOfEmpreneur varchar(50) NOT NULL,
workteam varchar(50)NOT NULL,
startdate date NOT NULL,
finaldate date NOT NULL,
duration varchar(50) NOT NULL,
idEmployee int NOT NULL,
idStudent int NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Empreneur Primary KEY(idEmpreneur)
);


CREATE TABLE Viatic
(    
	 idViatic int IDENTITY (1,1),
	 place varchar(200) NOT NULL,
	 description1 varchar(250) NOT NULL,
	 amount decimal (10,2) NOT NULL,
	 idEmployee int NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 IdUserCreate int null,
	 creationdate date NULL,
	 IdUserModify int null,
	 modified date null
	 CONSTRAINT PK_Viatic PRIMARY KEY (idViatic)
);


CREATE TABLE CompanyStudent (
IdCompanyStudent int IDENTITY(1,1),
[date] Date NULL,
workplace varchar(50) NOT NULL,
idStudent int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_CompanyStudent Primary KEY(idCompanyStudent)
);



CREATE TABLE OfficeRequestcommission 
(    
 idOfficeRequestcommission int IDENTITY (1,1), 
 addressee varchar(50) NOT NULL, 
 header varchar(50) NOT NULL, 
 afftair varchar(150) NOT NULL, 
 date1 date NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idEmploye int NOT NULL, 
 IdUserCreate int null, 
 creationdate date NULL, 
 IdUserModify int null, 
 modified date null 
 CONSTRAINT PK_OfficeRequestcommission PRIMARY KEY (idOfficeRequestcommission) 
); 

CREATE TABLE Position 
(    
 idPosition int IDENTITY (1,1), 
 jobDescription varchar(50) NOT NULL, 
 wage varchar(50) NOT NULL, 
 workingHours varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idTypePosition int NOT NULL, 
 IdUserCreate int null, 
 creationdate date NULL, 
 IdUserModify int null, 
 modified date null 
 CONSTRAINT PK_Position PRIMARY KEY (idPosition) 
); 
 CREATE TABLE StudyPlan 
(    
   idStudyPlan int IDENTITY (1,1), 
   objetive varchar(50) NOT NULL, 
   starDate date NOT NULL, 
   finalDate date NOT NULL, 
   key1 varchar(50) NOT NULL, 
   [status] bit NOT NULL DEFAULT 1, 
   idCareer int NOT NUll, 
   IdUserCreate int NULL, 
   creationdate date NULL, 
   IdUserModify int NULL, 
   modified date NULL 
   CONSTRAINT PK_StudyPlan PRIMARY KEY (idStudyPlan) 
); 


CREATE TABLE ComplementaryActivityCompany 
(
idComplementaryActivityCompany int IDENTITY (1,1),
idComplementaryActivity int NOT NULL,
IdCompany int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL,
datecreate date NULL,
idusermodified int NULL, 
datemodified date NULL
CONSTRAINT PK_ComplementaryActivityCompany Primary KEY(idComplementaryActivityCompany) 
);

CREATE TABLE AgreementCompany 
(
idAgreementCompany int IDENTITY (1,1),
idAgreement int NOT NULL, 
IdCompany int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_AgreementCompany Primary KEY(idAgreementCompany) 
);

CREATE TABLE AgreementPurpose
(
idAgreementPurpose int IDENTITY (1,1),
idAgreement int NOT NULL, 
IdPurpose int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_AgreementPurpose Primary KEY(idAgreementPurpose) 
);

CREATE TABLE EmployeePosition 
(    
idEmployeePosition int IDENTITY (1,1), 
IdEmployee int NOT NULL, 
IdPosition int NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idusercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_EmployeePosition PRIMARY KEY (idEmployeePosition) 
); 

CREATE TABLE SubjectStudyPlan 
(    
idSubjectStudyPlan int IDENTITY (1,1), 
IdSubject int NOT NULL, 
IdStudyPlan int NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idusercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_SubjectStudyPlan PRIMARY KEY (idSubjectStudyPlan) 
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
---------------------Index----------------
CREATE INDEX IX_ActivityDetail ON ActivityDetail(idActivityDetail)
CREATE INDEX IX_ActivityType ON ActivityType(idActivityType)
CREATE INDEX IX_Agreement ON Agreement(idAgreement)
CREATE INDEX IX_ComplementaryActivity ON ComplementaryActivity(idComplementaryActivity)
CREATE INDEX IX_Career ON Career(idCareer)
CREATE INDEX IX_Company ON Company(idCompany)
CREATE INDEX IX_CompanyStudent ON CompanyStudent(idCompanyStudent)
CREATE INDEX IX_Employee ON Employee(idEmployee)
CREATE INDEX IX_Entrepreneur ON Empreneur(idEmpreneur)
CREATE INDEX IX_EvaluationDetail ON EvaluationDetail(idEvaluationDetail )
CREATE INDEX IX_Objective ON Objective(idObjective)
CREATE INDEX IX_OfficeRequestcommission ON OfficeRequestcommission(idOfficeRequestcommission)
CREATE INDEX IX_Position ON Position(idPosition)
CREATE INDEX IX_TypePosition ON TypePosition(idTypePosition)
CREATE INDEX IX_Proof ON Proof (idProof)
CREATE INDEX IX_Purpose ON Purpose(idPurpose)
CREATE INDEX IX_Sector ON Sector(idSector)
CREATE INDEX IX_Student ON Student  (idStudent )
CREATE INDEX IX_StudyPlan ON StudyPlan(idStudyPlan)
CREATE INDEX IX_Subject ON Subject(idSubject)
CREATE INDEX IX_Territory ON Territory(idTerritory)
CREATE INDEX IX_User ON [User](idUser)
CREATE INDEX IX_Viatic ON Viatic(idViatic)
CREATE INDEX IX_Visit ON Visit(idVisit)
CREATE INDEX IX_Zone ON Zone (idZone)
CREATE INDEX IX_ComplementaryActivityCompany ON ComplementaryActivityCompany(idComplementaryActivityCompany)
CREATE INDEX IX_AgreementCompany ON AgreementCompany(idAgreementCompany)
CREATE INDEX IX_AgreementPurpose ON AgreementPurpose(idAgreementPurpose)
CREATE INDEX IX_EmployePosition ON EmployeePosition(idEmployeePosition)
CREATE INDEX IX_SubjectStudyPlan ON SubjectStudyPlan(idSubjectStudyPlan)

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


ALTER TABLE Career
ADD CONSTRAINT FK_UserCreateCareer FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Career
ADD CONSTRAINT FK_UserModifiedCareer FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)
------
ALTER TABLE ActivityType
ADD CONSTRAINT FK_UserCreateActivityType FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE ActivityType
ADD CONSTRAINT FK_UserModifiedActivityType FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE EvaluationDetail 
ADD CONSTRAINT FK_UserCreateEvaluationDetail FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE EvaluationDetail
ADD CONSTRAINT FK_UserModifiedEvaluationDetail FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE ActivityDetail 
ADD CONSTRAINT FK_UserCreateActivityDetail FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE ActivityDetail
ADD CONSTRAINT FK_UserModifiedActivityDetail FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Objective
ADD CONSTRAINT FK_UserCreateObjective FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Objective
ADD CONSTRAINT FK_UserModifiedObjective FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE TypePosition
ADD CONSTRAINT FK_UserCreateTypePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE TypePosition
ADD CONSTRAINT FK_UserModifiedTypePosition FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE ComplementaryActivity
ADD CONSTRAINT FK_UserCreateComplementaryActivity FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE ComplementaryActivity
ADD CONSTRAINT FK_UserModifiedComplementaryActivity FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Student
ADD CONSTRAINT FK_UserCreateStudent FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Student
ADD CONSTRAINT FK_UserModifiedStudent FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserCreateAgreement FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserModifiedAgreement FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Employee
ADD CONSTRAINT FK_UserCreateEmployee FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Employee
ADD CONSTRAINT FK_UserModifiedEmployee FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Empreneur
ADD CONSTRAINT FK_UserCreateEmpreneur FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Empreneur
ADD CONSTRAINT FK_UserModifiedEmpreneur FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Company
ADD CONSTRAINT FK_UserCreateCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Company
ADD CONSTRAINT FK_UserModifiedCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE CompanyStudent
ADD CONSTRAINT FK_UserCreateCompanyStudent FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE CompanyStudent
ADD CONSTRAINT FK_UserModifiedCompanyStudent FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Proof
ADD CONSTRAINT FK_UserCreateProof FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Proof
ADD CONSTRAINT FK_UserModifiedProof FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE [Subject]
ADD CONSTRAINT FK_UserCreateSubject FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE [Subject]
ADD CONSTRAINT FK_UserModifiedSubject FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE OfficeRequestcommission
ADD CONSTRAINT FK_UserCreateOfficeRequestcommission FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE OfficeRequestcommission
ADD CONSTRAINT FK_UserModifiedOfficeRequestcommission FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserCreateStudyPlan FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserModifiedStudyPlan FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Purpose
ADD CONSTRAINT FK_UserCreatePurpose FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Purpose
ADD CONSTRAINT FK_UserModifiedPurpose FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Position
ADD CONSTRAINT FK_UserCreatePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Position
ADD CONSTRAINT FK_UserModifiedPosition FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Sector
ADD CONSTRAINT FK_UserCreateSector FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Sector
ADD CONSTRAINT FK_UserModifiedSector FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Territory
ADD CONSTRAINT FK_UserCreateTerritory FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Territory
ADD CONSTRAINT FK_UserModifiedTerritory FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserCreateViatic FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserModifiedViatic FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Visit
ADD CONSTRAINT FK_UserCreateVisit FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Visit
ADD CONSTRAINT FK_UserModifiedVisit FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserCreateZone FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserModifiedZone FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE ComplementaryActivityCompany
ADD CONSTRAINT FK_UserCreateComplementaryActivityCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE ComplementaryActivityCompany
ADD CONSTRAINT FK_UserModifiedComplementaryActivityCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_UserCreateAgreementCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_UserModifiedAgreementCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_UserCreateAgreementPurpose FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_UserModifiedAgreementPurpose FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_UserCreateEmployeePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_UserModifiedEmployeePosition FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_UserCreateSubjectStudyPlan FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_UserModifiedSubjectStudyPlan FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)
-------------------------------------------------------
ALTER TABLE ComplementaryActivity--- bien
ADD CONSTRAINT FK_ComplementaryActivityStudent FOREIGN KEY (idStudent)
REFERENCES Student(idStudent)

ALTER TABLE ComplementaryActivity--- bien
ADD CONSTRAINT FK_ComplementaryActivityActivityType FOREIGN KEY (idActivityType)
REFERENCES ActivityType(idActivityType)


ALTER TABLE Agreement---bien
ADD CONSTRAINT FK_AgreementObjective FOREIGN KEY (idObjetive)
REFERENCES Objective (idObjective)

ALTER TABLE Agreement---bien
ADD CONSTRAINT FK_AgreementTerritory FOREIGN KEY (idTerritory)
REFERENCES Territory (idTerritory)

ALTER TABLE Employee---bien
ADD CONSTRAINT FK_AgreementSubject FOREIGN KEY (idSubject)
REFERENCES Subject (idSubject)

ALTER TABLE ActivityDetail---bien
ADD CONSTRAINT FK_ActivityDetailEvaluationDetail FOREIGN KEY (idEvaluationDetail)
REFERENCES EvaluationDetail (idEvaluationDetail)


ALTER TABLE ActivityDetail---bien
ADD CONSTRAINT FK_ActivityDetailComplementaryActivity FOREIGN KEY (idComplementaryActivity)
REFERENCES ComplementaryActivity (idComplementaryActivity)

ALTER TABLE Empreneur---bien
ADD CONSTRAINT FK_EmpreneurStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)

ALTER TABLE Empreneur---bien
ADD CONSTRAINT FK_EmpreneurEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE Company---bien
ADD CONSTRAINT FK_CompanySector FOREIGN KEY (idSector)
REFERENCES Sector  (idSector)

ALTER TABLE CompanyStudent---bien
ADD CONSTRAINT FK_CompanyStudentStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)

ALTER TABLE OfficeRequestcommission---bien
ADD CONSTRAINT FK_OfficeRequestcommissionEmployee FOREIGN KEY (idEmploye)
REFERENCES Employee (idEmployee)

ALTER TABLE StudyPlan---bien
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (idCareer)
REFERENCES Career (idCareer)

ALTER TABLE Position---bien
ADD CONSTRAINT FK_PositionTypePosition FOREIGN KEY (idTypePosition)
REFERENCES TypePosition (idTypePosition)

ALTER TABLE Viatic---bien
ADD CONSTRAINT FK_ViaticEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)


ALTER TABLE Visit---bien
ADD CONSTRAINT FK_VisitCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE Visit---bien
ADD CONSTRAINT FK_VisitZone FOREIGN KEY (idZone)
REFERENCES Zone (idZone)

ALTER TABLE Visit---bien
ADD CONSTRAINT FK_VisitEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE Visit---bien
ADD CONSTRAINT FK_VisitStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)

ALTER TABLE ComplementaryActivityCompany---
ADD CONSTRAINT FK_ActivityCompanyActivity FOREIGN KEY (idComplementaryActivity)
REFERENCES ComplementaryActivity (idComplementaryActivity)

ALTER TABLE ComplementaryActivityCompany
ADD CONSTRAINT FK_ActivityCompanyCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_AgreementCompanyAgreement FOREIGN KEY (idAgreement)
REFERENCES Agreement (idAgreement)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_AgreementCompanyCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_AgreementPurposePurpose FOREIGN KEY (idPurpose)
REFERENCES Purpose (idPurpose)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_AgreementPurposeAgreement FOREIGN KEY (idAgreement)
REFERENCES Agreement (idAgreement)


ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionPosition FOREIGN KEY (idPosition)
REFERENCES Position (idPosition)



ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_SubjectStudyPlanSubject FOREIGN KEY (idSubject)
REFERENCES Subject (idSubject)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_SubjectStudyPlanStudyPlan FOREIGN KEY (idStudyPlan)
REFERENCES StudyPlan (idStudyPlan)



-------poblar

-- Población de la tabla Aula
INSERT INTO Aula (idAula, Nombre, Capacidad, No_Butacas, Edificio, Ubicacion, status_Aula)
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

INSERT INTO [User] ([name],[password], email)
VALUES ('Alberto', '1234','A_Salazar@gmail.com');

INSERT INTO Career([name],duration,[description],idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('Informatica', '4 años 9 meses','Programacion',1,GETDATE(),1,GETDATE()),
      ('Mecanica', '4 años 9 meses','Automotriz',1,GETDATE(),1,GETDATE()),
	  ('Gestion Empresarial', '4 años 9 meses','Gestiona',1,GETDATE(),1,GETDATE()),
	  ('Electronica', '4 años 9 meses','Gestiona',1,GETDATE(),1,GETDATE()),
	  ('Energias Renovables', '4 años 9 meses','Medio ambiente',1,GETDATE(),1,GETDATE()),
	  ('Industrial', '4 años 9 meses','Industria',1,GETDATE(),1,GETDATE());

INSERT INTO Objective (objetivename,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('specific',1,GETDATE(),1,GETDATE()),
		('general',1,GETDATE(),1,GETDATE());
		

INSERT INTO TypePosition([level],typepositionname,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('intermedio', 'technicalAnalyst',1,GETDATE(),1,GETDATE()),
      ('intermedio', 'teacher',1,GETDATE(),1,GETDATE()),
	  ('intermedio', 'divisionChief',1,GETDATE(),1,GETDATE()),
	  ('intermedio', 'holderofthetransparencyUnit',1,GETDATE(),1,GETDATE()),
	    ('intermedio', 'headofDepartment',1,GETDATE(),1,GETDATE());

INSERT INTO  Proof([date],reason,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('2023-01-23','Visita a denso',1,GETDATE(),1,GETDATE()),
        ('2023-01-23','Visita a ahmsa',1,GETDATE(),1,GETDATE()),
		('2023-01-23','Visita a metro rey',1,GETDATE(),1,GETDATE()),
		('2023-01-23','Visita a wittur',1,GETDATE(),1,GETDATE()),
		('2023-01-23','Visita a ferromex',1,GETDATE(),1,GETDATE());

INSERT INTO  Purpose(investigation,purposename,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('investigation','investigation',1,GETDATE(),1,GETDATE()),
        ('practice','practice',1,GETDATE(),1,GETDATE()),
		('resindence','resindence',1,GETDATE(),1,GETDATE()),
		('socialService','socialService',1,GETDATE(),1,GETDATE()),
		('external','external',1,GETDATE(),1,GETDATE());

INSERT INTO  Sector(sectorname,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('public',1,GETDATE(),1,GETDATE()),
        ('private',1,GETDATE(),1,GETDATE()),
		('service',1,GETDATE(),1,GETDATE()),
		('social',1,GETDATE(),1,GETDATE()),
			('productive',1,GETDATE(),1,GETDATE()),
		('educative',1,GETDATE(),1,GETDATE());

INSERT INTO [Subject]([name],credit,unit,characteristic,keyMatter,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('ingles','100','1','Actividad 1','0923',1,GETDATE(),1,GETDATE()),
       ('ingles','100','2','Actividad 2','0923',1,GETDATE(),1,GETDATE()),
	   ('ingles','100','3','Actividad 3','0923',1,GETDATE(),1,GETDATE()),
	   ('ingles','100','4','Actividad 4','0923',1,GETDATE(),1,GETDATE()),
	   ('ingles','100','5','Actividad 5','0923',1,GETDATE(),1,GETDATE());

INSERT INTO Territory(territoryname,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('nacional',1,GETDATE(),1,GETDATE()),
        ('internacional',1,GETDATE(),1,GETDATE());
	

INSERT INTO [Zone](zonename,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('regional',1,GETDATE(),1,GETDATE()),
      ('local',1,GETDATE(),1,GETDATE()),
	  ('national',1,GETDATE(),1,GETDATE());
	 

INSERt INTO Company([name],email,phone,[address],identificationNumber,idSector,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('Altos hornos de mexico','hornos@gmail.com','8661652344','kenedy 122 monclova','2023',1,1,GETDATE(),1,GETDATE()),
      ('Denso','denso@gmail.com','8661302344','de los hornos cd frontera','2023',2,1,GETDATE(),1,GETDATE()),
	  ('Ferromex','ferromex@gmail.com','8661623445','Americana cd frontera','2023',3,1,GETDATE(),1,GETDATE()),
	  ('Coahuila Durango','coahuiladurango@gmail.com','8662002344','porfirio diaz cd frontera','2023',4,1,GETDATE(),1,GETDATE()),
	  ('Aptiv','aptiv@gmail.com','8661702344','lib carlos salinas de gortari','2023',5,1,GETDATE(),1,GETDATE())

INSERT INTO Employee([name],lastname,[mothersLastName]	,gender,phone,email,[address],socialSecurity,dateOfHire,idSubject,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('Luis Alfonso','Rodriguez','Perez','Hombre','8662567822','luis@gmail.com','Ayuntamiento 212 Occidental','44180032044','2023-01-23',1,1,GETDATE(),1,GETDATE()),
       ('Alberto','Salazar','Zuñiga','Hombre','8662347822','alberto@gmail.com','Ignacio allende 313 La sierrita','44180032042','2023-02-12',2,1,GETDATE(),1,GETDATE()),
	   ('Antonio','Rodriguez','Tovar','Hombre','8661227822','antonio@gmail.com','Jalisco nte 1700 Monclova','44180032043','2023-02-10',3,1,GETDATE(),1,GETDATE()),
	   ('Gabriela','Mendoza','Aguilar','Mujer','8662137822','gabriela@gmail.com','C. Monaco 1010 Monclova','44180032044','2023-04-11',4,1,GETDATE(),1,GETDATE()),
	   ('Patricia','Hernendez','Mata','Mujer','8665437822','patricia@gmail.com','C. Zaragoza 227 Frontera','44180032045','2023-07-25',5,1,GETDATE(),1,GETDATE());

INSERT INTO Student ([name],lastname,mothersthestName,enrollment,birthdate,curp,phone,rfc,socialSegurity,idUsercreate,creationdate,IdUserModify,modified)
VALUES ('Nallely','Toledo','Alonso','I15171917','1996-06-09','TOASMNL000NLLN9654','8667882323','TOASMNL000NLL','44180032043',1,GETDATE(),1,GETDATE()),
       ('Alberto','Salazar','Zuñiga','I18050517','2000-04-08','SAZA000408HCLLXLA6','8661222321','SAZA000408K61','44180032089',1,GETDATE(),1,GETDATE()),
	   ('Antonio','Perez','Gaitan','I23050517','2003-08-20','PEGA030820HCLLXKLR','8664322321','PEGA030820HCL','44180032090',1,GETDATE(),1,GETDATE()),
	   ('Maria','Rivera','Soledad','I20050517','2005-01-25','RISM000408HCLLXLA6','8662332321','RISM000408HCL','44180032011',1,GETDATE(),1,GETDATE()),
	   ('Bertha','Ibarra','Vazquez','I17050517','2007-09-17','VAVB000408HCLLXLO6','8666542321','VAVB000408HCL','44180032055',1,GETDATE(),1,GETDATE());
	   
INSERT INTO Visit(numberofstudent,duration,objetive,aplicacion,datevisit,requiretransportation,result,idCompany,idZone,idEmployee,idStudent,idUsercreate,datecreate,idusermodified,datemodified)
VALUES ('23','3 Horas','Conocer las instalaciones','2023-09-17','2023-09-17','Si','Excelente',1,1,1,1,1,GETDATE(),1,GETDATE()),
       ('10','2 Horas','Conocer las instalaciones','2023-10-09','2023-10-09','No','Excelente',2,2,2,2,1,GETDATE(),1,GETDATE()),
	   ('50','8 Horas','Conocer las instalaciones','2023-10-05','2023-10-05','Si','Excelente',3,3,3,3,1,GETDATE(),1,GETDATE()),
	   ('32','3 Horas','Conocer las instalaciones','2023-11-23','2023-11-23','Si','Excelente',4,2,4,4,1,GETDATE(),1,GETDATE()),
	   ('27','3 Horas','Conocer las instalaciones','2023-12-01','2023-12-01','Si','Excelente',5,1,5,5,1,GETDATE(),1,GETDATE());

	   INSERt INTO EvaluationDetail(assessment,criterion,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES('Excelente','Un buen desarrollo de trabajo',1,GETDATE(),1,GETDATE()),
      ('Buen trabajp ','Interesante trabajo solo la ortografia',1,GETDATE(),1,GETDATE()),
	  ('Excelente','Ninguno',1,GETDATE(),1,GETDATE()),
      ('Excelente','Ninguno',1,GETDATE(),1,GETDATE());

	 
INSERt INTO ActivityType(description,activityname,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES('practice','Proyecto de energias renovables la luz',1,GETDATE(),1,GETDATE()),
      ('residence ','Proyecto de Redes computacionales',1,GETDATE(),1,GETDATE()),
	  ('stay','Proyecto de Funcionamiento de automotriz',1,GETDATE(),1,GETDATE()),
      ('socialservice','Proyecto de Diseñar una pagina web',1,GETDATE(),1,GETDATE());

INSERt INTO ComplementaryActivity(activityname,idStudent,idActivityType,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES('practice',1,1,1,GETDATE(),1,GETDATE()),
      ('residence ',2,2,1,GETDATE(),1,GETDATE()),
	  (' stay',3,3,1,GETDATE(),1,GETDATE()),
      ('socialservice',4,4,1,GETDATE(),1,GETDATE());

 INSERt INTO ActivityDetail(activitydetailsdescription,idEvaluationDetail,idComplementaryActivity,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES('Ninguno',1,1,1,GETDATE(),1,GETDATE()),
      ('Interesante trabajo solo falta menjorar la ortografia ',2,2,1,GETDATE(),1,GETDATE()),
	  ('Ninguno',3,3,1,GETDATE(),1,GETDATE()),
      ('Ninguno',4,4,1,GETDATE(),1,GETDATE());
	  INSERT INTO Agreement(acronym,objetive,idObjetive,idTerritory,statusAgreement,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES ('CFE','Servicio',1,1,'Activo',1,GETDATE(),1,GETDATE()),
       ('Simas','Servicio',2,2,'Inactivo',1,GETDATE(),1,GETDATE()),
	   ('Telmex','Servicio',2,1,'Activo',1,GETDATE(),1,GETDATE()),
	   ('Transporte','Servicio',1,2,'Activo',1,GETDATE(),1,GETDATE()),
	   ('Mantenimiento','Servicio',2,1,'Inactivo',1,GETDATE(),1,GETDATE());

INSERt INTO Empreneur(request ,objetive,codeOfEmpreneur ,workteam ,startdate ,finaldate ,duration ,idEmployee ,idStudent,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('Solicitud de Proyecto 1','Investigacion sobre Redes ','A20230412 ','4','2023-09-17','2023-09-17','6 Meses',1,1,1,GETDATE(),1,GETDATE()),
      ('Solicitud de Proyecto 2','Investigacion de campo ','A20230923 ','2','2023-09-17','2023-09-17','6 Meses',1,1,1,GETDATE(),1,GETDATE()),
	  ('Solicitud de Proyecto 3','Exposicion','A20231131 ','5','2023-09-17','2023-09-17','6 Meses',1,1,1,GETDATE(),1,GETDATE()),
	  ('Solicitud de Proyecto 4','Test','A20231002 ','2','2023-09-17','2023-09-17','6 Meses',1,1,1,GETDATE(),1,GETDATE()),
	  ('Solicitud de Proyecto 5','Exposicion','A20232528 ','3','2023-09-17','2023-09-17','6 Meses',1,1,1,GETDATE(),1,GETDATE());

INSERT INTO Viatic(place,description1,amount,idEmployee,idUsercreate,creationdate,IdUserModify,modified)
VALUES ('Saltillo Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','2500.50',1,1,GETDATE(),1,GETDATE()),
       ('Monterrey Nuevo Leon','Realizar una visita para conocer las instalaciones y que es lo que realizan.','3289.50',2,1,GETDATE(),1,GETDATE()),
	   ('Monclova Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','1289.50',3,1,GETDATE(),1,GETDATE()),
	   ('Frontera Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','1392.50',4,1,GETDATE(),1,GETDATE()),
	   ('Saltillo Coahuila','Realizar una visita para conocer las instalaciones y que es lo que realizan.','3478.50',5,1,GETDATE(),1,GETDATE());

INSERT INTO CompanyStudent (date,workplace,idStudent,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('2023-10-23','HFI',1,1,GETDATE(),1,GETDATE()),
       ('2023-11-30','Grupo Fox',2,1,GETDATE(),1,GETDATE()),
	   ('2023-09-25','Denso',3,1,GETDATE(),1,GETDATE()),
	   ('2023-10-02','Aramak',4,1,GETDATE(),1,GETDATE()),
	   ('2023-11-09','Quality',5,1,GETDATE(),1,GETDATE());

INSERT INTO OfficeRequestcommission (addressee ,header ,afftair ,date1 ,idEmploye,IdUserCreate,creationdate,IdUserModify,modified)
VALUES ('Luis Alfonso Rodriguez Perez','Realizar Visita','Ir a las instalaciones y hacer una reunion','2023-11-09',1,1,GETDATE(),1,GETDATE()),
       ('Alberto Salazar Zuñiga', 'Revisión de Contrato', 'Reunión para revisar contrato', '2023-11-10',2, 1, GETDATE(), 1, GETDATE()),
       ('Antonio Rodriguez Tovar', 'Informe Mensual', 'Preparar informe de ventas', '2023-11-11', 3,1, GETDATE(), 1, GETDATE()),
       ('Gabriela Mendoza Aguilar', 'Entrevista de Trabajo', 'Realizar entrevista con candidato', '2023-11-12',4, 1, GETDATE(), 1, GETDATE()),
       ('Patricia Hernendez Mata', 'Reunión de Equipo', 'Planificar estrategia de equipo', '2023-11-13',5, 1, GETDATE(), 1, GETDATE()); 

 INSERT INTO Position( jobDescription, wage, workingHours ,idTypePosition ,IdUserCreate,creationdate,IdUserModify,modified)
VALUES ('Jefe de maestros','3210.99','8 Horas',1,1,GETDATE(),1,GETDATE()),
        ('Profesor de Matemáticas', '2500.00', '8 Horas', 2, 1, GETDATE(), 1, GETDATE()),
       ('Director', '4800.00', '8 Horas', 3, 1, GETDATE(), 1, GETDATE()),
       ('Psicologo/a', '2800.00', '8 Horas', 4, 1, GETDATE(), 1, GETDATE()),
       ('Subdirector', '2200.00', '8 Horas', 5, 1, GETDATE(), 1, GETDATE());

INSERT INTO StudyPlan(  objetive,starDate,finalDate,key1 ,idCareer  ,IdUserCreate,creationdate,IdUserModify,modified)
VALUES ('Informatica','2023-11-12','2023-11-12','I1920812',1,1,GETDATE(),1,GETDATE()),
       ('Gestion Empresarial','2023-11-07','2023-11-12','G8237288',2,1,GETDATE(),1,GETDATE()),
	   ('Electronica','2023-11-23','2023-11-12','E1920812',3,1,GETDATE(),1,GETDATE()),
       ('Mecanica','2023-10-31','2023-11-12','M765647',4,1,GETDATE(),1,GETDATE()),
	   ('Industrial','2023-09-12','2023-11-12','IN99087Y',5,1,GETDATE(),1,GETDATE());

INSERT INTO ComplementaryActivityCompany( idComplementaryActivity,IdCompany ,IdUserCreate,datecreate,idusermodified,datemodified)
Values (1,1,1,GETDATE(),1,GETDATE()),
       (2,2,1,GETDATE(),1,GETDATE()),
	   (3,3,1,GETDATE(),1,GETDATE()),
	   (4,4,1,GETDATE(),1,GETDATE()),
	   (1,1,1,GETDATE(),1,GETDATE());

INSERT INTO AgreementCompany(  idAgreement,IdCompany ,IdUserCreate,datecreate,idusermodified,datemodified)
Values (1,1,1,GETDATE(),1,GETDATE()),
       (2,2,1,GETDATE(),1,GETDATE()),
	   (3,3,1,GETDATE(),1,GETDATE()),
	   (4,4,1,GETDATE(),1,GETDATE()),
	   (5,5,1,GETDATE(),1,GETDATE());

INSERT INTO AgreementPurpose(  idAgreement,IdPurpose ,IdUserCreate,datecreate,idusermodified,datemodified)
Values (1,1,1,GETDATE(),1,GETDATE()),
       (2,2,1,GETDATE(),1,GETDATE()),
	   (3,3,1,GETDATE(),1,GETDATE()),
	   (4,4,1,GETDATE(),1,GETDATE()),
	   (5,5,1,GETDATE(),1,GETDATE());

INSERT INTO EmployeePosition(  IdEmployee,IdPosition ,IdUserCreate,datecreate,idusermodified,datemodified)
Values (1,1,1,GETDATE(),1,GETDATE()),
       (2,2,1,GETDATE(),1,GETDATE()),
	   (3,3,1,GETDATE(),1,GETDATE()),
	   (4,4,1,GETDATE(),1,GETDATE()),
	   (5,5,1,GETDATE(),1,GETDATE());

INSERT INTO SubjectStudyPlan(  IdSubject,IdStudyPlan ,IdUserCreate,datecreate,idusermodified,datemodified)
Values (1,1,1,GETDATE(),1,GETDATE()),
       (2,2,1,GETDATE(),1,GETDATE()),
	   (3,3,1,GETDATE(),1,GETDATE()),
	   (4,4,1,GETDATE(),1,GETDATE()),
	   (5,5,1,GETDATE(),1,GETDATE());

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


--Tabla ExpenseType --

CREATE TABLE ExpenseType
(
idExpenseType int IDENTITY (1,1),  
expenseTypeName varchar(50) NOT NULL, 
status bit NOT NULL DEFAULT 1, 
 --LLavePrimaria----
CONSTRAINT Pk_ExpenseType PRIMARY KEY (idExpenseType) 
)
-- Insert
INSERT INTO ExpenseType (expenseTypeName, status) VALUES
('Comida', 1), 
('Transporte', 1),
('Entretenimiento', 1);

 --Tabla Event--
CREATE TABLE Event
(
idEvent int IDENTITY (1,1), 
activityToPerform varchar(50) NOT NULL, 
dateEvent date NULL,
status bit NOT NULL DEFAULT 1, 
 --LLavePrimaria----
CONSTRAINT PK_Event PRIMARY KEY (idEvent) 
)
-- Insert
INSERT INTO Event (activityToPerform, dateEvent, status) VALUES
('Reunión de equipo', '2023-12-20', 1), 
('Conferencia virtual', '2023-12-25', 1), 
('Entrega de premios', '2023-12-31', 1); 

 --Tabla AccreditationControl--

CREATE TABLE AccreditationControl
(
idAccreditationControl  int IDENTITY (1,1), 
serviceHour varchar(50) NOT NULL, 
credit varchar(50) NOT NULL, 
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_AccreditationControl PRIMARY KEY (idAccreditationControl) 
)
--Insert--
INSERT INTO AccreditationControl (serviceHour, credit, status) VALUES
('Control de Acreditación 1', 'Créditos 1', 1),
('Control de Acreditación 2', 'Créditos 2', 1),
('Control de Acreditación 3', 'Créditos 3', 1);

 --Tabla Cubicle--
CREATE TABLE Cubicle
(
TEACHER_ID int IDENTITY (1,1), 
CUBICLE_NUMBER varchar(50) NOT NULL, 
BUILDING varchar(50) NOT NULL, 
PERIOD varchar(50) NOT NULL, 
STATUS bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_TEACHER_ID PRIMARY KEY (TEACHER_ID) 
)
--Insert--
INSERT INTO Cubicle (CUBICLE_NUMBER, BUILDING, PERIOD, STATUS) VALUES
('Cubículo 1', 'Edificio 1', 'Mañana', 1),
('Cubículo 2', 'Edificio 2', 'Tarde', 1),
('Cubículo 3', 'Edificio 3', 'Noche', 1);
 --Tabla InstitucionalScholarshop--
CREATE TABLE InstitucionalScholarshop
(
InstitutionalScholarshipID int IDENTITY (1,1), 
Name varchar(50) NOT NULL,
Requirements varchar(50) NOT NULL,
Percentage varchar(50) NOT NULL,
Status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_InstitutionalScholarship PRIMARY KEY (InstitutionalScholarshipID) 
)
--Insert--
INSERT INTO InstitucionalScholarshop (Name, Requirements, Percentage, Status) VALUES
('Beca  Tec Institucional 1', 'Requisito 1', '50%', 1),
('Beca Tec Institucional 2', 'Requisito 2', '75%', 1),
('Beca Tec Institucional 3', 'Requisito 3', '60%', 1);
 --Tabla InternalScholar----
CREATE TABLE InternalScholar
(
InternalScholarID int IDENTITY (1,1), 
Semester int NOT NULL, 
InstitutionalScholarshipID  int NOT NULL, 
idStudent int NOT NULL, 
Status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_InternalScholar PRIMARY KEY (InternalScholarID),
 --LLaveForanea----
CONSTRAINT FK_InstitutionalScholarshipID FOREIGN KEY (InstitutionalScholarshipID) 
REFERENCES InstitucionalScholarshop(InstitutionalScholarshipID),
CONSTRAINT FK_StudentInternalScholar FOREIGN KEY (idStudent)REFERENCES Student(idStudent)

)
-- Insert
INSERT INTO InternalScholar (Semester, InstitutionalScholarshipID, idStudent, Status) VALUES
(1, 1, 1001, 1),
(2, 2, 1002, 1), 
(1, 3, 1003, 1); 

 --Tabla ExternalScholarship----
CREATE TABLE ExternalScholarship
(
ExternalScholarIshipID  int IDENTITY (1,1),
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_ExternalScholarIship PRIMARY KEY (ExternalScholarIshipID) 
)
--Insert--
INSERT INTO ExternalScholarship (Status) VALUES
(1), 
(1), 
(1);

--Tabla ExternalScholarshipDetails----
CREATE TABLE ExternalScholarshipDetails
(
ExternalScholarIshipID int IDENTITY (1,1),
Institution varchar(50) NOT NULL,
Campus varchar(50) NOT NULL,
Semester int NOT NULL, 
Major int NOT NULL, 
Status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_ExternalScholarIship PRIMARY KEY (ExternalScholarIshipID) 
)
--Insert--
INSERT INTO ExternalScholarshipDetails (Institution, Campus, Semester, Major, Status) VALUES
('Institución 1', 'Campus Mva', 1, 100, 1), 
('Institución 2', 'Campus Saltillo', 2, 200, 1),
('Institución 3', 'Campus Mty', 1, 300, 1); 

--Tabla Project----
CREATE TABLE Project
(
PROJECT_ID int IDENTITY (1,1),
PROJECTNAME varchar(50) NOT NULL,
STUDENTSNAME varchar(50) NOT NULL,
QUALIFICATION  int NOT NULL, 
DESCRIPTION  varchar(50) NOT NULL,
DateProject date,
STATUS bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_PROJECT_ID PRIMARY KEY (PROJECT_ID)
)
--Insert--
INSERT INTO Project (PROJECTNAME, STUDENTSNAME, QUALIFICATION, DESCRIPTION, DateProject, STATUS) VALUES
('Proyecto 1', 'Estudiantes Proyecto 1', 90, 'Descripción del Proyecto 1', '2023-01-15', 1),
('Proyecto 2', 'Estudiantes Proyecto 2', 85, 'Descripción del Proyecto 2', '2023-02-20', 1),
('Proyecto 3', 'Estudiantes Proyecto 3', 95, 'Descripción del Proyecto 3', '2023-03-25', 1);
--Tabla advisory----
CREATE TABLE advisory
( 
ADVICE_ID int IDENTITY (1,1), 
NameStuff varchar(50) NOT NULL,
idDocente   int NOT NULL, 
idStudent int NOT NULL, 
Unit  int NOT NULL, 
DateAdvisory date,
State bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_ADVICE PRIMARY KEY (ADVICE_ID),
 --LLaveForanea----
CONSTRAINT FK_DocenteAdvisory FOREIGN KEY (idDocente)REFERENCES Docente(idDocente),
--LLaveForanea----
CONSTRAINT FK_StudentAdvisory FOREIGN KEY (idStudent)REFERENCES Student(idStudent)
)


--Tabla Univeristy----
CREATE TABLE Univeristy
( 
UniversityId int IDENTITY (1,1), 
Director_Name varchar(50) NOT NULL,
Phone  varchar(50) NOT NULL,
Name varchar(50) NOT NULL,
Cp varchar(50) NOT NULL,
Status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_University PRIMARY KEY (UniversityId)
)
INSERT INTO University (Director_Name, Phone, Name, Cp, Status)
VALUES 
('Juan Pérez', '123456789', 'Universidad TecMva', '12345', 1),
('María Gómez', '987654321', 'Universidad TecSaltillo', '54321', 1),
('Pedro Rodríguez', '111222333', 'Universidad Mty', '54321', 1);



--Tabla LifeInsurance----
CREATE TABLE LifeInsurance
(
LifeInsuranceID int IDENTITY (1,1),
InsurancePayment varchar(50) NOT NULL,
PolicyNumber varchar(50) NOT NULL,
Beneficiary varchar(50) NOT NULL,
StartDate date,
EndDate date,
PaymentPeriod varchar(50) NOT NULL,
DeathCoverage varchar(50) NOT NULL,
InsuranceCompany varchar(50) NOT NULL,
DisabilityCoverage varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_LifeInsurance PRIMARY KEY (LifeInsuranceID)
)
--Insert--
INSERT INTO LifeInsurance (InsurancePayment, PolicyNumber, Beneficiary, StartDate, EndDate, PaymentPeriod, DeathCoverage, InsuranceCompany, DisabilityCoverage, Status)
VALUES 
('Pago de Seguro de Vida 1', 'Número de Póliza 1', 'Beneficiario 1', '2023-01-01', '2024-01-01', 'Mensual', 'Cobertura de Fallecimiento 1', 'Compañía de Seguros 1', 'Cobertura de Incapacidad 1', 1),
('Pago de Seguro de Vida 2', 'Número de Póliza 2', 'Beneficiario 2', '2023-02-01', '2024-02-01', 'Trimestral', 'Cobertura de Fallecimiento 2', 'Compañía de Seguros 2', 'Cobertura de Incapacidad 2', 1),
('Pago de Seguro de Vida 3', 'Número de Póliza 3', 'Beneficiario 3', '2023-03-01', '2024-03-01', 'Anual', 'Cobertura de Fallecimiento 3', 'Compañía de Seguros 3', 'Cobertura de Incapacidad 3', 1),
('Pago de Seguro de Vida 4', 'Número de Póliza 4', 'Beneficiario 4', '2023-04-01', '2024-04-01', 'Mensual', 'Cobertura de Fallecimiento 4', 'Compañía de Seguros 4', 'Cobertura de Incapacidad 4', 1);


--Tabla FamilyData----
CREATE TABLE FamilyData
(
FamilyDataID int IDENTITY (1,1),
Relationship varchar(50) NOT NULL,
PhoneNumber varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
MiddleName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_FamilyData PRIMARY KEY (FamilyDataID)
)
--Insert--
INSERT INTO FamilyData (Relationship, PhoneNumber, Email, FirstName, MiddleName, LastName, Address, Status)
VALUES 
('Padre', '123456789', 'padre@email.com', 'Juan', 'Manuel', 'Pérez', 'Calle Principal 123', 1),
('Madre', '987654321', 'madre@email.com', 'María', 'Isabel', 'Gómez', 'Avenida Central 456', 1),
('Hijo', '555555555', 'hijo@email.com', 'Carlos', 'Antonio', 'Martínez', 'Calle Secundaria 789', 1),
('Hija', '333333333', 'hija@email.com', 'Laura', 'Fernanda', 'Rodríguez', 'Calle Norteña 012', 1);

--Tabla university----
CREATE TABLE university
(
UNIVERSITY_ID int IDENTITY (1,1),
NAME varchar(50) NOT NULL,
DIRECTOR_NAME varchar(50) NOT NULL,
PHONE varchar(50) NOT NULL,
ADDRESS varchar(50) NOT NULL,
CP varchar(50) NOT NULL,
STATUS  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_UNIVERSITY PRIMARY KEY (UNIVERSITY_ID)
)
--Insert--
INSERT INTO university (NAME, DIRECTOR_NAME, PHONE, ADDRESS, CP, STATUS)
VALUES 
('Universidad Central', 'Juan Pérez', '123456789', 'Calle Principal 123', '12345', 1),
('Universidad del Sur', 'María Gómez', '987654321', 'Avenida Central 456', '54321', 1),
('Universidad del Norte', 'Pedro Rodríguez', '111222333', 'Calle Norteña 789', '98765', 1);


--Tabla GraduationInformation----
CREATE TABLE GraduationInformation
(
GraduateInformationID int IDENTITY (1,1),
GraduationDate date,
CurrentPosition varchar(50) NOT NULL,
CurrentJob varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_GraduateInformation PRIMARY KEY (GraduateInformationID)
)
--Insert--
INSERT INTO GraduationInformation (GraduationDate, CurrentPosition, CurrentJob, Status)
VALUES 
('2023-06-30', 'Desarrollador de Software', 'Empresa de Tecnología', 1),
('2022-12-15', 'Ingeniero Civil', 'Constructora ConstruyeBien', 1),
('2023-08-20', 'Médico Residente', 'Hospital Central', 1);

--Tabla Group----
CREATE TABLE Group
(
idGroup  int IDENTITY (1,1),
numerOfStudents varchar(50) NOT NULL,
groupName  int NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Group PRIMARY KEY (idGroup)
)
--Insert--
INSERT INTO [Group] (numberOfStudents, groupName, status)
VALUES 
('30', 1, 1),
('25', 2, 1),
('20', 3, 1);

--Tabla InstitucionalScholarshop----
CREATE TABLE InstitucionalScholarshop
(
InstitutionalScholarshipID int IDENTITY (1,1),
Name varchar(50) NOT NULL,
Requirements varchar(50) NOT NULL,
Percentage varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_InstitutionalScholarship PRIMARY KEY (InstitutionalScholarshipID)
)
--Insert--
INSERT INTO InstitucionalScholarshop (Name, Requirements, Percentage, Status)
VALUES 
('Beca de Excelencia', 'Promedio mínimo de 9.0', '50%', 1),
('Beca Deportiva', 'Participación en equipos representativos', '25%', 1),
('Beca Cultural', 'Excelencia en actividades artísticas', '30%', 1);

--Tabla InternalScholar----
CREATE TABLE InternalScholar
(
InternalScholarID int IDENTITY (1,1),
Semester varchar(50) NOT NULL,
idStudent  int NOT NULL,
InstitutionalScholarshipID  int NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_InternalScholar PRIMARY KEY (InternalScholarID),
--LLaveForanea----
CONSTRAINT FK_StudentAdvisory FOREIGN KEY (InstitutionalScholarshipID)REFERENCES InstitucionalScholarshop(InstitutionalScholarshipID),
--LLaveForanea----
CONSTRAINT FK_StudentScholar FOREIGN KEY (idStudent)REFERENCES Student(idStudent)
)
--Insert--
INSERT INTO InternalScholar (Semester, idStudent, InstitutionalScholarshipID, Status)
VALUES 
('2023A', 1, 1, 1),
('2023B', 1, 2, 1),
('2024A', 1, 3, 1);

--Tabla Education----
CREATE TABLE Education
(
educationID int IDENTITY (1,1),
EducationLevel int NOT NULL,
StartDate date,
EndDate date,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_education PRIMARY KEY (educationID)
)
INSERT INTO Education (EducationLevel, StartDate, EndDate, status)
VALUES 
(1, '2020-09-01', '2024-06-30', 1),
(2, '2018-08-15', '2022-05-30', 1),
(3, '2019-07-01', '2023-04-20', 1);


CREATE TABLE Enrrollment
(
EnrollmentID int IDENTITY (1,1),
idStudent int NOT NULL,
PeriodID int NOT NULL,
DueDate date ,
Semester int NOT NULL,
Matriculation  varchar(50) NOT NULL,
NumericalReference varchar(50) NOT NULL,
TotalPayment varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Enrollment PRIMARY KEY (EnrollmentID),
--LLaveForanea----
CONSTRAINT FK_StudentScholar FOREIGN KEY (idStudent)REFERENCES Student(idStudent)
)
INSERT INTO Enrollment (idStudent, PeriodID, DueDate, Semester, Matriculation, NumericalReference, TotalPayment, Status)
VALUES 
(1, 1, '2023-01-15', 1, 'Matrícula Enero 2023', 'REF123', '500 ', 1),
(1, 2, '2023-02-20', 2, 'Matrícula Febrero 2023', 'REF456', '600 ', 1),
(1, 3, '2023-03-25', 3, 'Matrícula Marzo 2023', 'REF789', '550 ', 1);


CREATE TABLE Period
(
PeriodID  int IDENTITY (1,1),
Name varchar(50) NOT NULL,
Duration varchar(50) NOT NULL,
StartDate date,
EndDate date,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Period PRIMARY KEY (PeriodID)
)
INSERT INTO Period (Name, Duration, StartDate, EndDate, Status)
VALUES 
('Semestre 1', '4 meses', '2023-01-01', '2023-04-30', 1),
('Semestre 2', '4 meses', '2023-05-01', '2023-08-31', 1),
('Semestre 3', '4 meses', '2023-09-01', '2023-12-31', 1);


CREATE TABLE Classroom
(
idClassroom  int IDENTITY (1,1),
name varchar(50) NOT NULL,
roomNumber int NOT NULL,
capacity int NOT NULL,
status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Classroom PRIMARY KEY (idClassroom)
)
INSERT INTO Classroom (name, roomNumber, capacity, status)
VALUES 
('Salón A', 101, 50, 1),
('Salón B', 102, 40, 1),
('Salón C', 103, 60, 1);

CREATE TABLE Kardex
(
KardexID  int IDENTITY (1,1),
Note int NOT NULL,
Unity int NOT NULL,
Grade int NOT NULL,
OportunityID int NOT NULL,
idStudent int NOT NULL,
ClassID int NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Kardex PRIMARY KEY (KardexID),
--LLaveForanea----
CONSTRAINT FK_StudentScholar FOREIGN KEY (idStudent)REFERENCES Student(idStudent)
)
--Insert--
INSERT INTO Kardex (Note, Unity, Grade, OportunityID, idStudent, ClassID, Status)
VALUES 
(90, 1, 95, 1, 12345, 1, 1),
(83, 2, 92, 2, 23456, 2, 1),
(88, 3, 89, 3, 34567, 3, 1);

CREATE TABLE Exam
(
Exam_ID int IDENTITY (1,1),
StudentName varchar(50) NOT NULL,
Examen_Type varchar(50) NOT NULL,
Qualification  int NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Exam PRIMARY KEY (Exam_ID)
)
INSERT INTO Exam (StudentName, Examen_Type, Qualification, Status)
VALUES 
('Juan Pérez', 'Examen de Matemáticas', 90, 1),
('María Gómez', 'Examen de Historia', 85, 1),
('Pedro Rodríguez', 'Examen de Ciencias', 88, 1);

CREATE TABLE Schedule
(
Schedule_ID int IDENTITY (1,1),
Subject varchar(50) NOT NULL,
Hours varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Schedule PRIMARY KEY (Schedule_ID)
)
--Insert--
INSERT INTO Schedule (Subject, Hours, Status)
VALUES 
('Matemáticas', '4 horas semanales', 1),
('Historia', '3 horas semanales', 1),
('Ciencias', '5 horas semanales', 1);

CREATE TABLE ClassDetail
(
idClassDetail int IDENTITY (1,1),
endTime  varchar(50) NOT NULL,
days varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_ClassDetail PRIMARY KEY (idClassDetail)
)
--Insert--
INSERT INTO ClassDetail (endTime, days, Status)
VALUES 
('13:00', 'Lunes y Miércoles', 1),
('14:30', 'Martes y Jueves', 1),
('11:00', 'Viernes', 1);

CREATE TABLE Class
(
ClassID  int IDENTITY (1,1),
CourseID int NOT NULL,
idEmployee int NOT NULL,
PeriodID int NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Class PRIMARY KEY (ClassID),
--LLaveForanea----
CONSTRAINT FK_StudentScholar FOREIGN KEY (idEmployee)REFERENCES Employee(idEmployee)
)
--Insert--
INSERT INTO Class (CourseID, idEmployee, PeriodID, status)
VALUES 
(1, 2, 1, 1),
(2, 2, 1, 1),
(3, 2, 1, 1);

CREATE TABLE Opportunity
(
OpportunityID int IDENTITY (1,1),
NameOportunity varchar(50) NOT NULL,
Number int NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Oportunity PRIMARY KEY (OpportunityID)
)
--Insert--
INSERT INTO Opportunity (NameOportunity, Number, Status)VALUES 
('Oportunidad de Empleo', 1, 1),
('Oportunidad de Becas', 2, 1),
('Oportunidad de Prácticas', 3, 1);


CREATE TABLE AttendanceRecord
(
idAttendancerecord int IDENTITY (1,1),
dateAttendanceRecord date,
reasonForAbsence varchar(50) NOT NULL,
status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_AttendanceRecord PRIMARY KEY (idAttendancerecord)
)
INSERT INTO AttendanceRecord (dateAttendanceRecord, reasonForAbsence, status)
VALUES 
('2023-12-01', 'Enfermedad', 1),
('2023-12-05', 'Compromiso familiar', 1),
('2023-12-10', 'Asuntos personales', 1);

CREATE TABLE DropOut
(
idDropOut int IDENTITY (1,1),
dropOutDate  date,
reason   varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_DropOut PRIMARY KEY (idDropOut)
)
--Insert--
INSERT INTO DropOut (dropOutDate, reason, status)
VALUES 
('2023-10-15', 'Motivos personales', 1),
('2023-11-20', 'Falta de interés', 1),
('2023-12-05', 'Razones laborales', 1);

CREATE TABLE AcademicAward
(
idAcademicAward int IDENTITY (1,1),
nameAdademicAward varchar(50) NOT NULL,
description varchar(50) NOT NULL,
recipients varchar(50) NOT NULL,
dateAcademicAward date, 
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_AcademicAward PRIMARY KEY (idAcademicAward)
)
--Insert--
INSERT INTO AcademicAward (nameAdademicAward, description, recipients, dateAcademicAward, status) VALUES 
('Premio de Excelencia', 'Otorgado por logros sobresalientes', 'Estudiante Ejemplar', '2023-05-20', 1),
('Mención Honorífica', 'Reconocimiento por desempeño destacado', 'Estudiante Destacado', '2023-06-10', 1),
('Premio al Mérito', 'Por contribuciones excepcionales', 'Estudiante Meritorio', '2023-07-15', 1);

CREATE TABLE AcademicDiploma
(
idAcademicDiploma  int IDENTITY (1,1),
type varchar(50) NOT NULL,
title  varchar(50) NOT NULL,
dateAcademicDiploma date,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_AcademicDiploma PRIMARY KEY (idAcademicDiploma)
 
)
--Insert
INSERT INTO AcademicDiploma (type, title, dateAcademicDiploma, status)
VALUES 
('Grado', 'Licenciatura en Ingeniería', '2023-08-30', 1),
('Diploma', 'Diploma en Administración de Empresas', '2023-09-15', 1),
('Certificado', 'Certificado en Marketing Digital', '2023-10-20', 1);



CREATE TABLE Club
(
idClub  int IDENTITY (1,1),
name varchar(50) NOT NULL,
classification varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Club PRIMARY KEY (idClub)
)
--Insert--
INSERT INTO Club (name, classification, status)
VALUES 
('Club de Debate', 'Académico', 1),
('Club de Fotografía', 'Artístico', 1),
('Club de Ajedrez', 'Recreativo', 1);

CREATE TABLE TypeMaterial
(
idTypeMaterial int IDENTITY (1,1),
nameTypeMaterial varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_TypeMaterial PRIMARY KEY (idTypeMaterial)
)
--Insert--
INSERT INTO TypeMaterial (nameTypeMaterial, status)
VALUES 
('Libros', 1),
('Equipos Deportivos', 1),
('Material Artístico', 1);
CREATE TABLE CandidateStudent
(
idCandidateStudent int IDENTITY (1,1),
name varchar(50) NOT NULL,
gendeer varchar(50) NOT NULL,
nationality varchar(50) NOT NULL,
contactinformation varchar(50) NOT NULL,
address varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_CandidateStudent PRIMARY KEY (idCandidateStudent)
)
--Insert
INSERT INTO CandidateStudent (name, gendeer, nationality, contactInformation, address, status)
VALUES 
('María López', 'Femenino', 'Mexicana', 'correo@example.com', 'Calle Principal, Ciudad', 1),
('Juan Martínez', 'Masculino', 'Español', 'juan@example.com', 'Avenida Central, Ciudad', 1),
('Ana García', 'Femenino', 'Colombiana', 'ana@example.com', 'Calle Secundaria, Ciudad', 1);

CREATE TABLE ServicePayment
(
idServicePayment int IDENTITY (1,1),
paymentDate date,
paymentMethod  varchar(50) NOT NULL,
amount varchar(50) NOT NULL,
status  bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_ServicePayment PRIMARY KEY (idServicePayment)
)
--Insert--
INSERT INTO ServicePayment (paymentDate, paymentMethod, amount, status)
VALUES 
('2023-10-01', 'Tarjeta de crédito', '150.00', 1),
('2023-11-05', 'Efectivo', '200.00', 1),
('2023-12-10', 'Transferencia bancaria', '180.00', 1);

CREATE TABLE Reticule
(
ReticuleID  int IDENTITY (1,1),
CourseID int NOT NULL,
ContactInformation  varchar(50) NOT NULL,
Description  varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Reticule PRIMARY KEY (ReticuleID)
)
--Insert--
INSERT INTO Reticule (CourseID, ContactInformation, Description, Status)
VALUES 
(101, 'contacto@example.com', 'Descripción del retículo 1', 1),
(102, 'informacion@example.com', 'Descripción del retículo 2', 1),
(103, 'detalles@example.com', 'Descripción del retículo 3', 1);

CREATE TABLE TeacherEvaluation
(
idTeacherEvaluation int IDENTITY (1,1),
comments varchar(50) NOT NULL,
calification varchar(50) NOT NULL,
dateEvaluation date,
grade int NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_TeacherEvaluation PRIMARY KEY (idTeacherEvaluation)
)
--Insert
INSERT INTO TeacherEvaluation (comments, calification, dateEvaluation, grade, status)
VALUES 
('Muy buen desempeño', 'Excelente', '2023-09-15', 10, 1),
('Regular', 'Regular', '2023-10-20', 5, 1),
('Necesita mejorar', 'Bajo', '2023-11-25', 3, 1);


CREATE TABLE Material
(
idMaterial int IDENTITY (1,1),
itemType  int NOT NULL,
quantity  int NOT NULL,
itemName varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Material PRIMARY KEY (idMaterial)
)
--Insert--
INSERT INTO Material (itemType, quantity, itemName, status)
VALUES 
(1, 100, 'Libros', 1),
(2, 50, 'Equipos Deportivos', 1),
(3, 75, 'Material Artístico', 1);

CREATE TABLE Contract
(
idContract int IDENTITY (1,1),
ContractType  varchar(50) NOT NULL,
salary varchar(50) NOT NULL,
startDate date,
endDate date,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Contract PRIMARY KEY (idContract)
)
--Insert--
INSERT INTO Contract (ContractType, salary, startDate, endDate, status)
VALUES 
('Tiempo Completo', '30000', '2023-01-01', '2024-01-01', 1),
('Medio Tiempo', '20000', '2023-02-01', '2024-02-01', 1),
('Por Proyecto', '50000', '2023-03-01', '2023-06-01', 1);

CREATE TABLE Aplication
(
idAplication  int IDENTITY (1,1),
AplicationDate date,
ApplicantFirstName  varchar(50) NOT NULL,
applicantLastName  varchar(50) NOT NULL,
grade int NOT NULL,
schoolOfOrigin  varchar(50) NOT NULL,
dateOfBirth date,
preferredCareer  varchar(50) NOT NULL,
temporalID int NOT NULL,
status bit NOT NULL DEFAULT 1,
 --LLavePrimaria----
CONSTRAINT PK_Aplication PRIMARY KEY (idAplication)
)
INSERT INTO Aplication (AplicationDate, ApplicantFirstName, ApplicantLastName, grade, schoolOfOrigin, dateOfBirth, preferredCareer, temporalID, status)
VALUES 
('2023-12-01', 'María', 'González', 90, 'Escuela Secundaria 1', '2005-05-15', 'Ingeniería Civil', 101, 1),
('2023-12-05', 'Pedro', 'López', 85, 'Escuela Secundaria 2', '2004-08-20', 'Medicina', 102, 1),
('2023-12-10', 'Luisa', 'Martínez', 92, 'Escuela Secundaria 3', '2006-02-10', 'Arquitectura', 103, 1);


CREATE TABLE Departament
(
idDepartament  int IDENTITY (1,1),
name  varchar(50) NOT NULL,
description   varchar(50) NOT NULL,
cellNumber  varchar(50) NOT NULL,
ubication  varchar(50) NOT NULL,
openingHour  varchar(50) NOT NULL,
director  varchar(50) NOT NULL, 
fundationDate date,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Departament PRIMARY KEY (idDepartament)
)
INSERT INTO Departament (name, description, cellNumber, ubication, openingHour, director, foundationDate, status)
VALUES 
('Departamento de Matemáticas', 'Matemáticas avanzadas y cálculo', '123-456-7890', 'Edificio A, Planta 2', '9:00 AM - 5:00 PM', 'Dr. Carlos García', '2020-01-01', 1),
('Departamento de Historia', 'Estudio de la historia mundial', '987-654-3210', 'Edificio B, Planta 3', '8:00 AM - 4:00 PM', 'Dra. María Martínez', '2015-06-15', 1),
('Departamento de Ciencias de la Computación', 'Informática y programación', '555-123-4567', 'Edificio C, Planta 1', '10:00 AM - 6:00 PM', 'Dr. Juan Rodríguez', '2018-03-10', 1);

CREATE TABLE LoanApplication
(
idLoanApplication int IDENTITY (1,1),
numberLoan int NOT NULL,
deliveryDate date,
description varchar(50) NOT NULL,
quantity int NOT NULL,
departureDate date,
Status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_LoanApplication PRIMARY KEY (idLoanApplication)
)
--Insert--
INSERT INTO LoanApplication (numberLoan, deliveryDate, description, quantity, departureDate, Status)
VALUES 
(1001, '2023-12-01', 'Préstamo de libros', 50, '2023-12-15', 1),
(1002, '2023-12-05', 'Préstamo de equipos deportivos', 20, '2023-12-20', 1),
(1003, '2023-12-10', 'Préstamo de material artístico', 30, '2023-12-25', 1);

CREATE TABLE Course
(
idCourse int IDENTITY (1,1),
name varchar(50) NOT NULL,
characteristic varchar(50) NOT NULL,
keyMatter varchar(50) NOT NULL,
credit  int NOT NULL,
unit int NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Course PRIMARY KEY (idCourse)
)
--Insert--
INSERT INTO Course (name, characteristic, keyMatter, credit, unit, status)
VALUES 
('Matemáticas Avanzadas', 'Avanzado', 'MAT101', 5, 3, 1),
('Historia del Arte', 'Teórico y práctico', 'HAR201', 4, 2, 1),
('Programación en Python', 'Introducción a la programación', 'CMP301', 6, 3, 1);

CREATE TABLE DocumentType
(
DocumentTypeID int IDENTITY (1,1),
Name  varchar(50) NOT NULL,
Description  varchar(50) NOT NULL,
Status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_DocumentType PRIMARY KEY (DocumentTypeID)
)
--Insert--
INSERT INTO DocumentType (Name, Description, Status)
VALUES 
('Identificación', 'Documento de identificación personal', 1),
('Transcripción', 'Registro académico oficial', 1),
('Certificado', 'Documento de certificación', 1);

CREATE TABLE DocumentRequest
(
DocumentRequestID int IDENTITY (1,1),
DocumentTypeID int NOT NULL,
idEmployee  int NOT NULL,
RequestDate date,
idStudent int NOT NULL,
Status  bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_DocumentRequest PRIMARY KEY (DocumentRequestID),
--LLaveForanea----
CONSTRAINT FK_StudentDocumentRequest FOREIGN KEY (idStudent)REFERENCES Student(idStudent),
--LLaveForanea----
CONSTRAINT FK_Employe FOREIGN KEY (idEmployee)REFERENCES Employee(idEmployee)
)
INSERT INTO DocumentRequest (DocumentTypeID, idEmployee, RequestDate, idStudent, Status)
VALUES 
(1, 1, '2023-12-01', 201, 1),
(2, 1, '2023-12-05', 202, 1),
(3, 1, '2023-12-10', 203, 1);

--Creo que ya existe verificar--
CREATE TABLE Zone
(
idZone int IDENTITY (1,1),
zonename varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Zone PRIMARY KEY (idZone)
)
--Insert--

INSERT INTO Zone (zonename, status)
VALUES 
('Zona 1', 1),
('Zona 2', 1),
('Zona 3', 1);

CREATE TABLE Conference
(
idConference int IDENTITY (1,1),
nameConference  varchar(50) NOT NULL,
startDate date,
endDate date,
location varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Conference PRIMARY KEY (idConference)
)
--INSERT--
INSERT INTO Conference (nameConference, startDate, endDate, location, status)
VALUES 
('Conferencia de Tecnología', '2023-12-10', '2023-12-12', 'Ciudad Saltillo', 1),
('Conferencia de Marketing', '2023-12-15', '2023-12-16', 'Localidad Mva', 1),
('Conferencia Médica', '2023-12-20', '2023-12-22', 'Lugar Torreon', 1);

CREATE TABLE CareerService
(
CareerServiceID int IDENTITY (1,1),
idCareer int NOT NULL,
idEmployee int NOT NULL,
Description varchar(50) NOT NULL,
ServiceDate date,
State int NOT NULL,
Status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_CareerService PRIMARY KEY (CareerServiceID),
--LLaveForanea----
CONSTRAINT FK_CareerService_Employe FOREIGN KEY (idEmployee)REFERENCES Employee(idEmployee),
--LLaveForanea----
CONSTRAINT FK_CareerService_Career FOREIGN KEY (idCareer)REFERENCES Career(idCareer)
)

--Insert--
INSERT INTO CareerService (idCareer, idEmployee, Description, ServiceDate, State, Status)
VALUES 
(1, 1, 'Servicio de orientación laboral', '2023-12-10', 1, 1),
(2, 2, 'Asesoramiento en búsqueda de empleo', '2023-12-12', 1, 1),
(3, 1, 'Taller de desarrollo profesional', '2023-12-15', 1, 1);

CREATE TABLE Facility
(
idFacility  int IDENTITY (1,1),
FacilityName varchar(50) NOT NULL,
capacity  varchar(50) NOT NULL,
avaliability varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Facility PRIMARY KEY (idFacility)
)
--Insert--
INSERT INTO Facility (FacilityName, capacity, avaliability, status)
VALUES 
('Sala de Conferencias', '100', 'Disponible', 1),
('Gimnasio', '50', 'No disponible', 1),
('Piscina', '200', 'Disponible', 1);

CREATE TABLE ClubShedule
(
idClubSchedule  int IDENTITY (1,1),
dayOfWeekShedule varchar(50) NOT NULL,
startTime varchar(50) NOT NULL,
endTime varchar(50) NOT NULL,
status  bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_ClubShedule PRIMARY KEY (idClubSchedule)
)
--Insert--
INSERT INTO ClubShedule (dayOfWeekShedule, startTime, endTime, status) VALUES 
('Lunes', '09:00', '17:00', 1),
('Miércoles', '14:00', '19:00', 1),
('Viernes', '18:00', '22:00', 1);
--Ya existe--
CREATE TABLE Event
(
idEvent  int IDENTITY (1,1),
name varchar(50) NOT NULL,
credits int NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Event PRIMARY KEY (idEvent)
)
CREATE TABLE BookCatalog
(
idBookCatalog  int IDENTITY (1,1),
titleBook varchar(50) NOT NULL,
inStock  int NOT NULL,
publisher  varchar(50) NOT NULL,
authorName varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_BookCatalog PRIMARY KEY (idBookCatalog)
)
--Insert--
INSERT INTO BookCatalog (titleBook, inStock, publisher, authorName, status)
VALUES 
('El Señor de los Anillos', 50, 'Editorial 1', 'J.R.R. Tolkien', 1),
('Cien años de soledad', 30, 'Editorial 2', 'Gabriel García Márquez', 1),
('1984', 40, 'Amor', 'Gabriel García Márquez', 1);

CREATE TABLE DegreeRequirements
(
idDegreeRequirements int IDENTITY (1,1),
tipo varchar(50) NOT NULL,
semestre int NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_DegreeRequirements PRIMARY KEY (idDegreeRequirements)
)
--Insert--
INSERT INTO DegreeRequirements (tipo, semestre, status)
VALUES 
('Requisito A', 1, 1),
('Requisito B', 2, 1),
('Requisito C', 3, 1);

CREATE TABLE Expense
(
idExpense int IDENTITY (1,1),
expenseDate date ,
amount int NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Expense PRIMARY KEY (idExpense)
)
INSERT INTO Expense (expenseDate, amount, status)
VALUES 
('2023-12-01', 500, 1),
('2023-12-05', 300, 1),
('2023-12-10', 700, 1);
--Ya existe--
CREATE TABLE Company
(
idCompany int IDENTITY (1,1),
name  varchar(50) NOT NULL,
phone varchar(50) NOT NULL,
identificationnumber varchar(50) NOT NULL,
address varchar(50) NOT NULL,
mail varchar(50) NOT NULL,
status  bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Company PRIMARY KEY (idCompany)
)

CREATE TABLE EmployeType
(
idEmployeType  int IDENTITY (1,1),
Position varchar(50) NOT NULL,
level varchar(50) NOT NULL,
Hours varchar(50) NOT NULL,
TypePositionName varchar(50) NOT NULL,
BaseSalary varchar(50) NOT NULL,
status  bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_EmployeType PRIMARY KEY (idEmployeType)
)
--Insert--
INSERT INTO EmployeType (Position, level, Hours, TypePositionName, BaseSalary, status)
VALUES 
('Gerente', 'Nivel 5', '40 horas', 'Tiempo completo', '50000', 1),
('Asistente', 'Nivel 2', '20 horas', 'Medio tiempo', '25000', 1),
('Analista', 'Nivel 3', '35 horas', 'Tiempo completo', '40000', 1);

CREATE TABLE AreaApplication
(
idAreaApplication  int IDENTITY (1,1),
description varchar(50) NOT NULL,
dateAreaApplication date,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_AreaApplication PRIMARY KEY (idAreaApplication)
)
--INSERT--
INSERT INTO AreaApplication (description, dateAreaApplication, status)
VALUES 
('Área de Ventas', '2023-12-01', 1),
('Área de Marketing', '2023-12-05', 1),
('Área de Desarrollo', '2023-12-10', 1);

CREATE TABLE ToolCatalog
(
ToolCatalog int IDENTITY (1,1),
name varchar(50) NOT NULL,
model varchar(50) NOT NULL,
brand varchar(50) NOT NULL,
quantityExistence  int NOT NULL,
description  varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_ToolCatalog PRIMARY KEY (ToolCatalog)
)
--INSERT
INSERT INTO ToolCatalog (name, model, brand, quantityExistence, description, status)VALUES 
('Destornillador', 'Modelo 1001', 'Marca A', 50, 'Destornillador de punta plana', 1),
('Martillo', 'Modelo 2001', 'Marca B', 30, 'Martillo de 500g', 1),
('Sierra eléctrica', 'Modelo 3001', 'Marca C', 20, 'Sierra circular portátil', 1);

CREATE TABLE Building
(
idBuilding int IDENTITY (1,1),
number int NOT NULL,
description varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Building PRIMARY KEY (idBuilding)
)
--Ya existe--
CREATE TABLE Area
(
idArea  int IDENTITY (1,1),
number  int NOT NULL,
description varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Area PRIMARY KEY (idArea)
)
CREATE TABLE Service
(
idService int IDENTITY (1,1),
ServiceName varchar(50) NOT NULL,
ServiceDescription varchar(50) NOT NULL,
ServiceCost  varchar(50) NOT NULL,
StartDate date,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_Service PRIMARY KEY (idService)
)
--Insert--
INSERT INTO Service (ServiceName, ServiceDescription, ServiceCost, StartDate, status)
VALUES 
('Limpieza de oficinas', 'Servicio de limpieza diaria', '1000', '2023-12-01', 1),
('Mantenimiento de equipos', 'Revisión mensual de equipos', '500', '2023-12-05', 1),
('Servicio de catering', 'Catering para eventos corporativos', '1500', '2023-12-10', 1);

CREATE TABLE externalPayment
(
idexternalPayment int IDENTITY (1,1),
PaymentAmount varchar(50) NOT NULL,
referenceNumber varchar(50) NOT NULL,
PaymentMethod varchar(50) NOT NULL,
payee varchar(50) NOT NULL,
status bit NOT NULL DEFAULT 1
 --LLavePrimaria----
CONSTRAINT PK_externalPayment PRIMARY KEY (idexternalPayment)
)
--Insert--
INSERT INTO externalPayment (PaymentAmount, referenceNumber, PaymentMethod, payee, status)
VALUES 
('1500', 'REF123456', 'Transferencia bancaria', 'Empresa X', 1),
('800', 'REF789012', 'Tarjeta de crédito', 'Empresa Y', 1),
('2000', 'REF345678', 'Cheque', 'Empresa Z', 1);

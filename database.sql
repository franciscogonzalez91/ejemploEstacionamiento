/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 02-abr.-2017 14:22:42 				*/
/*  DBMS       : SQL Server 2012 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

IF NOT EXISTS(SELECT * FROM master.sys.databases WHERE name = 'ControlEntradas')
BEGIN
	CREATE DATABASE ControlEntradas
END
GO

USE ControlEntradas

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Usuarios_Empleados]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Usuarios] DROP CONSTRAINT [FK_Usuarios_Empleados]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_UsoDocenEstacionamiento_Empleados]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [UsoDocenEstacionamiento] DROP CONSTRAINT [FK_UsoDocenEstacionamiento_Empleados]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_UsoDocenEstacionamiento_EspaciosEstacionamieno]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [UsoDocenEstacionamiento] DROP CONSTRAINT [FK_UsoDocenEstacionamiento_EspaciosEstacionamieno]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_UsoAlumEstacionamiento_Alumnos]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [UsoAlumEstacionamiento] DROP CONSTRAINT [FK_UsoAlumEstacionamiento_Alumnos]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_UsoAlumEstacionamiento_EspaciosEstacionamieno]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [UsoAlumEstacionamiento] DROP CONSTRAINT [FK_UsoAlumEstacionamiento_EspaciosEstacionamieno]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_HorarioLogueo_Casetas]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [HorarioLogueo] DROP CONSTRAINT [FK_HorarioLogueo_Casetas]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_HorarioLogueo_Usuarios]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [HorarioLogueo] DROP CONSTRAINT [FK_HorarioLogueo_Usuarios]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_EspaciosEstacionamieno_Estacionamiento]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [EspaciosEstacionamieno] DROP CONSTRAINT [FK_EspaciosEstacionamieno_Estacionamiento]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Empleados_Departamentos]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Empleados] DROP CONSTRAINT [FK_Empleados_Departamentos]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Docentes_Empleados]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Docentes] DROP CONSTRAINT [FK_Docentes_Empleados]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Carreras_Departamentos]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Carreras] DROP CONSTRAINT [FK_Carreras_Departamentos]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Alumnos_Carreras]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [Alumnos] DROP CONSTRAINT [FK_Alumnos_Carreras]
GO

/* Drop Tables */

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Usuarios]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Usuarios]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[UsoDocenEstacionamiento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [UsoDocenEstacionamiento]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[UsoAlumEstacionamiento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [UsoAlumEstacionamiento]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[HorarioLogueo]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [HorarioLogueo]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Estacionamiento]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Estacionamiento]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[EspaciosEstacionamieno]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [EspaciosEstacionamieno]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Empleados]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Empleados]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Docentes]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Docentes]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Departamentos]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Departamentos]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Casetas]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Casetas]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Carreras]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Carreras]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Alumnos]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Alumnos]
GO

/* Create Tables */

CREATE TABLE [Usuarios]
(
	[usr_NomUsuario] varchar(50) NOT NULL,
	[usr_Contraseņa] varchar(50) NOT NULL,
	[usr_IdEmpleado] int NOT NULL
)
GO

CREATE TABLE [UsoDocenEstacionamiento]
(
	[ude_idRegistro] int NOT NULL,
	[ude_idPosicion] int NOT NULL,
	[ude_idEmpleado] int NOT NULL,
	[ude_Placas] varchar(15) NOT NULL,
	[ude_Fecha] date NOT NULL,
	[ude_HoraEntrada] time(7) NOT NULL,
	[ude_HoraSalida] time(7) NOT NULL
)
GO

CREATE TABLE [UsoAlumEstacionamiento]
(
	[uae_idRegistro] int NOT NULL,
	[uae_idPosicion] int NOT NULL,
	[uae_Matricula] varchar(8) NOT NULL,
	[uae_Placas] varchar(15) NOT NULL,
	[uae_Fecha] date NOT NULL,
	[uae_HoraEntrada] time(7) NOT NULL,
	[uae_HoraSalida] time(7) NOT NULL
)
GO

CREATE TABLE [HorarioLogueo]
(
	[log_Id] int NOT NULL,
	[log_NomUsuario] varchar(50) NOT NULL,
	[log_HoraConexion] datetime NOT NULL,
	[log_HoraDesconexion] datetime NOT NULL,
	[log_IdCaseta] int NOT NULL,
	[log_PCConexion] varchar(50) NOT NULL
)
GO

CREATE TABLE [Estacionamiento]
(
	[est_id] int NOT NULL,
	[est_Descripcion] varchar(50) NOT NULL
)
GO

CREATE TABLE [EspaciosEstacionamieno]
(
	[esp_id] int NOT NULL,
	[esp_Posicion] varchar(10) NOT NULL,
	[esp_Invalido] bit NOT NULL,
	[esp_idEstacionamiento] int NOT NULL,
	[esp_EnUso] bit NOT NULL
)
GO

CREATE TABLE [Empleados]
(
	[emp_id] int NOT NULL,
	[emp_Nombre] varchar(50) NOT NULL,
	[emp_ApPaterno] varchar(50) NOT NULL,
	[emp_ApMaterno] varchar(50) NOT NULL,
	[emp_idDepto] int NOT NULL,
	[emp_Telefono] varchar(10) NOT NULL,
	[emp_Celular] varchar(10) NOT NULL,
	[emp_Email] varchar(100) NOT NULL
)
GO

CREATE TABLE [Docentes]
(
	[doc_Id] int NOT NULL,
	[doc_IdDepto] int NOT NULL,
	[doc_IdEmpleado] int NOT NULL
)
GO

CREATE TABLE [Departamentos]
(
	[dep_id] int NOT NULL,
	[dep_Nombre] varchar(50) NOT NULL
)
GO

CREATE TABLE [Casetas]
(
	[cst_Id] int NOT NULL,
	[cst_Descripcion] varchar(200) NOT NULL
)
GO

CREATE TABLE [Carreras]
(
	[car_id] varchar(5) NOT NULL,
	[car_Nombre] varchar(50) NOT NULL,
	[car_idDepto] int NOT NULL
)
GO

CREATE TABLE [Alumnos]
(
	[alum_Matricula] varchar(8) NOT NULL,
	[alum_Nombre] varchar(50) NOT NULL,
	[alum_Apellido Paterno] varchar(50) NOT NULL,
	[alum_Apellido Materno] varchar(50) NOT NULL,
	[alum_idCarrera] varchar(5) NOT NULL,
	[alum_Foto] image NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [Usuarios] 
 ADD CONSTRAINT [PK_Usuarios]
	PRIMARY KEY CLUSTERED ([usr_NomUsuario])
GO

CREATE INDEX [IXFK_Usuarios_Empleados] 
 ON [Usuarios] ([usr_IdEmpleado] ASC)
GO

ALTER TABLE [UsoDocenEstacionamiento] 
 ADD CONSTRAINT [PK_UsoDocenEstacionamiento]
	PRIMARY KEY CLUSTERED ([ude_idRegistro])
GO

CREATE INDEX [IXFK_UsoDocenEstacionamiento_Empleados] 
 ON [UsoDocenEstacionamiento] ([ude_idEmpleado] ASC)
GO

CREATE INDEX [IXFK_UsoDocenEstacionamiento_EspaciosEstacionamieno] 
 ON [UsoDocenEstacionamiento] ([ude_idPosicion] ASC)
GO

ALTER TABLE [UsoAlumEstacionamiento] 
 ADD CONSTRAINT [PK_UsoAlumEstacionamiento]
	PRIMARY KEY CLUSTERED ([uae_idRegistro])
GO

CREATE INDEX [IXFK_UsoAlumEstacionamiento_Alumnos] 
 ON [UsoAlumEstacionamiento] ([uae_Matricula] ASC)
GO

CREATE INDEX [IXFK_UsoAlumEstacionamiento_EspaciosEstacionamieno] 
 ON [UsoAlumEstacionamiento] ([uae_idPosicion] ASC)
GO

ALTER TABLE [HorarioLogueo] 
 ADD CONSTRAINT [PK_HorarioLogueo]
	PRIMARY KEY CLUSTERED ([log_Id])
GO

CREATE INDEX [IXFK_HorarioLogueo_Casetas] 
 ON [HorarioLogueo] ([log_IdCaseta] ASC)
GO

CREATE INDEX [IXFK_HorarioLogueo_Usuarios] 
 ON [HorarioLogueo] ([log_NomUsuario] ASC)
GO

ALTER TABLE [Estacionamiento] 
 ADD CONSTRAINT [PK_Estacionamiento]
	PRIMARY KEY CLUSTERED ([est_id])
GO

ALTER TABLE [EspaciosEstacionamieno] 
 ADD CONSTRAINT [PK_EspaciosEstacionamieno]
	PRIMARY KEY CLUSTERED ([esp_id])
GO

CREATE INDEX [IXFK_EspaciosEstacionamieno_Estacionamiento] 
 ON [EspaciosEstacionamieno] ([esp_idEstacionamiento] ASC)
GO

ALTER TABLE [Empleados] 
 ADD CONSTRAINT [PK_Empleados]
	PRIMARY KEY CLUSTERED ([emp_id])
GO

CREATE INDEX [IXFK_Empleados_Departamentos] 
 ON [Empleados] ([emp_idDepto] ASC)
GO

ALTER TABLE [Docentes] 
 ADD CONSTRAINT [PK_Docentes]
	PRIMARY KEY CLUSTERED ([doc_Id])
GO

CREATE INDEX [IXFK_Docentes_Empleados] 
 ON [Docentes] ([doc_IdEmpleado] ASC)
GO

ALTER TABLE [Departamentos] 
 ADD CONSTRAINT [PK_Departamentos]
	PRIMARY KEY CLUSTERED ([dep_id])
GO

ALTER TABLE [Casetas] 
 ADD CONSTRAINT [PK_Casetas]
	PRIMARY KEY CLUSTERED ([cst_Id])
GO

ALTER TABLE [Carreras] 
 ADD CONSTRAINT [PK_Carreras]
	PRIMARY KEY CLUSTERED ([car_id])
GO

CREATE INDEX [IXFK_Carreras_Departamentos] 
 ON [Carreras] ([car_idDepto] ASC)
GO

ALTER TABLE [Alumnos] 
 ADD CONSTRAINT [PK_Alumnos]
	PRIMARY KEY CLUSTERED ([alum_Matricula])
GO

CREATE INDEX [IXFK_Alumnos_Carreras] 
 ON [Alumnos] ([alum_idCarrera] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [Usuarios] ADD CONSTRAINT [FK_Usuarios_Empleados]
	FOREIGN KEY ([usr_IdEmpleado]) REFERENCES [Empleados] ([emp_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UsoDocenEstacionamiento] ADD CONSTRAINT [FK_UsoDocenEstacionamiento_Empleados]
	FOREIGN KEY ([ude_idEmpleado]) REFERENCES [Empleados] ([emp_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UsoDocenEstacionamiento] ADD CONSTRAINT [FK_UsoDocenEstacionamiento_EspaciosEstacionamieno]
	FOREIGN KEY ([ude_idPosicion]) REFERENCES [EspaciosEstacionamieno] ([esp_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UsoAlumEstacionamiento] ADD CONSTRAINT [FK_UsoAlumEstacionamiento_Alumnos]
	FOREIGN KEY ([uae_Matricula]) REFERENCES [Alumnos] ([alum_Matricula]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [UsoAlumEstacionamiento] ADD CONSTRAINT [FK_UsoAlumEstacionamiento_EspaciosEstacionamieno]
	FOREIGN KEY ([uae_idPosicion]) REFERENCES [EspaciosEstacionamieno] ([esp_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [HorarioLogueo] ADD CONSTRAINT [FK_HorarioLogueo_Casetas]
	FOREIGN KEY ([log_IdCaseta]) REFERENCES [Casetas] ([cst_Id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [HorarioLogueo] ADD CONSTRAINT [FK_HorarioLogueo_Usuarios]
	FOREIGN KEY ([log_NomUsuario]) REFERENCES [Usuarios] ([usr_NomUsuario]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [EspaciosEstacionamieno] ADD CONSTRAINT [FK_EspaciosEstacionamieno_Estacionamiento]
	FOREIGN KEY ([esp_idEstacionamiento]) REFERENCES [Estacionamiento] ([est_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Empleados] ADD CONSTRAINT [FK_Empleados_Departamentos]
	FOREIGN KEY ([emp_idDepto]) REFERENCES [Departamentos] ([dep_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Docentes] ADD CONSTRAINT [FK_Docentes_Empleados]
	FOREIGN KEY ([doc_IdEmpleado]) REFERENCES [Empleados] ([emp_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Carreras] ADD CONSTRAINT [FK_Carreras_Departamentos]
	FOREIGN KEY ([car_idDepto]) REFERENCES [Departamentos] ([dep_id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Alumnos] ADD CONSTRAINT [FK_Alumnos_Carreras]
	FOREIGN KEY ([alum_idCarrera]) REFERENCES [Carreras] ([car_id]) ON DELETE No Action ON UPDATE No Action
GO

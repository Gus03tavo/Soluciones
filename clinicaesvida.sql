

create table Pacientes(
pac_id int IDENTITY(1,1) PRIMARY KEY,
pac_nombre varchar(50) not null,
pac_apellido varchar(50) not null,
pac_fechanac date not null,
pac_telefono char(9) not null,
pac_correo varchar(80)not null unique,
pac_contra varchar(80) not null,
pac_status bit default 1
);


create table Doctores(
doc_id int identity(1,1) primary key,
doc_nombreCom varchar(120) not null,
doc_dni char(8) not null,
doc_correo varchar(80)not null unique CHECK (doc_correo LIKE '%@clinicaesvida.com'),
doc_especialidad varchar(50) not null,
doc_telefono char(9)not null,
doc_contra varchar(80)not null,
doc_status bit default 1
)

create table Citas(
cita_id int identity(1,1) primary key,
pac_id int,
doc_id int,
cita_especialidad varchar(40) not null,
cita_fecha date not null,
cita_comentario varchar(max) null,
cita_status bit default 1,
FOREIGN KEY (pac_id) REFERENCES Pacientes(pac_id),
FOREIGN KEY (doc_id) REFERENCES Doctores(doc_id)
);

create table Citas2(
cita_id int identity(1,1) primary key ,
cita_nombre varchar(50) not null,
cita_correo varchar(80) not null,
cita_fecha date not null,
cita_especialidad varchar(50) not null,
cita_telefono char(9) not null,
cita_comentario varchar(max) null,
cita_status bit default 1,
);
-
--drop table citas

--drop table doctores

--drop table Pacientes




select * from Pacientes
select * from Doctores

select Pacientes.*,Citas.*,Doctores.* From Citas inner join Doctores on  Citas.doc_id = Doctores.doc_id inner join Pacientes on Citas.pac_id=Pacientes.pac_id;

select Pacientes.pac_nombre,Pacientes.pac_apellido,Pacientes.pac_correo,Pacientes.pac_telefono,
	Citas.cita_fecha,
	Doctores.doc_especialidad,
	Citas.cita_comentario
	From Citas inner join Doctores on  Citas.doc_id = Doctores.doc_id 
	inner join Pacientes on Citas.pac_id=Pacientes.pac_id;

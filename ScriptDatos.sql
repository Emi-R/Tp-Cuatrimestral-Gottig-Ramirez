Insert into Perfiles (Nombre) Values ('Gerente')
Insert into Perfiles (Nombre) Values ('Mesero')

Insert into Provincias (Nombre) Values ('Buenos Aires');
Insert into Provincias (Nombre) Values ('Cordoba');
Insert into Provincias (Nombre) Values ('Mendoza');
Insert into Provincias (Nombre) Values ('Santa Fe');
Insert into Provincias (Nombre) Values ('Misiones');
Insert into Provincias (Nombre) Values ('La Pampa');
Insert into Provincias (Nombre) Values ('Chubut');
Insert into Provincias (Nombre) Values ('Neuquen');
Insert into Provincias (Nombre) Values ('Santa Cruz');
Insert into Provincias (Nombre) Values ('Tucuman');
Go

Insert into Ciudades (Nombre, IDProvincia) Values ('Buenos Aires', 1);
Insert into Ciudades (Nombre, IDProvincia) Values ('Cordoba', 2);
Insert into Ciudades (Nombre, IDProvincia) Values ('Mendoza', 3);
Insert into Ciudades (Nombre, IDProvincia) Values ('Santa Fe', 4);
Insert into Ciudades (Nombre, IDProvincia) Values ('Misiones', 5);
Insert into Ciudades (Nombre, IDProvincia) Values ('La Pampa', 6);
Insert into Ciudades (Nombre, IDProvincia) Values ('Chubut', 7);
Insert into Ciudades (Nombre, IDProvincia) Values ('Neuquen', 8);
Insert into Ciudades (Nombre, IDProvincia) Values ('Santa Cruz', 9);
Insert into Ciudades (Nombre, IDProvincia) Values ('Tucuman', 10);
Go

Select * from Ciudades

Insert into Localidades (Nombre, IDCiudad) Values ('Buenos Aires', 1);
Insert into Localidades (Nombre, IDCiudad) Values ('Cordoba', 2);
Insert into Localidades (Nombre, IDCiudad) Values ('Mendoza', 3);
Insert into Localidades (Nombre, IDCiudad) Values ('Santa Fe', 4);
Insert into Localidades (Nombre, IDCiudad) Values ('Misiones', 5);
Insert into Localidades (Nombre, IDCiudad) Values ('La Pampa', 6);
Insert into Localidades (Nombre, IDCiudad) Values ('Chubut', 7);
Insert into Localidades (Nombre, IDCiudad) Values ('Neuquen', 8);
Insert into Localidades (Nombre, IDCiudad) Values ('Santa Cruz', 9);
Insert into Localidades (Nombre, IDCiudad) Values ( 'Tucuman', 10);
Go


insert into Mesas (MeseroAsignado, Numero, Capacidad) values (5, 1, 6);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (4, 2, 1);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (3, 3, 5);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (10, 4, 3);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (6, 5, 5);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (2, 6, 1);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (8, 7, 1);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (2, 8, 3);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (5, 9, 6);
insert into Mesas (MeseroAsignado, Numero, Capacidad) values (4, 10, 6);
Go

insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('lfdi', 42672165, 'Kù', 'Eltringham', '8645977039', 'geltringham0@sun.com', 'Reindahl', '7193', null, null, 8, 2, '1991-12-25 16:16:40', '2019-10-26 04:18:54', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('gdhb', 22143859, 'Léonie', 'Draayer', '9689906602', 'ldraayer1@va.gov', 'Nobel', '2', null, null, 3, 2, '1998-08-10 20:39:41', '2020-03-16 07:18:40', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('ocmj', 15033506, 'Lén', 'McIlwrick', '1994617416', 'pmcilwrick2@omniture.com', 'Brown', '4533', null, null, 5, 2, '1997-09-16 12:11:39', '2021-11-13 11:08:54', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('zjfv', 17100895, 'Andréa', 'Kringe', '2778920958', 'nkringe3@wikia.com', 'Michigan', '841', null, null, 8, 2, '1996-05-13 18:55:34', '2020-11-05 12:29:51', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('pelf', 43611217, 'Magdalène', 'Parkhouse', '4735875523', 'sparkhouse4@themeforest.net', 'Rieder', '4333', null, null, 9, 2, '1998-01-01 04:09:37', '2020-06-09 19:10:18', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('amub', 38931946, 'Daphnée', 'Gascoigne', '4783653726', 'jgascoigne5@moonfruit.com', 'Mcguire', '5895', null, null, 10, 2, '1998-09-02 11:26:50', '2022-08-05 19:57:56', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('inwj', 20736674, 'Örjan', 'Tandy', '7976930835', 'mtandy6@noaa.gov', 'Pearson', '9215', null, null, 2, 2, '1994-05-19 00:02:18', '2019-09-14 18:40:19', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('rxgf', 23367514, 'Judicaël', 'Cordie', '5508976418', 'jcordie7@domainmarket.com', 'Nelson', '00', null, null, 3, 2, '1995-08-17 06:55:21', '2021-05-21 18:43:21', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('cjjb', 36909435, 'Adèle', 'Westwell', '4933840137', 'swestwell8@hp.com', 'Crest Line', '806', null, null, 5, 2, '1999-06-09 03:21:26', '2021-12-24 07:51:03', 2);
insert into Usuarios (Contraseña, DNI, Nombre, Apellidos, Telefono, Email, Calle, Numero, Piso, Departamento, IDLocalidad, TipoPerfil, FechaNac, FechaRegistro, Estado) values ('acyc', 14509792, 'Irène', 'Garthside', '1724077704', 'sgarthside9@dion.ne.jp', 'Crowley', '4', null, null, 8, 2, '1994-05-10 06:56:28', '2019-10-16 16:55:39', 2);
Go

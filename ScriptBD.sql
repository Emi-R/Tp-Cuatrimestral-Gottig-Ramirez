Create Database Restaurant
GO

Use Restaurant
Go

Create Table Perfiles
(
    ID tinyint Primary Key Identity(1,1),
    Nombre Varchar(20) Not Null
)

Create Table Provincias(
    ID int Primary Key Identity(1,1),
    Nombre varchar(20)
)

Create Table Ciudades(
    ID int Primary Key Identity(1,1),
    Nombre varchar(30),
    IDProvincia int Not Null Foreign Key References Provincias(ID)
)

Create Table Localidades(
    ID int Primary Key Identity(1,1),
    Nombre varchar(30),
    IDCiudad int Not Null Foreign Key References Ciudades(ID)
)

Create Table Usuarios(
    Legajo Int Primary Key Identity(1,1),
    Contraseña varchar(10) Not Null,
    Dni varchar(10) Unique Not Null,
    Nombre varchar(30),
    Apellidos varchar(30) Not Null,
    Telefono varchar(15) Not Null,
    Email varchar(30) Not Null,
    Calle varchar(20) Not Null,
    Numero varchar(5) Not Null,
    Piso tinyint Null,
    Departamento char(1) Null,
    IDLocalidad int Not Null Foreign Key References Localidades(ID),
    TipoPerfil tinyint Not Null Foreign Key References Perfiles(ID),
    FechaNac date Not Null,
    FechaRegistro date Not Null,
    Estado bit Not Null
)

Create Table Mesas(
    ID Int Not Null Primary Key Identity(1,1),
    MeseroAsignado Int Null Foreign Key References Usuarios(Legajo),
    Numero Int Not Null,
    Capacidad Int Not Null,
    Ocupado Bit Not Null Default(0),
    Reservado Bit Not Null Default(0),
    Activo Bit Not Null Default(1)
)

Create table TipoInsumo(
Id int primary key identity(1,1),
Nombre varchar(150),
Activo bit not null default 1
)
go

Create table Marcas(
Id int primary key identity(1,1),
Nombre varchar(max),
Activo bit not null default 1
)
go

Create table Insumos(
Id int primary key identity(1,1),
Nombre varchar(150),
Precio money,
IdTipoInsumo int foreign key references TipoInsumo(Id) not null,
Capacidad float,
Marca int foreign key references Marcas(Id) null,
Alcoholica bit default 0,
Activo bit not null default 1
)
Go

-- Store Procedures

Create Procedure SpListarInsumos
As
Begin
Select i.Id, i.Nombre, Precio, ti.Nombre As Tipo,
m.Nombre As Marca
From Insumos i
Inner join TipoInsumo ti
On i.IdTipoInsumo = ti.Id
Left Join Marcas m
On i.Id = m.Id
Where i.Activo = 1
end
Go 

Create Procedure SpListarUsuarios
As 
Begin 
Select 
    U.Legajo,
    U.TipoPerfil,
    U.Apellidos, 
    U.Nombre,
    U.Dni,
    U.Telefono,
    U.Email,
    U.Calle,
    U.Numero,
    U.Piso,
    U.FechaNac,
    U.FechaRegistro,
    U.Estado
From Usuarios U 
End
Go 

Create Procedure SpListarMesas 
As
Begin
Select 
    M.Numero, 
    U.Legajo, 
    U.Apellidos, 
    U.Nombre, 
    M.Capacidad, 
    M.Ocupado, 
    M.Reservado, 
    M.Activo 
From Mesas M 
Inner Join Usuarios U On M.MeseroAsignado = U.Legajo
End
Go 

Exec SpListarUsuarios
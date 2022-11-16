Create Database Restaurant
GO

Use Restaurant
Go

Create Table Perfiles
(
    ID tinyint Primary Key Identity(1,1),
    Nombre Varchar(20) Not Null
)

Create Table Paises
(
    ID int Primary Key Identity (1, 1),
    Nombre Varchar(20) Not Null
)

Create Table Usuarios(
    Legajo Int Primary Key Identity(1,1),
    Contraseña varchar(10) Not Null,
    Dni varchar(15) Unique Not Null,
    Nombre varchar(40),
    Apellidos varchar(40) Not Null,
    Telefono varchar(20) Not Null,
    Email varchar(40) Not Null,
    Calle varchar(40) Not Null,
    Numero varchar(5) Not Null,
    Piso varchar(5) Null,
    Departamento char(1) Null,
    IDNacionalidad int Not Null Foreign Key References Paises(ID),
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

Alter Procedure SpListarUsuarios
As 
Begin 
Select 
    U.Legajo,
    U.Apellidos,
    U.Nombre,
    U.Dni,
    P.Nombre as Pais,
    U.TipoPerfil,
    U.Telefono,
    U.Email,
    U.Calle,
    U.Numero,
    U.Piso,
    CONVERT(VARCHAR(10),U.FechaNac ,103) AS FechaNac,
    CONVERT(VARCHAR(10),U.FechaRegistro ,103) AS FechaRegistro,
    U.Estado
From Usuarios U Inner Join Paises P On U.IDNacionalidad = P.ID
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
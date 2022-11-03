Create Database Restaurant
GO

Use Restaurant
Go

Create Table Usuarios(
    Legajo Int Primary Key
)

Create Table Mesas(
    ID Int Not Null Primary Key Identity(1,1),
    MeseroAsignado Int Null Foreign Key References Usuarios(Legajo),
    Numero Int Not Null,
    Capacidad Int Not Null,
    Ocupado Bit Not Null Default(0),
    Activo Bit Not Null Default(1)
)
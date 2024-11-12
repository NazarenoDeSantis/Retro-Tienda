create table Roles (
    idRol int primary key,
    Nombre varchar(255) not null
);


insert into Roles (idRol, Nombre) values (1, 'Admin');
insert into Roles (idRol, Nombre) values (2, 'Empleado');
insert into Roles (idRol, Nombre) values (3, 'Usuario');


select * from usuarios
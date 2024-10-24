-- Crear la base de datos
CREATE DATABASE Ecommerce_DB;
GO

USE Ecommerce_DB;
GO

-- Tabla Usuario
CREATE TABLE Usuario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(100) NOT NULL UNIQUE,
    clave NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(255),
    telefono NVARCHAR(25),
    localidad NVARCHAR(100), 
    fecha_nacimiento DATE,   
    estado NVARCHAR(50)
);
GO

-- Tabla Categorias
CREATE TABLE Categorias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
    --descripcion NVARCHAR(MAX)
);
GO

-- Tabla Articulo
CREATE TABLE Articulo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT NULL, -- Permitir NULL para ON DELETE SET NULL
    CONSTRAINT FK_Articulo_Categoria FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);
GO

-- Tabla Carrito
CREATE TABLE Carrito (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NULL, -- Permitir NULL si se elimina el usuario
    total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Carrito_Usuario FOREIGN KEY (usuario_id) REFERENCES Usuario(id) 
);
GO

-- Tabla Pedido
CREATE TABLE Pedido (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NULL, -- Permitir NULL si se elimina el usuario
    carrito_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    fecha_pedido DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(20) NOT NULL DEFAULT 'pendiente',
    direccion_envio NVARCHAR(255),
    CONSTRAINT FK_Pedido_Usuario FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ,
    CONSTRAINT FK_Pedido_Carrito FOREIGN KEY (carrito_id) REFERENCES Carrito(id) 
);
GO

-- Tabla intermedia para los artículos en el carrito
CREATE TABLE Carrito_Articulo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    carrito_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT FK_CarritoArticulo_Carrito FOREIGN KEY (carrito_id) REFERENCES Carrito(id) ,
    CONSTRAINT FK_CarritoArticulo_Articulo FOREIGN KEY (articulo_id) REFERENCES Articulo(id) 
);
GO

-- Tabla intermedia para los artículos en el pedido
CREATE TABLE Pedido_Articulo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pedido_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_PedidoArticulo_Pedido FOREIGN KEY (pedido_id) REFERENCES Pedido(id) ,
    CONSTRAINT FK_PedidoArticulo_Articulo FOREIGN KEY (articulo_id) REFERENCES Articulo(id) 
);
GO

CREATE TABLE Imagenes (
    id_imagen INT IDENTITY(1,1) PRIMARY KEY,  
    id_articulo INT,                         
    url NVARCHAR(255) NOT NULL,               
    CONSTRAINT FK_Imagenes_Articulo FOREIGN KEY (id_articulo) REFERENCES Articulo(id) 
);
GO



-- INSERTs para la tabla Usuario
INSERT INTO Usuario (nombre, correo, clave, direccion, telefono, localidad, fecha_nacimiento, estado)
VALUES ('Juan Perez', 'juan.perez@mail.com', 'clave123', 'Calle Falsa 123', '555-1234', 'Buenos Aires', '1985-05-10', 'activo');

INSERT INTO Usuario (nombre, correo, clave, direccion, telefono, localidad, fecha_nacimiento, estado)
VALUES ('Maria Lopez', 'maria.lopez@mail.com', 'clave456', 'Av. Siempre Viva 456', '555-5678', 'Cordoba', '1990-09-15', 'activo');
GO

-- INSERTs para la tabla Categorias
INSERT INTO Categorias (nombre)
VALUES ('Electrónica');

INSERT INTO Categorias (nombre)
VALUES ('Hogar');
GO

-- INSERTs para la tabla Articulo
INSERT INTO Articulo (nombre, descripcion, precio, stock, categoria_id)
VALUES ('Laptop', 'Laptop con 8GB de RAM y 256GB SSD', 1000.00, 50, 1); -- categoría Electrónica

INSERT INTO Articulo (nombre, descripcion, precio, stock, categoria_id)
VALUES ('Aspiradora', 'Aspiradora de 1500W con bolsa', 300.00, 30, 2); -- categoría Hogar
GO

-- INSERTs para la tabla Carrito
INSERT INTO Carrito (usuario_id, total)
VALUES (1, 0.00); -- carrito de Juan Perez

INSERT INTO Carrito (usuario_id, total)
VALUES (2, 0.00); -- carrito de Maria Lopez
GO

-- INSERTs para la tabla Pedido
INSERT INTO Pedido (usuario_id, carrito_id, total, direccion_envio)
VALUES (1, 1, 1500.00, 'Calle Falsa 123'); -- pedido de Juan Perez

INSERT INTO Pedido (usuario_id, carrito_id, total, direccion_envio)
VALUES (2, 2, 300.00, 'Av. Siempre Viva 456'); -- pedido de Maria Lopez
GO

-- INSERTs para la tabla Carrito_Articulo
INSERT INTO Carrito_Articulo (carrito_id, articulo_id, cantidad)
VALUES (1, 1, 1); -- Juan Perez compra 1 laptop

INSERT INTO Carrito_Articulo (carrito_id, articulo_id, cantidad)
VALUES (2, 2, 1); -- Maria Lopez compra 1 aspiradora
GO

-- INSERTs para la tabla Pedido_Articulo
INSERT INTO Pedido_Articulo (pedido_id, articulo_id, cantidad, precio_unitario)
VALUES (1, 1, 1, 1000.00); -- 1 laptop en el pedido de Juan Perez

INSERT INTO Pedido_Articulo (pedido_id, articulo_id, cantidad, precio_unitario)
VALUES (2, 2, 1, 300.00); -- 1 aspiradora en el pedido de Maria Lopez
GO

-- INSERT para la tabla Imagenes
INSERT INTO Imagenes (id_articulo, url)
VALUES (1, 'https://example.com/imagenes/laptop.jpg'); -- Imagen para el artículo con id 1 (Laptop)

INSERT INTO Imagenes (id_articulo, url)
VALUES (2, 'https://example.com/imagenes/aspiradora.jpg'); -- Imagen para el artículo con id 2 (Aspiradora)
GO
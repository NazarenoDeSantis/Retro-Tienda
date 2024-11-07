-- Crear la base de datos
CREATE DATABASE Ecommerce_DB;
GO

USE Ecommerce_DB;
GO

-- Tabla Usuario
CREATE TABLE Usuarios (
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
CREATE TABLE Articulos (
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
CREATE TABLE Carritos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NULL, -- Permitir NULL si se elimina el usuario
    total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Carrito_Usuario FOREIGN KEY (usuario_id) REFERENCES Usuario(id) 
);
GO

-- Tabla Pedido
CREATE TABLE Pedidos (
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

-- Tabla intermedia para los art�culos en el carrito
CREATE TABLE Carrito_Articulo (
    id INT IDENTITY(1,1) PRIMARY KEY,
    carrito_id INT NOT NULL,
    articulo_id INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT FK_CarritoArticulo_Carrito FOREIGN KEY (carrito_id) REFERENCES Carrito(id) ,
    CONSTRAINT FK_CarritoArticulo_Articulo FOREIGN KEY (articulo_id) REFERENCES Articulo(id) 
);
GO

-- Tabla intermedia para los art�culos en el pedido
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
INSERT INTO Usuarios (nombre, correo, clave, direccion, telefono, localidad, fecha_nacimiento, estado)
VALUES ('Juan Perez', 'juan.perez@mail.com', 'clave123', 'Calle Falsa 123', '555-1234', 'Buenos Aires', '1985-05-10', 'activo');

INSERT INTO Usuarios (nombre, correo, clave, direccion, telefono, localidad, fecha_nacimiento, estado)
VALUES ('Maria Lopez', 'maria.lopez@mail.com', 'clave456', 'Av. Siempre Viva 456', '555-5678', 'Cordoba', '1990-09-15', 'activo');
GO

-- INSERTs para la tabla Categorias
INSERT INTO Categorias (nombre)
VALUES ('Regaleria');

INSERT INTO Categorias (nombre)
VALUES ('Indumentaria');
GO

-- INSERTs para la tabla Articulo
INSERT INTO [Articulos] ([nombre], [descripcion], [precio], [stock], [categoria_id])
VALUES
('Radiograbador Antiguo', 'Radiograbador vintage con casetes y radio AM/FM', 1500.00, 10, 1),
('Televisor CRT', 'Televisor antiguo de tubo con control manual', 2500.00, 5, 1),
('M�quina de Escribir', 'M�quina de escribir mec�nica para uso personal', 1200.00, 7, 1),
('Tel�fono de Disco', 'Tel�fono retro de disco con cable largo', 900.00, 12, 1),
('Vinilo de M�sica Cl�sica', 'Disco de vinilo con grandes �xitos de m�sica cl�sica', 500.00, 20, 1),
('C�mara Fotogr�fica Anal�gica', 'C�mara fotogr�fica de rollo con lente intercambiable', 3500.00, 4, 1),
('Walkman Sony', 'Reproductor de casetes port�til marca Sony', 2200.00, 8, 1),
('Proyector de Diapositivas', 'Proyector para diapositivas de 35mm', 3000.00, 3, 1),
('Reloj Despertador Mec�nico', 'Reloj despertador con campana y cuerda manual', 700.00, 15, 1),
('Yoyo antiguo', 'Yoyo antiguo', 900.00, 15, 1),
('Agujereadora manual antigua', 'Agujereadora manual antigua', 1300.00, 9, 1),
('Grabadora de Voz', 'Grabadora de voz con microcasetes', 1300.00, 9, 1),
('Remera de los 90 s', 'Remera retro', 4000.00, 6, 2),
('Bufanda antigua', 'Bufanda retro', 300.00, 30, 2),
('Reloj pulsera retro', 'Reloj pulsera antigup', 800.00, 25, 2);

-- INSERTs para la tabla Carrito
INSERT INTO Carritos (usuario_id, total)
VALUES (1, 0.00); -- carrito de Juan Perez

INSERT INTO Carritos (usuario_id, total)
VALUES (2, 0.00); -- carrito de Maria Lopez
GO

-- INSERTs para la tabla Pedido
INSERT INTO Pedidos (usuario_id, carrito_id, total, direccion_envio)
VALUES (1, 1, 1500.00, 'Calle Falsa 123'); -- pedido de Juan Perez

INSERT INTO Pedidos(usuario_id, carrito_id, total, direccion_envio)
VALUES (2, 2, 300.00, 'Av. Siempre Viva 456'); -- pedido de Maria Lopez
GO

-- INSERTs para la tabla Carrito_Articulo
INSERT INTO Carrito_Articulos (carrito_id, articulo_id, cantidad)
VALUES (1, 1, 1); -- Juan Perez compra 1 laptop

INSERT INTO Carrito_Articulos (carrito_id, articulo_id, cantidad)
VALUES (2, 2, 1); -- Maria Lopez compra 1 aspiradora
GO

-- INSERTs para la tabla Pedido_Articulo
INSERT INTO Pedido_Articulos (pedido_id, articulo_id, cantidad, precio_unitario)
VALUES (1, 1, 1, 1000.00); -- 1 laptop en el pedido de Juan Perez

INSERT INTO Pedido_Articulos (pedido_id, articulo_id, cantidad, precio_unitario)
VALUES (2, 2, 1, 300.00); -- 1 aspiradora en el pedido de Maria Lopez
GO

-- INSERT para la tabla Imagenes
-- Insertar 15 im�genes para diferentes art�culos
INSERT INTO [Imagenes] ([id_articulo], [url])
VALUES
(1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF8tB2UL2IhzLBsl0m9Q78tpuQ4xCxeni8Hw&s'),  -- Radiograbador antiguo
(2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRcM4oUIECQe7EtVHD26GNGWkaWy52FESM1g&s'),  -- televisor crt
(3, 'https://www.hermanoscastano.es/wp-content/uploads/2021/07/HCI07280-scaled-900x1011.jpg'),        -- M�quina de escribir
(4, 'https://www.museocostarica.go.cr/wp-content/grand-media/image/telefono-de-disco.jpg'),          -- Tel�fono de disco
(5, 'https://http2.mlstatic.com/D_NQ_NP_875519-MLA51615080855_092022-O.webp'),   -- Vinilo de m�sica cl�sica
(6, 'https://png.pngtree.com/png-vector/20240529/ourlarge/pngtree-compact-vintage-analog-camera-png-image_12547114.png'),        -- C�mara fotogr�fica anal�gica
(7, 'https://i0.wp.com/hipertextual.com/wp-content/uploads/2019/06/hipertextual-walkman-abuelo-ipod-cumple-40-anos-2019512483-860x573.jpg?resize=780%2C520&quality=70&strip=all&ssl=1'),            -- Walkman Sony
(8, 'https://http2.mlstatic.com/D_NQ_NP_674143-MLA71897377106_092023-O.webp'),  -- Proyector de diapositivas
(9, 'https://i.etsystatic.com/6858355/r/il/0b1900/3599636435/il_570xN.3599636435_itkg.jpg'),      -- Reloj despertador mec�nico
(10, 'https://i.ebayimg.com/thumbs/images/g/1Q4AAOSwrAFm2LUj/s-l1200.jpg'),          -- yoyo antiguo
(11, 'https://i.ebayimg.com/images/g/Hu0AAOSw~P9imjyW/s-l640.jpg'),            -- agujereadora manual antigua
(12, 'https://www.shutterstock.com/image-vector/vector-cassette-recorder-xxl-icon-600nw-75762229.jpg'),      -- gravadora de voz
(13, 'https://acdn.mitiendanube.com/stores/906/459/products/italia1-e1ad25a33da28d316b16002239341759-480-0.jpg'),      -- remera de los 90's
(14, 'https://m.media-amazon.com/images/I/41UVRe4k8LL._AC_SY580_.jpg'), --bufanda antigua
(15, 'https://a.1stdibscdn.com/omega-1940s-retro-rose-gold-and-rubies-bracelet-watch-for-sale/j_94/j_221583921709072820347/j_22158392_1709072821766_bg_processed.jpg');        -- reloj pulsera retro


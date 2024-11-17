
CREATE PROCEDURE sp_ListarArticulos
as
BEGIN
select a.idArticulo, a.nombre, a.descripcion, a.precio, a.stock, a.categoria_id, i.url, a.estado
 from Articulos a
 inner join imagenes i on a.idArticulo = i.idArticulo
 where a.estado = 1
 END;

GO

CREATE PROCEDURE spListarArticulosPorCategoria 
    @categoria_id INT
AS
BEGIN
    SELECT TOP 3 
        A.idArticulo,
        A.NOMBRE,
        A.DESCRIPCION,
        A.PRECIO,
        A.STOCK,
        A.categoria_id,
        I.url
    FROM 
        ARTICULOS A
    INNER JOIN 
        Imagenes I ON A.idArticulo = I.idarticulo
    WHERE 
        A.categoria_id = @categoria_id
        AND A.estado = 1
    ORDER BY 
        A.idArticulo;
END;

GO
CREATE PROCEDURE SP_InsertarArticulo
  @Nombre VARCHAR(100),
  @Descripcion VARCHAR(200),
  @Precio DECIMAL(10,2),
  @Stock INT,
  @Categoria INT,
  @URLIMAGEN VARCHAR(200)
AS
BEGIN
  -- Inicia una transacción para asegurar que ambas inserciones sean consistentes
  BEGIN TRANSACTION;

  BEGIN TRY
    -- Inserta el artículo en la tabla Articulos y captura el ID generado
    DECLARE @ArticuloID INT;
    
    INSERT INTO Articulos (nombre, descripcion, precio, stock, categoria_id)
    VALUES (@Nombre, @Descripcion, @Precio, @Stock, @Categoria);

    SET @ArticuloID = SCOPE_IDENTITY();

    -- Inserta la URL de la imagen en la tabla Imagenes, vinculada con el ID del artículo
    INSERT INTO Imagenes (idArticulo, url)
    VALUES (@ArticuloID, @URLIMAGEN);

    -- Confirma la transacción
    COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    -- Si ocurre un error, revierte la transacción
    ROLLBACK TRANSACTION;

    -- Lanza el error para que sea capturado por el código cliente
    PRINT ERROR_MESSAGE();
    THROW;
  END CATCH
END;
GO

CREATE PROCEDURE SP_ModificarArticulo
    @Id INT,
    @Nombre VARCHAR(100),
    @Descripcion VARCHAR(200),
    @Precio DECIMAL(10, 2),
    @Stock INT,
    @Categoria INT,
    @UrlImagen VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar la tabla Articulos
    UPDATE Articulos
    SET 
        nombre = @Nombre,
        descripcion = @Descripcion,
        precio = @Precio,
        stock = @Stock,
        categoria_id = @Categoria
    WHERE idArticulo = @Id;

    -- Actualizar la tabla Imagenes
    UPDATE Imagenes
    SET 
        url = @UrlImagen
    WHERE idArticulo = @Id;
END;
GO


create procedure SP_BajaLogicaArticulo
-- Get a list of tables and views in the current database
@idArticulo int
as
begin
update Articulos set estado = 0 where idArticulo = @idArticulo
end
GO

create procedure SP_ReactivacionLogicaArticulo
-- Get a list of tables and views in the current database
@idArticulo int
as
begin
update Articulos set estado = 1 where idArticulo = @idArticulo
end
GO


--CATEGORIAS

CREATE PROCEDURE SP_ModificarCategoria
    @Id INT,
    @Nombre VARCHAR(100)
 
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar la tabla Categoria
    UPDATE Categorias
    SET 
        nombre = @Nombre   
    WHERE idCategoria = @Id

END;
GO


create procedure SP_BajaLogicaCategoria
-- Get a list of tables and views in the current database
@idCategoria int
as
begin
update Categorias set estado = 0 where idCategoria = @idCategoria
end
GO


create procedure SP_ReactivacionCategoria
-- Get a list of tables and views in the current database
@nombre varchar
as
begin
update Categorias set estado = 1 where nombre = @nombre
end

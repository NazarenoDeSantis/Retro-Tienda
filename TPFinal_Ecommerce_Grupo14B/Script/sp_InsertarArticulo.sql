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
END
GO

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
END
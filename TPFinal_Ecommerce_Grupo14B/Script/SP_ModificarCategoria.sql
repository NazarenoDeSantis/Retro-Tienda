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

END
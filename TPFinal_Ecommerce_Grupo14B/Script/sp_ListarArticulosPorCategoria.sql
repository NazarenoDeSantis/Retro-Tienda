use Ecommerce_DB


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
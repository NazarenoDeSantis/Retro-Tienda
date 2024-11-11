SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ListarArticulos]
as
select a.idArticulo, a.nombre, a.descripcion, a.precio, a.stock, a.categoria_id, i.url, a.estado
 from Articulos a
 inner join imagenes i on a.idArticulo = i.idArticulo
GO

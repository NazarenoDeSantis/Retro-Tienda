create procedure SP_BajaLogicaArticulo
-- Get a list of tables and views in the current database
@idArticulo int
as
begin
update Articulos set estado = 0 where idArticulo = @idArticulo
end
GO
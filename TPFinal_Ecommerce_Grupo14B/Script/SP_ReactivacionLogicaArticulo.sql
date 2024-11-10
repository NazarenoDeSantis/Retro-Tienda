create procedure SP_ReactivacionLogicaArticulo
-- Get a list of tables and views in the current database
@idArticulo int
as
begin
update Articulos set estado = 1 where idArticulo = @idArticulo
end
GO

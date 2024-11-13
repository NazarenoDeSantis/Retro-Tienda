create procedure SP_BajaLogicaCategoria
-- Get a list of tables and views in the current database
@idCategoria int
as
begin
update Categorias set estado = 0 where idCategoria = @idCategoria
end
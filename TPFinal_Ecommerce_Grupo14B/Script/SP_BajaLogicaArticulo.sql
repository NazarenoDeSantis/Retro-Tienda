create procedure SP_BajaLCategoria
-- Get a list of tables and views in the current database
@id int
as
begin
update Categorias set estado = 0 where idCategoria = @id
end
GO

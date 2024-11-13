create procedure SP_ReactivacionCategoria
-- Get a list of tables and views in the current database
@nombre varchar
as
begin
update Categorias set estado = 1 where nombre = @nombre
end
using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> listar()
        {
            List<Categoria> lista = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select idCategoria, nombre from Categorias");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.Id = (int)datos.Lector["idCategoria"];
                    aux.Nombre = (string)datos.Lector["Nombre"];

                    lista.Add(aux);
                }

            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return lista;
        }

        public void agregar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM Categorias WHERE nombre = @nombre");
                datos.setearParametro("@nombre", categoria.Nombre);

                int cantidad = (int)datos.ejecutarAccionScalar();

                if(cantidad > 0)
                {
                    throw new Exception($"Ya existe una Categoría con nombre '{categoria.Nombre}' en la base de datos. ");
                }
                else
                {
                    datos.setearConsulta("INSERT INTO Categorias (nombre) VALUES (@nombre)");
                    datos.setearParametro("@nombre", categoria.Nombre);
                    datos.ejecutarAccion();
                }
            }
            catch (Exception ex )
            {

                throw new Exception("Error al agregar la Categoría : " + ex.Message) ;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminar(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta(" DELETE FROM Categorias WHERE idCategoria = @id");
                datos.setearParametro("id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw;
            }

        }

        public void modificar (Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT COUNT (*) FROM Categorias WHERE nombre = @nombre AND idCategoria <> @id");
                datos.setearParametro("@nombre", categoria.Nombre);
                datos.setearParametro("@id", categoria.Id);

                int cantidad = (int)datos.ejecutarAccionScalar();

                if(cantidad > 0)
                {
                    throw new Exception($"Ya existe una Categoria con el nombre '{categoria.Nombre}' en la base de datos. ");
                }
                else
                {
                    datos.setearConsulta("UPDATE Categorias SET nombre = @nombre WHERE idCategoria = @id");
                    datos.setearParametro("@nombre", categoria.Nombre);
                    datos.setearParametro("@id", categoria.Id);
                    datos.ejecutarAccion();
                }
            }
            catch (Exception ex)
            {

                throw new Exception("Error al modificar la Categoria " + ex.Message) ;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}

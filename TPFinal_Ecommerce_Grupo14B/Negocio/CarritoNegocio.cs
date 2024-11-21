using negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CarritoNegocio
    {
        //hacer un metodo para crear un nuevo carrito cuando se crea un nuevo usuario
        public void agregarCarrito(int idUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Configuramos la consulta SQL
                datos.setearConsulta("INSERT INTO Carritos (idUsuario, total, fecha_creacion) VALUES(@IdUsuario, 0, GETDATE())");
                datos.setearParametro("@IdUsuario", idUsuario);

                // Ejecutamos la acción
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                // Lanzamos una excepción detallada en caso de error
                throw new Exception("Error al agregar el carrito: " + ex.Message);
            }
            finally
            {
                // Cerramos la conexión en el bloque finally para garantizar que se liberen los recursos
                datos.cerrarConexion();
            }
        }

    }
}





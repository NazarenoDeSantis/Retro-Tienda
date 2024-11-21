using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Negocio
{
    public class PedidoNegocio
    {

        public void InstertarPedido(Pedido pedido)
        {
            
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into Pedidos values (@idUsuario, @idCarrito, @total, @fecha_pedido, @idTipoPedido, @direccion_envio)");
                datos.setearParametro("@idUsuario", pedido.UsuarioId);
                datos.setearParametro("@idCarrito", pedido.CarritoId);
                datos.setearParametro("@total", pedido.Total);
                datos.setearParametro("@fecha_pedido", DateTime.Now);
                datos.setearParametro("@idTipoPedido", pedido.Estado);
                datos.setearParametro("@direccion_envio", pedido.DireccionEnvio);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public List<Pedido> TraerPedido(int id)
        {
            List<Pedido> listaPedidos = new List<Pedido>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Configurar la consulta
                datos.setearConsulta("SELECT pe.idPedido, pe.idUsuario, pe.idCarrito, pe.total, pe.fecha_pedido, pe.idTipoPedido, tp.nombre AS tipoPedidoNombre, pe.direccion_envio " +
                                     "FROM Pedidos AS pe " +
                                     "INNER JOIN tipoPedidos AS tp ON pe.idTipoPedido = tp.idTipoPedido " +
                                     "WHERE pe.idUsuario = @id");

                // Agregar parámetro
                datos.setearParametro("@id", id);

                // Ejecutar lectura de datos
                datos.ejecutarLectura();

                // Leer y mapear los resultados
                while (datos.Lector.Read())
                {
                    Pedido pedido = new Pedido
                    {
                        Id = datos.Lector.GetInt32(0),
                        UsuarioId = datos.Lector.GetInt32(1), // Columna idUsuario
                        CarritoId = datos.Lector.GetInt32(2), // Columna idCarrito
                        Total = datos.Lector.GetDecimal(3), // Columna total
                        FechaPedido = datos.Lector.GetDateTime(4), // Columna fecha_pedido
                        Estado = datos.Lector.GetInt32(5), // Columna idTipoPedido
                        NameStatus = datos.Lector.GetString(6), // Columna nombre (alias tipoPedidoNombre)
                        DireccionEnvio = datos.Lector.GetString(7) // Columna direccion_envio
                    };

                    // Agregar pedido a la lista
                    listaPedidos.Add(pedido);
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                throw ex;
            }
            finally
            {
                // Cerrar conexión
                datos.cerrarConexion();
            }

            return listaPedidos;
        }



    }


}

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
                datos.setearParametro("@direccion_envio", "s/d");
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

       
    }


}

using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class Pagos : System.Web.UI.Page
    {
        PedidoNegocio pedidoNegocio = new PedidoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            TraerUsuario();
        }

        public void TraerUsuario()
        {
            List<Articulo> listaArticulos = Session["ListaArticulos"] as List<Articulo>;
            Dictionary<int, int> diccionarioCantidades = Session["DiccionarioCantidades"] as Dictionary<int, int>;
            int idArticulo = 1;

                Usuario usuario = new Usuario();
                usuario = (Usuario)Session["usuarioActual"];            
        }

        //OnClick="ConfirmPago_Click"
        protected void ConfirmPago_Click(object sender, EventArgs e)
        {

            GuardarPedido(); 

        }

        public void GuardarPedido()
        {
            Pedido pedido = new Pedido();
            // Recuperar datos de la sesión
            List<Articulo> listaArticulos = Session["ListaArticulos"] as List<Articulo>;
            Dictionary<int, int> diccionarioCantidades = Session["DiccionarioCantidades"] as Dictionary<int, int>;
            Usuario usuario = Session["usuarioActual"] as Usuario;

            if (listaArticulos == null || diccionarioCantidades == null || usuario == null)
            {
                // Manejar caso donde falten datos
                throw new InvalidOperationException("Faltan datos en la sesión para procesar el pedido.");
            }

            // Calcular el subtotal usando una expresión lambda
            decimal subtotal = listaArticulos
                .Where(a => diccionarioCantidades.ContainsKey(a.Id)) // Asegurarse de que el artículo esté en el diccionario
                .Sum(a => a.Precio * diccionarioCantidades[a.Id]);
            // Datos del pedido
            int idCarrito = usuario.Id; // Generar o asignar el ID del carrito según corresponda
            int idUsuario = usuario.Id;
            DateTime fecha = DateTime.Now;

            // Aquí puedes agregar lógica para guardar el pedido en la base de datos
            // por ejemplo, creando una instancia de Pedido o utilizando un servicio.

            // Ejemplo: Mostrar datos del pedido

            pedido.UsuarioId = idUsuario;
            pedido.CarritoId = idCarrito;
            pedido.Total = subtotal;
            pedido.FechaPedido = fecha;
            pedido.Estado = 2;
            pedido.DireccionEnvio = "";

            pedidoNegocio.InstertarPedido(pedido);

            //poner todos los valores en cero del carrito que ya se cargo la venta
            Session["ListaArticulos"] = null;
            Session["DiccionarioCantidades"] = null;
            listaArticulos = null;
            diccionarioCantidades = null;
            usuario = null;

        
        }


    }
}
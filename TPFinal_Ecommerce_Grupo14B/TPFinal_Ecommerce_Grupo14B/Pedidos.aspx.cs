using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;


namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class Pedidos : System.Web.UI.Page
    {
        List <Pedido> pedidos = new List <Pedido>();

        protected void Page_Load(object sender, EventArgs e)
        {

            CargarPedidosDePrueba();
            gvPedidos.DataSource = pedidos;
            gvPedidos.DataBind();

        }

        public void CargarPedidosDePrueba()
        {
            // cargate una clase con parametros
            Pedido pedido = new Pedido(1, 1, 1, 1000, DateTime.Now,   1,"En preparacion", "Bajo Flores");
            pedidos.Add(pedido);
            Pedido pedido1 = new Pedido(2, 1, 2, 2000, DateTime.Now, 1, "En preparacion", "La KOREA");
            pedidos.Add(pedido1);
            Pedido pedido2 = new Pedido(3, 1, 3, 3000, DateTime.Now, 1, "En preparacion", "sANTA RITA");
            pedidos.Add(pedido2);


        }
    }
}
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class Productos : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.listarConSP();


            if (!IsPostBack)
            {
                repRepetidor.DataSource = listaArticulos;
                repRepetidor.DataBind();
            }


        }


        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            
            LinkButton btnVerDetalle = (LinkButton)sender;
            string id = btnVerDetalle.CommandArgument;

            // Guarda el id en la sesión
            
            Session.Add("ProductoId", id);
            

            // Redirige a la página de detalles
            Response.Redirect("DetallesProducto.aspx");
        }
    }
}
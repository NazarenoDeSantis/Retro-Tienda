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
    public partial class AdministrarArticulos : System.Web.UI.Page
    {
        ArticuloNegocio articuloNegocio = new ArticuloNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarArticulos();
            }
        }

        void cargarArticulos()
        {
            List<Articulo> lista = new List<Articulo>();
            
            lista = articuloNegocio.listar();
            gvArticulos.DataSource = lista;
            gvArticulos.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/FormularioArticulo.aspx");
        }
    }
}
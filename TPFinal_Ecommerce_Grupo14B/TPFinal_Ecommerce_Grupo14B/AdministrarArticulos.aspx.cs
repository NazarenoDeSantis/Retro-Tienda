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
        ArticuloNegocio negocio = new ArticuloNegocio();
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
            
            lista = negocio.listarConSP();
            gvArticulos.DataSource = lista;
            gvArticulos.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/FormularioArticulo.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void gvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvArticulos.SelectedDataKey.Value.ToString();
 
            Response.Redirect("/FormularioArticulo.aspx?id=" + id);
        }
    }
}
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
            if (Session["idRol"] == null)
            {
                Response.Redirect("IniciarSesion.aspx");
            }

            if (!IsPostBack)
            {
                cargarArticulos();
            }
        }

        void cargarArticulos()
        {
            /*
            List<Articulo> lista = new List<Articulo>();
            
            lista = negocio.listarConSP();
            gvArticulos.DataSource = lista;
            gvArticulos.DataBind();*/

            List<Articulo> lista = new List<Articulo>();
            Session.Add("listaArticulos", negocio.listarConSP());
            gvArticulos.DataSource = Session["listaArticulos"];
            gvArticulos.DataBind();

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/FormularioArticulo.aspx");
        }


        protected void gvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvArticulos.SelectedDataKey.Value.ToString();
 
            Response.Redirect("/FormularioArticulo.aspx?id=" + id);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            gvArticulos.DataSource = listaFiltrada;
            gvArticulos.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdministracionGeneral.aspx");
        }
    }
}
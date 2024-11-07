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
    public partial class Reportes : System.Web.UI.Page
    {
        CategoriaNegocio negocio = new CategoriaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarCategoria();
        }

        public void CargarCategoria()
        {
            List<Categoria> lista = new List<Categoria>();
            lista = negocio.listar();
            gvCategoria.DataSource = lista;
            gvCategoria.DataBind();
        }
    }
}
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
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }
        public List<Articulo> listaArticulosDos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            int categoriaID = 1;
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.listarConSP("spListarArticulosPorCategoria", categoriaID);
            listaArticulosDos = negocio.listarConSP("spListarArticulosPorCategoria", categoriaID++);

            if (!IsPostBack)
            {
                repRepetidor.DataSource = listaArticulos;
                repRepetidor.DataBind();
                repRepetidorDos.DataSource = listaArticulosDos;
                repRepetidorDos.DataBind();
            }

        }

        protected void btnVerMasDestacados_Click(object sender, EventArgs e)
        {

        }
    }
}
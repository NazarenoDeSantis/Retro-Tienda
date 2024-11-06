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

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            listaArticulos = negocio.listarConSP();

            if (!IsPostBack)
            {
                //repRepetidor.DataSource = listaArticulos;
                //repRepetidor.DataBind();
            }

        }

        protected void btnComprarDestacados_Click(object sender, EventArgs e)
        {
           

        }

        protected void btnComprarDest2_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprarDest3_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprarDest6_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprarDest5_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprarDest4_Click(object sender, EventArgs e)
        {

        }

        protected void btnComprarDest3_Click1(object sender, EventArgs e)
        {

        }

        protected void btnVerMasDest6_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerMasDest5_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerMasdest4_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerMasDest3_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerMasDest2_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerMasDestacados_Click(object sender, EventArgs e)
        {
            
        }

       
    }
}
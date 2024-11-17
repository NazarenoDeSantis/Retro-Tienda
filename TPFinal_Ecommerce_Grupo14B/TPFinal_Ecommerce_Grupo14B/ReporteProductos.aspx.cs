using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class ReporteProductos : System.Web.UI.Page
    {
        ReporteNegocio reporteNegocio = new ReporteNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarTotaldeProductos();
        }

        protected void CargarTotaldeProductos()
        {
            int totalProductos = reporteNegocio.CantidadArticulos();
            lblTotalProductos.Text = totalProductos.ToString();
            lblCantidaddeClientes.Text = reporteNegocio.CantidadClientes().ToString();
           lblValorActivosEmpresa.Text = "$" + " " + reporteNegocio.ValorActivosEmpresa().ToString();
        }


    }
}
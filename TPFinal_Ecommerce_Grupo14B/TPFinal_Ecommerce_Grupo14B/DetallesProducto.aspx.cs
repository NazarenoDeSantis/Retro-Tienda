using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class DetallesProducto : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Recupera el id desde la sesión
                string id = Session["ProductoId"] as string;
                

                if (!string.IsNullOrEmpty(id))
                {
                    // Usa el id como necesites, por ejemplo, cargar detalles del producto
                    CargaDetallesProducto(id);
                }
                else
                {
                    Response.Write("No se encontró el ID del producto en la sesión.");
                }
            }
        }
        public void CargaDetallesProducto(string id)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            Articulo articulo = negocio.listarConSP().Find(x => x.Id == Convert.ToInt32(id));
            lblNombre.Text = articulo.Nombre;
            lblID.Text = "Código Artículo: "+ articulo.Id.ToString();
            lblDescripcion.Text = articulo.Descripcion;
            lblPrecio.Text = articulo.Precio.ToString();
            imgProducto.ImageUrl = articulo.UrlImagen;
        }
        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            // Recuperar la cantidad desde el TextBox
            int cantidadSeleccionada = Convert.ToInt32(txtCantidad.Text);

            // Guardar en la sesión
            Session["CantidadSeleccionada"] = cantidadSeleccionada;

            // Guardar el ID del producto en la sesión
            Session["ProductoId"] = lblID.Text;

            // Redirigir al carrito
            Response.Redirect("Carrito.aspx");

        }

    }
}
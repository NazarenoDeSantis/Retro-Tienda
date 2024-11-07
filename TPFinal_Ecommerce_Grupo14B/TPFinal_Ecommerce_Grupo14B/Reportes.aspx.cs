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
            if (!IsPostBack)
            {
                CargarCategoria();
            }
        }

        public void CargarCategoria()
        {
            try
            {
                List<Categoria> lista = negocio.listar();
                gvCategoria.DataSource = lista;
                gvCategoria.DataBind();
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
                lblError.CssClass = "text-danger";
            }
        }

       
            

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
                string nombreCategoria = txtNombreCategoria.Text.Trim();
                if (string.IsNullOrEmpty(nombreCategoria))
                {
                    // Aquí puedes agregar un mensaje de error si el nombre está vacío
                    lblError.Text = "El nombre de la categoría no puede estar vacío.";
                    return;
                }

                Categoria nuevaCategoria = new Categoria
                {
                    Nombre = nombreCategoria
                };

                // Llamar al método de negocio para agregar la categoría
                negocio.agregar(nuevaCategoria);

                // Limpiar el campo de texto
                txtNombreCategoria.Text = string.Empty;

                // Actualizar el GridView con la lista más reciente
                CargarCategoria();
            }
            catch (Exception ex)
            {
                // Aquí puedes manejar el error, como mostrar un mensaje en un Label
                lblError.Text = "Error al agregar la categoría: " + ex.Message;
            }
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {

        }
    }
}

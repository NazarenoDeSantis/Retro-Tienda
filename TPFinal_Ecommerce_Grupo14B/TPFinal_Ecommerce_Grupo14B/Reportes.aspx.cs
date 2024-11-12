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
        Categoria categoria = new Categoria();

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
            categoria.Nombre = txtNombreCategoria.Text.Trim();
           // string nombreCategoria = txtNombreCategoria.Text.Trim();
            try
            {
               
                if (string.IsNullOrEmpty(categoria.Nombre))
                {
                    // Aquí puedes agregar un mensaje de error si el nombre está vacío
                    lblError.Visible = true;
                    lblError.Text = "El nombre de la categoría no puede estar vacío.";
                    return;
                }

               // Categoria nuevaCategoria = new Categoria();
               // nuevaCategoria.Nombre = txtNombreCategoria.Text;
               

                // Llamar al método de negocio para agregar la categoría
                negocio.agregar(categoria);

                // Limpiar el campo de texto
                txtNombreCategoria.Text = string.Empty;

                // Actualizar el GridView con la lista más reciente
                CargarCategoria();
            }
            catch (Exception ex)
            {
                // Aquí puedes manejar el error, como mostrar un mensaje en un Label
                lblError.Visible = true;
                lblError.Text =  ex.Message;
            }
        }

        
    }
}

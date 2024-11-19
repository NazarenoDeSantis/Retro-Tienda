using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class FormularioCategoria : System.Web.UI.Page
    {
        CategoriaNegocio negocio = new CategoriaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            try
            {

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (!string.IsNullOrEmpty(id) && !IsPostBack)
                {
                    Categoria categoria = negocio.listar().Find(x => x.Id == int.Parse(id));

                    if (categoria != null)
                    {
                        txtId.Text = categoria.Id.ToString();
                        txtNombre.Text = categoria.Nombre;

                        if (!categoria.Activo)
                        {
                            btnDeshabilitar.Text = "Reactivar";

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error",
                     $"Swal.fire('Error', 'Hubo un error al cargar los datos: {ex.Message}', 'error');", true);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {

                Categoria categoria = new Categoria();
                categoria.Nombre = txtNombre.Text.Trim();

                if (string.IsNullOrEmpty(categoria.Nombre))
                {
                    /* lblError.Visible = true;
                     lblError.Text = "No puede agregar un nombre Vacio";
                     return;*/
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CampoVacio",
                         "Swal.fire('Error', 'El nombre no puede estar vacío.', 'error');", true);
                    return;
                }
                if (negocio.verificarDuplicado(categoria))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Duplicado",
                        "Swal.fire('Advertencia', 'La categoría ya existe.', 'warning');", true);
                    return;
                }

                //negocio.verificarDuplicado(categoria);
                if (Request.QueryString["id"] != null)
                {
                    categoria.Id = int.Parse(txtId.Text);
                    //negocio.verificarDuplicado(categoria);
                    negocio.modificarConSP(categoria);
                }
                else
                {
                    negocio.agregar(categoria);
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Success",
                    "Swal.fire('Éxito', 'Categoría guardada correctamente.', 'success').then(() => { window.location = 'AdministrarCategorias.aspx'; });", true);

                //  Response.Redirect("AdministrarCategorias.aspx");


            }
            catch (Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = "Hubo un error al agregar la categoría: " + ex.Message;
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdministrarCategorias.aspx");
        }

        protected void btnDeshabilitar_Click(object sender, EventArgs e)
        {
           
            try
            {
                string script = string.Empty;

                if (btnDeshabilitar.Text == "Reactivar")
                {
                    negocio.ReactivacionLogicaConSP(int.Parse(txtId.Text));
                    script = "Swal.fire('Éxito', 'Categoría reactivada con éxito.', 'success').then((result) => { window.location = '/AdministrarCategorias.aspx'; });";
                }
                else
                {
                    negocio.bajaLogicaConSP(int.Parse(txtId.Text));
                    script = "Swal.fire('Éxito', 'Categoría deshabilitada con éxito.', 'success').then((result) => { window.location = '/AdministrarCategorias.aspx'; });";
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "DeshabilitarCategoria", script, true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error",
                    $"Swal.fire('Error', 'Hubo un problema al realizar la acción: {ex.Message}', 'error');", true);
            }
        }

    }
}
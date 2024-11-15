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
                if (!string.IsNullOrEmpty(id))
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
                Session.Add("Error", ex);
                throw;
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
                    lblError.Visible = true;
                    lblError.Text = "No puede agregar un nombre Vacio" ;
                    return;
                }

                negocio.verificarDuplicado(categoria);
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
                
                Response.Redirect("AdministrarCategorias.aspx");


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

                if (btnDeshabilitar.Text == "Reactivar")
                {
                    negocio.ReactivacionLogicaConSP(int.Parse(txtId.Text));
                    Response.Redirect("/AdministrarCategorias.aspx");
                }
                else

                {
                    negocio.bajaLogicaConSP(int.Parse(txtId.Text));
                }

                Response.Redirect("/AdministrarCategorias.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);

                throw;
            }
        }
    
    }
}
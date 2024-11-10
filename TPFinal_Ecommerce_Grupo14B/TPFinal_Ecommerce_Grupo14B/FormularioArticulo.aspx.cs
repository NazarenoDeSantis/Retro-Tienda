using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class FormularioArticulo : System.Web.UI.Page
    {   
        ArticuloNegocio negocio = new ArticuloNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            
            try
            {
                if(!IsPostBack)
                {
                    CategoriaNegocio negocio = new CategoriaNegocio();
                    List<Categoria> lista = negocio.listar();

                    ddlCategoria.DataSource = lista;
                    ddlCategoria.DataTextField = "Nombre";
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataBind();
                }

                //config si estamos modificando
                               
                    
                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (!string.IsNullOrEmpty(id) && !IsPostBack)
                    {
                        Articulo articulo = negocio.listarConSP().Find(x => x.Id == int.Parse(id));
                        if (articulo != null)
                        {
                            txtId.Text = articulo.Id.ToString();
                            txtNombre.Text = articulo.Nombre;
                            txtDescripcion.Text = articulo.Descripcion;
                            txtPrecio.Text = articulo.Precio.ToString();
                            txtStock.Text = articulo.Stock.ToString();
                            ddlCategoria.SelectedValue = articulo.CategoriaId.ToString();
                            txtImagenUrl.Text = articulo.UrlImagen;
                            imgArticulo.ImageUrl = articulo.UrlImagen;
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
                Articulo articulo = new Articulo();
                articulo.Nombre = txtNombre.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Precio = decimal.Parse(txtPrecio.Text);
                articulo.Stock = int.Parse(txtStock.Text);
                articulo.CategoriaId = int.Parse(ddlCategoria.SelectedValue);
                articulo.UrlImagen = txtImagenUrl.Text;

                if(Request.QueryString["id"] != null)
                {
                    articulo.Id = int.Parse(txtId.Text);
                    negocio.modificarConSP(articulo);
                }
                else
                {
                    negocio.agregarConSP(articulo);
                }

                Response.Redirect("/AdministrarArticulos.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdministrarArticulos.aspx");
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnDeshabilitar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                negocio.eliminarLogicoConSP(int.Parse(txtId.Text));
                Response.Redirect("/AdministrarArticulos.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);

                throw;
            }
        }
    }
}
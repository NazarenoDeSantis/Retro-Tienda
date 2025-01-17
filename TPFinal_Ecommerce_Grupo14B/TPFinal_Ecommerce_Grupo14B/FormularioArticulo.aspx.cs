﻿using Negocio;
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
                if (!IsPostBack)
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

                        if (!articulo.Activo)
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
                if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtDescripcion.Text) ||
                   string.IsNullOrWhiteSpace(txtPrecio.Text) || string.IsNullOrWhiteSpace(txtStock.Text) ||
                   string.IsNullOrWhiteSpace(txtImagenUrl.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CamposVacios",
                        "Swal.fire({icon: 'error', title: 'Campos vacíos', text: 'Por favor, complete todos los campos.'});", true);
                    return;
                }

                decimal precio;
                if (!decimal.TryParse(txtPrecio.Text, out precio) || precio <= 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PrecioInvalido",
                        "Swal.fire({icon: 'error', title: 'Precio inválido', text: 'El precio debe ser mayor a 0.'});", true);
                    return;
                }

                int stock;
                if (!int.TryParse(txtStock.Text, out stock) || stock < 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "StockInvalido",
                        "Swal.fire({icon: 'error', title: 'Stock inválido', text: 'El stock debe ser mayor o igual a 0.'});", true);
                    return;
                }

                Articulo articulo = new Articulo();
                articulo.Nombre = txtNombre.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Precio = precio;
                articulo.Stock = stock;
                articulo.CategoriaId = int.Parse(ddlCategoria.SelectedValue);
                articulo.UrlImagen = txtImagenUrl.Text;

                if (Request.QueryString["id"] != null)
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

                if(btnDeshabilitar.Text == "Reactivar")
                {
                    negocio.ReactivacionLogicaConSP(int.Parse(txtId.Text));
                    Response.Redirect("/AdministrarArticulos.aspx");
                }
                else

                {
                    negocio.bajaLogicaConSP(int.Parse(txtId.Text));
                }    
                
                
                
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
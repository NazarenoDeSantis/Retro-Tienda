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
    public partial class FormularioUsuario : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            //config inicial
            try
            {
                if (!IsPostBack)
                {
                    TipoRolNegocio negocio = new TipoRolNegocio();
                    List<TipoRol> lista = negocio.listar();

                    ddlRol.DataSource = lista;
                    ddlRol.DataTextField = "Nombre";
                    ddlRol.DataValueField = "Id";
                    ddlRol.DataBind();
                }

                //config si estamos modificando
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (!string.IsNullOrEmpty(id) && !IsPostBack)
                {
                    Usuario usuario= negocio.listar().Find(x => x.Id == int.Parse(id));
                    if (usuario != null)
                    {

                        txtId.Text = usuario.Id.ToString();
                        txtNombre.Text = usuario.Nombre;
                        txtClave.Text = usuario.Clave;
                        txtCorreo.Text = usuario.Correo;
                        txtTelefono.Text = usuario.Telefono;
                        txtDireccion.Text = usuario.Direccion;
                        txtLocalidad.Text = usuario.Localidad;
                        txtFechaNacimiento.Text = usuario.FechaNacimiento.ToString();
                        ddlRol.SelectedValue = usuario.IdRol.ToString();

                        if (!usuario.Estado)
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
                Usuario usuario = new Usuario();
                usuario.Nombre = txtNombre.Text;
                usuario.Correo = txtCorreo.Text;
                usuario.Clave = txtClave.Text;
                usuario.Telefono = txtTelefono.Text;
                usuario.Direccion = txtDireccion.Text;
                usuario.Localidad = txtLocalidad.Text;
                usuario.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                usuario.IdRol = int.Parse(ddlRol.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    usuario.Id = int.Parse(txtId.Text);
                    negocio.modificar(usuario);
                }
                else
                {
                    negocio.agregar(usuario);
                }


                

                Response.Redirect("/AdministrarUsuarios.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdministrarUsuarios.aspx");
        }

        protected void btnDeshabilitar_Click(object sender, EventArgs e)
        {
            try
            {

                UsuarioNegocio negocio = new UsuarioNegocio();

                if (btnDeshabilitar.Text == "Reactivar")
                {
                    negocio.ReactivacionLogica(int.Parse(txtId.Text));
                    Response.Redirect("/AdministrarUsuarios.aspx");
                }
                else

                {
                    negocio.bajaLogica(int.Parse(txtId.Text));
                }



                Response.Redirect("/AdministrarUsuarios.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);

                throw;
            }
        }
    }
}
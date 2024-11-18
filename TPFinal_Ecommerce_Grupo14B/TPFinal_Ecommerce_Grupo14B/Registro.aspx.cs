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
    public partial class Registro : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {

            try
            {
                Usuario usuario = new Usuario();
                usuario.Nombre = txtNombre.Text;
                usuario.Correo = txtEmail.Text;
                usuario.Clave = txtClave.Text;
                usuario.Telefono = txtTelefono.Text;
                usuario.Direccion = txtDireccion.Text;
                usuario.Localidad = txtLocalidad.Text;
                usuario.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                usuario.IdRol = 3;

                negocio.agregar(usuario);
                if (negocio.loguear(usuario))
                {
                    Session["usuario"] = usuario;
                    Session["idRol"] = usuario.IdRol;

                    Response.Redirect("Default.aspx");
                }

            }

            catch (Exception ex)
            {
                Session.Add("Error", ex.Message);
                throw;
            }
        }
    }
}
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
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* if(Session["usuario"] == null)
             {
                 Session.Add("error", "Debes loguearte para ingresar");
                 Response.Redirect("Default.aspx", false);
             }*/
            if (Request.QueryString["logout"] == "true")
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("~/IniciarSesion.aspx");
            }
        }


        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario.Correo = txtEmail.Text;
                usuario.Clave = txtPassword.Text;


                if (negocio.loguear(usuario))
                {
                    Session["usuario"] = usuario;
                    Session["idRol"] = usuario.IdRol;

                    if (usuario.IdRol == 3)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else if (usuario.IdRol == 1 || usuario.IdRol == 2)
                    {
                        Response.Redirect("AdministracionGeneral.aspx", false);
                    }

                }
                else
                {
                    Session.Add("error ", "usuario o contraseña incorrecta");
                    Response.Redirect("Registro.aspx", false);
                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
            }
        }
    }
}
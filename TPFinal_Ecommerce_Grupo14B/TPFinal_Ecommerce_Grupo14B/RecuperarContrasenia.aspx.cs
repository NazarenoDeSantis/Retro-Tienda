using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_Ecommerce_Grupo14B
{
    public partial class RecuperarContrasenia : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
  
                string emailCliente = txtEmailRecuperar.Text;


                if (string.IsNullOrEmpty(emailCliente))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'warning', title: 'Correo invalido', text: 'Por favor, ingrese un correo valido.'});", true);
                    return;
                }

                if (!negocio.ExisteEmail(emailCliente))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'warning', title: 'Correo inexistente', text: 'El correo electrónico no esta registrado.'});", true);
                    return;
                }

                string contrasena = negocio.RecuperarPass(emailCliente);

                if (string.IsNullOrEmpty(contrasena))
                {
                    Response.Write("<script>alert('El correo ingresado no está registrado.');</script>");
                    return;
                }
 
                MailMessage mensaje = new MailMessage();
                mensaje.From = new MailAddress("ecommerce14bretro@gmail.com"); 
                mensaje.To.Add(emailCliente); 
                mensaje.Subject = "Recuperación de contraseña";
                mensaje.Body = $"Hola,\n\nTu contraseña es: {contrasena}\n\nSaludos!";
                mensaje.IsBodyHtml = false;

                SmtpClient clienteSmtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    Credentials = new NetworkCredential("ecommerce14bretro@gmail.com", "lmfw xlpn tkaw iqkx"), 
                    EnableSsl = true
                };

                clienteSmtp.Send(mensaje);
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'success', title: 'Correo existente', text: 'Se ha enviado un correo con la clave correspondiente.'});", true);
               
                return;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'warning', title: 'Error', text: 'Error al enviar el correo'});", true);
            }
        }
    }
}
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
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnEnviarMensaje_Click(object sender, EventArgs e)
        {
            try
            {
                // Captura los datos del formulario
                string nombre = txtNombre.Text;
                string emailCliente = txtEmail.Text;
                string asunto = txtAsunto.Text;
                string mensajeCliente = txtMensaje.Text; // Captura el mensaje del textarea

                // Crea el mensaje de correo
                MailMessage mensaje = new MailMessage();
                mensaje.From = new MailAddress("ecommerce14bretro@gmail.com"); // Cambia por tu correo
                mensaje.To.Add("ecommerce14bretro@gmail.com"); // Cambia por el correo donde recibirás los mensajes
                mensaje.Subject = asunto;
                mensaje.Body = $"Nombre: {nombre}\nCorreo: {emailCliente}\nMensaje: {mensajeCliente}";
                mensaje.IsBodyHtml = false;

                // Configura el cliente SMTP
                SmtpClient clienteSmtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    Credentials = new NetworkCredential("ecommerce14bretro@gmail.com", "lmfw xlpn tkaw iqkx"), // Cambia por tu email y contraseña
                    EnableSsl = true
                };

                // Envía el correo
                clienteSmtp.Send(mensaje);

                // Muestra un mensaje de éxito
                Response.Write("<script>alert('El mensaje se ha enviado correctamente.');</script>");
            }
            catch (Exception ex)
            {
                // Maneja cualquier error al enviar el correo
                Response.Write($"<script>alert('Error al enviar el mensaje: {ex.Message}');</script>");
            }
        }


    }
}
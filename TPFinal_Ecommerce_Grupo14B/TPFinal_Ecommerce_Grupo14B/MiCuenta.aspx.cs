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
    public partial class MiCuenta1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                // Redirige al usuario a la página de inicio de sesión
                Response.Redirect("IniciarSesion.aspx");
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos vacíos o nulos
                if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                    string.IsNullOrWhiteSpace(txtTelefono.Text) ||
                    string.IsNullOrWhiteSpace(txtLocalidad.Text) ||
                    string.IsNullOrWhiteSpace(txtFechaNacimiento.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CamposVacios",
                        "Swal.fire({icon: 'error', title: 'Error', text: 'Todos los campos son obligatorios.'});", true);
                    return;
                }

                if (System.Text.RegularExpressions.Regex.IsMatch(txtNombre.Text.Trim(), @"\d"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "NombreInvalido",
                        "Swal.fire({icon: 'error', title: 'Error', text: 'El nombre no puede contener números.'});", true);
                    return;
                }

                // Validar formato del correo electrónico
                if (!txtEmail.Text.Contains("@"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CorreoInvalido",
                        "Swal.fire({icon: 'error', title: 'Error', text: 'El correo electrónico debe contener el carácter @.'});", true);
                    return;
                }

                // Validar que el número de teléfono solo contenga números
                if (!long.TryParse(txtTelefono.Text.Trim(), out _))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "TelefonoInvalido",
                        "Swal.fire({icon: 'error', title: 'Error', text: 'El teléfono debe contener solo números.'});", true);
                    return;
                }

                // Validar que las contraseñas coincidan
                if (txtClave.Text.Trim() != txtConfirmacionPassword.Text.Trim())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorPassword",
                        "Swal.fire({icon: 'error', title: 'Error', text: 'Las contraseñas no coinciden.'});", true);
                    return;
                }

                // Recuperar el usuario actual de la sesión
                Usuario usuarioSesion = (Usuario)Session["usuario"];

                // Crear un nuevo objeto Usuario con los datos actualizados
                Usuario usuarioActualizado = new Usuario
                {
                    Id = usuarioSesion.Id, // Mantener el ID del usuario
                    Nombre = txtNombre.Text.Trim(),
                    Correo = txtEmail.Text.Trim(),
                    Clave = string.IsNullOrWhiteSpace(txtClave.Text) ? usuarioSesion.Clave : txtClave.Text.Trim(),
                    Direccion = txtDireccion.Text.Trim(),
                    Telefono = txtTelefono.Text.Trim(),
                    Localidad = txtLocalidad.Text.Trim(),
                    FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text),
                    IdRol = usuarioSesion.IdRol // Mantener el rol
                };

                // Llamar al método modificar
                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.modificar(usuarioActualizado);

                // Actualizar los datos en la sesión
                Session["usuario"] = usuarioActualizado;

                // Mostrar mensaje de éxito
                ScriptManager.RegisterStartupScript(this, this.GetType(), "UsuarioModificado",
                    "Swal.fire({icon: 'success', title: 'Perfil actualizado', text: 'Tus datos han sido actualizados correctamente.'});", true);
            }
            catch (Exception ex)
            {
                // Manejar errores y mostrar mensaje
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorActualizacion",
                    $"Swal.fire({{icon: 'error', title: 'Error', text: 'Hubo un problema al actualizar tus datos: {ex.Message}'}});", true);
            }
        }


        private void CargarDatosUsuario(Usuario usuario)
        {
            // Cargar los datos del usuario en los controles
            txtNombre.Text = usuario.Nombre;
            txtEmail.Text = usuario.Correo;
            txtDireccion.Text = usuario.Direccion;
            txtTelefono.Text = usuario.Telefono;
            txtLocalidad.Text = usuario.Localidad;
            txtFechaNacimiento.Text = usuario.FechaNacimiento.ToString("yyyy-MM-dd");
        }
    }

}

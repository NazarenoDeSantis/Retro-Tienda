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
        CarritoNegocio carritoNegocio = new CarritoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(txtClave.Text) ||
                    string.IsNullOrWhiteSpace(txtConfirmacionClave.Text) ||
                    string.IsNullOrWhiteSpace(txtTelefono.Text) ||
                    string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                    string.IsNullOrWhiteSpace(txtLocalidad.Text) ||
                    string.IsNullOrWhiteSpace(txtFechaNacimiento.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'error', title: 'Campos vacíos', text: 'Todos los campos son obligatorios.'});", true);
                    return;
                }
                // Validación del correo electrónico
                if (negocio.ExisteEmail(txtEmail.Text))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'warning', title: 'Correo duplicado', text: 'El correo electrónico ya está registrado.'});", true);
                    return;
                }
                // Validar la contraseña
                if (txtClave.Text != txtConfirmacionClave.Text)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'error', title: 'Contraseñas no coinciden', text: 'La contraseña y la confirmación deben ser iguales.'});", true);
                    return;
                }
                // Validar formato 
                DateTime fechaNacimiento;
                if (!DateTime.TryParse(txtFechaNacimiento.Text, out fechaNacimiento) || fechaNacimiento > DateTime.Now)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'error', title: 'Fecha inválida', text: 'Ingrese una fecha de nacimiento válida.'});", true);
                    return;
                }
                // Validar números
                if (!long.TryParse(txtTelefono.Text, out _))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'error', title: 'Teléfono inválido', text: 'El teléfono solo debe contener números.'});", true);
                    return;
                }

                Usuario usuario = new Usuario
                {
                    Nombre = txtNombre.Text,
                    Correo = txtEmail.Text,
                    Clave = txtClave.Text,
                    Telefono = txtTelefono.Text,
                    Direccion = txtDireccion.Text,
                    Localidad = txtLocalidad.Text,
                    FechaNacimiento = fechaNacimiento,
                    IdRol = 3
                };

                negocio.agregar(usuario);

                if (negocio.loguear(usuario))
                {
                    Session["usuario"] = usuario;
                    Session["idRol"] = usuario.IdRol;

                    // Mensaje de éxito y redirección
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'success', title: 'Registro exitoso', text: '¡Bienvenido!', showConfirmButton: false, timer: 1500}).then(() => { window.location.href = 'Default.aspx'; });", true);
                    carritoNegocio.agregarCarrito(usuario.Id);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"Swal.fire({{icon: 'error', title: 'Error', text: '{ex.Message}'}});", true);
            }

        }
    }
}
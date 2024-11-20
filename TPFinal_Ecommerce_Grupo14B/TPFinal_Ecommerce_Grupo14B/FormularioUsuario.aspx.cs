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
                if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtCorreo.Text) ||
                    string.IsNullOrWhiteSpace(txtClave.Text) || string.IsNullOrWhiteSpace(txtTelefono.Text) ||
                    string.IsNullOrWhiteSpace(txtDireccion.Text) || string.IsNullOrWhiteSpace(txtLocalidad.Text) ||
                    string.IsNullOrWhiteSpace(txtFechaNacimiento.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CamposVacios",
                        "Swal.fire({icon: 'error', title: 'Campos vacíos', text: 'Por favor, complete todos los campos.'});", true);
                    return;
                }

                if (negocio.listar().Any(u => u.Correo == txtCorreo.Text && (Request.QueryString["id"] == null || u.Id != int.Parse(txtId.Text))))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "CorreoDuplicado",
                        "Swal.fire({icon: 'error', title: 'Correo duplicado', text: 'Este correo ya está registrado.'});", true);
                    return;
                }

                DateTime fechaNacimiento;
                if (!DateTime.TryParse(txtFechaNacimiento.Text, out fechaNacimiento))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "FechaInvalida",
                        "Swal.fire({icon: 'error', title: 'Fecha inválida', text: 'Por favor, ingrese una fecha de nacimiento válida.'});", true);
                    return;
                }

                if (!long.TryParse(txtTelefono.Text, out _))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "Swal.fire({icon: 'error', title: 'Teléfono inválido', text: 'El teléfono solo debe contener números.'});", true);
                    return;
                }

                Usuario usuario = new Usuario
                {
                    Nombre = txtNombre.Text,
                    Correo = txtCorreo.Text,
                    Clave = txtClave.Text,
                    Telefono = txtTelefono.Text,
                    Direccion = txtDireccion.Text,
                    Localidad = txtLocalidad.Text,
                    FechaNacimiento = fechaNacimiento,
                    IdRol = int.Parse(ddlRol.SelectedValue)
                };

                if (usuario.IdRol == 1) // Administrador
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ConfirmacionRol",
                        "Swal.fire({title: '¿Estás seguro?', text: '¿Quieres asignar este usuario como administrador?', icon: 'warning', showCancelButton: true, confirmButtonText: 'Sí', cancelButtonText: 'No'}).then((result) => { if (result.isConfirmed) { document.getElementById('btnAceptar').click(); } });", true);
                    return; 
                }

                if (Request.QueryString["id"] != null)
                {
                    usuario.Id = int.Parse(txtId.Text);
                    negocio.modificar(usuario);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ModificacionExitosa",
                       "Swal.fire({icon: 'success', title: 'Modificación exitosa', text: 'El usuario ha sido modificado correctamente.'}).then((result) => { window.location.href = '/AdministrarUsuarios.aspx'; });", true);
                }
                else
                {
                    negocio.agregar(usuario);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AgregadoExitosa",
                       "Swal.fire({icon: 'success', title: 'Usuario agregado', text: 'El usuario ha sido agregado correctamente.'}).then((result) => { window.location.href = '/AdministrarUsuarios.aspx'; });", true);
                }

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
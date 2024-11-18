<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container d-flex justify-content-center align-items-center vh-60 mt-5">
        <div class="card p-4 shadow-sm" style="max-width: 600px; width: 80%;">
            <h3 class="text-center mb-4">Registrarse</h3>


            <!-- Datos Personales -->
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre y Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>

            <!-- Dirección -->
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" />
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="ciudad" class="form-label">Localidad</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLocalidad" />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="Fecha de Nacimiento" class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNacimiento" TextMode="Date" />
                </div>

            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" />
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <asp:TextBox runat="server" CssClass="form-control" type="password" ID="txtClave" />
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtConfirmacionClave" type="password" />
            </div>
            <asp:Button Text="Registrarse" runat="server" CssClass="btn btn-primary w-100" ID="btnRegistro" OnClick="btnRegistro_Click" />
            <div class="mt-3 text-center">
                <p>¿Ya tienes una cuenta? <a href="/IniciarSesion.aspx">Inicia sesión aquí</a></p>
            </div>
        </div>
    </div>













</asp:Content>

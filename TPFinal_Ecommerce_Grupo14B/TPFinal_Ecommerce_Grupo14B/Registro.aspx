<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container d-flex justify-content-center align-items-center vh-60 mt-5">
        <div class="card p-4 shadow-sm" style="max-width: 600px; width: 80%;">
            <h3 class="text-center mb-4">Registrarse</h3>


            <!-- Datos Personales -->
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
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
                        <label for="ciudad" class="form-label">Ciudad</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCiudad" />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="provincia" class="form-label">Provincia/Estado</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtProvincia" />
                    </div>
                </div>
                <div class="mb-3">
                    <label for="codigoPostal" class="form-label">Código Postal</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCodigoPostal" />
                </div>

                <!-- Contraseña -->
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" type="password" ID="txtPassword" />
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtConfirmacionPassword" type="password" />
                </div>
                <asp:Button Text="Registrarse" runat="server" CssClass="btn btn-primary w-100" ID="btnRegistro" OnClick="btnRegistro_Click" />
                <div class="mt-3 text-center">
                    <p>¿Ya tienes una cuenta? <a href="/IniciarSesion.aspx">Inicia sesión aquí</a></p>
                </div>
            </div>
        </div>
    </div>












</asp:Content>

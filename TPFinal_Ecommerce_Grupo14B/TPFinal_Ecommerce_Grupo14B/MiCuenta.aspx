<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MiCuenta.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.MiCuenta1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Mi Cuenta</h2>

    <div class="container d-flex justify-content-center align-items-center vh-60 mt-5">
        <div class="card p-4 shadow-sm" style="max-width: 600px; width: 80%;">
            <h3 class="text-center mb-4">Editar Perfil</h3>


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
                <asp:TextBox runat="server" CssClass="form-control" ID="txtConfirmacionPassword" type="password" />
            </div>
            <div>
                <asp:Button Text="Actualizar" runat="server" CssClass="btn btn-primary" ID="btnActualizar" OnClick="btnActualizar_Click" />
                <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-primary " ID="Cancelar" />
            </div>

        </div>

    </div>

</asp:Content>

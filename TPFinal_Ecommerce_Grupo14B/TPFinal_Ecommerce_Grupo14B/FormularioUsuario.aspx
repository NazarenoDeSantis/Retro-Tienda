<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioUsuario.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.FormularioUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCorreo" class="form-label">Correo: </label>
                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Clave: </label>
                <asp:TextBox runat="server" ID="txtClave" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtTelefono" class="form-label">Teléfono: </label>
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtDireccion" class="form-label">Direccion: </label>
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad: </label>
                <asp:TextBox runat="server" ID="txtLocalidad" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento: </label>
                <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ddlRol" class="form-label">Tipo de Rol: </label>
                <asp:DropDownList ID="ddlRol" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Cancelar" ID="btnCancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" runat="server" />
                <asp:Button Text="Deshabilitar" ID="btnDeshabilitar" CssClass="btn btn-warning" OnClick="btnDeshabilitar_Click" runat="server" />
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

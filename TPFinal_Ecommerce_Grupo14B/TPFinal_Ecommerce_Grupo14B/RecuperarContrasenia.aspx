<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RecuperarContrasenia.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.RecuperarContrasenia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow-sm">
                    <h4 class="card-title mb-4 text-center">Recuperar Contraseña</h4>
                    <p class="text-center">Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.</p>

                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <asp:TextBox runat="server" ID="txtEmailRecuperar" CssClass="form-control" />
                    </div>
                    <asp:Button Text="Recuperar contraseña" ID="btnRecuperar" CssClass="btn btn-primary w-100" runat="server" OnClick="btnRecuperar_Click" />
                    <div class="mt-3 text-center">
                        <a href="/MiCuenta.aspx" class="link-primary">Volver a Mi Cuenta</a>
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>

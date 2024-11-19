<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <h1 class="text-center mb-4">¿Tienes una idea de producto? ¡Contáctanos!</h1>
        <p class="text-center">Si tienes alguna sugerencia o idea para crear un nuevo producto, déjanos un mensaje y nos pondremos en contacto.</p>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4 shadow-sm">
                    <h4 class="card-title mb-4">Formulario de Contacto</h4>


                    <!-- Nombre -->
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    </div>

                    <!-- Correo Electrónico -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                    </div>

                    <!-- Asunto -->
                    <div class="mb-3">
                        <label for="asunto" class="form-label">Asunto</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAsunto" />
                    </div>

                    <!-- Mensaje -->
                    <div class="mb-3">
                        <label for="mensaje" class="form-label">Descripción de tu idea</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtMensaje" TextMode="MultiLine" Rows="5" Placeholder="Describe tu idea o sugerencia"></asp:TextBox>
                    </div>

                    <!-- Botón de Enviar -->
                    <asp:Button Text="Enviar mensaje" runat="server" ID="btnEnviarMensaje" CssClass="btn btn-primary w-100" OnClick="btnEnviarMensaje_Click" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>

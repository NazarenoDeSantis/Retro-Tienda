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
                        <input type="text" class="form-control" id="nombre" placeholder="Ingresa tu nombre" required>
                    </div>

                    <!-- Correo Electrónico -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingresa tu correo electrónico" required>
                    </div>

                    <!-- Asunto -->
                    <div class="mb-3">
                        <label for="asunto" class="form-label">Asunto</label>
                        <input type="text" class="form-control" id="asunto" placeholder="Asunto del mensaje" required>
                    </div>

                    <!-- Mensaje -->
                    <div class="mb-3">
                        <label for="mensaje" class="form-label">Descripción de tu idea</label>
                        <textarea class="form-control" id="mensaje" rows="5" placeholder="Describe tu idea o sugerencia" required></textarea>
                    </div>

                    <!-- Botón de Enviar -->
                    <button type="submit" class="btn btn-primary w-100">Enviar mensaje</button>


                </div>
            </div>
        </div>
    </div>

</asp:Content>

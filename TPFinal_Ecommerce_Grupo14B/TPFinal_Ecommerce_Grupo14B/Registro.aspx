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
                <input type="text" class="form-control" id="nombre" placeholder="Ingresa tu nombre" required>
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" placeholder="Ingresa tu apellido" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" placeholder="Ingresa tu correo" required>
            </div>

            <!-- Dirección -->
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="direccion" placeholder="Ingresa tu dirección" required>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="ciudad" class="form-label">Ciudad</label>
                    <input type="text" class="form-control" id="ciudad" placeholder="Ingresa tu ciudad" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="provincia" class="form-label">Provincia/Estado</label>
                    <input type="text" class="form-control" id="provincia" placeholder="Ingresa tu provincia o estado" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="codigoPostal" class="form-label">Código Postal</label>
                <input type="text" class="form-control" id="codigoPostal" placeholder="Ingresa tu código postal" required>
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" placeholder="Ingresa tu contraseña" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                <input type="password" class="form-control" id="confirmPassword" placeholder="Confirma tu contraseña" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Registrarse</button>


            <div class="mt-3 text-center">
                <p>¿Ya tienes una cuenta? <a href="login.html">Inicia sesión aquí</a></p>
            </div>
        </div>
    </div>












</asp:Content>

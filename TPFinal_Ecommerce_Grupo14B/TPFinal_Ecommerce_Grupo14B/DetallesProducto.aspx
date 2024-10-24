<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesProducto.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.DetallesProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <!-- Imagen del Producto -->
                <img src="https://via.placeholder.com/500" class="img-fluid" alt="Imagen del Producto">
            </div>
            <div class="col-md-6">
                <!-- Información del Producto -->
                <h2>Producto 1 </h2>
                <p class="text-muted">Código del producto: #12345</p>


                <p class="mt-3">Este es un excelente producto que cuenta con las mejores características y te ofrece la mejor experiencia de uso. Perfecto para cualquier ocasión.</p>

                <!-- Precio -->
                <h3 class="mt-3 text-success">$199.99</h3>

  
                <div class="mt-4">
                    <label for="cantidad" class="form-label">Cantidad</label> 
                    <asp:TextBox runat="server" ID="txtCantidad" CssClass="form-control w-25" />
                    <asp:Button Text="Agregar al Carrito" runat="server" ID="btnAgregarCarrito" CssClass="btn btn-primary mt-3 w-100"   />
                </div>
                <div class="mt-4">
                    <h5>Características:</h5>
                    <ul>
                        <li>Característica 1</li>
                        <li>Característica 2</li>
                        <li>Característica 3</li>
                    </ul>
                </div>
                <div class="mt-3">
                    <a href="/Default.aspx" class="link-primary">Volver a la tienda</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

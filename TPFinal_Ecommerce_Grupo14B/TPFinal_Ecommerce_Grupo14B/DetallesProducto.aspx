<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesProducto.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.DetallesProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">
        
        <div class="row">
            <div class="col-md-6">
                <!-- Imagen del Producto -->
                <img src="Images/indumentaria1.jpg" class="img-fluid" alt="Imagen del Producto">
            </div>
            <div class="col-md-6">
                <!-- Información del Producto -->
                <h2>Remera estampa 90'</h2>
                <p class="text-muted">Código del producto: #12345</p>


                <p class="mt-3">Remera retro con temática Gamer de los años 90', unisex, talle único</p>

                <!-- Precio -->
                <h3 class="mt-3 text-success">$199.99</h3>


                <div class="mt-4">
                    <label for="cantidad" class="form-label">Cantidad</label>
                    <asp:TextBox runat="server" ID="txtCantidad" CssClass="form-control w-25" />
                    <asp:Button Text="Agregar al Carrito" runat="server" ID="btnAgregarCarrito" CssClass="btn btn-primary mt-3 w-100" OnClick="btnAgregarCarrito_Click" />
                </div>
                <div class="mt-4">
                    <h5>Características:</h5>
                    <ul>
                        <li>Material: Algodón 100%</li>
                        <li>Color: Negro</li>
                        <li>Medidas: Ancho: 56cm, Largo: 73cm </li>
                    </ul>
                </div>
                <div class="mt-3">
                    <a href="CatalogoIndumentaria.aspx" class="link-primary">Volver a la tienda</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

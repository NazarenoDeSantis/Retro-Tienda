<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Sección de productos más vendidos -->
    <div id="productos-mas-vendidos" class="container mt-5">
        <h2 class="text-center mb-4">Los más vendidos !!</h2>

        <!-- Carrusel de productos más vendidos -->
        <div id="productosCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 1">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 1</h5>
                                    <p class="card-text">Descripción breve del producto 1.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                    
                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 2">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 2</h5>
                                    <p class="card-text">Descripción breve del producto 2.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 3">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 3</h5>
                                    <p class="card-text">Descripción breve del producto 3.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 4">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 4</h5>
                                    <p class="card-text">Descripción breve del producto 4.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 5">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 5</h5>
                                    <p class="card-text">Descripción breve del producto 5.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                    <asp:Button ID="btnComprar" Text="Comprar" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 6">
                                <div class="card-body">
                                    <h5 class="card-title">Producto 6</h5>
                                    <p class="card-text">Descripción breve del producto 6.</p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productosCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productosCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoIndumentaria.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.CatalogoIndumentaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
        <li class="breadcrumb-item"><a href="CatalogoIndumentaria.aspx">Indumentaria</a></li>
    </ol>
</nav>
        <h1 class="text-center mb-4">Indumentaria</h1>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Producto 1 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 1">
                    <div class="card-body">
                        <h5 class="card-title">Producto 1</h5>
                        <p class="card-text">Descripción breve del producto 1. Es un excelente artículo.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria" OnClick="btnVerMasIndumentaria_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 2 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 2">
                    <div class="card-body">
                        <h5 class="card-title">Producto 2</h5>
                        <p class="card-text">Descripción breve del producto 2. Producto de alta calidad.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria2" OnClick="btnVerMasIndumentaria2_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria2" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria2_Click" />
                    </div>
                </div>
            </div>
            <!-- Producto 3 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 3">
                    <div class="card-body">
                        <h5 class="card-title">Producto 3</h5>
                        <p class="card-text">Descripción breve del producto 3. Ideal para tu colección.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria3" OnClick="btnVerMasIndumentaria3_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria3" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria3_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 4 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 4">
                    <div class="card-body">
                        <h5 class="card-title">Producto 4</h5>
                        <p class="card-text">Descripción breve del producto 4. Innovador y moderno.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria4" OnClick="btnVerMasIndumentaria4_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria4" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria4_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 5 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 5">
                    <div class="card-body">
                        <h5 class="card-title">Producto 5</h5>
                        <p class="card-text">Descripción breve del producto 5. Muy solicitado por nuestros clientes.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria5" OnClick="btnVerMasIndumentaria5_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria5" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria5_Click" />
                    </div>
                </div>
            </div>
            <!-- Producto 6 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 6">
                    <div class="card-body">
                        <h5 class="card-title">Producto 6</h5>
                        <p class="card-text">Descripción breve del producto 6. Ideal para tu hogar.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria6" OnClick="btnVerMasIndumentaria6_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria6" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria6_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 7 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 7">
                    <div class="card-body">
                        <h5 class="card-title">Producto 7</h5>
                        <p class="card-text">Descripción breve del producto 7. Excelente calidad y precio.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria7" OnClick="btnVerMasIndumentaria7_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria7" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria7_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 8 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 8">
                    <div class="card-body">
                        <h5 class="card-title">Producto 8</h5>
                        <p class="card-text">Descripción breve del producto 8. Diseño único.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria8" OnClick="btnVerMasIndumentaria8_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria8" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria8_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 9 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 9">
                    <div class="card-body">
                        <h5 class="card-title">Producto 9</h5>
                        <p class="card-text">Descripción breve del producto 9. Ideal para cualquier ocasión.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria9" OnClick="btnVerMasIndumentaria9_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria9" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria9_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 10 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 10">
                    <div class="card-body">
                        <h5 class="card-title">Producto 10</h5>
                        <p class="card-text">Descripción breve del producto 10. No te lo puedes perder.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria10" OnClick="btnVerMasIndumentaria10_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria10" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria10_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 11 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 11">
                    <div class="card-body">
                        <h5 class="card-title">Producto 11</h5>
                        <p class="card-text">Descripción breve del producto 11. Aumenta tu productividad.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria11" OnClick="btnVerMasIndumentaria11_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria11" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria11_Click"  />
                    </div>
                </div>
            </div>
            <!-- Producto 12 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 12">
                    <div class="card-body">
                        <h5 class="card-title">Producto 12</h5>
                        <p class="card-text">Descripción breve del producto 12. Oportunidad única.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasIndumentaria12" OnClick="btnVerMasIndumentaria12_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarIndumentaria12" CssClass="btn btn-primary" OnClick="btnComprarIndumentaria12_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

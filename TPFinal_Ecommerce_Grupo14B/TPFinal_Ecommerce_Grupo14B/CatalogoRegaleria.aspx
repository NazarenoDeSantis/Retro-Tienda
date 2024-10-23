<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoRegaleria.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.CatalogoRegaleria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <h1 class="text-center mb-4">Regaleria</h1>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Producto 1 -->
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/150" class="card-img-top" alt="Producto 1">
                    <div class="card-body">
                        <h5 class="card-title">Producto 1</h5>
                        <p class="card-text">Descripción breve del producto 1. Es un excelente artículo.</p>
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria" OnClick="btnVerMasRegaleria_Click" />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria" CssClass="btn btn-primary" OnClick="btnComprarRegaleria_Click" />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria2" OnClick="btnVerMasRegaleria2_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria2" CssClass="btn btn-primary" OnClick="btnComprarRegaleria2_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria3" OnClick="btnVerMasRegaleria3_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria3" CssClass="btn btn-primary" OnClick="btnComprarRegaleria3_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria4" OnClick="btnVerMasRegaleria4_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria4" CssClass="btn btn-primary" OnClick="btnComprarRegaleria4_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria5" OnClick="btnVerMasRegaleria5_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria5" CssClass="btn btn-primary" OnClick="btnComprarRegaleria5_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria6" OnClick="btnVerMasRegaleria6_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria6" CssClass="btn btn-primary" OnClick="btnComprarRegaleria6_Click" />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria7" OnClick="btnVerMasRegaleria7_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria7" CssClass="btn btn-primary" OnClick="btnComprarRegaleria7_Click" />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria8" OnClick="btnVerMasRegaleria8_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria8" CssClass="btn btn-primary" OnClick="btnComprarRegaleria8_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria9" OnClick="btnVerMasRegaleria9_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria9" CssClass="btn btn-primary" OnClick="btnComprarRegaleria9_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria10" OnClick="btnVerMasRegaleria10_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria10" CssClass="btn btn-primary" OnClick="btnComprarRegaleria10_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria11" OnClick="btnVerMasRegaleria11_Click"  />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria11" CssClass="btn btn-primary" OnClick="btnComprarRegaleria11_Click"  />
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
                        <asp:Button Text="Ver más" runat="server" CssClass="btn btn-primary" ID="btnVerMasRegaleria12" OnClick="btnVerMasRegaleria12_Click" />
                        <asp:Button Text="Comprar" runat="server" ID="btnComprarRegaleria12" CssClass="btn btn-primary" OnClick="btnComprarRegaleria12_Click"  />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReporteProductos.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.ReporteProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <h1 class="mb-4">Dashboard de Reportes</h1>

        <!-- Fila para las tarjetas de reportes -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Productos Totales</div>
                    <div class="card-body">
                        <h5>

                            <asp:Label ID="lblTotalProductos" runat="server" Text=""></asp:Label>
                        </h5>
                        <p class="card-text">Cantidad distinta de productos en stock.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-header">Clientes Registrados</div>
                    <div class="card-body">
                        <h5>
                            <asp:Label ID="lblCantidaddeClientes" runat="server" Text=""></asp:Label>
                        </h5>
                        <p class="card-text">Clientes registrados.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-secondary mb-3">
                    <div class="card-header">Total Activo</div>
                    <div class="card-body">
                        <h5>
                            <asp:Label ID="lblValorActivosEmpresa" runat="server" Text=""></asp:Label>
                        </h5>
                        <p class="card-text">Valor total en pesos.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-header">Cantidad productos vendidos</div>
                    <div class="card-body">
                        <h5>
                            <asp:Label ID="lblCantidadProductosVendidos" runat="server" Text="10"></asp:Label>
                        </h5>
                        <p class="card-text">Total productos vendidos.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-info mb-3">
                    <div class="card-header">Total ventas</div>
                    <div class="card-body">
                        <h5>
                            <asp:Label ID="lblValorTotalVentas" runat="server" Text="$ 10"></asp:Label>
                        </h5>
                        <p class="card-text">Valor total en pesos de ventas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white mb-3" style="background-color:#ff6a00" ">
                    <div class="card-header">Productos bajo stock</div>
                    <div class="card-body">
                        <h5>
                            <asp:Label ID="lblProductosBajoStock" runat="server" Text="10"></asp:Label>
                        </h5>
                        <p class="card-text">Productos con menos de 3 unidades.</p>
                    </div>
                </div>
            </div>
            <h2>Productos con stock menor a 10</h2>
            <div class="col col-6">
    <!-- Contenedor con scroll cuando hay más de 10 filas -->
    <div style="max-height: 300px; overflow-y: auto;">
        <asp:GridView 
            ID="gvPocoStock" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            </Columns>
        </asp:GridView>
    </div>
</div>

        </div>
</asp:Content>

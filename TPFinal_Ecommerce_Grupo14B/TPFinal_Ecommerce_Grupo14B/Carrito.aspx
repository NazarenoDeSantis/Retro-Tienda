<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container mt-5">
        <h2 class="mb-4">Carrito de Compras</h2>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvCarrito_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:Label
                                    ID="lblCantidad"
                                    runat="server"
                                    Text='<%# Eval("Cantidad") + "/" + Eval("StockMaximo") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subtotal">
                            <ItemTemplate>
                                <asp:Label ID="lblSubtotal" runat="server" Text='<%# Eval("Subtotal", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="btnAumentar" runat="server" Text="+" CommandName="Aumentar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary btn-sm" />

                                <asp:Button ID="btnDisminuir" runat="server" Text="-" CommandName="Disminuir" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-warning btn-sm" />

                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <!-- Total de la compra -->
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label runat="server" ID="lblTotal" CssClass="h3"></asp:Label>
                    </div>
                    <div class="col-md-6 text-end">

                        <asp:Button Text="Seguir Comprando" ID="btnSeguirComprando" CssClass="btn btn-outline-primary" runat="server" OnClick="btnSeguirComprando_Click" />
                        <asp:Button Text="Pagar" CssClass="btn btn-success" ID="btnPagar" runat="server" OnClick="btnPagar_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

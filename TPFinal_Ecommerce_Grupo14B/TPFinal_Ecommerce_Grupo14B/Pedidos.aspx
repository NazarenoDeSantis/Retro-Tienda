<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1>Pedidos</h1>
    <asp:GridView ID="gvPedidos" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID Pedido" />
            <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
            <asp:BoundField DataField="FechaPedido" HeaderText="Fecha Pedido" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:BoundField DataField="NameStatus" HeaderText="Estado Detalle" />
            <asp:BoundField DataField="DireccionEnvio" HeaderText="Dirección Envío" />
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>

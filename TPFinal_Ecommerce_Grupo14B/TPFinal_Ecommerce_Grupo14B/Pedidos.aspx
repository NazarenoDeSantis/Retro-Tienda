<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pedidos</h1>
    <asp:GridView ID="gvPedidos" runat="server" CssClass="table table-striped table-bordered table-hover" ></asp:GridView>
</asp:Content>

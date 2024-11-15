<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministracionGeneral.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.AdministracionGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="admin-dashboard">
        <h2>Panel de Administración</h2>

        <asp:Button Text="Administrar Usuarios" CssClass="btn btn-primary admin-button" ID="btnAdminUsuarios" OnClick="btnAdminUsuarios_Click" runat="server" />
        <asp:Button Text="Administrar Productos" CssClass="btn btn-primary admin-button" ID="btnAdminProductos" OnClick="btnAdminProductos_Click"  runat="server" />
        <asp:Button Text="Administrar Categorías" CssClass="btn btn-primary admin-button" ID="btnAdminCategorias" OnClick="btnAdminCategorias_Click"  runat="server" />
        <asp:Button Text="Ver Reportes" CssClass="btn btn-primary admin-button" ID="btnAdminReportes" OnClick="btnAdminReportes_Click"  runat="server" />
        <asp:Button Text="Configuración" CssClass="btn btn-primary admin-button" ID="btnConfiguracion" OnClick="btnConfiguracion_Click"  runat="server" />
    </div>
</asp:Content>

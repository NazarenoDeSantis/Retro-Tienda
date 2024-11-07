<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <h2 class="mb-4">Gestión de Categorías</h2>

    <!-- Formulario para agregar/modificar categorías -->
    <div class="mb-3">
        <label for="txtNombreCategoria" class="form-label">Nombre de la Categoría</label>
        <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" placeholder="Ingrese el nombre de la categoría"></asp:TextBox>
    </div>
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>


 

    <!-- GridView para mostrar las categorías -->
    <asp:GridView ID="gvCategoria" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" HeaderStyle-CssClass="table-dark">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
        </Columns>
    </asp:GridView>
</asp:Content>

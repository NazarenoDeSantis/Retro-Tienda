<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministrarArticulos.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.AdministrarArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Administrar Artículos</h1>
    <asp:GridView ID="gvArticulos" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" OnSelectedIndexChanged="gvArticulos_SelectedIndexChanged" HeaderStyle-CssClass="table-dark">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:BoundField DataField="CategoriaId" HeaderText="Categoria" SortExpression="Categoria" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:CommandField ShowSelectButton="true" SelectText="🎰" HeaderText="Accion"/>
        </Columns>
    </asp:GridView>
     <div class="col">
     <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" runat="server" />
     <asp:Button Text ="Editar" ID="btnEditar" CssClass="btn btn-secondary" OnClick="btnEditar_Click" runat="server" />
     <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" onclick="btnEliminar_Click" runat="server" />
 </div>
</asp:Content>

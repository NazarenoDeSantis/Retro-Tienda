<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministrarArticulos.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.AdministrarArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Administrar Artículos</h1>
    <div class="row">
    <div class="col-6">
        <div class="mb-3">
            <asp:Label Text="Filtrar" runat="server" />
            <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
        </div>
    </div>
</div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvArticulos" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" OnSelectedIndexChanged="gvArticulos_SelectedIndexChanged" HeaderStyle-CssClass="table-dark">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                    <asp:BoundField DataField="CategoriaID" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" SortExpression="Activo" />
                    <asp:CommandField ShowSelectButton="true" SelectText="🎰" HeaderText="Accion" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="col">
        <asp:Button Text="Agregar" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" runat="server" />
    </div>
</asp:Content>

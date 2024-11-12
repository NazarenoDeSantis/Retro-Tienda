<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h2 class="mb-4">Listado de Categorías</h2>

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
            <asp:GridView ID="gvCategoria" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" HeaderStyle-CssClass="table-dark" OnSelectedIndexChanged="gvCategoria_SelectedIndexChanged" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" SortExpression="Activo" />
                    <asp:CommandField ShowSelectButton="true" SelectText="🎰" HeaderText="Accion" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="col">
        <asp:Button Text="Editar" ID="btnEditar" CssClass="btn btn-primary" OnClick="btnEditar_Click" runat="server" />
    </div>


</asp:Content>

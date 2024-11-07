<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="TPFinal_Ecommerce_Grupo14B.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2> Registro Provisorio De Categorias   </h2>

    <asp:GridView ID="gvCategoria" runat="server" AutoGenerateColumns="False" CssClass="table  table-bordered table-hover" HeaderStyle-CssClass="table-dark" > 
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" SortExpression="id" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
        </Columns>
    </asp:GridView>


    
 


</asp:Content>

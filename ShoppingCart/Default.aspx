<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingCart.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ShoppingCartDataSource" Width="500px" BackColor="White" BorderStyle="None" CellPadding="3" HorizontalAlign="Center" style="text-align: center" BorderColor="#CCCCCC" BorderWidth="1px" CellSpacing="1" DataKeyNames="cat_id" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Shop" />
            <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" Wrap="False" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
<asp:SqlDataSource ID="ShoppingCartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" SelectCommand="SELECT [cat_id], [name], [description] FROM [categories] ORDER BY [name]"></asp:SqlDataSource>
</asp:Content>

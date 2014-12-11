<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ShoppingCart.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="product_id" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="700px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product ID" Visible="False" />
            <asp:BoundField DataField="cat_id" HeaderText="Category ID" Visible="False" />
            <asp:BoundField DataField="name" HeaderText="Product Name" />
            <asp:BoundField DataField="description" HeaderText="Product Description" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:ButtonField ButtonType="Button" CommandName="select" Text="Buy" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ShoppingCart.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="product_id" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="700px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" style="text-align: left">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product ID" Visible="False" />
            <asp:BoundField DataField="cat_id" HeaderText="Category ID" Visible="False" />
            <asp:BoundField DataField="name" HeaderText="Product Name" />
            <asp:BoundField DataField="description" HeaderText="Product Description" />
            <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:ButtonField ButtonType="Button" CommandName="select" Text="Buy" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
</asp:Content>

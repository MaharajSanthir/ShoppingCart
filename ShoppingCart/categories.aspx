<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="ShoppingCart.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ShoppingCartDataSource" Width="700px" CellPadding="4" HorizontalAlign="Center" style="text-align: left" DataKeyNames="cat_id" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Shop" />
            <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Wrap="False" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
<asp:SqlDataSource ID="ShoppingCartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" SelectCommand="SELECT [cat_id], [name], [description] FROM [categories] ORDER BY [name]"></asp:SqlDataSource>
</asp:Content>

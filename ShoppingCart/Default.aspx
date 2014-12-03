<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingCart.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ShoppingCartDataSource" Width="500px" CellPadding="4" HorizontalAlign="Center" style="text-align: center" DataKeyNames="cat_id" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Shop" />
            <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Wrap="False" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
<asp:SqlDataSource ID="ShoppingCartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartConnectionString %>" SelectCommand="SELECT [cat_id], [name], [description] FROM [categories] ORDER BY [name]"></asp:SqlDataSource>
</asp:Content>

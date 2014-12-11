<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ShoppingCart.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 700px;
            margin-left:auto;
            margin-right:auto;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table class="auto-style1">
        <tr>
            <td colspan="2">    <asp:GridView ID="GridView1" EmptyDataText="Empty" runat="server" CellPadding="2" DataKeyNames="prod_id" ForeColor="Black" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Width="100%" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Delete" />
            <asp:BoundField DataField="prod_name" HeaderText="Product Name" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="subtotal" HeaderText="Subtotal" />
        </Columns>
                <EmptyDataTemplate>
                    Cart is empty
                </EmptyDataTemplate>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>    
    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" OnClick="btnContinue_Click" />
            </td>
            <td style="text-align: right">    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
            </td>
        </tr>
    </table>
    <br />
    </asp:Content>

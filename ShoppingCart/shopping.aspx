<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shopping.aspx.cs" Inherits="ShoppingCart.shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
            width: 376px;
        }
        .auto-style3 {
            height: 23px;
            width: 228px;
        }
        .auto-style4 {
            width: 228px;
        }
        .auto-style5 {
            height: 23px;
            width: 234px;
        }
        .auto-style6 {
            width: 234px;
        }
        .auto-style7 {
            height: 23px;
            width: 124px;
        }
        .auto-style8 {
            width: 124px;
        }
        .auto-style9 {
            width: 376px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HiddenFieldProd_ID" runat="server" />
    <table class="auto-style1" border="1">
        <tr>
            <td class="auto-style3">Product Name</td>
            <td class="auto-style5">Price</td>
            <td class="auto-style7">Quantity</td>
            <td class="auto-style2">Sub Total</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblProdName" runat="server"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:Label ID="lblPrice" runat="server"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:DropDownList ID="ddlQuantity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlQuantity_SelectedIndexChanged">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="btnGoToCart" runat="server" OnClick="btnGoToCart_Click" Text="Go to Cart" />
&nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
        </tr>
    </table>

</asp:Content>

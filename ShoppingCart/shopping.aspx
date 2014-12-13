<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shopping.aspx.cs" Inherits="ShoppingCart.shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style16 {
            text-align: center;
            background-color: #F7F7DE;
        }
        .auto-style17 {
            text-align: center;
            color: #FFFFFF;
            background-color: #6B696B;
            height: 22px;
        }
        .auto-style19 {
            text-align: center;
            color: #FFFFFF;
            width: 111px;
            background-color: #6B696B;
            height: 22px;
        }
        .auto-style20 {
            width: 111px;
            background-color: #F7F7DE;
        }
        .auto-style21 {
            font-weight: bold;
            width: 176px;
            height: 24px;
            background-color: #F7F7DE;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%; border-color:#DEDFDE; border-width:1px;" >
        <tr>
            <td class="auto-style17">Product Name</td>
            <td class="auto-style17">Price</td>
            <td class="auto-style19">Quantity</td>
            <td class="auto-style17" >Sub Total</td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="lblProdName" runat="server"></asp:Label>
            </td>
            <td class="auto-style21" >
                $<asp:Label ID="lblPrice" runat="server"></asp:Label>
            </td>
            <td class="auto-style20" >
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
            <td class="auto-style21" >
                $<asp:Label ID="lblSubTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td  colspan="3">
    <asp:HiddenField ID="HiddenFieldProd_ID" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnGoToCart" runat="server" OnClick="btnGoToCart_Click" Text="Add to Cart" />
&nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
        </tr>
    </table>

</asp:Content>

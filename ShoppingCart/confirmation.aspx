<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="ShoppingCart.confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4" colspan="2">Order Details</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Order ID:</td>
                        <td class="auto-style3">
                            <asp:Label ID="lblOrderID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Date:</td>
                        <td class="auto-style3">
                            <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Status:</td>
                        <td class="auto-style3">
                            <asp:Label ID="lblOrderStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4" colspan="2">Customer Details</td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td>
                            <asp:Label ID="lblCustName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td>
                            <asp:Label ID="lblCustAddr" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td>
                            <asp:Label ID="lblCustPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:Label ID="lblCustEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
        </tr>
    </table>


</asp:Content>

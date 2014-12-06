<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ShoppingCart.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">        
        .auto-style14 {
            width: 287px;
            margin-left:auto;
            margin-right:auto;
            height: 164px;
        }
        .auto-style15 {
            height: 23px;
            font-weight: 700;
            margin-left: 80px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style14">
        <tr>
            <td class="auto-style15">
                Username:</td>
            <td class="auto-style15">
                <asp:TextBox ID="tbxUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" ErrorMessage="Username is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                Password</td>
            <td class="auto-style15">
                <asp:TextBox ID="tbxPassword" runat="server" Height="16px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" ErrorMessage="Password is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                &nbsp;</td>
            <td class="auto-style15">
                <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
&nbsp;&nbsp;
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">
                <asp:Button ID="btnBackToShipping" runat="server" Text="Cancel and Go Back To Shipping Address" Width="100%" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

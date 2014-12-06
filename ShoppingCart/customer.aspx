<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="ShoppingCart.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 500px;
            margin-left:auto;
            margin-right:auto;
        }
        .auto-style2 {
            text-decoration: underline;
            text-align: right;
            width: 633px;
        }
        .auto-style5 {
            height: 23px;
            text-align: right;
            width: 633px;
        }
        .auto-style6 {
            text-align: right;
            width: 633px;
        }
        .auto-style7 {
            height: 26px;
            text-align: right;
            width: 633px;
        }
        .auto-style8 {
            height: 26px;
            width: 648px;
        }
        .auto-style9 {
            width: 648px;
        }
        .auto-style10 {
            height: 23px;
            width: 648px;
        }
        .auto-style13 {
            height: 23px;
            width: 633px;
        }
        .auto-style14 {
            width: 200px;
        }
        .auto-style15 {
            height: 23px;
        }
        .auto-style16 {
            height: 22px;
            margin-left: 40px;
        }
        .auto-style17 {
            height: 22px;
            width: 4px;
            margin-left: 40px;
        }
        .auto-style18 {
            height: 23px;
            width: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">






    <br />
    <asp:Panel ID="Panel_Addresses" runat="server">

    </asp:Panel>

    <asp:Panel ID="Panel_LoggedIn" runat="server">

    </asp:Panel>

    <table class="auto-style1">
        <tr>
            <td class="auto-style7">First Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="lblFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="lblFirstName" runat="server" ErrorMessage="First name is required.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Last Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="lblLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lblLastName" ErrorMessage="Last name is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Phone:</td>
            <td class="auto-style9">
                <asp:TextBox ID="lblPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lblPhone" ErrorMessage="Phone is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="lblPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" runat="server" ErrorMessage="Phone number invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Email:</td>
            <td class="auto-style9">
                <asp:TextBox ID="lblEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lblEmail" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="lblEmail" ValidationExpression="^[a-z0-9][-a-z0-9.!#$%&'*+-=?^_`{|}~\/]+@([-a-z0-9]+\.)+[a-z]{2,5}$" ErrorMessage="Email is invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Shipping Address</td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Address</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="lblAddress" runat="server" ErrorMessage="Address is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">City:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="lblCity" runat="server" ErrorMessage="City is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Province:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblProvince" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="lblProvince" runat="server" ErrorMessage="Province is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Postal Code:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblPostalCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="lblPostalCode" runat="server" ErrorMessage="Postal code is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="lblPostalCode" ValidationExpression="^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\d{1}[A-Za-z]{1} *\d{1}[A-Za-z]{1}\d{1}$" runat="server" ErrorMessage="Postal Code is invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style10">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ViewStateMode="Enabled" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style10">
                <asp:Button ID="Button1" runat="server" Text="Proceed to Payment" />
            </td>
        </tr>
    </table>

</asp:Content>

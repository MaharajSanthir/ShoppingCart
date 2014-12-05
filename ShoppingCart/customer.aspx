<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="ShoppingCart.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            text-decoration: underline;
            text-align: right;
            width: 350px;
        }
        .auto-style4 {
            height: 26px;
            width: 312px;
        }
        .auto-style5 {
            height: 23px;
            text-align: right;
            width: 350px;
        }
        .auto-style6 {
            text-align: right;
            width: 350px;
        }
        .auto-style7 {
            height: 26px;
            text-align: right;
            width: 350px;
        }
        .auto-style8 {
            height: 26px;
            width: 630px;
        }
        .auto-style9 {
            width: 630px;
        }
        .auto-style10 {
            height: 23px;
            width: 630px;
        }
        .auto-style11 {
            width: 312px;
        }
        .auto-style12 {
            height: 23px;
            width: 312px;
        }
        .auto-style13 {
            height: 23px;
            width: 350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style7">First Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="lblFirstName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="lblFirstName" runat="server" ErrorMessage="First name is required.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Last Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="lblLastName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lblLastName" ErrorMessage="Last name is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Phone:</td>
            <td class="auto-style9">
                <asp:TextBox ID="lblPhone" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lblPhone" ErrorMessage="Phone is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="lblPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" runat="server" ErrorMessage="Phone number invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Email:</td>
            <td class="auto-style9">
                <asp:TextBox ID="lblEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lblEmail" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="lblEmail" ValidationExpression="^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$" ErrorMessage="Email is invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Shipping Address</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Address</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblAddress" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="lblAddress" runat="server" ErrorMessage="Address is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">City:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblCity" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="lblCity" runat="server" ErrorMessage="City is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Province:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblProvince" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="lblProvince" runat="server" ErrorMessage="Province is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Postal Code:</td>
            <td class="auto-style10">
                <asp:TextBox ID="lblPostalCode" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="lblPostalCode" runat="server" ErrorMessage="Postal code is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="lblPostalCode" ValidationExpression="[ABCEFGHJKLMNPRSTVXY][0-9][ABCEFGHJKLMNPRSTVWXYZ] ?[0-9][ABCEFGHJKLMNPRSTVWXYZ][0-9]U" runat="server" ErrorMessage="Postal Code is invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style10">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ViewStateMode="Enabled" />
            </td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style10">
                <asp:Button ID="Button1" runat="server" Text="Proceed to Payment" />
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
    </table>

</asp:Content>

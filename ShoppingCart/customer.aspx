<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="ShoppingCart.customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 700px;
            margin-left:auto;
            margin-right:auto;

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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="auto-style1">
        <tr>
            <td class="auto-style7">First Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFirstName" runat="server" ErrorMessage="First name is required.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Last Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Phone:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" runat="server" ErrorMessage="Phone number invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Email:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-z0-9][-a-z0-9.!#$%&'*+-=?^_`{|}~\/]+@([-a-z0-9]+\.)+[a-z]{2,5}$" ErrorMessage="Email is invalid">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Address</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtAddress" runat="server" ErrorMessage="Address is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">City:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtCity" runat="server" ErrorMessage="City is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Province:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtProvince" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtProvince" runat="server" ErrorMessage="Province is required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Postal Code:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtPostalCode" runat="server" ErrorMessage="Postal code is required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtPostalCode" ValidationExpression="^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\d{1}[A-Za-z]{1} *\d{1}[A-Za-z]{1}\d{1}$" runat="server" ErrorMessage="Postal Code is invalid">*</asp:RegularExpressionValidator>
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
                <asp:Button ID="Button1" runat="server" Text="Proceed to Payment" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>


</asp:Content>

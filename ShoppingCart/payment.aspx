<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="ShoppingCart.payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 700px;
            margin-left:auto;
            margin-right:auto;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
            vertical-align:top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Billing Address:</td>
            <td>
                <asp:Label ID="lblBillingAddress" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Phone:</td>
            <td>
                <asp:Label ID="lblPhone" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email:</td>
            <td>
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Payment Type</td>
            <td>
                <asp:DropDownList ID="ddlPaymentType" runat="server">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>Master Card</asp:ListItem>
                    <asp:ListItem Value="American Express"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Card Number:</td>
            <td>
                <asp:TextBox ID="txtCreditcardNum" runat="server" Height="16px" Width="160px"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Credit card number is invalid." OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Name On Card:</td>
            <td>
                <asp:TextBox ID="txtNameOnCard" runat="server" Height="16px" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameOnCard" ErrorMessage="Name on card is required!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Expiration Date:</td>
            <td>
                MM:<asp:DropDownList ID="ddlExpMonth" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                YY:<asp:TextBox ID="txtExpYear" runat="server" Width="20px" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtExpYear" ErrorMessage="Expiration year is required!">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="txtExpYear" ErrorMessage="Expiration year is invalid!" OnServerValidate="CustomValidator3_ServerValidate">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Security Code:</td>
            <td>
                <asp:TextBox ID="txtSecurityCode" runat="server" Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtSecurityCode" runat="server" ErrorMessage="Security code is required!">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Security code is invalid!" OnServerValidate="CustomValidator2_ServerValidate">*</asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnBackToAddress" runat="server" Text="Back to Address" CausesValidation="False" style="text-align: left" OnClick="btnBackToAddress_Click" />
            </td>
            <td style="text-align: right">
                <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="Button1_Click" Width="100px" />
            &nbsp;
            </td>
        </tr>
    </table>
    
</asp:Content>

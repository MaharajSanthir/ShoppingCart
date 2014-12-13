<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="ShoppingCart.confirmation" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background:#f6f3f3;
        }
        .auto-style9 {
            height: 170px;
        }
        .dynamic {
            font-weight: 700;
        }
        .auto-style29 {
            width: 100%;
            height: 239px;
        }
        .auto-style34 {
            text-align: left;
            height: 27px;
            background-color: #FFFFFF;
            width: 219px;
        }
        .auto-style35 {
            text-align: left;
            height: 27px;
            background-color: #FFFFFF;
            width: 86px;
        }
        .auto-style38 {
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .auto-style40 {
            color: #000000;
            text-align: center;
            text-decoration: underline;
            height: 20px;
            background-color: #F7F6F3;
        }
        .auto-style42 {
            height: 27px;
            background-color: #F7F6F3;
            text-align: center;
        }
        .auto-style48 {
            text-align: left;
            height: 26px;
            background-color: #FFFFFF;
            width: 86px;
        }
        .auto-style49 {
            text-align: left;
            height: 26px;
            background-color: #FFFFFF;
            width: 219px;
        }
        .auto-style50 {
            width: 86px;
            height: 27px;
            background-color: #FFFFFF;
        }
        .auto-style51 {
            height: 27px;
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .auto-style53 {
            background-color: #F7F6F3;
        }
        .auto-style54 {
            text-decoration: underline;
            background-color: #F7F6F3;
        }
        .auto-style55 {
            width: 100%;
        }
        .auto-style57 {
            height: 22px;
            font-weight: bold;
            background-color: #FFFFFF;
        }
        .auto-style60 {
            background-color: #F7F6F3;
        }
        .auto-style61 {
            height: 22px;
            width: 328px;
            background-color: #F7F6F3;
        }
        .auto-style62 {
            width: 127px;
            background-color: #FFFFFF;
        }
        .auto-style63 {
            height: 22px;
            width: 127px;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="auto-style1">
        <tr>
            <td class="auto-style9">
                <table class="auto-style29">
                    <tr>
                        <td colspan="2" class="auto-style40"><strong class="auto-style53">Order Details</strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style48">Order ID:</td>
                        <td class="auto-style49">
                            <asp:Label ID="lblOrderID" runat="server" CssClass="dynamic"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style35">Order Date:</td>
                        <td class="auto-style34">
                            <asp:Label ID="lblOrderDate" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style35">Shipping Status:</td>
                        <td class="auto-style34">
                            <asp:Label ID="lblOrderStatus" runat="server" style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style42" colspan="2"><strong><span class="auto-style54">Customer Details</span></strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style50">Name:</td>
                        <td class="auto-style51">
                            <asp:Label ID="lblCustName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">Address:</td>
                        <td class="auto-style38">
                            <asp:Label ID="lblCustAddr" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">Phone:</td>
                        <td class="auto-style51">
                            <asp:Label ID="lblCustPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">Email:</td>
                        <td class="auto-style51">
                            <asp:Label ID="lblCustEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; margin-left: 40px">
                <asp:Label ID="LabelError" runat="server" Text="" style="font-weight: 700; text-decoration: underline"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; margin-left: 40px">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="prod_name" HeaderText="Product Name" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="price" DataFormatString="{0:C}" HeaderText="Price" />
                        <asp:BoundField DataField="subtotal" DataFormatString="{0:C}" HeaderText="SubTotal" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="margin-left: 40px">
                <table class="auto-style55">
                    <tr>
                        <td class="auto-style60" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style60">&nbsp;</td>
                        <td class="auto-style63">Total:</td>
                        <td class="auto-style57">
                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style61"></td>
                        <td class="auto-style63">Payment Status:</td>
                        <td class="auto-style57">PAID</td>
                    </tr>
                    <tr>
                        <td class="auto-style61">&nbsp;</td>
                        <td class="auto-style62">Payment Type:</td>
                        <td class="auto-style38">
                            <asp:Label ID="lblPaymentType" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>


</asp:Content>

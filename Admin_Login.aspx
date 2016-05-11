<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Login.aspx.cs" Inherits="ADMIN_Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #003366;
            font-weight: bold;
        }
        .style5
        {
            height: 6px;
            font-weight: bold;
        }
        .style3
        {
            height: 6px;
        }
        .style6
        {
            height: 23px;
            font-weight: bold;
        }
        .style4
        {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2" 
                style="text-align: center; background-color: #2E2E2E; font-size: x-large;" 
                width="100%">
                <span lang="en-us" style="background-color: #FFFFFF">LOGIN FORM</span></td>
        </tr>
        <tr>
            <td class="style5" style="text-align: right" width="50%">
                Username:</td>
            <td class="style3" style="text-align: left" width="50%">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUsername" ErrorMessage="Please Enter the Username">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" width="50%" class="style6">
                Password:</td>
            <td style="text-align: left" width="50%" class="style4">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Please enter the Password">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" width="50%">
                &nbsp;</td>
            <td style="text-align: left" width="50%">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                    style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" width="50%">
                &nbsp;</td>
            <td style="text-align: left" width="50%">
                <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                    Text="Login" 
                    style="font-weight: 700; color: #003300; background-color: #FFFFFF;" />
                <asp:Button ID="btnReSet" runat="server" onclick="btnReSet_Click" Text="ReSet" 
                    ValidationGroup="1" 
                    style="font-weight: 700; color: #003300; background-color: #FFFFFF; height: 26px;" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right" width="50%">
                &nbsp;</td>
            <td style="text-align: left" width="50%">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="43px" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbladmin_login]"></asp:SqlDataSource>
    </p>
</form>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
</body>
</html>

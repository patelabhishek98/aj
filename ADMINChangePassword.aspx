<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/ADMIN_AFTER_LOGIN.master" AutoEventWireup="true" CodeFile="ADMINChangePassword.aspx.cs" Inherits="ADMIN_ADMINChangePassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2" colspan="2" 
                
            style="text-align: center; background-color: #444341; color: #FFFFFF; font-weight: 700; font-size: x-large;" 
            width="100%">
            CHANGE PASSWORD</td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right; font-weight: 700;" width="50%">
                Username:</td>
        <td class="style3" style="text-align: left" width="50%">
            <asp:TextBox ID="txtUsername" runat="server" Enabled="False"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="Please Enter the Username"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: right; font-weight: 700;" width="50%" class="style7">
                OldPassword:</td>
        <td style="text-align: left" width="50%" class="style7">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Please enter the Password"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: right; font-weight: 700;" width="50%" class="style4">
            New Password:</td>
        <td style="text-align: left" width="50%" class="style4">
            <asp:TextBox ID="txtnewPassword" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtnewPassword" ErrorMessage="Please enter the new Password"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: right; font-weight: 700;" width="50%" class="style6">
            Confirm Password</td>
        <td style="text-align: left" width="50%" class="style6">
            <asp:TextBox ID="txtconfirmpass" runat="server" Width="128px" 
                TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtnewPassword" ControlToValidate="txtconfirmpass" 
                ErrorMessage="Pass and Confirm Pass not Matched.."></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: right" width="50%" class="style5">
        </td>
        <td style="text-align: left" width="50%" class="style5">
            <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                    style="font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: right" width="50%" class="style8">
        </td>
        <td style="text-align: left" width="50%" class="style8">
            <asp:Button ID="btnchangepass" runat="server" onclick="btnLogin_Click" 
                    Text="Change password" 
                style="font-weight: 700; color: #003300; background-color: #FFFFFF" 
                Height="23px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReSet" runat="server" onclick="btnReSet_Click" Text="ReSet" 
                    ValidationGroup="1" 
                style="font-weight: 700; color: #003300; background-color: #FFFFFF" 
                Height="23px" />
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
    <tr>
        <td style="text-align: right" width="50%">
                &nbsp;</td>
        <td style="text-align: left" width="50%">
                &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center; width: 100%;" width="100%" colspan="2">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [tblAdmin_Login] WHERE [user_id] = @original_user_id AND [password] = @original_password" 
                InsertCommand="INSERT INTO [tblAdmin_Login] ([user_id], [password]) VALUES (@user_id, @password)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tblAdmin_Login]" 
                UpdateCommand="UPDATE [tblAdmin_Login] SET [password] = @password WHERE [user_id] = @original_user_id AND [password] = @original_password">
                <DeleteParameters>
                    <asp:Parameter Name="original_user_id" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="original_user_id" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="user_id" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>

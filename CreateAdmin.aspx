<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/ADMIN_AFTER_LOGIN.master" AutoEventWireup="true" CodeFile="CreateAdmin.aspx.cs" Inherits="ADMIN_CreateAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    t<table class="style1">
        <tr>
            <td class="style2" colspan="2" 
                
                style="text-align: center; background-color: #2E2E2E; color: #FFFFFF; font-weight: 700; font-size: x-large;" 
                width="100%">
                CREATE ADMIN</td>
        </tr>
        <tr>
            <td class="style3" style="text-align: right; font-weight: 700;" width="50%">
                Username:</td>
            <td class="style3" style="text-align: left" width="50%">
                <asp:TextBox ID="txtUsername" runat="server" 
                    ontextchanged="txtUsername_TextChanged" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtUsername" ErrorMessage="Please Enter the Username"></asp:RequiredFieldValidator>
                <asp:Label ID="lblusername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; font-weight: 700;" width="50%" class="style7">
                Password:</td>
            <td style="text-align: left" width="50%" class="style7">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                    ontextchanged="txtPassword_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Please enter the Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; font-weight: 700;" width="50%" class="style4">
                Confirm Password:</td>
            <td style="text-align: left" width="50%" class="style4">
                <asp:TextBox ID="txtConfirmPassword" runat="server" 
                    ontextchanged="txtConfirmPassword_TextChanged" TextMode="Password"></asp:TextBox>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
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
            <td style="text-align: right" width="50%" class="style6">
            </td>
            <td style="text-align: left" width="50%" class="style6">
                <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                    Text="Create" 
                    
                    style="font-weight: 700; color: #003300; background-color: #FFFFFF; " />
                <asp:Button ID="btnReSet" runat="server" onclick="btnReSet_Click" Text="ReSet" 
                    ValidationGroup="1" 
                    style="font-weight: 700; color: #003300; background-color: #FFFFFF" />
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
            <td style="text-align: center; width: 100%;" width="50%" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="username" 
                    DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" 
                    Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                    BorderWidth="1px">
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <Columns>
                        <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" 
                            SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" 
                            SortExpression="password" />
                    </Columns>
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
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


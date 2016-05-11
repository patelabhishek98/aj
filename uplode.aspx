<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/ADMIN_AFTER_LOGIN.master" AutoEventWireup="true" CodeFile="uplode.aspx.cs" Inherits="ADMIN_uplode" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1" style="width: 956px">
    <tr>
        <td class="auto-style2" style="text-align: center" width="100%">UPLOAD</td>
    </tr>
    <tr>
        <td style="width: 100%; text-decoration: underline;" width="50%">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [uplode]"></asp:SqlDataSource>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="viemain" runat="server">
                    <table class="auto-style1" style="width: 99%; height: 107px">
                        <tr>
                            <td class="auto-style4" style="text-align: right">username </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtuser" runat="server" OnTextChanged="txtuser_TextChanged" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="text-align: right">Techid</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txttechid" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttechid" ErrorMessage="enter Tech id"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="text-align: center">
                                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#003366" OnClick="LinkButton1_Click">Video</asp:LinkButton>
                            </td>
                            <td style="text-align: center">
                                <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#003366" OnClick="LinkButton2_Click">File</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vievideo" runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5" colspan="2" style="text-align: center" width="50%">vidoe</td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="True" ValidateRequestMode="Enabled" />
                            </td>
                            <td width="50%">
                                <asp:Button ID="Uplode" runat="server" OnClick="Uplode_Click" Text="Uplode" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="viefile" runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2" style="text-align: center">file</td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <asp:FileUpload ID="FileUpload3" runat="server" />
                            </td>
                            <td width="50%">
                                <asp:Button ID="uplode1" runat="server" OnClick="uplode1_Click" Text="Uplode" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </td>
    </tr>
</table>
</asp:Content>


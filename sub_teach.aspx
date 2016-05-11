<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/ADMIN_AFTER_LOGIN.master" AutoEventWireup="true" CodeFile="sub_teach.aspx.cs" Inherits="ADMIN_sub_teach" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
                            <td class="auto-style4" style="text-align: center" colspan="2">TEACH_ID</td>
                            </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right"  width="50%">Username </td>
                            <td class="auto-style2" width="50%">
                                <asp:TextBox ID="txtuser" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right" width="50%">Major</td>
                            <td class="auto-style4" width="50%">
                                <asp:TextBox ID="txtmajor" runat="server" ValidationGroup="3" Width="128px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmajor" ErrorMessage="enyer major" ValidationGroup="3"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right"  width="50%">Subject name</td>
                            <td class="auto-style2" width="50%">
                                <asp:TextBox ID="txtsub" runat="server" ValidationGroup="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsub" ErrorMessage="enter subject name" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right" width="50%">Topic </td>
                            <td class="auto-style2" width="50%">
                                <asp:TextBox ID="txttopic" runat="server" ValidationGroup="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttopic" ErrorMessage="enter topic name" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right"  width="50%">&nbsp;</td>
                            <td class="auto-style2" width="50%">
                                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" style="height: 26px" />
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right" " width="50%">techid:</td>
                            <td class="auto-style4" width="50%">
                                <asp:Label ID="tech_id" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right" width="50%">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [techid] WHERE ([username] = @username)" DeleteCommand="DELETE FROM techid WHERE (techid = @techid)" UpdateCommand="UPDATE techid SET username = @username, major = @major, subname = @subname, topic = @topic WHERE (techid = @techid)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="techid" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="username" SessionField="uname" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="username" />
                                        <asp:Parameter Name="major" />
                                        <asp:Parameter Name="subname" />
                                        <asp:Parameter Name="topic" />
                                        <asp:Parameter Name="techid" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style4" width="50%">
                                &nbsp;</td>
                        </tr>
        <tr>
                            <td class="auto-style4" style="text-align: right; width: 100%;" width="50%" colspan="2">
                                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataKeyNames="techid" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                        <asp:BoundField DataField="major" HeaderText="major" SortExpression="major" />
                                        <asp:BoundField DataField="subname" HeaderText="subname" SortExpression="subname" />
                                        <asp:BoundField DataField="topic" HeaderText="topic" SortExpression="topic" />
                                        <asp:BoundField DataField="techid" HeaderText="techid" ReadOnly="True" SortExpression="techid" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </td>
                        </tr>
    </table>
</asp:Content>


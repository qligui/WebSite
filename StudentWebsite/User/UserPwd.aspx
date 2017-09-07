<%@ Page Title="修改密码" Language="C#" MasterPageFile="~/Method/UserSite.Master" AutoEventWireup="true" CodeBehind="UserPwd.aspx.cs" Inherits="StudentWebsite.User.UserPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="userStyle/UserMsg.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="userpwd">
        <table>
            <tr>
                <td>
                    旧密码:
                </td>
                <td>
                    <asp:TextBox ID="txtLastpwd" runat="server" CssClass="txtStyle" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVtxtlastPwd" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtLastpwd" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:Label ID="labpwd" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    新密码:
                </td>
                <td>
                    <asp:TextBox ID="txtPwd1" runat="server" CssClass="txtStyle" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVtxtPwd1" runat="server" ErrorMessage="*" ControlToValidate="txtPwd1" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    确认密码:
                </td>
                <td>
                    <asp:TextBox ID="txtPwd2" runat="server" CssClass="txtStyle" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFVtxtPwd2" runat="server" ErrorMessage="*"
                        ControlToValidate="txtPwd2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVtxt" runat="server" ErrorMessage="*密码前后不一致"
                        ControlToCompare="txtPwd1" ControlToValidate="txtPwd2" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnEnter" runat="server" Text="递交" Height="30px" CssClass="btnEnter"
                        Width="125px" onclick="btnEnter_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

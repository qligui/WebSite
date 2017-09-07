<%@ Page Title="用户信息" Language="C#" MasterPageFile="~/Method/UserSite.Master" AutoEventWireup="true" CodeBehind="userIndex.aspx.cs" Inherits="StudentWebsite.User.userIndex1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="userStyle/UserMsg.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="UserInfo">
        <table class="tableUser">
            <tr>
                <td class="tdImg" rowspan="12" valign="top">
                    <asp:Image ID="ImgPic" runat="server" Width="70px" Height="70px" />
                </td>
                <td class="tdCosplan" colspan="2">
                    基本信息
                </td>
                <td class="tdCosplan">
                    &nbsp;
                </td>
                <td class="tdCosplan" colspan="2">
                    完善/修改个人信息
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    用户名:
                </td>
                <td>
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="tdUser">
                    用户名:
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="txtStyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    性别:
                </td>
                <td>
                    <asp:Label ID="LabelSex" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="tdUser">
                    性别:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSex" runat="server">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                        <asp:ListItem>未知</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    职业:
                </td>
                <td>
                    <asp:Label ID="LabelWork" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="tdUser">
                    职业:
                </td>
                <td>
                    <asp:DropDownList ID="ddlWork" runat="server">
                        <asp:ListItem>程序员</asp:ListItem>
                        <asp:ListItem>学生</asp:ListItem>
                        <asp:ListItem>教师</asp:ListItem>
                        <asp:ListItem>IT人士</asp:ListItem>
                        <asp:ListItem>软件工程师</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tdUser" colspan="2">
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="tdUser">
                    QQ:
                </td>
                <td>
                    <asp:TextBox ID="txtQQ" runat="server" CssClass="txtStyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdUser" colspan="2">
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="tdUser">电子邮件:</td>
                <td>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="txtStyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdCosplan" colspan="2">
                    联系方式
                </td>
                <td class="tdCosplan">
                    &nbsp;
                </td>
                <td class="tdUser" colspan="2">
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    QQ:
                </td>
                <td>
                    <asp:Label ID="LabelQQ" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    电子邮件:
                </td>
                <td>
                    <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUser" runat="server" Text="修改/完善个人信息" Height="25px" 
                        onclick="btnUser_Click" />
                </td>
            </tr>
            <tr>
                <td class="tdUser">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

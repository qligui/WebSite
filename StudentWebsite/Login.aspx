<%@ Page Title="登录" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentWebsite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleCss/Login.css" rel="stylesheet" type="text/css" />
    <script src="Jscripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function ($) {
            $.fn.togglePassword = function (options) {
                var s = $.extend($.fn.togglePassword.defaults, options),
        input = $(this);

                $(s.el).bind(s.ev, function () {
                    "password" == $(input).attr("type") ?
                $(input).attr("type", "<%=txtUserName.ClientID %>") :
                $(input).attr("type", "<%=txtPassWord.ClientID %>");
                });
            };
            $.fn.togglePassword.defaults = {
                ev: "click"
            };
        } (jQuery));

        $(function () {
            $('#<%=txtPassWord.ClientID %>').togglePassword({
                el: '#togglePassword'
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login_tip">
	<span style="height: 20px">如果您还没有帐号，<strong><a href="Register.aspx">立即注册</a></strong>。</span>
</div>
<div class="login">
<div class="login_title">用户登录</div>
    <div class="login_name">
    <table class="tablecolor">
    <tr>
    <td>用户名:</td>
    <td>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="username"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatoruUserName" runat="server" 
                ErrorMessage="*" ControlToValidate="txtUserName" ForeColor="Red" 
                Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlUser" runat="server" BackColor="#F7F7F7"  
                CssClass="ddluser" Height="25px">
                <asp:ListItem>学生</asp:ListItem>
                <asp:ListItem>教师</asp:ListItem>
                <asp:ListItem>管理员</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr><td>密 码:</td>
    <td>
        <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" 
            CssClass="password"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassWord" runat="server" 
            ErrorMessage="*" ControlToValidate="txtPassWord" ForeColor="Red"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
    <td>
        <input id="remPassword" type="checkbox" />记住密码
    </td>
     <td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="togglePassword" type="checkbox" />显示密码
     </td>
        </tr>
        <tr><td colspan="2">
            <asp:Button ID="BtnLogin" runat="server" Text="登  录" CssClass="btnlogin" 
                BackColor="#6285C1" BorderColor="White" BorderStyle="None" 
                ForeColor="#CCCCCC" Height="35px" Width="315px" onclick="BtnLogin_Click" /></td>
</tr>
<tr><td colspan="2">
    <asp:Label ID="LabelMsg" runat="server" ForeColor="Red"></asp:Label></td></tr>
    </table>
    </div>
</div>
</asp:Content>

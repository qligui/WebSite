<%@ Page Title="注册" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentWebsite.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleCss/Regsiter.css" rel="stylesheet" type="text/css" />
    <script src="Jscripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        function getClientId() {
            var passId = '<%= txtPassWord1.ClientID %>';
            return { Id: passId };
        }
    </script>
    <script src="Jscripts/PassWordenble.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
 <div  class="ResterText">
 欢迎大家注册大学生创新创业教育在线学习平台，在这里你可以学到更多相关的创业知识，
 并且和更多的朋友相互交流,相信创新创业知识学习会给大家带来更多的惊喜！
</div>
<div class="MainTitle">填写注册信息</div>
<div class="MainTable">
<table class="tableText">
<tr>
<td>用户名</td>
<td>
<asp:TextBox ID="txtUserName" MD="txtName" runat="server" CssClass="username" 
        MaxLength="50" AutoPostBack="True"></asp:TextBox>
</td>
 <td>
<asp:Label ID="labelUserName" runat="server" ForeColor="Red"></asp:Label>
</td>
</tr>
    <tr><td>设置密码</td><td>
        <asp:TextBox ID="txtPassWord1" runat="server" CssClass="password" 
            TextMode="Password" MaxLength="30" AutoPostBack="True"></asp:TextBox></td>
        <td><div id="divImg">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPassWord1" ForeColor="Red" ValidationGroup="Button"></asp:RequiredFieldValidator>
            </div> 
            </td>
        </tr>
        <tr><td>重复密码</td><td>
            <asp:TextBox ID="txtPassWord2" runat="server" CssClass="password2" 
                TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtPassWord2" ForeColor="Red" 
                        Display="Dynamic" ValidationGroup="Button"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="*密码前后不一致" ControlToCompare="txtPassWord1" 
                        ControlToValidate="txtPassWord2" ForeColor="Red"></asp:CompareValidator>
                </td>
                </tr>
         
         <tr><td>电子邮箱</td><td>
            <asp:TextBox ID="txtMail" runat="server" CssClass="txtemail"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtMail" ForeColor="Red" 
                    Display="Dynamic" ValidationGroup="Button"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="*邮箱格式不正确" ControlToValidate="txtMail" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
            <td>验证码</td>
            <td><asp:TextBox ID="txtNumber" runat="server" CssClass="txtnum" ></asp:TextBox>
            </td>
               <td><img src="Repeternum.ashx" onclick="this.src='Repeternum.ashx?aa='+new Date()" /></td> 
            </tr>
            <tr>
            <td colspan="2">
                <asp:Label ID="labelMsg" runat="server" Text="" ForeColor="Red"></asp:Label></td>
           </tr>
</table>
</div>
<div class="PageText">
<input id="privacy" value="1" checked=checked type="checkbox" name="privacy">我已经阅读并理解我们的<a href="Internet/ITlaws.htm" target="_blank">网站政策</a>。<br/>
<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BtnRepter" runat="server" Text="注册" Height="35px" Width="95px" 
        BackColor="#6285C1" BorderColor="White" BorderStyle="None" 
        ForeColor="White" onclick="BtnRepter_Click" ValidationGroup="Button" />
</div>
</div>
</asp:Content>

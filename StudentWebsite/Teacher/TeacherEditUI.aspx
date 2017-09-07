<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherEditUI.aspx.cs" Inherits="StudentWebsite.Teacher.TeacherEditUI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
    <tr>
    <td>教师工号</td>
     <td>
         <asp:TextBox ID="txttecherId" runat="server"></asp:TextBox>
     </td>
    </tr>
    <tr>
    <td>密 码：</td>
    <td>
         <asp:TextBox ID="txtPwd" runat="server"></asp:TextBox>
    </td>
    </tr>
        <tr>
    <td>
        <asp:Button ID="btnlogin" runat="server" Text="提交" Height="26px" 
            onclick="btnlogin_Click" Width="70px" />
    </td>
     <td>
         <asp:Button ID="Button2" runat="server" Text="返回" Height="26px" 
             onclick="Button2_Click" Width="80px" />
     </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>

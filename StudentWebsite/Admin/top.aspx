<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top.aspx.cs" Inherits="StudentWebsite.Admin.Admintop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>标题栏</title>
    <link href="../StyleCss/Admin.css" rel="stylesheet" type="text/css" />
    <script src="../Jscripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected");
                $(this).addClass("selected");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bgcolor">
        <img src="Images/admin_logo.png" id="imgpx" title="系统首页" />
<span class="spanImg">
<ul>
<li>
<a href="../News/NewsEditUI.aspx?action=addnew" target="rightFrame"><img src="Images/iconwork.png" class="selected"></a>
<a href="../News/NewsEditUI.aspx?action=addnew" target="rightFrame" class="txt">新增消息</a></li>
<li><a href="../Test/StudentGrade.aspx" target="rightFrame"><img src="Images/i05.png"></a>
<a href="../Test/StudentGrade.aspx" target="rightFrame" class="txt">成绩管理</a></li>
<li><a href="../User/studentMange.aspx" target="rightFrame"><img src="Images/i07.png"></a>
<a href="../User/studentMange.aspx" target="rightFrame" class="txt">用户管理</a></li>
</ul>
</span>
        <div class="topright">
            <ul>
                <li><span>
                    <img src="Images/help.png" title="帮助" class="helpimg" /></span><a href="#">帮助</a></li>
                <li><a href="#">关于</a></li>
                <li>
 <asp:LinkButton ID="linkLogUser" runat="server" onclick="linkLog_Click">退出登录</asp:LinkButton>
</li>
            </ul>
            <div class="user">
                <span><%=Session["adminName"] %></span> <i>消息</i> <b>0</b>
            </div>
            </div>
        </div>
    </form>
</body>
</html>

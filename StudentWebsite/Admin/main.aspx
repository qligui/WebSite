<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="StudentWebsite.Admin.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员系统</title>
</head>
<frameset rows="100,*" frameborder="no" border="0" framespacing="0">
    <frameset cols="*" frameborder="no" border="0" framespacing="0">
<frame src="top.aspx" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" /> 
    </frameset>
    <frameset cols="*" frameborder="no" border="0" framespacing="0">
<frameset cols="200,*" frameborder="no" border="0" framespacing="0">
<frame src="left.htm" name="leftFrame"  scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame"/> 
<frame src="Index.aspx" name="rightFrame" id="rightFrame" title="rightFrame" />
</frameset>
    </frameset>
</frameset>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportTest.aspx.cs" Inherits="StudentWebsite.Test.ImportTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>批量导入试题</title>
</head>
<body>
    <form id="form1" runat="server">
        <center><h2>批量导入导入试题</h2><hr /></center>
    <div>
    <br />
    <br />
    <center>
        <asp:FileUpload ID="fuload" runat="server" />
        <asp:Button ID="BtnImport" runat="server" Height="28px" 
            onclick="BtnImport_Click" Text="导入" Width="72px" />
        <asp:Label ID="lbmsg" runat="server"></asp:Label>
    </center>
    </div>
    <div style="margin-top:300px">
    <hr />
            <center><h3>导入试题使用说明</h3></center>
                <div style="margin-top:30px;">
    <p style="text-align: center;">
	<strong><span style="color:#0066cc;"><span style="font-size:16px;">
        &quot;在新增试题这块，请用户使用Excel文件，支持扩展名为.xls或者.xlsx&quot;</span></span></strong></p>
<p style="text-align: center;">
	<strong><span style="color:#0066cc;"><span style="font-size:16px;">&ldquo;请用户使用相关标准使用excel模块的导入。”</span></span></strong></p>
<p style="text-align: center;">
	<strong><span style="color:#0066cc;"><span style="font-size:16px;">&ldquo;您的支持，是我们渐进的动力！&rdquo;</span></span></strong></p>
    <center>
<p>
	<strong><span style="color:#0066cc;"><span style="font-size:18px;"> &ldquo;祝你体验愉快！&rdquo;</span></span></strong></p>
    </center>
   </div>
    </div>
    </form>
</body>
</html>

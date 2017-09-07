<%@ Page Title="发表问题" Language="C#" MasterPageFile="~/Method/Site.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddView.aspx.cs" Inherits="StudentWebsite.BBS.AddView" EnableViewState="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
    <link href="../Jscripts/kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <script src="../Jscripts/kindeditor/kindeditor.js" type="text/javascript"></script>
    <script src="../Jscripts/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../Jscripts/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#<%=txtMsg.ClientID %>', {
                resizeType : 0,
                resizeMode: 0,
                allowPreviewEmoticons: false,
                allowImageUpload: false,
                items: [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
            });
        });
    </script>
    <style type="text/css">
    .title { width: 640px; padding: 5px; border: 1px solid #ccc;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:#EDE8E8">
<div style="margin-top:60px;margin-left:70px;">
<br />
<table>
<tr><td>问题名称：</td>
<td>
    <asp:TextBox ID="txtTitle" runat="server" Width="640px" CssClass="title" 
        MaxLength="100"></asp:TextBox></td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="Msg" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
        </td>
</tr>
<tr><td>问题描述：</td>
<td>
  <asp:TextBox id="txtMsg" TextMode="MultiLine" runat="server" Width="648px" 
        Height="200px" MaxLength="200"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMsg" ValidationGroup="Msg"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnRequest" runat="server" Text="发 表" Height="30px" Width="90px" 
                onclick="btnRequest_Click" ValidationGroup="Msg" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="返 回" onclick="window.location.href='Index.aspx'" style="height:30px;width:90px" /></td>
        </tr>
</table>
<br />
</div>
</div>
<br />
<br />
</asp:Content>

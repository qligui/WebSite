<%@ Page Title="" Language="C#" MasterPageFile="~/Method/UserSite.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="StudentWebsite.User.Message" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
    <link href="../Jscripts/kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <script src="../Jscripts/kindeditor/kindeditor.js" type="text/javascript"></script>
    <script src="../Jscripts/kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../Jscripts/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor1 = K.create('#<%=txtMsg.ClientID %>', {
                resizeType: 0,
                resizeMode: 0,
                allowPreviewEmoticons: false,
                allowImageUpload: false,
                items: [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'link']
            });
        });
    </script>
    <style type="text/css">
    .YanZhen { width: 70px; padding: 5px; border: 1px solid #ccc;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
<div style="margin-top:0px;margin-left:50px;">
<br />
<table>
<tr><td>留 言：</td>
<td>
  <asp:TextBox ID="txtMsg" TextMode="MultiLine" runat="server" Width="648px" 
        Height="200px" ControlToValidate="txtMsg"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="*" ValidationGroup="Msg" ForeColor="#FF3300" 
                ControlToValidate="txtMsg"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td></td>
        <td colspan="2">
        <asp:Button ID="btnRequest" runat="server" Text="提   交" Height="35px" Width="145px" 
                onclick="btnRequest_Click" ValidationGroup="Msg" />&nbsp;
                <asp:TextBox ID="txtYanZhen" runat="server" CssClass="YanZhen"></asp:TextBox>
        <img src="../Repeternum.ashx" onclick="this.src='../Repeternum.ashx?aa='+new Date()" id="ImageYanZhen"/>
<a href="javascript:changeImage()" style="font-size:13px;text-decoration: none;">看不清楚</a>&nbsp;
    <asp:Label ID="LabError" runat="server" ForeColor="Red"></asp:Label></td>
</table>
<script type="text/javascript">
    function changeImage() {
        var x = document.getElementById('ImageYanZhen');
        x.setAttribute('src', '../Repeternum.ashx?' + new Date());
    } 
</script>
<br />
</div>
</div>
<br />
<br />
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="StudentWebsite.Message" ValidateRequest="false" %>
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
.ResterText{margin:10px 0 0;color:#767779;height:2.5em;line-height:2.5;border:solid 1px #ccd0d3;background:#e6e8ea;padding:5px;font-size:15px;}
.OuputAnswer{margin-top:10px;}
.YanZhen{width: 80px; padding: 5px; border: 1px solid #ccc;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="ResterText">
 您的支持 是我们前进的动力！
</div>
<div class="OuputAnswer">
<asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="750px" Height="300px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtMsg" ForeColor="Red" 
        ValidationGroup="Msg"></asp:RequiredFieldValidator>
<div>
<table>
<tr><td>
    <asp:Button ID="btnAnswer" runat="server" Text="提交留言" Height="30px"  
        Width="130px" onclick="btnAnswer_Click" ValidationGroup="Msg" /></td>
<td>&nbsp;&nbsp;</td>
<td><asp:TextBox ID="txtYanZhen" runat="server" CssClass="YanZhen"></asp:TextBox></td>
<td><img src="../Repeternum.ashx" onclick="this.src='../Repeternum.ashx?aa='+new Date()" id="ImageYanZhen"/>
<a href="javascript:changeImage()" style="font-size:12px;text-decoration: none;">看不清楚</a>
</td>
<td>
    <asp:Label ID="LabError" runat="server" ForeColor="Red"></asp:Label></td>
</tr>
</table>
<script type="text/javascript">
    function changeImage() {
        var x = document.getElementById('ImageYanZhen');
        x.setAttribute('src', '../Repeternum.ashx?' + new Date());
    } 
</script> 
</div>
</div>
</asp:Content>

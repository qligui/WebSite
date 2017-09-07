<%@ Page Title="在线问答" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="StudentWebsite.BBS.View" ValidateRequest="false" EnableViewState="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleCss/View.css" rel="stylesheet" type="text/css" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="width:950px;">
<div class="navlink_show">您现在正在浏览：问题讨论</div>
    <asp:ObjectDataSource ID="objDataAnswer" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataById" 
        TypeName="StudentWebsite.DAL.DataSetBBSTableAdapters.T_BBSTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_BBSId" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QuestionTitle" Type="String" />
            <asp:Parameter Name="QuestionConent" Type="String" />
            <asp:Parameter Name="QuestionUserName" Type="String" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="VisitHits" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BBSId" QueryStringField="id" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuestionTitle" Type="String" />
            <asp:Parameter Name="QuestionConent" Type="String" />
            <asp:Parameter Name="QuestionUserName" Type="String" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="VisitHits" Type="Int32" />
            <asp:Parameter Name="Original_BBSId" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FvAnswer" runat="server" DataSourceID="objDataAnswer" 
        DataKeyNames="BBSId" Width="950px">
     <ItemTemplate>
<!--题目框-->
<div class="pb_mainbox_show">
<div class="pb_box_l_show">
 <span class="title">
 <a href="#" target="_blank"><asp:Label ID="QuestionTitleLabel" runat="server" Text='<%# Bind("QuestionTitle") %>' /></a>
 </span>
 <br />
<p class="pb_box_right_show">
<a href="#" style="margin-left:5px;"><asp:Label ID="QuestionUserNameLabel" runat="server" Text='<%# Bind("QuestionUserName") %>' /></a>
 发表于<span class="d"><asp:Label ID="AddTimeLabel" runat="server" Text='<%# Bind("AddTime") %>' /></span>
 提问者：<asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestionUserName") %>' />&nbsp;</p>
</div>
<div class="content">
<asp:Label ID="QuestionConentLabel" runat="server" Text='<%# Bind("QuestionConent") %>' />
</div>
</div>
</ItemTemplate>
</asp:FormView>
<div class="clear"><br /></div>
<!--所有回答栏-->
<div class="navlink_show">全部答案</div>
    <asp:ObjectDataSource ID="objDataOtherAnswer" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetElementByBBSId" 
        TypeName="StudentWebsite.DAL.DataSetBBSTableAdapters.T_BBSAnswerTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_AnswerId" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AnswerUserName" Type="String" />
            <asp:Parameter Name="BBSId" Type="Int64" />
            <asp:Parameter Name="AnserTitle" Type="String" />
            <asp:Parameter Name="AnserContent" Type="String" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BBSId" QueryStringField="id" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AnswerUserName" Type="String" />
            <asp:Parameter Name="BBSId" Type="Int64" />
            <asp:Parameter Name="AnserTitle" Type="String" />
            <asp:Parameter Name="AnserContent" Type="String" />
            <asp:Parameter Name="AddTime" Type="DateTime" />
            <asp:Parameter Name="Original_AnswerId" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:Repeater ID="RepterotherAnswer" runat="server" 
        DataSourceID="objDataOtherAnswer">
    <ItemTemplate>
<div class="newslist">
<dl>
<dd class="desc">
<!--digg & bury-->
<div class="" id="digg_<%#Eval("AnswerID")%>">
</div>
<div class="" style="word-wrap: break-word; word-break: break-all; float: left; width: 90%;margin-left: 22px;">
<img src="Images/quote_start.gif" style="float: left;" /><div style="float: left;font-size: medium;"> <%#Eval("AnserContent")%></div>
<img src="Images/quote_end.gif" style="float: right; margin-right: 43px;" /></div></dd></dl>
<dl>
<dd class="detail">
<p class="author">
<a href="#">
<%#Eval("AnswerUserName")%></a>&nbsp;在 <span style="color: Gray;">
<%#Eval("AddTime")%></span> 时回答 </p>
</dd> </dl></div>
</ItemTemplate>
</asp:Repeater>
<br />
<!--我来解答-->
<div class="navlink_show">我要解答</div>
<div class="OuputAnswer">
<asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="750px" 
            Height="300px" MaxLength="200"></asp:TextBox>
<div>
<table>
<tr><td><asp:Button ID="btnAnswer" runat="server" Text="发表解答" Height="30px"  
        Width="130px" onclick="btnAnswer_Click" ValidationGroup="msg" /></td>
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
        x.setAttribute('src', '../Repeternum.ashx?' +new Date());
    } 
</script> 
</div>
</div>
</div>
</asp:Content>

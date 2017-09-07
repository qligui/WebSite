<%@ Page Title="" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="ResplaceTest.aspx.cs" Inherits="StudentWebsite.Test.ResplaceTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:Azure;margin-top:-10px;">
<center><h3>
<p><strong>你现在进入的是创业测试专题，对于该专题，我们将采用分数制来衡量你的学习成果。</strong></p>
</h3>
<h3><p><strong>请按照测试要求答题！</strong></p></h3>
<br />
<br />
<br />
<br />
<center>
<input type="button" onclick="if(confirm('您同意上处意见并参与考试吗？')){javascript:window.location.href='../Test/Test.aspx';}" value="准备测试" style="height: 40px; width: 175px" />
</center>
</div>
</asp:Content>

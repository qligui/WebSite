<%@ Page Title="内容" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="NewsContent.aspx.cs" Inherits="StudentWebsite.NewsContent" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleCss/News.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
<p><h2><asp:Literal ID="LitTitle" runat="server"></asp:Literal></h2></p>
</center>
<p class="author">作者：<asp:Literal ID="LitAuthor" runat="server"></asp:Literal></p>
<p class="date">发布日期：<asp:Literal ID="Litdate" runat="server"></asp:Literal></p>
<br class="clear" />
<br />
<p><asp:Literal ID="LitContent" runat="server"></asp:Literal></p>
</asp:Content>

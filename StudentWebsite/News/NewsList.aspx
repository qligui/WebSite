<%@ Page Title="新闻动态" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="StudentWebsite.News.NewsList" EnableViewState="false" %>
<%@ Register src="../UserControl/NewsControl.ascx" tagname="NewsControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    a{text-decoration:none;color:#042780;}
    a:hover{text-decoration:none;color:#336bf9;}
    #tabs-1 li,#tabs-2 li{border-bottom:1px dashed #adadb0;margin-top:15px;
                          text-overflow:ellipsis; overflow:hidden;white-space:nowrap;}
    </style>
    <script src="../Jscripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="../Jscripts/jquery-ui/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs();
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="tabs">
<ul>
<li><a href="#tabs-1">新闻动态</a></li>
<li><a href="#tabs-2">政策法规</a>
    </li>
</ul>
  <div id="tabs-1">  
      <uc1:NewsControl ID="NewsInfoControl" runat="server" TypeId="1" />   
  </div>
  <div id="tabs-2">
      <uc1:NewsControl ID="NewsLawControl" runat="server" TypeId="4" />
  </div>
</div>
</asp:Content>

<%@ Page Title="创业专题" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="ProList.aspx.cs" Inherits="StudentWebsite.News.ProList" %>
<%@ Register src="../UserControl/NewsControl.ascx" tagname="NewsControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        a{text-decoration: none;color: #042780;}
        a:hover{text-decoration: none;color: #336bf9;}
        #tabs-1 li, #tabs-2 li{border-bottom: 1px dashed #adadb0; margin-top: 15px;
                               text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
<li><a href="#tabs-1">创业实例</a></li>
<li><a href="#tabs-2">创业技巧</a></li>
</ul>
  <div id="tabs-1">
      <uc1:NewsControl ID="BunExple" runat="server" TypeId="2"/>
  </div>
  <div id="tabs-2">
      <uc1:NewsControl ID="BunSkill" runat="server" TypeId="3"/>
  </div>
</div>
</asp:Content>

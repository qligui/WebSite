<%@ Page Title="资料列表" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="MeansList.aspx.cs" Inherits="StudentWebsite.Means.MeansList" EnableViewState="false" %>
<%@ Register src="../UserControl/MeanStyle.ascx" tagname="MeanStyle" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../StyleCss/MeanStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    a{text-decoration:none;color:#042780;}
    a:hover{text-decoration:none;color:#336bf9;}
    #tabs-1 li,#tabs-2 li,#tabs-3 li,#tabs-4 li{border-bottom:1px dashed #adadb0;margin-top:-15px;
                          text-overflow:ellipsis;overflow:hidden;white-space:nowrap;}
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
<li><a href="#tabs-1">传统技能</a></li>
<li><a href="#tabs-2">知识服务</a></li>
<li><a href="#tabs-3">就业创业</a></li>
<li><a href="#tabs-4">其他创业</a></li>
</ul>
 <div id="tabs-1">
     <uc1:MeanStyle ID="MeanStyle1" runat="server" TypeId="1" />
</div>

  <div id="tabs-2">
      <uc1:MeanStyle ID="MeanStyle2" runat="server" TypeId="2" />
  </div>
    <div id="tabs-3">
        <uc1:MeanStyle ID="MeanStyle3" runat="server" TypeId="3" />
  </div>
  <div id="tabs-4">
      <uc1:MeanStyle ID="MeanStyle4" runat="server" TypeId="4" />
  </div>
</div>
</asp:Content>

<%@ Page Title="行业知识库" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="WorkList.aspx.cs" Inherits="StudentWebsite.News.WorkList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Jscripts/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        a{text-decoration: none;color: #042780;}
        a:hover{text-decoration: none;color: #336bf9;}
        #tabs-1, #tabs-2,#tabs-3,#tabs-4 li{border-bottom: 1px dashed #adadb0; margin-top: 15px;
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
<li><a href="#tabs-1">科技网络</a></li>
<li><a href="#tabs-2">自然科学</a></li>
<li><a href="#tabs-3">人文历史</a></li>
<li><a href="#tabs-4">社会服务</a></li>
</ul>
    <div id="tabs-1">
        1
    </div>
    <div id="tabs-2">
        2
    </div>
    <div id="tabs-3">
        3
    </div>
    <div id="tabs-4">
        4
    </div>
</div>
</asp:Content>

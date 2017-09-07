<%@ Page Title="首页" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentWebsite.Default"  EnableViewState="false"%>
<%@ Register src="UserControl/NewsControl.ascx" tagname="NewsControl" tagprefix="uc1" %>
<%@ Register src="UserControl/MeansControl.ascx" tagname="MeansControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleCss/Default.css" rel="stylesheet" type="text/css" />
    <link href="StyleCss/Imgplay.css" rel="stylesheet" type="text/css" />
    <link href="StyleCss/News.css" rel="stylesheet" type="text/css" />
    <script src="Jscripts/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="Jscripts/Imgplay.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#Imgplay").show();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_kuangjia">
<div class="main_picture">
	<div id="Imgplay" style="display:none;">
		<a href="#"><img src="Images/01.jpg" /></a>
		<a href="#"><img src="Images/02.jpg" /></a>
		<a href="#"><img src="Images/03.jpg" /></a>
        <a href="#"><img src="Images/04.jpg" /></a>
        <a href="#"><img src="Images/05.jpg" /></a>
        </div>
<!--<h1>图片栏</h1>-->
</div>
<div class="main_news">
<div class="main_title">
<span class="main_more">
<a href="News/NewsList.aspx" title="更多">More>></a>
</span>
</div>

<div class="main_newsbody">

<uc1:NewsControl ID="NewsControl1" runat="server" TypeId="1" MaxLength="7" />

</div>
</div>
</div>

<div class="main_statworking">

<div class="main_laws">
<div class="main_pic">
<span class="main_more"><a href="" title="更多">More>></a></span> 
</div>
<div class="main_newslaws">

    <uc1:NewsControl ID="NewsControl2" runat="server" TypeId="4" MaxLength="7" />

</div>
</div>


<div class="main_zip">
<div class="main_down">
<span class="main_more">
<a href="Means/MeansList.aspx" title="更多">More>></a>
</span>
</div>
<div class="main_newsload">
    <uc2:MeansControl ID="MeansControl1" runat="server" MaxLength="7" />
</div>
</div>
</div>

<div class="main_kuangjia">

<div class="main_zhinan">
<div class="main_workexplame">
<span class="main_more">
<a href="News/ProList.aspx" title="更多">More>></a>
</span>
</div>
<div class="main_newsexe">

    <uc1:NewsControl ID="NewsControl3" runat="server" TypeId="2" MaxLength="7" />

</div>
</div>

<div class="main_jiqiao">
<div class="main_workskill">
<span class="main_more">
<a href="News/ProList.aspx" title="更多">More>></a>
</span>
</div>
<div class="main_newsskill">

    <uc1:NewsControl ID="NewsControl4" runat="server" TypeId="3" MaxLength="7" />

</div>
</div>

<div class="end">
<div class="main_link"></div>
<div>
<ul>
<li><a href="http://cy.ncss.org.cn/"><img src="Images/Student.jpg" style="width: 260px; height: 45px"/></a></li>
<li><a href="http://www.studentboss.com/"><img src="Images/student02.jpg" style="width: 260px; height: 45px"/></a></li>
<li><a href="http://www.jxga.com/"><img src="Images/jxga.jpg" style="width:260px;height:45px" /></a></li>
</ul>
</div>
</div>
</div>
</asp:Content>

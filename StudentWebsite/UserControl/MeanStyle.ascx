<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeanStyle.ascx.cs" Inherits="StudentWebsite.UserControl.MeanStyle" %>
<asp:Repeater ID="ReMeanStyle" runat="server">
<ItemTemplate>
<ul id="dll_list">
<li>
<div class="ddlist_info">
<h2><a class="deepred" href='../Means/DownLoad.ashx?FileName=<%#Eval("FileName") %>' title='<%#Eval("Title") %>'><%#Eval("Title") %></a></h2>
<div class="ddllist_summary">
<span>
<div class="ddlist_img"></div>
</span>
<span class="txtSize"><%#Eval("Description")%></span>
</div>
<p class="ddlist_more">
<span class="green"><a href='../Means/DownLoad.ashx?FileName=<%#Eval("FileName") %>' title='<%#Eval("Title") %>'>
<img alt="立即下载" src="../Means/Images/btn_download.gif" /></a><%#Eval("FileSize") %>&nbsp;下载:<%#Eval("DownLoadHits") %><a href='#'>&nbsp;上传者：<%#Eval("Author") %></a></span></p>
</div>
<div class="clear"></div>
</li>
</ul>
</ItemTemplate>
</asp:Repeater>



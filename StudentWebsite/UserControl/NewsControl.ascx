<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsControl.ascx.cs" Inherits="StudentWebsite.UserControl.NewsControl" %>

<asp:Repeater ID="RepterNews" runat="server">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate><li>
<a href='../News/NewsContent.aspx?id=<%#Eval("NewId") %>' title='<%#Eval("Title") %>'><%#Eval("Title") %></a>
</li></ItemTemplate>
<FooterTemplate></ul></FooterTemplate>
</asp:Repeater>
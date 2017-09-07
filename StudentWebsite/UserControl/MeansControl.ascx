<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeansControl.ascx.cs" Inherits="StudentWebsite.UserControl.MeansControl" %>
<asp:Repeater ID="RepeaterMeans" runat="server">
<HeaderTemplate><div style="float:left;width:450px;height:280px;"><ul></HeaderTemplate>
<ItemTemplate>
<li>
<a href='../Means/DownLoad.ashx?FileName=<%#Eval("FileName") %>' title=<%#Eval("Title") %>><%#Eval("Title") %><img style="float:right;" src="../Means/Images/btn_download.gif" /></a>
</li>
</ItemTemplate>
<FooterTemplate></ul></div></FooterTemplate>
</asp:Repeater>

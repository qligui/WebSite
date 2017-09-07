<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SoulutionQuest.ascx.cs" Inherits="StudentWebsite.UserControl.SoulutionQuest" %>
<asp:Repeater ID="RepeaterSoulation" runat="server">
<ItemTemplate>
<li><a href="view.aspx?id=<%#Eval("BBSId")%>&action=Read" style=" text-decoration: none;" target="_blank">
<strong><%#Eval("QuestionTitle")%></strong></a>
</li>
</ItemTemplate>
</asp:Repeater>

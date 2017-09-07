<%@ Page Title="创业论坛" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="StudentWebsite.BBS.Index" %>
<%@ Register src="../UserControl/SoulutionQuest.ascx" tagname="SoulutionQuest" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleCss/BBSIndex.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .topic a:hover{text-decoration: none;}
        .content a:visit{color:Red;}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bbsTitle">
<div style="float: left; margin-left: 5px;">
<asp:TextBox ID="txtQS" runat="server" Height="22px" Width="494px"></asp:TextBox></div>
<div class="bbsTiWen">
<a href="AddView.aspx" style="cursor: pointer; text-decoration: none;">
<span style="margin-left: 8px; margin-top: 5px; color: White; height: 21px; font-size:11pt;">
我要提问</span>
</a>
</div>
</div>

 <div style="width:680px;float:left;">
     <asp:ObjectDataSource ID="objDataQuestion" runat="server" DeleteMethod="Delete" 
         InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
         SelectMethod="GetData" 
         TypeName="StudentWebsite.DAL.DataSetBBSTableAdapters.T_BBSTableAdapter" 
         UpdateMethod="Update">
         <DeleteParameters>
             <asp:Parameter Name="Original_BBSId" Type="Int64" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="QuestionTitle" Type="String" />
             <asp:Parameter Name="QuestionConent" Type="String" />
             <asp:Parameter Name="QuestionUserName" Type="String" />
             <asp:Parameter Name="AddTime" Type="DateTime" />
             <asp:Parameter Name="Status" Type="Boolean" />
             <asp:Parameter Name="VisitHits" Type="Int32" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="QuestionTitle" Type="String" />
             <asp:Parameter Name="QuestionConent" Type="String" />
             <asp:Parameter Name="QuestionUserName" Type="String" />
             <asp:Parameter Name="AddTime" Type="DateTime" />
             <asp:Parameter Name="Status" Type="Boolean" />
             <asp:Parameter Name="VisitHits" Type="Int32" />
             <asp:Parameter Name="Original_BBSId" Type="Int64" />
         </UpdateParameters>
     </asp:ObjectDataSource> 
<asp:Repeater ID="RepterQustion" runat="server" DataSourceID="objDataQuestion">
<ItemTemplate>
                <div class="newslist">
                    <dl>
                        <dt class="topic"><a href="view.aspx?id=<%#Eval("BBSId")%>&action=Read" style="margin-left: 22px;
                            margin-right: 42px; text-decoration: none;" target="_blank">
                            <strong>
                                <%#QuestionStatus(Eval("Status").ToString())%><%#Eval("QuestionTitle")%></strong></a>
                        </dt>
                    </dl>
                    <dl>
                        <dd class="desc">
                            <!--digg & bury-->
                            <div class="" id="digg_<%#Eval("BBSId")%>">
                            </div>
                            <div class="" style="word-wrap: break-word; word-break: break-all; float: left; width: 90%;
                                margin-left: 22px;">
                                <img src="Images/quote_start.gif" style="float: left;" /><div style="float: left;font-size:13px;">
                                    <%#Eval("QuestionConent")%></div>
                                <img src="Images/quote_end.gif" style="float: right; margin-right: 43px;" /></div>
                        </dd>
                    </dl>
                    <dl>
                        <dd class="detail">
                            <p class="author" style=" font-size:13px;">
                                <a href='../member/user.aspx?n=<%#Eval("QuestionUserName")%>'>
                                    <%#Eval("QuestionUserName")%></a>&nbsp;在 <span class="d">
                                        <%#Eval("AddTime")%></span> 提问|
                                <img src="Images/comment.gif" /> <%#WriteText(Eval("BBSId").ToString())%>条评论
                                <img src="Images/qrt.gif" />
                                <%#Eval("VisitHits")%>次阅读
                            </p>
                        </dd>
                    </dl>
                </div>
</ItemTemplate>
</asp:Repeater>      
 </div>



    <div class="i_right_news" style="float: right;">
            <div class="i_right1" style="height: 100%; width: 250px;">
                <div class="box_titler">
                    <ul>
                        <li style="margin-left: 15px; margin-top: 6px;">待解决问题</li>
                    </ul>
                </div>
                <div class="content">
                    <ul style="margin: 10px;list-style-type:none">

                        <uc1:SoulutionQuest ID="SoulutionQuest1" runat="server" Status="False" />

                    </ul>
                </div>
            </div>
      
        <div>
            <div class="i_right1" style="height: 100%; width: 248px; margin-top: 8px">
                <div class="box_titler">
                    <ul style="list-style-type:none">
                        <li style="margin-left: 15px; margin-top: 6px;">已解决问题</li>
                    </ul>
                </div>
                <div class="content">
                    <ul style="margin: 10px;">
                        <uc1:SoulutionQuest ID="SoulutionQuest2" runat="server" Status="True" />
                    </ul>
                </div>
            </div>
        </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thBBS.aspx.cs" Inherits="StudentWebsite.Teacher.thBBS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>教师论坛</title>
        <link href="../StyleCss/BBSIndex.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .topic a:hover{text-decoration: none;}
        .content a:visit{color:Red;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="objDataBBS" runat="server" DeleteMethod="Delete" 
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
        <asp:ListView ID="LvBBS" runat="server" DataKeyNames="BBSId" 
            DataSourceID="objDataBBS">
            <EmptyDataTemplate>
                <span>没有数据了！</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                 <div class="newslist">
                    <dl>
                        <dt class="topic"><a href='../BBS/View.aspx?id=<%#Eval("BBSId")%>&action=Read' style="margin-left: 22px;
                            margin-right: 42px; text-decoration: none;" target="_blank">
                            <strong>
                                <%#QuestionStatus(Eval("Status").ToString())%><%#Eval("QuestionTitle")%></strong></a><p>
                                </p>
                        </dt>
                    </dl>
                    <dl>
                        <dd class="desc">
                            <!--digg & bury-->
                            <div class="" id="digg_<%#Eval("BBSId")%>">
                            </div>
                            <div class="" style="word-wrap: break-word; word-break: break-all; float: left; width: 90%;
                                margin-left: 22px;">
                                <img src="../BBS/Images/quote_start.gif" style="float: left;" /><div style="float: left;font-size:13px;">
                                    <%#Eval("QuestionConent")%></div>
                                <img src="../BBS/Images/quote_end.gif" style="float: right; margin-right: 43px;" /></div>
                        </dd>
                    </dl>
                    <dl>
                        <dd class="detail">
                            <p class="author" style=" font-size:13px;">
                                <a href='../member/user.aspx?n=<%#Eval("QuestionUserName")%>'>
                                    <%#Eval("QuestionUserName")%></a>&nbsp;在 <span class="d">
                                        <%#Eval("AddTime")%></span> 提问|
                                <img src="../BBS/Images/comment.gif" /> <%#WriteText(Eval("BBSId").ToString())%>条评论
                                <img src="../BBS/Images/qrt.gif" />
                                <%#Eval("VisitHits")%>次阅读
                            </p>
                        </dd>
                    </dl>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
    <div>
    <center>
        <asp:DataPager ID="DataPageBBS" runat="server" PagedControlID="LvBBS">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                    ShowLastPageButton="True" />
            </Fields>
        </asp:DataPager>
        </center>
    </div>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmesMange.aspx.cs" Inherits="StudentWebsite.Admin.MessageMange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>留言内容</title>
        <link href="../StyleCss/BBSIndex.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .topic a:hover{text-decoration: none;}
        .content a:visit{color:Red;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManagerAmes" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelMes" runat="server">
    <ContentTemplate>
    <asp:ObjectDataSource ID="objDataMes" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="StudentWebsite.DAL.DataSetMessageTableAdapters.T_MessageTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_MessageId" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="content" Type="String" />
            <asp:Parameter Name="DateTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="content" Type="String" />
            <asp:Parameter Name="DateTime" Type="DateTime" />
            <asp:Parameter Name="Original_MessageId" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <div>
        <asp:ListView ID="lvMess" runat="server" DataKeyNames="MessageId" 
            DataSourceID="objDataMes">
            <EmptyDataTemplate>
                <span>没有留言了！</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                            <div class="newslist">
                    <dl>
                        <dt class="topic" style="height:20px;background-color:#D1D1D1;"><strong><%#Eval("UserName") %></strong></a>
                        </dt>
                    </dl>
                    <dl>
                        <dd class="desc">
                            <!--digg & bury-->
                            <div class="" style="word-wrap: break-word; word-break: break-all; float: left; width: 90%;
                                margin-left: 22px;">
                                <img src="../BBS/Images/quote_start.gif" style="float: left;" /><div style="float: left;font-size:13px;">
                                    <%#Eval("content")%></div>
                                <img src="../BBS/Images/quote_end.gif" style="float: right; margin-right: 43px;" /></div>
                        </dd>
                    </dl>
                    <dl>
                        <dd class="detail">
                            <p class="author" style=" font-size:13px;">
                                <a href='#'><%#Eval("UserName")%></a>&nbsp;在 <span class="d">
                                  <%# Eval("DateTime") %></span>留言
                            </p>
                        </dd>
                    </dl>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <div style="margin-left:400px;">
        <asp:DataPager ID="DataPagerMes" runat="server" PagedControlID="lvMess">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                    ShowLastPageButton="True" />
            </Fields>
        </asp:DataPager>
        </div>
    </div>
   </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>

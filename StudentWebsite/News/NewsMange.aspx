<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsMange.aspx.cs" Inherits="StudentWebsite.News.NewsMange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>新闻管理</title>
    <link href="newStyle/NewList.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="newstype">
        <asp:ObjectDataSource ID="objNewsMange" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByPaged" 
            TypeName="StudentWebsite.DAL.DataSetNewsTableAdapters.T_NewsTableAdapter" 
            UpdateMethod="Update" EnablePaging="True" SelectCountMethod="QueryCount">
            <DeleteParameters>
                <asp:Parameter Name="Original_NewId" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="NewsTypeId" Type="Int64" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="DateTime" Type="DateTime" />
                <asp:Parameter Name="NewMsg" Type="String" />
                <asp:Parameter Name="ReadHits" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="NewsTypeId" Type="Int64" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="DateTime" Type="DateTime" />
                <asp:Parameter Name="NewMsg" Type="String" />
                <asp:Parameter Name="ReadHits" Type="Int64" />
                <asp:Parameter Name="Original_NewId" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
        <asp:ObjectDataSource ID="objNewsType" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="StudentWebsite.DAL.DataSetNewsTableAdapters.T_NewsTypeTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int64" />
                <asp:Parameter Name="Name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Original_Id" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ListView ID="LvnewsMange" runat="server" DataKeyNames="NewId" 
            DataSourceID="objNewsMange" >
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            没有新闻！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="" id="trType">
                    <td>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="ddlNewsType" runat="server" SelectedValue='<%#Eval("NewsTypeId") %>' DataTextField="Name" DataSourceID="objNewsType" DataValueField="Id" Enabled="False">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="DateTimeLabel" runat="server" Text='<%# Eval("DateTime") %>' />
                    </td>
                    <td>&nbsp;</td>
                     <td>
                     <a href='NewsEditUI.aspx?action=edit&id=<%#Eval("NewId")%>'>编辑</a>
                        <asp:Button ID="DeleteButton" runat="server" OnClientClick="return confirm('真的要删除吗？');" CommandName="Delete" Text="删除" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0">
                                <tr runat="server">
                                    <th runat="server">
                                        新闻标题</th>
                                        <th runat="server">
                                        &nbsp;
                                        </th>
                                    <th runat="server">
                                        新闻类型</th>
                                     <th runat="server">
                                        &nbsp;
                                        </th>
                                    <th runat="server">
                                        作者</th>
                                      <th runat="server">
                                        &nbsp;
                                        </th>
                                    <th runat="server">
                                        发布日期</th>
                                     <th runat="server">
                                        &nbsp;
                                        </th>
                                        <th runat="server">
                                        操作
                                        </th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server" class="pager">
                        <td runat="server">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="首页" ShowFirstPageButton="True"
                                        ShowNextPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" LastPageText="尾页"
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>

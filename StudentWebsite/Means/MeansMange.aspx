<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeansMange.aspx.cs" Inherits="StudentWebsite.Means.MeansMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资料管理</title>
    <style type="text/css">
    .table{width:900px;}
    .tr{width:350px;}
    .td{width:350px;}
    </style>
</head>
<body style="background-color:#C6E2FF">
    <form id="form1" runat="server">
    <div>
    
       <asp:ObjectDataSource ID="objMeans" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="StudentWebsite.DAL.DataSetMeansTableAdapters.T_MeansLoadTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_MeansId" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="MeansType" Type="Int64" />
                <asp:Parameter Name="DateTime" Type="DateTime" />
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileSize" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DownloadHits" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Author" Type="String" />
                <asp:Parameter Name="MeansType" Type="Int64" />
                <asp:Parameter Name="DateTime" Type="DateTime" />
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileSize" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DownloadHits" Type="Int64" />
                <asp:Parameter Name="Original_MeansId" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objMeansType" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" TypeName="StudentWebsite.DAL.DataSetMeansTableAdapters.T_MeansTypeTableAdapter" 
            InsertMethod="Insert" UpdateMethod="Update">
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
    
        <asp:ListView ID="LvMeans" runat="server" DataKeyNames="MeansId" 
            DataSourceID="objMeans" onitemcommand="LvMeans_ItemCommand">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                           没有资料了！
                           </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                    <%# Eval("Title") %>
                    </td>
                    <td>
                      <%# Eval("Author")%>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMeansType" runat="server" SelectedValue='<%# Eval("MeansType") %>' DataTextField="Name" DataSourceID="objMeansType" DataValueField="Id" Enabled="false">
                        </asp:DropDownList>
                    </td>
                    <td>
                      <%# Eval("DateTime") %>
                    </td>
                    <td>
                       <%# Eval("FileSize") %>
                    </td>
                      <td>
                      <a href='MeansEditUI.aspx?action=edit&id=<%#Eval("MeansId") %>'>编辑</a>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClientClick="return confirm('真的要删除吗？');" Text="删除" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="" align="center">
                                <tr runat="server" style="" align="center">
                                    <td runat="server">
                                        资料名称</td>
                                    <td runat="server">
                                        上传作者</td>
                                    <td runat="server">
                                        上传类型</td>
                                    <td runat="server">
                                        上传时间</td>
                                    <td runat="server">
                                        文件大小</td>
                                        <td runat="server">
                                        操作
                                        </td>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
            </LayoutTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>

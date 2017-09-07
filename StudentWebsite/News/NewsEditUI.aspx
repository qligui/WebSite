<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsEditUI.aspx.cs" Inherits="StudentWebsite.News.NewsEditUI" ValidateRequest="False" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="../Jscripts/ckeditor/ckeditor.js" type="text/javascript"></script>
<link href="newStyle/NewList.css" rel="stylesheet" type="text/css" />
<head runat="server">
    <title>新闻编辑</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="newstype1">
    
        <asp:ObjectDataSource ID="ObjNewsEdit" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByNewId" 
            TypeName="StudentWebsite.DAL.DataSetNewsTableAdapters.T_NewsTableAdapter" 
            UpdateMethod="Update">
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
            <SelectParameters>
                <asp:QueryStringParameter Name="NewId" QueryStringField="id" Type="Int64" />
            </SelectParameters>
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
    
        <asp:FormView ID="FvEditUI" runat="server" DataKeyNames="NewId" 
            DataSourceID="ObjNewsEdit" onitemupdated="FvEditUI_ItemUpdated" 
            onitemupdating="FvEditUI_ItemUpdating" 
            onitemcommand="FvEditUI_ItemCommand" 
            oniteminserted="FvEditUI_ItemInserted" oniteminserting="FvEditUI_ItemInserting">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>
                            新闻标题
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' CssClass="txtTitle" Width="800px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TitleTextBox" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                        新闻类型
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNewType" runat="server" SelectedValue='<%#Bind("NewsTypeId") %>'
                                DataValueField="Id" DataTextField="Name" DataSourceID="objNewsType">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            作者
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' CssClass="txtAuthor" Width="300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            新闻内容
                        </td>
                        <td>
                            <asp:TextBox ID="NewMsgTextBox" runat="server" Text='<%# Bind("NewMsg") %>' TextMode="MultiLine"
                                CssClass="ckeditor" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" Text="*" ControlToValidate="NewMsgTextBox" EnableClientScript="False" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="更新" />
                        </td>
                        <td>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="取消" />
                        </td>
                    </tr>
                </table>
               
                
                
                <br />
                <br />
                &nbsp;
            </EditItemTemplate>
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            新闻标题
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' CssClass="txtTitle"
                                Width="800px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ControlToValidate="TitleTextBox" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            新闻类型
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNewType" runat="server" SelectedValue='<%#Bind("NewsTypeId") %>'
                                DataValueField="Id" DataTextField="Name" DataSourceID="objNewsType">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            作者
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' CssClass="txtAuthor"
                                Width="300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            新闻内容
                        </td>
                        <td>
                            <asp:TextBox ID="NewMsgTextBox" runat="server" Text='<%# Bind("NewMsg") %>' TextMode="MultiLine"
                                CssClass="ckeditor" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                                Text="*" ControlToValidate="NewMsgTextBox" EnableClientScript="False" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="保存" />
                        </td>
                        <td>
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="取消" />
                        </td>
                    </tr>
            </InsertItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>

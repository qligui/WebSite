<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="MeansEditUI.aspx.cs" Inherits="StudentWebsite.Means.MeansEditUI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资料编辑</title>
    <script src="../Jscripts/ckeditor/ckeditor.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="objMeans" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByMeanId" 
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
            <SelectParameters>
                <asp:QueryStringParameter Name="MeansId" QueryStringField="id" Type="Int64" />
            </SelectParameters>
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
    
        <asp:ObjectDataSource ID="objMeansType" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="StudentWebsite.DAL.DataSetMeansTableAdapters.T_MeansTypeTableAdapter" 
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
    
        <asp:FormView ID="FvMeans" runat="server" DataKeyNames="MeansId" 
            DataSourceID="objMeans" oniteminserted="FvMeans_ItemInserted" 
            oniteminserting="FvMeans_ItemInserting" onitemupdated="FvMeans_ItemUpdated" 
            onitemupdating="FvMeans_ItemUpdating" onitemcommand="FvMeans_ItemCommand">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td>
                            资料名称
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ForeColor="#FF3300" ControlToValidate="TitleTextBox"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            作者
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            上传资料
                        </td>
                        <td>
                            <asp:FileUpload ID="MeansFileupload" runat="server" />
                            <asp:HiddenField ID="MeansHiddenFiled" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            资料类型
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMeansType" runat="server" SelectedValue='<%#Bind("MeansType") %>'
                                DataValueField="Id" DataTextField="Name" DataSourceID="objMeansType">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            资料描述
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' CssClass="ckeditor" TextMode="MultiLine" />
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
            </EditItemTemplate>

            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            资料名称
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ForeColor="#FF3300" ControlToValidate="TitleTextBox"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            作者
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            上传资料
                        </td>
                        <td>
                            <asp:FileUpload ID="MeansFileupload" runat="server" />
                            <asp:HiddenField ID="MeansHiddenFiled" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            资料类型
                        </td>
                        <td>
                          <asp:DropDownList ID="ddlMeansType" runat="server" SelectedValue='<%#Bind("MeansType") %>'
                                DataValueField="Id" DataTextField="Name" DataSourceID="objMeansType">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            资料描述
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' CssClass="ckeditor" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="保存" />
                        </td>
                        <td>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="取消" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>

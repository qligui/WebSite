<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentMange.aspx.cs" Inherits="StudentWebsite.studentMange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生管理</title>
    <style type="text/css">
    table{width:900px;margin-left:auto;margin-right:auto;}
    tr{width:300px;}
    td{width:300px;}
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <asp:ObjectDataSource ID="objDataUser" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="StudentWebsite.DAL.DataSetUserTableAdapters.T_UserTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_userId" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="userPassword" Type="String" />
            <asp:Parameter Name="userType" Type="String" />
            <asp:Parameter Name="Sex" Type="String" />
            <asp:Parameter Name="QQ" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Work" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="userIP" Type="String" />
            <asp:Parameter Name="ErrorTimes" Type="Int32" />
            <asp:Parameter Name="LastErrorTimes" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="userPassword" Type="String" />
            <asp:Parameter Name="userType" Type="String" />
            <asp:Parameter Name="Sex" Type="String" />
            <asp:Parameter Name="QQ" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Work" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="userIP" Type="String" />
            <asp:Parameter Name="ErrorTimes" Type="Int32" />
            <asp:Parameter Name="LastErrorTimes" Type="DateTime" />
            <asp:Parameter Name="Original_userId" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <div>
    
        <asp:ListView ID="LvStudent" runat="server" DataKeyNames="userId" 
            DataSourceID="objDataUser" onitemcommand="ListView1_ItemCommand">
            <AlternatingItemTemplate>
                <tr style="background:#D1EEEE;color:#8B8B7A">
                    <td>
                        <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SexLabel" runat="server" Text='<%# Eval("Sex") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="WorkLabel" runat="server" Text='<%# Eval("Work") %>' />
                    </td>
                    <td>
                        <asp:Label ID="userIPLabel" runat="server" Text='<%# Eval("userIP") %>' />
                    </td>
                   <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="return confirm('真的要删除吗？');" />
                        <asp:Button ID="BtnpassWord" runat="server" Text="重置密码" CommandName="resetPwd" OnClientClick="return confirm('真的要重置吗？');" />

                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            没有学生数据！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SexLabel" runat="server" Text='<%# Eval("Sex") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="WorkLabel" runat="server" Text='<%# Eval("Work") %>' />
                    </td>
                    <td>
                        <asp:Label ID="userIPLabel" runat="server" Text='<%# Eval("userIP") %>' />
                    </td>
                     <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="return confirm('真的要删除吗？');" />
                         <asp:Button ID="BtnpassWord" runat="server" CommandName="resetPwd" Text="重置密码"  OnClientClick="return confirm('真的要重置吗？');" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" align="center" style="border-collapse: collapse;">
                                <tr runat="server" align="center" style="background-color: #0000FF;color:White;">
                                    <th runat="server">
                                        用户名</th>
                                    <th runat="server">
                                        性别</th>
                                    <th runat="server">
                                        Email</th>
                                    <th runat="server">
                                        工作</th>
                                    <th runat="server">
                                        用户IP</th>
                                    <th runat="server">
                                    操作状态
                                    </th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
    <div style="margin-left:350px; width: 319px;">
     <asp:DataPager ID="DataPager1" runat="server" PagedControlID="LvStudent">
     <Fields>
     <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
      </Fields>
     </asp:DataPager>
    </div>
    </div>
    </form>
</body>
</html>

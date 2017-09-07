<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherMange.aspx.cs" Inherits="StudentWebsite.Teacher.TeacherMange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>教师管理</title>
    <style type="text/css">
        table{width:900px;margin-left:auto;margin-right:auto;}
        tr{width:400px;}
        td{width:400px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="objDataTeacher" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="StudentWebsite.DAL.DataSetUserTableAdapters.T_TeacherTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_TeacherId" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TeacherName" Type="String" />
                <asp:Parameter Name="TeacherPassWord" Type="String" />
                <asp:Parameter Name="TeacherType" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TeacherIP" Type="String" />
                <asp:Parameter Name="ErrorTimes" Type="Int32" />
                <asp:Parameter Name="LastErrorTimes" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TeacherName" Type="String" />
                <asp:Parameter Name="TeacherPassWord" Type="String" />
                <asp:Parameter Name="TeacherType" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TeacherIP" Type="String" />
                <asp:Parameter Name="ErrorTimes" Type="Int32" />
                <asp:Parameter Name="LastErrorTimes" Type="DateTime" />
                <asp:Parameter Name="Original_TeacherId" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    <a href="TeacherEditUI.aspx">新增教师用户</a>
    <br />
    <br />
        <asp:ListView ID="LvTeacher" runat="server" DataKeyNames="TeacherId" 
            DataSourceID="objDataTeacher" onitemcommand="LvTeacher_ItemCommand">
            <AlternatingItemTemplate>
                <tr style="background:#D1EEEE;color:#8B8B7A;" align="center">
                    <td>
                        <asp:Label ID="TeacherNameLabel" runat="server" 
                            Text='<%# Eval("TeacherName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TeacherIPLabel" runat="server" Text='<%# Eval("TeacherIP") %>' />
                    </td>
                     <td>
                    <asp:Button ID="btnresetPwd" runat="server" Text="密码重置" CommandName="teacherPwd" OnClientClick="return confirm('真的要重置吗？');" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="return confirm('真的要删除吗？');" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            没有教师数据！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="" align="center">
                    <td>
                        <asp:Label ID="TeacherNameLabel" runat="server" 
                            Text='<%# Eval("TeacherName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TeacherIPLabel" runat="server" Text='<%# Eval("TeacherIP") %>' />
                    </td>
                   <td>
                       <asp:Button ID="btnresetPwd" runat="server" Text="密码重置" CommandName="teacherPwd" OnClientClick="return confirm('真的要重置吗？');" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" OnClientClick="return confirm('真的要删除吗？');" />
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
                                        教师工号</th>
                                    <th runat="server">
                                        E-mail</th>
                                    <th runat="server">
                                        登录IP</th>
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
       <div style="margin-left:300px; width: 476px;"><asp:DataPager ID="DataPageTeacger" 
               runat="server" PagedControlID="LvTeacher">
           <Fields>
               <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                   ShowLastPageButton="True" />
           </Fields>
        </asp:DataPager></div>
    </div>
    </form>
</body>
</html>

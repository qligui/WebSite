<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentGrade.aspx.cs" Inherits="StudentWebsite.Admin.StudentGrade" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color:#a4d3ee;height:500px;">
        <asp:ObjectDataSource ID="objStudnetGrade" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataStudentGrade" 
            TypeName="StudentWebsite.DAL.DataSetTestTableAdapters.T_TestScoreTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ScoreId" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="TestScore" Type="Int32" />
                <asp:Parameter Name="TestDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="TestScore" Type="Int32" />
                <asp:Parameter Name="TestDate" Type="DateTime" />
                <asp:Parameter Name="Original_ScoreId" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridViewGrade" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ScoreId" 
            DataSourceID="objStudnetGrade" ForeColor="#333333" GridLines="None" 
            Width="1036px" PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="用户名" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="TestScore" HeaderText="测试成绩" 
                    SortExpression="TestScore" />
                <asp:BoundField DataField="TestDate" HeaderText="测试日期" 
                    SortExpression="TestDate" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>

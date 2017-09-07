<%@ Page Title="考试成绩" Language="C#" MasterPageFile="~/Method/UserSite.Master" AutoEventWireup="true" CodeBehind="TestGrade.aspx.cs" Inherits="StudentWebsite.User.TestGrade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
.UserInfo{color:#333;width:777px; height:300px; float:left;border: #D0DBE7 1px solid; margin-left:0px;}
td{border-color:#999;width:350px;}
tr{width:350px;}
.table{width:900px;}
.tableStyle{margin-top:50px;width:500px;margin-left:100px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="UserInfo">
<div class="tableStyle">
<asp:ScriptManager ID="ScriptManagerTest" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanelTest" runat="server">
<ContentTemplate>
        <asp:ObjectDataSource ID="objDataTest" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetGradeById" 
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
            <SelectParameters>
                <asp:QueryStringParameter Name="UserId" QueryStringField="id" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int64" />
                <asp:Parameter Name="TestScore" Type="Int32" />
                <asp:Parameter Name="TestDate" Type="DateTime" />
                <asp:Parameter Name="Original_ScoreId" Type="Int64" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ListView ID="LvTest" runat="server" DataKeyNames="ScoreId" 
            DataSourceID="objDataTest">
            <EmptyDataTemplate>
                <table id="Table1" runat="server" align="center" style="">
                    <tr>
                        <td>
                            没有成绩！</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr align="center">
                    <td>
                    <%# Eval("row") %>
                    </td>
                    <td>
                    <%# Eval("TestScore")%>
                        
                    </td>
                    <td>
                     <%# Eval("TestDate") %>
                    </td>
                </tr>
            </ItemTemplate>
 <LayoutTemplate>
<table id="Table2" runat="server" align="center" style="border-collapse: collapse;">
<tr id="Tr1" runat="server" align="center" style="background-color: #0000FF;color:White">
<td id="Td1" runat="server">成绩序号</td>
<td id="Td2" runat="server">测试成绩</td>
<td id="Td3" runat="server">测试时间</td></tr>
 <tr ID="itemPlaceholder" runat="server"></tr>
</table>
</LayoutTemplate>
</asp:ListView>
<div style=" text-align:center;">
    <asp:DataPager ID="DataPageTest" runat="server" PageSize="10" 
        PagedControlID="LvTest">     
            <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                ShowLastPageButton="False" FirstPageText="首页" LastPageText="尾页" ShowNextPageButton="False" ShowPreviousPageButton="True" />
                <asp:NumericPagerField ButtonType="Link" />
                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" LastPageText="尾页" ButtonType="Button" />
        </Fields>
    </asp:DataPager>
</div>
</ContentTemplate>
</asp:UpdatePanel>
 </div>
 </div>
</asp:Content>

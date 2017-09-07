<%@ Page Title="" Language="C#" MasterPageFile="~/Method/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="StudentWebsite.Test.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ObjectDataSource ID="objDataTest" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        
        
        TypeName="StudentWebsite.DAL.DataSetTestTableAdapters.T_TestQustionTableAdapter" 
        InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_QustionId" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QuestionName" Type="String" />
            <asp:Parameter Name="OptionA" Type="String" />
            <asp:Parameter Name="OptionB" Type="String" />
            <asp:Parameter Name="OptionC" Type="String" />
            <asp:Parameter Name="OptionD" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Degree" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuestionName" Type="String" />
            <asp:Parameter Name="OptionA" Type="String" />
            <asp:Parameter Name="OptionB" Type="String" />
            <asp:Parameter Name="OptionC" Type="String" />
            <asp:Parameter Name="OptionD" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Degree" Type="String" />
            <asp:Parameter Name="Original_QustionId" Type="Int64" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:DataList ID="DLTest" runat="server" DataKeyField="QustionId" 
        DataSourceID="objDataTest">
        <ItemTemplate>
 &nbsp;<asp:Label ID="labelQuestion" runat="server" Height="19px" Width="1px" Font-Size="9pt"></asp:Label>
        &nbsp;
        <%#DataBinder.Eval(Container.DataItem, "QuestionName")%><table>
                <tr>
                    <td colspan="3">
                    </td>
                </tr>
                <tr>
                    <td rowspan="4" style="width: 45px">
                        <asp:RadioButtonList ID="RBnTest" runat="server">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td colspan="2">
                        <%#DataBinder.Eval(Container.DataItem, "OptionA")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 218px">
                        <%#DataBinder.Eval(Container.DataItem, "OptionB")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 218px">
                        <%#DataBinder.Eval(Container.DataItem, "OptionC")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 218px">
                        <%#DataBinder.Eval(Container.DataItem, "OptionD")%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:Button ID="BtnTest" runat="server" Text="交卷" Width="140px" Height="35px" 
        onclick="BtnTest_Click" OnClientClick="return confirm('真的要交卷吗吗？');" />
</asp:Content>

<%@ Page Title="Домашняя страница" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplicationExcelExportImportBd._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h3> Excel</h3>
    <div>
        <table>
            <tr>
                <td class="style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                        Text="Import data DescPage" />
                </td>
                <td class="style1">
                    <asp:Button ID="btnImport" runat="server" Text="I d AscPage" 
                        onclick="btnImport_Click" />

                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="I d DescName" />
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="I d AscName" />
                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                        Text="I d DescAuthor" />
                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" 
                        Text="I d AscAuthor" />

                </td>
            </tr>
        </table>
        <div>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number">1</asp:TextBox>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Exchange Link" />
            <br />
            <asp:label ID="lblMessage" runat="server" Fond-Bold="true" />
            <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
            <br />
            <asp:GridView ID="gvData" runat="server" EnableSortingAndPagingCallbacks="True">
                <EmptyDataTemplate>
                    <div style="padding:10px">
                        Data not found
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Домашняя страница" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplicationExcelExportImportBd._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h3> Excel</h3>
    <div>
        <table>
            <tr>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnImport" runat="server" Text="Import data" 
                        onclick="btnImport_Click" />

                </td>
            </tr>
        </table>
        <div>
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

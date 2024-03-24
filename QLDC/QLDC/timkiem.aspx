<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="QLDC.giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:TextBox ID="txttimkiem" placeholder="Bạn tìm gì..."  runat="server" style="display: none;"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
     <ItemTemplate>
    <table style="width:100%;">
        <!-- Existing HTML code for the first column -->
        <tr>
            <td style="width: 12px"> <asp:Image ID="Image1" Width="160px" Height="100px" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' /></td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 12px">
                &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' style="text-decoration: none; color: #333;" Text='<%# Eval("tensp") %>'></asp:HyperLink>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"> </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("gia") %>' ForeColor="Red"></asp:Label></td>
        </tr>
         <tr>
         <td style="height: 41px; width: 12px;" rowspan="2">&nbsp;&nbsp;</td>
        </tr>
    </table>
</ItemTemplate>

     </asp:DataList>
        </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="spnoibat.ascx.cs" Inherits="QLDC.spnoibat" %>
<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <table style="width:100%;">
            <tr>
                <td rowspan="2">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Height="40px" Width="40px" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' Text='<%# Eval("tensp") %>'></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("gia") %>' ForeColor="Red"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("giamgia") %>' Font-Strikeout="True"></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

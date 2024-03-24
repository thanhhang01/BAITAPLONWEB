<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="spbanchay.ascx.cs" Inherits="QLDC.spbanchay" %>
<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <table style="width:100%;">
            <tr>
                <td rowspan="2">
                    <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Width="40px" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' Text='<%# Eval("tensp") %>'></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("gia") %>' ForeColor="Red"></asp:Label>
                </td>
            </tr>
            
        </table>
    </ItemTemplate>
</asp:DataList>


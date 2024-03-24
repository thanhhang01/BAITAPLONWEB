<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="splienquan.ascx.cs" Inherits="QLDC.splienquan" %>
<style>
    .button {
    background-color: #0094ff; /* Màu nền */
    color: white; /* Màu chữ */
    padding: 10px 20px; /* Kích thước lề nút */
    border: none; /* Không có viền */
    border-radius: 5px; /* Bo tròn góc */
    cursor: pointer; /* Con trỏ là bàn tay khi di chuột qua nút */
    font-size: 16px; /* Kích thước chữ */
}

.button:hover {
    background-color: #45a049; /* Màu nền khi di chuột qua */
}

</style>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
    <ItemTemplate>
        <table style="width:100%;">
            <tr>
                <td colspan="2">
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Width="160px" />
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <asp:HyperLink ID="HyperLink1" Style="text-decoration:none;" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' Text='<%# Eval("tensp") %>'></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
      <td><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i>
      </i></td>
</tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" class="button" runat="server" Text="Thêm giỏ hàng"/>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>


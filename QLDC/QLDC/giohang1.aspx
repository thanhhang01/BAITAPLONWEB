<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="giohang1.aspx.cs" Inherits="QLDC.giohang11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* CSS cho giỏ hàng */
/* Định dạng bảng */
table {
    width: 100%;
    border-collapse: collapse;
}

/* Định dạng dòng đầu tiên của bảng (tiêu đề) */
table tr:first-child {
    background-color: #f2f2f2; /* Màu nền */
}

/* Định dạng ô trong bảng */
table td {
    padding: 10px;
    border: 1px solid #ddd; /* Đường viền */
}

/* Định dạng hình ảnh sản phẩm */
#DataList1 img {
    max-width: 100%;
    height: auto;
}

/* Định dạng tên sản phẩm */
#DataList1 td:nth-child(2) {
    font-weight: bold;
}

/* Định dạng giá sản phẩm */
#DataList1 td:nth-child(3) {
    color: green;
}

/* Định dạng số lượng */
#DataList1 td:nth-child(4) {
    text-align: center;
}

/* Định dạng các dòng trống */
#DataList1 tr:nth-child(even) {
    background-color: #f9f9f9; /* Màu nền cho các dòng chẵn */
}

#DataList1 tr:nth-child(odd) {
    background-color: #fff; /* Màu nền cho các dòng lẻ */
}

/* Định dạng nút hoàn tất mua hàng */
#btnCompletePurchase {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    border: 1px solid #3498db;
    border-radius: 5px;
    background-color: #3498db;
    color: #fff;
    transition: background-color 0.3s ease;
}

#btnCompletePurchase:hover {
    background-color: #2980b9;
    border-color: #2980b9;
    color: #fff;
}

    </style>
    <asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <table style="width:100%;">
            <tr>
                <td>Hình ảnh</td>
                <td>Tên sản phẩm</td>
                <td>Giá</td>
                <td>Số lượng</td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Width="200px" />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

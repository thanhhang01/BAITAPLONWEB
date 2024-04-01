<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="QLDC.giohang1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
       /* Định dạng cho table */
table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #ddd;
    margin-bottom: 20px;
}

/* Định dạng cho tiêu đề của table */
th {
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

/* Định dạng cho các ô dữ liệu của table */
td {
    border: 1px solid #ddd;
    padding: 8px;
}

/* Định dạng cho hàng chẵn của table */
tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Định dạng cho nút hoàn tất thanh toán */
.btn-hoan-tat {
    background-color: #ee4d2d;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

/* Định dạng khi hover vào nút hoàn tất thanh toán */
.btn-hoan-tat:hover {
    background-color: #ff6347;
}
.quantity-container {
    display: flex;
    align-items: center;
}

.txt-quantity {
    width: 50px;
    text-align: center;
}

.btn-quantity {
    width: 30px;
    height: 30px;
    border: none;
    background-color: #ccc;
    cursor: pointer;
}

.btn-quantity:hover {
    background-color: #ddd;
}

   </style>
    <div>
        <h2>Giỏ hàng của bạn</h2>
        <asp:Repeater ID="rptProductsInCart" runat="server" OnItemCommand="rptProductsInCart_ItemCommand">
            <HeaderTemplate>
                <table border="1">
                    <tr>
                        <th>Hình</th>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Height="100px" Width="100px" />
                    </td>
                    <td><%# Eval("masp") %></td>
                    <td><%# Eval("tensp") %></td>
                    <td><%# Eval("gia") %></td>
                    
                <td class="quantity-container">
            <asp:Button ID="btnDecrease" runat="server" CssClass="btn-quantity" Text="-" OnClick="btnDecrease_Click" />
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="txt-quantity" ReadOnly="true" Text='<%# Eval("soluong") %>' />
            <asp:Button ID="btnIncrease" runat="server" CssClass="btn-quantity" Text="+" OnClick="btnIncrease_Click" />
        </td>
        <td>
            <!-- Thêm một nhãn để hiển thị tổng tiền -->
            <asp:Label ID="lblTotalPrice" runat="server" data-price='<%# Eval("gia") %>'>
                <%# Convert.ToDecimal(Eval("gia")) * Convert.ToInt32(Eval("soluong")) %>
            </asp:Label>
        </td>

                    <td><asp:Button ID="btnXoa" class="btn btn-primary" runat="server" Text="Xóa" CommandArgument='<%# Eval("masp") %>' OnClick="btnXoa_Click1"/></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <script>
    function updateTotalPrice(btn) {
        var quantityContainer = btn.parentElement;
        var quantityTextbox = quantityContainer.querySelector('.txt-quantity');
        var priceCell = quantityContainer.nextElementSibling;

        var currentQuantity = parseInt(quantityTextbox.value);
        var price = parseFloat(priceCell.getAttribute('data-price'));

        var totalPrice = currentQuantity * price;
        priceCell.innerText = totalPrice.toFixed(2);
    }

    document.querySelectorAll('.btn-quantity').forEach(function(btn) {
        btn.addEventListener('click', function() {
            updateTotalPrice(this);
        });
    });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

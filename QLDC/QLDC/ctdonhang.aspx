<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="ctdonhang.aspx.cs" Inherits="QLDC.ctdonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
              body {
        width: 80%;
        margin: 0 auto;
        background-color: #FFFFCC;
        font-family: Arial, sans-serif;
    }
    
    form {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
        transition: background-color 0.3s;
    }
    th:hover, td:hover {
    background-color: #f0f0f0; 
}
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-bordered" style="width:100%;">
    <table style="width:100%;">
        <tr>
            <td colspan="2" style="text-align: center"><strong>CHI TIẾT ĐƠN ĐẶT HÀNG</strong></td>
        </tr>
        <tr>
            <td>Số hóa đơn</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Mã sản phẩm</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td>
                <asp:TextBox ID="txtsl" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtsl" ErrorMessage="Nhập số lượng" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Đơn giá</td>
            <td>
                <asp:TextBox ID="txtdg" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdg" ErrorMessage="Nhập đơn giá" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" style="text-align: center"><strong>
                <asp:Button ID="btnthem" runat="server" CssClass="btn btn-primary" style="font-weight: bold" Text="Thêm " OnClick="btnthem_Click" />
                <asp:Button ID="btnsua" runat="server" CssClass="btn btn-warning" style="font-weight: bold" Text="Sửa" OnClick="btnsua_Click" />
                <asp:Button ID="btnxoa" runat="server" CssClass="btn btn-danger" style="font-weight: bold" Text="Xóa" OnClick="btnxoa_Click" />
                <asp:Button ID="btnhuy" runat="server" Text="Hủy" CssClass="btn btn-danger" OnClick="btnhuy_Click1" />
                </strong></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:GridView ID="GridView1" AllowPaging="True" runat="server" AutoGenerateColumns="False" PageSize="5" DataKeyNames="sohd" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="sohd" HeaderText="Số hóa đơn" />
                        <asp:BoundField DataField="masp" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                        <asp:BoundField DataField="dongia" HeaderText="Đơn giá" />
                        <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
           </table>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
</asp:Content>

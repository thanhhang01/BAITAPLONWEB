<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="loaisanpham.aspx.cs" Inherits="QLDC.loaisanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <title>Loại sản phẩm</title>
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
        .auto-style2 {
            text-align: center;
        }
        .auto-style2{
 background-color: #333;
 overflow: hidden;
 color:aliceblue;
 height:40px;
}
.auto-style2:hover{
 background-color: #ddd;
 color: black;
}
       
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-bordered" style="width:100%;">
    <table style="width:100%;">
        <tr>
            <td colspan="2" style="text-align: center" class="auto-style2"><strong>LOẠI SẢN PHẨM</strong></td>
        </tr>
        <tr>
            <td>Mã loại </td>
            <td>
                <asp:TextBox ID="txtmaloai" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Tên loại</td>
            <td>
                <asp:TextBox ID="txttenloai" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttenloai" ErrorMessage="Nhập tên loại" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <strong>
                <asp:Button ID="btnthem" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnthem_Click" style="font-weight: bold" />
                <asp:Button ID="btnsua" runat="server" CssClass="btn btn-warning" Text="Sửa" OnClick="btnsua_Click" style="font-weight: bold" />
                <asp:Button ID="btnxoa" runat="server" CssClass="btn btn-danger" Text="Xóa" OnClick="btnxoa_Click" style="font-weight: bold" />
                <asp:Button ID="btnhuy" runat="server" CssClass="btn btn-danger" OnClick="btnhuy_Click2" Text="Hủy" style="font-weight: bold" />
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" AllowPaging="true" runat="server" AutoGenerateColumns="False" PageSize="5" DataKeyNames="maloai" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="maloai" HeaderText="Mã loại" />
                        <asp:BoundField DataField="tenloai" HeaderText="Tên loại" />
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

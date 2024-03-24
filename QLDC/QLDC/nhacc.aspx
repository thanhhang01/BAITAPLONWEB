<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="nhacc.aspx.cs" Inherits="QLDC.nhacc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <title>Nhà cung cấp</title>
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
        .auto-style3{
            text-align:center;
        }
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-bordered" style="width:100%;">
        <tr>
            <td colspan="2" style="text-align: center" class="auto-style2"><strong>NHÀ CUNG CẤP</strong></td>
        </tr>
        <tr>
            <td>Mã nhà cung cấp</td>
            <td>
                <asp:TextBox ID="txtmancc" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Tên nhà cung cấp</td>
            <td>
                <asp:TextBox ID="txttenncc" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Địa chỉ</td>
            <td>
                <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>SĐT</td>
            <td>
                <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style3">
                <strong>
                <asp:Button ID="btnthem" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnthem_Click" style="font-weight: bold" />
                <asp:Button ID="btnsua" runat="server" CssClass="btn btn-warning" Text="Sửa" OnClick="btnsua_Click" style="font-weight: bold" />
                <asp:Button ID="btnxoa" runat="server" CssClass="btn btn-danger" Text="Xóa" OnClick="btnxoa_Click" style="font-weight: bold" />
                <asp:Button ID="btnhuy" runat="server" CssClass="btn btn-danger" OnClick="btnhuy_Click" Text="Hủy" />
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" AllowPaging="True" runat="server" AutoGenerateColumns="False" PageSize="5" DataKeyNames="mancc" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="mancc" HeaderText="Mã nhà cung cấp" />
                        <asp:BoundField DataField="tenncc" HeaderText="Tên nhà cung cấp" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
                        <asp:BoundField DataField="sdt" HeaderText="SĐT" />
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

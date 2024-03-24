<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="dondathang.aspx.cs" Inherits="QLDC.dondathang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>

<head>
    <title>Đơn Đặt Hàng</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
       body{
           width:80%;
           margin:0 auto;
           background-color: #FFFFCC;
           font-family: Arial, sans-serif;
       }
       form {
            width:100%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
       .w-100{
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        margin-left:-80px;
        
       } 
       td {
        padding: 5px;
        border: 1px solid #ddd;
        text-align: left;
        transition: background-color 0.3s;
    }
    th:hover, td:hover {
    background-color: #f0f0f0; 
}
    .auto-style6{
         background-color: #333;
         overflow: hidden;
         color:aliceblue;
         height:40px;
        }
        .auto-style6:hover{
         background-color: #ddd;
         color: black;
        }
    </style>
</head>

<body>
    <div class="container">
        
        <table class="table table-bordered"> 
        <table class="w-100">
        <tr>
            <td colspan="2" style="text-align: center" class="auto-style6"><strong>ĐƠN ĐẶT HÀNG</strong></td>
        </tr>
        <tr>
            <td class="auto-style2">Số hóa đơn </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtshd" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Ngày đặt hàng</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtngaydh" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Trị giá</td>
            <td class="auto-style4">
                <asp:TextBox ID="txttrigia" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Đã giao</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtdagiao" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Ngày giao </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtngaygiao" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Tên người nhận</td>
            <td class="auto-style4">
                <asp:TextBox ID="txttennhan" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Địa chỉ nhận</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtdcnhan" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">SĐT nhận</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtsdtnhan" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Hình thức thanh toán</td>
            <td class="auto-style4">
                <asp:TextBox ID="txthtthanhtoan" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Hình thức giao hàng</td>
            <td class="auto-style4">
                <asp:TextBox ID="txthtgiaohang" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Mã khách hàng</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <strong>
                <asp:Button ID="btnthem" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnthem_Click" style="font-weight: bold" />
                <asp:Button ID="btnsua" runat="server" CssClass="btn btn-warning" Text="Sửa" OnClick="btnsua_Click" style="font-weight: bold" />
                <asp:Button ID="btnxoa" runat="server" CssClass="btn btn-danger" Text="Xóa" OnClick="btnxoa_Click" style="font-weight: bold" />
                <asp:Button ID="btnhuy" runat="server" CssClass="btn btn-danger" OnClick="btnhuy_Click" Text="Hủy" />
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:GridView ID="GridView1" AllowPaging="True" runat="server" AutoGenerateColumns="False" PageSize="5" DataKeyNames="sohd" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="sohd" HeaderText="Số hóa đơn" />
                        <asp:BoundField DataField="ngaydh" HeaderText="Ngày đặt hàng" />
                        <asp:BoundField DataField="trigia" HeaderText="Trị giá" />
                        <asp:BoundField DataField="ngaygiao" HeaderText="Ngày giao" />
                        <asp:BoundField DataField="tennguoinhan" HeaderText="Tên người nhận" />
                        <asp:BoundField DataField="dcnhan" HeaderText="Địa chỉ nhận" />
                        <asp:BoundField DataField="sdtnhan" HeaderText="SĐT nhận" />
                        <asp:BoundField DataField="htthanhtoan" HeaderText="Hình thức thanh toán" />
                        <asp:BoundField DataField="htgiaohang" HeaderText="Hình thức giao hàng" />
                        <asp:BoundField DataField="makh" HeaderText="Mã khách hàng" />
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

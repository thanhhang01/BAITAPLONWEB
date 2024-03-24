<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="khachhang.aspx.cs" Inherits="QLDC.khachhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>

<head>
    <title>Khách Hàng</title>
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
            max-width: 1000px;
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
        margin-left:-92px;
        
       } 
       td {
        padding: -20px;
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
        
        .form-control {
        width: 500px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 15px;
        display: inline-block;
       }
        .batloi{
        color: red;
        display: inline-block;
        margin-left: 5px; /* hoặc khoảng cách mong muốn */
        }
       .gridview-pager {
        text-align: center;
        margin-top: 10px;
    }

    .gridview-pager a,
    .gridview-pager span {
        padding: 8px 12px;
        margin: 2px;
        border: 1px solid #ddd;
        text-decoration: none;
        color: #333;
        background-color: #f5f5f5;
        cursor: pointer;
        border-radius: 4px;
    }

    .gridview-pager a:hover {
        background-color: #ddd;
    }

    .gridview-pager .current {
        background-color: #337ab7;
        color: #fff;
        border: 1px solid #337ab7;
    }

    .gridview-pager .disabled {
        pointer-events: none;
        cursor: not-allowed;
    }
    </style>
</head>

<body>
    <div class="container">
        <form>
        <table class="table table-bordered">
            <table class="w-100">
            <tr>
                <td colspan="2" style="text-align: center" class="auto-style2"><strong>KHÁCH HÀNG</strong></td>
            </tr>
            <tr>
                <td class="auto-style3">Mã khách hàng</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtmakh" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Tên khách hàng</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txttenkh" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="batloi" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttenkh" ErrorMessage="Nhập tên khách hàng" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Địa chỉ</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdiachi" CssClass="batloi" ErrorMessage="Nhập địa chỉ" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">SĐT</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtsdt" CssClass="batloi" ErrorMessage="Nhập sđt" ForeColor="Red" ValidationExpression="\d{10}">(*)</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator CssClass="batloi" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsdt" ErrorMessage="Nhập sđt" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Tên đăng nhập </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txttendn" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="batloi" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttendn" ErrorMessage="Nhập tên đăng nhập" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Mật khẩu</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtmk" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmk" Display="Dynamic" ErrorMessage="Nhập mật khẩu" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Ngày sinh </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtngaysinh" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Giới tính</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtgioitinh" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <strong>
                    <asp:Button ID="btnthem" runat="server" Text="Thêm" CssClass="btn btn-primary" style="font-weight: bold" OnClick="btnthem_Click" />
                    <asp:Button ID="btnsua" runat="server" Text="Sửa" CssClass="btn btn-warning" style="font-weight: bold" OnClick="btnsua_Click" />
                    <asp:Button ID="btnxoa" runat="server" Text="Xóa" CssClass="btn btn-danger" style="font-weight: bold" OnClick="btnxoa_Click" />
                    <asp:Button ID="btnhuy" runat="server" CssClass="btn btn-danger" Text="Hủy" OnClick="btnhuy_Click1" style="font-weight: bold" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-left">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" DataKeyNames="makh" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="makh" HeaderText="Mã khách hàng" />
                            <asp:BoundField DataField="tenkh" HeaderText="Tên khách hàng" />
                            <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="sdt" HeaderText="SĐT" />
                            <asp:BoundField DataField="tendangnhap" HeaderText="Tên đăng nhập" />
                            <asp:BoundField DataField="matkhau" HeaderText="Mật khẩu" />
                            <asp:BoundField DataField="ngaysinh" HeaderText="Ngày sinh" />
                            <asp:BoundField DataField="gioitinh" HeaderText="Giới tính" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                        <PagerSettings Position="TopAndBottom" PageButtonCount="5" />
                        <PagerStyle HorizontalAlign="Center" CssClass="gridview-pager" />
                    </asp:GridView>
                </td>
            </tr>
       </table>
            </form>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>


</asp:Content>

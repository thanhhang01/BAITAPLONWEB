<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="QLDC.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <!DOCTYPE html>
<html>
<head>
    
    <title>Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        #btnthemtk, #btnsua, #btnxoa, #btnhuy {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        #btnthemtk:hover, #btnsua:hover, #btnxoa:hover, #btnhuy:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
 
        <div>
                         <table style="width:100%;">
                    <tr>
                        <td colspan="2" style="height: 31px; text-align: center;">
                            <strong>USER</strong></td>
                    </tr>
                    <tr>
                        <td style="height: 33px">Tên Đăng Nhập</td>
                        <td style="height: 33px">
                            <asp:TextBox ID="txttdn" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Mật khẩu</td>
                        <td>
                            <asp:TextBox ID="txtmk" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td>
                            <asp:TextBox ID="txtrole" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-left">
                            <asp:Button ID="btnthemtk" runat="server" OnClick="btnthemtk_Click" Text="Thêm Tài Khoản" CssClass="btn btn-primary" />
                            <asp:Button ID="btnsua" runat="server" OnClick="btnsua_Click" Text="Sửa Tài Khoản" CssClass="btn btn-warning" />
                            <asp:Button ID="btnxoa" runat="server" OnClick="btnxoa_Click" Text="Xóa Tài Khoản" CssClass="btn btn-danger" />
                            <asp:Button ID="btnhuy" runat="server" OnClick="btnhuy_Click" Text="Hủy Tài Khoản" CssClass="btn btn-danger" />
                        </td>
                    </tr>
                </table>
           
            <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="tendangnhap" HeaderText="Tên Đăng Nhập" />
                    <asp:BoundField DataField="matkhau" HeaderText="Mật Khẩu" />
                    <asp:BoundField DataField="role" HeaderText="Role" />
                    <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
  
</body>
</html>
</asp:Content>

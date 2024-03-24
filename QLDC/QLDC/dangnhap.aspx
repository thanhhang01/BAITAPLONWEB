<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="QLDC.dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            margin: 20px auto;
            width: 50%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        #form1 {
            text-align: center;
        }

        .auto-style1 {
                border-style: none;
                    border-color: inherit;
                    border-width: medium;
                    background-color: #4CAF50;
                    color: white;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                    font-weight: bold;
                }

        .auto-style1:hover {
            background-color: #45a049;
        }

        .auto-style2 {
            background-color: #f2f2f2;
                    text-align: center;
                }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <table style="width:100%;">
        <h3>Đăng nhập</h3>
        <tr>
            <td>Tên đăng nhập</td>
            <td>
                <asp:TextBox ID="txttendangnhap" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Mật khẩu</td>
            <td>
                <asp:TextBox ID="txtmatkhau" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2"><strong>
                <asp:Button ID="btndangnhap" runat="server" CssClass="auto-style1" OnClick="btndangnhap_Click" Text="Đăng nhập" />
                </strong></td>
        </tr>
    </table>
</div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="QLDC.dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

form {
    margin: 20px auto;
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

h3 {
    margin-top: 0;
    color: #333;
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #4CAF50;
    color: white;
}

input[type="text"],
input[type="password"] {
    width: calc(100% - 24px);
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="password"]:focus {
    outline: none;
    border-color: #4CAF50;
}

.btn-submit {
    width: 100%;
    border: none;
    background-color: #4CAF50;
    color: white;
    padding: 12px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

.btn-submit:hover {
    background-color: #45a049;
}

.forgot-password {
    text-align: right;
}

.captcha-image {
    margin-top: 20px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.btn-submit {
    width: calc(50% - 12px); /* Độ rộng của nút */
    margin: 20px auto; /* Căn giữa nút theo chiều ngang và chiều dọc */
    border: none;
    background-color: #4CAF50;
    color: white;
    padding: 12px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
    display: block; /* Hiển thị nút dưới dạng block để chiếm toàn bộ chiều rộng của form */
    text-align: center; /* Căn giữa nội dung của nút */
}

.btn-submit:hover {
    background-color: #45a049;
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
                    <td>Nhập mã captcha</td>
                    <td>
                        <input type="text" id="txtsecuritycode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img id="captchaImage" class="captcha-image" runat="server" />
                   

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btndangnhap" class="btn-submit" runat="server" OnClick="btndangnhap_Click" Text="Đăng nhập" />
                    </td>
                </tr>
            </table>
            <div class="forgot-password">
                 <a href="dangky.aspx">Đăng ký?</a>&nbsp;&nbsp;
                <a href="forgotpassword.aspx">Quên mật khẩu?</a>
            </div>
        </div>
    </form>
</body>
</html>

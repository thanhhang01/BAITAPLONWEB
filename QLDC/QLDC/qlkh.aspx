<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="qlkh.aspx.cs" Inherits="QLDC.qlkh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!DOCTYPE html>
  
<html>
<head>
    <title>Bài 4</title>
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
        
.auto-style8:hover {
    background-color: #45a049; 
}  
        .auto-style2 {
            width: 191px;
        }
        .auto-style3 {
            width: 220px;
        }
    </style>
</head>
<body>
         <table style="width:100%;">
        <tr>
            <td colspan="2" style="text-align: center"><strong>THÔNG TIN KHÁCH HÀNG</strong></td>
        </tr>
        <tr>
            <td class="auto-style2">Mã khách hàng</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtmakh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Tên khách hàng</td>
            <td class="auto-style3">
                <asp:TextBox ID="txttenkh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Địa chỉ </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">SĐT</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtsdt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Tên đăng nhập</td>
            <td class="auto-style3">
                <asp:TextBox ID="txttdn" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mật khẩu</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtmk" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Ngày sinh</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtngaysinh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Giới tính</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtgioitinh" runat="server" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center"><strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </strong></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">&nbsp;</td>
        </tr>
    </table>  
</body>
</html>
</asp:Content>

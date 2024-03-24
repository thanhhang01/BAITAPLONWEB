<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="QLDC.giohang1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<style>
    /* Thiết lập CSS cho giỏ hàng */
    body {
        font-family: Arial, sans-serif;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
    img {
        max-width: 100px;
        max-height: 100px;
    }
</style>
</head>
<body>

<h2>Giỏ hàng</h2>

<table>
  <tr>
    <th>Hình ảnh</th>
    <th>Tên sản phẩm</th>
    <th>Giá</th>
    <!-- Thêm các cột khác nếu cần -->
  </tr>
  <%-- Hiển thị thông tin sản phẩm từ Session --%>
  <% foreach (string productName in (List<string>)Session["GioHang"]) { %>
  <tr>
    <td><img src="image/<%= productName %>.jpg" alt="<%= productName %>"></td>
    <td><%= productName %></td>
    <td>$10.00</td> <%-- Thay thế bằng giá thực tế --%>
    <!-- Thêm các cột khác nếu cần -->
  </tr>
  <% } %>

    <% foreach (string tensp in (List<string>)Session["GioHang"]) { %>
<tr>
  
  <td><%= tensp %></td>
  
  <!-- Thêm các cột khác nếu cần -->
</tr>
<% } %>
</table>

</body>
</html>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

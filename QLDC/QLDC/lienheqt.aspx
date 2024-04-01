<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="lienheqt.aspx.cs" Inherits="QLDC.lienheqt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ</title>
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
        label {
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h2>Liên Hệ</h2>

<form>
    <label for="fname">Họ và Tên:</label>
    <input type="text" id="fname" name="fullname" placeholder="Nhập họ và tên của bạn">

    <label for="email">Email:</label>
    <input type="text" id="email" name="email" placeholder="Nhập địa chỉ email của bạn">

    <label for="message">Nội dung:</label>
    <textarea id="message" name="message" placeholder="Nhập nội dung liên hệ của bạn"></textarea>

    <input type="submit" value="Gửi">
</form>

</body>
</html>

</asp:Content>

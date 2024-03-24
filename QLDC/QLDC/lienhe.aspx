<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="lienhe.aspx.cs" Inherits="QLDC.lienhe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
    font-family: Arial, sans-serif;
}

.contact-form-container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
}

input, textarea {
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    padding: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}
label {
    display: inline-block;
    width: 120px; /* Độ rộng của label, bạn có thể điều chỉnh theo ý muốn */
    margin-right: 10px; /* Khoảng cách giữa label và input */
    text-align: right; /* Căn chỉnh văn bản sang phải */
}

input, textarea {
    box-sizing: border-box;
    width: 100%;
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

    </style>
</head>
<body>

    <div class="contact-form-container">
        <h2>Liên hệ chúng tôi</h2>
        <form action="process-contact.php" method="post">
            <label for="name">Họ và tên:</label>
            <input type="text" id="name" name="name" required><br />

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br />

            <label for="message">Nội dung:</label>
            <textarea id="message" name="message" rows="4" required></textarea><br />

            <button type="submit">Gửi</button>
        </form>
    </div>

</body>
</html>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

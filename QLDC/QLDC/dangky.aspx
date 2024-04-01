<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangky.aspx.cs" Inherits="QLDC.dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        
        form {
            margin: 50px auto;
            width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        div {
            margin-bottom: 15px;
        }
        
        .text {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        
        .password {
            width: calc(100% - 24px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        
       
        .password:focus {
            outline: none;
            border-color: #4CAF50;
        }
        
        .btnRegister {
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
        
        .btnRegister:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Đăng ký</h2>
            <div>
                <asp:Label ID="lblUsername" class="text" runat="server" Text="Tên đăng nhập:"></asp:Label>
                <asp:TextBox ID="txtUsername" class="password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblPassword" class="text" runat="server" Text="Mật khẩu:"></asp:Label>
                <asp:TextBox ID="txtPassword" class="password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblConfirmPassword" class="text" runat="server" Text="Xác nhận mật khẩu:"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" class="password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblrole" class="text" runat="server" Text="Role:"></asp:Label>
                <asp:TextBox ID="txtrole" class="password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnRegister" class="btnRegister" runat="server" Text="Đăng ký" OnClick="btnRegister_Click" />
            </div>
        </div>
    </form>
</body>
</html>

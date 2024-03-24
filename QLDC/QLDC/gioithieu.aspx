<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="gioithieu.aspx.cs" Inherits="QLDC.gioithieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .top{
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .giua {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
        }

        p {
            line-height: 1.6;
        }

        .cuoi{
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .bando{
             max-width: 800px;
             margin: 20px auto;
             padding: 20px;
             background-color: white;
             border-radius: 8px;
             box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="top">
        <h1>Cửa Hàng Đồ Chơi Thanh Hằng Shop</h1>
        <p>Chất Lượng - Sáng Tạo - Niềm Vui</p>
    </div>

    <div class="giua">
        <h2>Chào mừng đến với Cửa Hàng Đồ Chơi Thanh Hằng Shop</h2>
        <p>
            Cửa hàng đồ chơi Thanh Hằng Shop là địa điểm lý tưởng cho bạn và gia đình khám phá và chọn lựa những đồ chơi phong phú và đa dạng. Chúng tôi tự hào cung cấp những sản phẩm đồ chơi chất lượng cao từ các thương hiệu uy tín trên thị trường.
        </p>
        <p>
            Tại cửa hàng chúng tôi, chúng tôi cam kết mang lại trải nghiệm mua sắm thú vị và an toàn cho trẻ em. Sự sáng tạo, tính giáo dục và an toàn là những tiêu chí hàng đầu mà chúng tôi đặt ra khi chọn lựa sản phẩm.
        </p>
        <p>
            Hãy đến và khám phá thế giới đầy màu sắc và niềm vui của đồ chơi cùng Cửa Hàng Đồ Chơi Thanh Hằng Shop. Chúng tôi luôn sẵn lòng phục vụ và tư vấn cho bạn mỗi khi bạn cần.
        </p>
    </div>
    <div class="bando">
        <h3>Địa chỉ:Tiên Sơn, Tiên Cát, Việt Trì, Phú Thọ</h3>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3716.9512592544006!2d105.39706327415156!3d21.312942180408456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31348d4ebf6c9a5b%3A0xabb9e949be7982d0!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBDw7RuZyBOZ2hp4buHcCBWaeG7h3QgVHLDrA!5e0!3m2!1svi!2s!4v1704376780846!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    <div class="cuoi">
        &copy; 2023 Cửa Hàng Đồ Chơi Thanh Hằng Shop. All Rights Reserved.
    </div>

</body>
</html>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

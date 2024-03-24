<%@ Page Title="" Language="C#" MasterPageFile="~/quantri.Master" AutoEventWireup="true" CodeBehind="sanpham.aspx.cs" Inherits="QLDC.sanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <title>Sản phẩm</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        //margin-right:-30px;
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
    .auto-style1 {
        height: 57px;
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
        .auto-style3 {
            height: 71px;
        }
       .batloi{
        color: red;
        display: inline-block;
        margin-left: 5px; /* hoặc khoảng cách mong muốn */
        }
       .ht{
           margin-right:40px;
       }
    </style>
</head>
<body>
    <div class="container">
        <table class="table table-bordered" style="width:100%;">
    <table style="width:100%;" class="ht">
    <tr>
        <td colspan="3" style="height: 31px; text-align: center" class="auto-style2"><strong>SẢN PHẨM</strong></td>
    </tr>
    <tr>
        <td>Mã sản phẩm</td>
        <td>
            <asp:TextBox ID="txtmasp" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
        <td>Chọn ảnh sản phẩm:</td>
    </tr>
    <tr>
        <td>Tên sản phẩm</td>
        <td>
            <asp:TextBox ID="txttensp" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="batloi" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttensp" ErrorMessage="Nhập tên sản phẩm" ForeColor="Red">(*)</asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    </tr>
    <tr>
        <td>Đơn vị tính </td>
        <td>
            <asp:TextBox ID="txtdvtinh" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
        </td>
    </tr>
    <tr>
        <td>Giá</td>
        <td>
            <asp:TextBox ID="txtgia" runat="server" CssClass="form-control" ForeColor="Red"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtgia" ErrorMessage="Nhập giá" ForeColor="Red" ValidationExpression="\d">(*)</asp:RegularExpressionValidator>
        </td>
        <td rowspan="6">
            <asp:Image ID="Image1" runat="server" Height="350px" Width="300px" />
        </td>
    </tr>
       
    <tr>
        <td>Mô tả </td>
        <td>
            <asp:TextBox ID="txtmota" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Hình</td>
        <td class="auto-style3">
            <asp:TextBox ID="txthinh" runat="server" CssClass="form-control"></asp:TextBox>
          
            <!--<asp:Image ID="Image2" runat="server" Height="50px" Width="50px" />-->
          
        </td>
    </tr>
    <tr>
        <td>Mã loại </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">Mã nhà cung cấp</td>
        <td style="margin-left: 40px" class="auto-style1">
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </td>
    </tr>
<tr>
    <td>Giảm giá</td>
    <td>
        <asp:TextBox ID="txtgiamgia" runat="server" CssClass="form-control"></asp:TextBox></td>
</tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Button ID="btnthem" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnthem_Click" />
            
            <asp:Button ID="btnsua" runat="server" OnClick="btnsua_Click" CssClass="btn btn-warning" Text="Sửa" />
            <asp:Button ID="btnxoa" runat="server" OnClick="btnxoa_Click" CssClass="btn btn-danger" Text="Xóa" />
            <asp:Button ID="btnhuy" runat="server" OnClick="btnhuy_Click" CssClass="btn btn-danger" Text="Hủy" />
            
        </td>
    </tr>
    
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:GridView ID="GridView1" AllowPaging="True" runat="server" AutoGenerateColumns="False" PageSize="5" DataKeyNames="maloai" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="masp" HeaderText="Mã sản phẩm" />
                    <asp:BoundField DataField="tensp" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="dvtinh" HeaderText="Đơn vị tính" />
                    <asp:BoundField DataField="gia" HeaderText="Giá" />
                    <asp:BoundField DataField="mota" HeaderText="Mô tả" />
                    <asp:TemplateField HeaderText="Hình">
                    <ItemTemplate>
                        <asp:Image ID="imgHinh" runat="server" ImageUrl='<%# Eval("hinh", "~/image/{0}") %>' Height="50" Width="50" />
                    </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="maloai" HeaderText="Mã loại" />
                    <asp:BoundField DataField="mancc" HeaderText="Mã nhà cung cấp" />
                    <asp:BoundField DataField="giamgia" HeaderText="Giảm giá" />
                    <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            
        </td>
    </tr>
    
        </table>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
     
     
</asp:Content>

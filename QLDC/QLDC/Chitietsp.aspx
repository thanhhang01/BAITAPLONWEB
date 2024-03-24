<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="Chitietsp.aspx.cs" Inherits="QLDC.Chitietsp" %>

<%@ Register Src="~/spgiamgia.ascx" TagPrefix="uc1" TagName="spgiamgia" %>
<%@ Register Src="~/splienquan.ascx" TagPrefix="uc1" TagName="splienquan" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
  <html>
    <head>
    <title>Chi tiết sản phẩm</title>
        <style>
    /* Style cho DataList */
    #<%= DataList1.ClientID %> {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    /* Style cho tiêu đề của mỗi cột */
    #<%= DataList1.ClientID %> th {
        padding: 10px;
        text-align: left;
        background-color: #f2f2f2;
        border-bottom: 2px solid #ddd;
        color: #333;
        font-weight: bold;
    }

    /* Style cho nội dung của mỗi ô */
    #<%= DataList1.ClientID %> td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    /* Style cho hình ảnh sản phẩm */
    #<%= DataList1.ClientID %> img {
        display: block;
        margin: auto;
        max-width: 200px;
        max-height: 200px;
    }

    /* Style cho nút "Mua Ngay" và "Thêm giỏ hàng" */
    #<%= DataList1.ClientID %> .btnContainer {
        text-align: center;
    }

    #<%= DataList1.ClientID %> .btnContainer button {
        padding: 10px;
        font-size: 16px;
        font-weight: bold;
        background-color: #ff6900;
        color: #fff;
        border: none;
        cursor: pointer;
        margin-right: 10px;
        transition: background-color 0.3s ease;
    }

    #<%= DataList1.ClientID %> .btnContainer button:hover {
        background-color: #cf2e2e;
    }
    
    .nut1{
        display: flex;
        justify-content: space-between; /* Các phần tử con sẽ cách nhau một khoảng đều */
        align-items: center; /* Căn giữa theo chiều dọc */
        width: 100%;
    }
    .nut:hover {
        background-color:#0094ff;
        color: #808080;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng */
    }
    .nut{
        text-align: center;
        padding: 10px;
        font-size: 16px;
        font-weight: bold;
        background-color: #0094ff;
        color: #fff;
        border: none;
        cursor: pointer;
        margin-right: 10px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng */
    }
    .table{
    background-color:azure;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng */
}
    .tieude{
    color: #fff;
    background-color: #3498db;
    font-size: 1.2em;
    font-weight: bold;
    margin-bottom: 0;
    padding: 10px;
    text-align:center;
    border-radius: 5px; 
}
</style>

</head>
<body>

        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table style="width:100%;" class="table">
                    <tr>
                        <td rowspan="7">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Height="200px" Width="200px" />
                        </td>
                        <td style="width: 273px; height: 58px;">Mã sản phẩm</td>
                        <td style="height: 58px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("masp") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px; height: 56px;">Tên sản phẩm</td>
                        <td style="height: 56px">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("tensp") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px; height: 33px;">Đơn vị tính</td>
                        <td style="height: 33px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("dvtinh") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px; height: 29px;">Giá</td>
                        <td style="height: 29px">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px">Mô tả</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px">Mã loại</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("maloai") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 273px; height: 30px">Mã nhà cc</td>
                        <td style="height: 30px">
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("mancc") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="nut1">
                            <asp:Button ID="Button1" class="nut" runat="server" Text="Mua Ngay" /><asp:Button ID="Button3" runat="server" class="nut" Text="Thêm giỏ hàng" /></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
       <div>
           <p class="tieude">Sản phẩm liên quan</p>
           <uc1:splienquan runat="server" id="splienquan" />
       </div>
    </body>
</html>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="sptheoloai.aspx.cs" Inherits="QLDC.sptheoloai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
    <head>
        <title>Sản phẩm theo loại</title>
        <style>
            .LinkButton1 {
    display: inline-block;
    padding: 10px 20px; 
    font-size: 16px; 
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    border: 1px solid #3498db; 
    border-radius: 5px; 
    background-color: #3498db; 
    color: #fff; 
    transition: background-color 0.3s ease; 
}


.LinkButton1:hover {
    background-color: #2980b9; 
    border-color: #2980b9;
    color: #fff; 
}
            .auto-style2 {
                height: 41px;
            }
        </style>
    </head>
<body>
   <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
    <ItemTemplate>
        <table style="width:100%;">
            <!-- Existing HTML code for the first column -->
            <tr>
                <td> <asp:Image ID="Image1" Width="160px" Height="100px" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' /></td>
            </tr>
            <tr>
                <td rowspan="2">
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' style="text-decoration: none; color: #333;" Text='<%# Eval("tensp") %>'></asp:HyperLink>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"> </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("gia") %>' ForeColor="Red"></asp:Label></td>
            </tr>
             <tr>
       <td><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i>
       </i>Đã bán 184</td>
 </tr>
             <tr>
             <td style="height: 41px" rowspan="2"><asp:LinkButton class="LinkButton1" ID="LinkButton1" runat="server" Text="Thêm giỏ hàng" OnClick="AddToCart_Click" CommandArgument='<%# Eval("masp") %>' />
                 &nbsp;&nbsp;</td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>


</body>
</html>




</asp:Content>

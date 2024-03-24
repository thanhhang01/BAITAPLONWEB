<%@ Page Title="" Language="C#" MasterPageFile="~/qldc.Master" AutoEventWireup="true" CodeBehind="trangchu.aspx.cs" Inherits="QLDC.trangchu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
            #DataList1 {
                width: 100%;
                margin: 20px 0;
                
            }

            #DataList1 table {
                width: 100%;
                border-collapse: collapse;
                
            }

            #DataList1 td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
                
            }

            #DataList1 td img {
                max-width: 100%;
                height: auto;
            }

            .product-list-container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .slider-container {
                position: relative;
                width: 100%; /* Kích thước slider ảnh bằng với DataList */
                height: auto; /* Chiều cao sẽ tự điều chỉnh dựa trên tỉ lệ ảnh */
                overflow: hidden;
            }

            .slider {
                width: 400%;
                display: flex;
                transition: transform 1s ease-in-out;
            }

            .slide {
                width: 100%;
                box-sizing: border-box;
            }

            .anh1 {
                width: 100%;
                height: auto;
            }
        .prev,
        .next {
            position: absolute;
            top: 50%;
            font-size: 18px;
            color: white;
            background-color: rgba(0, 0, 0, 0.5);
            border: none;
            padding: 10px;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .slider-container:hover .prev,
        .slider-container:hover .next {
            opacity: 1;
        }

        .prev:hover,
        .next:hover {
            transform: scale(1.2);
        }

        .prev:active,
        .next:active {
            transform: scale(0.8);
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
        }



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
            
        /* Thiết lập bảng */
    .data {
        border-collapse: collapse;
        width: 100%;
        font-family: Arial, sans-serif;
        //color: #333;
        //background-color:azure;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Đường biên cho các ô và header */
    .data, .td {
        //border: 1px solid #ddd;
        margin-bottom:20px;
        margin-right:10px;
    }

    /* Nền của header */
    th {
        background-color: #f2f2f2;
    }

    /* Màu chữ và căn giữ cho header và ô dữ liệu */
    .d {
        padding: 12px;
        text-align: center;
    }

   
            
            .auto-style2 {
                height: 53px;
            }
            .auto-style3 {
                width: 36px;
            }
            .auto-style4 {
                height: 41px;
                width: 36px;
            }
            
        </style>
        <script>
            $(document).ready(function () {
                const leftbtn = $(".prev");
                const rightbtn = $(".next");
                const imgNumber = $(".slider .slide");
                let index = 0;

                rightbtn.click(function () {
                    index = (index + 1) % imgNumber.length;
                    showSlide();
                });

                leftbtn.click(function () {
                    index = (index - 1 + imgNumber.length) % imgNumber.length;
                    showSlide();
                });

                function showSlide() {
                    $(".slider").css("transform", "translateX(" + -index * 25 + "%)");
                }

                setInterval(function () {
                    index = (index + 1) % imgNumber.length;
                    showSlide();
                }, 5000);
            });
        </script>
    </head>
    <body>
        <div class="slider-container">
            <div class="slider">
                <div class="slide"><img class="anh1" src="image/banner1.jpg" /></div>
                <div class="slide"><img class="anh1" src="image/banner2.jpg" /></div>
                <div class="slide"><img class="anh1" src="image/banner3.jpg" /></div>
                <div class="slide"><img class="anh1" src="image/banner4.jpg" /></div>
            </div>
            <button class="prev"><</button>
            <button class="next">></button>
        </div>

        <div class="product-list-container">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" ForeColor="Red" OnSelectedIndexChanged="DataList1_SelectedIndexChanged1">
            
         <ItemTemplate>
        <table style="width: 100%;" class="data">
            
            <tr class="da">
                <td class="auto-style3" class="d">
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# "~/image/"+Eval("hinh") %>' Width="160px" />
                </td>
            </tr>
          
            <tr class="da">
                <td rowspan="2" class="auto-style3" class="d">&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Chitietsp?masp="+Eval("masp") %>' style="text-decoration: none; color: #333;" Text='<%# Eval("tensp") %>'></asp:HyperLink>
                    &nbsp;</td>
               
            </tr>
            <tr class="da">
                <td class="auto-style2" class="d"></td>
            </tr>
            <tr class="da">
                <td class="d">&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("gia") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("giamgia") %>' Font-Strikeout="True"></asp:Label>
                </td>
            </tr>
              <tr>
                    <td><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i><i class="fas fa-star fa-sm" style="color: gold;"></i>
                    </i></td>
              </tr>
            <tr class="da">
                <td class="auto-style4" class="d">
                    &nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" class="LinkButton1" Text="Thêm giỏ hàng" CommandArgument='<%# "giohang?masp="+Eval("masp") %>'  OnClick="LinkButton1_Click" OnClientClick="addToCart();"></asp:LinkButton>
                </td>
            </tr>
            <caption>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </caption>
            
        </table>
                    
    </ItemTemplate> 
                 
            </asp:DataList>
            <asp:Button ID="Button1" runat="server" Text="Xem thêm" OnClick="Button1_Click"/>
             </div>
    </body>
    </html>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:DataList ID="DataList2" runat="server">
        <ItemTemplate>
            <table class="auto-style3">
                <tr>
                    <td rowspan="2" class="auto-style2">
         
                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/image/"+Eval("hinh") %>' />
                    </td>
                    <td class="auto-style4">Tên sản phẩm</td>
                    <td class="auto-style4"><asp:Label ID="Label1" runat="server" Text='<%# Eval("tensp") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>Giá</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("gia") %>'></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            <input type="hidden" id="hiddenProductName" />
<input type="hidden" id="hiddenProductPrice" />
  <!-- Thêm một thẻ div để chứa danh sách sản phẩm trong giỏ hàng -->


<!-- Script để cập nhật danh sách sản phẩm trong giỏ hàng -->
<script>
    // Kiểm tra sự tồn tại của hiddenProductName và hiddenProductPrice
    var hiddenProductNameElement = document.getElementById('hiddenProductName');
    var hiddenProductPriceElement = document.getElementById('hiddenProductPrice');

    if (hiddenProductNameElement && hiddenProductPriceElement) {
        // Lấy thông tin sản phẩm từ các input ẩn
        var productName = hiddenProductNameElement.value;
        var productPrice = hiddenProductPriceElement.value;

        // Tạo một thẻ p để hiển thị thông tin sản phẩm và giá
        var productInfo = document.createElement('p');
        productInfo.innerHTML = productName + ' - ' + productPrice + ' đ';

        // Thêm thẻ p vào danh sách sản phẩm trong giỏ hàng
        var cartItemsContainer = document.getElementById('cartItems');
        if (cartItemsContainer) {
            cartItemsContainer.appendChild(productInfo);
        } else {
            console.error('Không tìm thấy cartItems.');
        }
    } else {
        console.error('Không tìm thấy hiddenProductName hoặc hiddenProductPrice.');
    }

    // Hàm được gọi khi thêm vào giỏ hàng thành công
    function addToCartSuccess(result) {
        alert(result); // Hiển thị thông báo thành công (có thể sửa đổi theo nhu cầu)
    }

    // Hàm được gọi khi thêm vào giỏ hàng thất bại
    function addToCartFailure(error) {
        alert("Có lỗi xảy ra khi thêm vào giỏ hàng."); // Hiển thị thông báo lỗi
    }
</script>


</asp:Content>


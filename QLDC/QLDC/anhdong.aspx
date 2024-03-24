<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anhdong.aspx.cs" Inherits="QLDC.anhdong" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                       .container-website{
    width:100%;
    height: 100%;
    position: relative;
    /* background: #fff; */
    margin-top: 160px;
}
/* ---------------SLIDER----------------- */
.box-slider{
    width: 100%;
    height: 100%;
    background: #fff;
}
.container-website .slider{
    position: relative;
    width: 1120px;
    height: 100%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
}
.container-website .slider .slider-left{
    width: 70%;
    height: 100%;
    /* display: flex; */
    position: relative;
    overflow: hidden;
    margin-top: 20px;
}
.slider-left-container{
    position: relative;
    width: 100%;
    height: 100%;
    transition: 1s;
}
.container-website .slider .slider-left .slider-left-top{
    width: 100%;
    height: 430px;
    position: relative;
    transition: all 1s;
}
.container-website .slider .slider-left .slider-left-top img{
    width: 784px;
    height: 430px;
    position: absolute;     
}
.container-website .slider .slider-left .slider-left-top a:nth-child(2) img{
    transform: translateX(100%);
}
.container-website .slider .slider-left .slider-left-top a:nth-child(3) img{
    transform: translateX(200%);
}
.slider-left .slider-left-top-btn{
    position: absolute;
    z-index: 10000;
    width: 100%;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    justify-content: space-between;
}
.slider-left .slider-left-top-btn .fa-angle-left{
    font-size: 30px;
    cursor: pointer;
    width: 40px;
    height: 40px;
    border: 3px solid rgb(255, 255, 255, 0.7);
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: rgba(255, 255, 255, 0.7);
    padding: 0px 15px;
    opacity: 0;
    transform: translateX(30px);
    transition: all 0.5s ease-in-out;
}
.slider-left .slider-left-top-btn .fa-angle-right{
    font-size: 30px;
    cursor: pointer;
    width: 40px;
    height: 40px;
    border: 3px solid rgb(255, 255, 255, 0.7);
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: rgba(255, 255, 255, 0.7);
    padding: 0px 15px;
    opacity: 0;
    transform: translateX(-30px);
    transition: all 0.5s ease-in-out;
}
.slider .slider-left .slider-left-container:hover i{
    opacity: 1;
    transform: translateX(0px);
}
.slider .slider-left .slider-left-top-btn .fa-solid:hover{
    background: #ff6900;
    border: 3px solid #ff6900;
}
    </style>
</head>
<body>
    <div class="container-website">
 <div class="box-slider">
     <div class="slider">
         <div class="slider-left">
             <div class="slider-left-container">
                 <div class="slider-left-top">
                     <a href=""><img src="image/banner1.jpg" /></a>
                     <a href=""><img src="image/banner2.jpg" alt=""></a>
                     <a href=""><img src="image/banner3.jpg" alt=""></a>
                 </div>
                 <div class="slider-left-top-btn">
                     <i class="fa-solid fa-angle-left"></i>
                     <i class="fa-solid fa-angle-right"></i>
                 </div>
             </div>
             <div class="slider-left-bottom">
                 <div class="slider-left-bottom-item1">
                     <a href=""><img src="image/slide2.jpg" alt=""></a>
                 </div>
                 <div class="slider-left-bottom-item1">
                     <a href=""><img src="image/slide3.jpg" alt=""></a>
                 </div>
             </div>
         </div>
         <div class="slider-right">
             <img src="image/slide4.jpg" alt="">
         </div>
</body>
</html>

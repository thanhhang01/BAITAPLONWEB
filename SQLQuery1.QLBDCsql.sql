use QLBDC;

create table khachhang(
makh int identity(1,1) primary key,
tenkh nvarchar(30),
diachi nvarchar(50),
sdt int,
tendangnhap nvarchar(30),
matkhau int,
ngaysinh date,
gioitinh nvarchar(10),
email nvarchar(50))

create table loaisp(
maloai int identity(1,1) primary key,
tenloai nvarchar(60))

create table nhacungcap(
mancc int identity(1,1) primary key,
tenncc nvarchar(60),
diachi nvarchar(30),
sdt int )


create table sanpham(
masp int identity(1,1) primary key,
tensp nvarchar(60),
dvtinh int,
gia int,
mota nvarchar(50),
hinh nchar(50),
maloai int references loaisp(maloai)ON DELETE CASCADE,
mancc int references nhacungcap(mancc)ON DELETE CASCADE)
ALTER TABLE sanpham
ADD giamgia INT DEFAULT 0;

create table dondathang(
sohd int identity(1,1) primary key,
ngaydh date,
trigia int,
dagiao nvarchar(30),
ngaygiao date,
tennguoinhan nvarchar(30),
dcnhan nvarchar(50),
sdtnhan int,
htthanhtoan nvarchar(30),
htgiaohang nvarchar(30),
makh int references khachhang(makh) ON DELETE CASCADE)

create table ctdathang(
sohd int references dondathang(sohd),
masp int references sanpham(masp),
soluong int,
dongia int,
primary key (sohd,masp))


create table dangnhap(
tendangnhap nvarchar(50) Primary Key,
matkhau nvarchar(50),
role nvarchar(50)
)

insert into dangnhap(tendangnhap,matkhau,role) values 
('user','123456','user'),
(N'Admin','123456')

select * from dangnhap

create table dangnhap12(
tendangnhap nvarchar(30) Primary Key,
matkhau int
)

ON DELETE CASCADE;


ALTER TABLE sanpham
ALTER COLUMN dvtinh nvarchar(30);

ALTER TABLE sanpham
ALTER COLUMN gia int;

ALTER TABLE sanpham
DROP CONSTRAINT DF__sanpham__giamgia__403A8C7D;

select ISNUMERIC(hinh) from sanpham
create database QuanLyThuVien;
use QuanLyThuVien;
create table TacGia (
MaTacGia int primary key auto_increment,
TenTacGia varchar(100) not null,
QuocTich varchar(50)
);
create table DocGia (
MaDocGia int primary key auto_increment,
TenDocGia varchar(100) not null,
DiaChi varchar(255),
SoDienThoai varchar(15) unique

);
insert into TacGia (TenTacGia, QuocTich)
values
('Nguyễn Nhật Ánh', 'Việt Nam'),
('J.K. Rowling', 'Anh'),
('Haruki Murakami', 'Nhật Bản'),
('Dale Carnegie', 'Mỹ');

insert into DocGia (TenDocGia, DiaChi,SoDienThoai)
values 
('Nguyễn Văn A', '123 Đường ABC, Hà Nội', '0901234567'),
('Trần Thị B', '456 Đường XYZ, TP.HCM', '0912345678'),
('Lê Văn C', '789 Đường LMN, Đà Nẵng', '0923456789'),
('Phạm Thị D', '101 Đường QRS, Hà Nội', '0934567890'),
('Hoàng Văn E', '202 Đường UVW, Cần Thơ', '0945678901');

select * from TacGia 
where QuocTich = 'Việt Nam';

select * from DocGia
where DiaChi like '%Hà Nội';

select TenDocGia, SoDienThoai from DocGia;

update DocGia
set DiaChi = '200 Đường XYZ, TP. Thủ Đức'
where MaDocGia = 2;
delete from TacGia
where MaTacGia = 3;

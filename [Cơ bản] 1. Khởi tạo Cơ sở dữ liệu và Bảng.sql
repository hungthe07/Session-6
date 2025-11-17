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
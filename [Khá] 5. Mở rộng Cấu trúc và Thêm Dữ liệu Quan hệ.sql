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

CREATE TABLE sach (
    ma_sach INT PRIMARY KEY AUTO_INCREMENT,
    ten_sach VARCHAR(200) NOT NULL,
    nam_xuat_ban int,
    ma_tac_gia INT NULL,
    FOREIGN KEY (ma_tac_gia) REFERENCES tac_gia(ma_tac_gia)
);
ALTER TABLE sach
MODIFY COLUMN nam_xuat_ban bigint ;
INSERT INTO sach (ten_sach, nam_xuat_ban, ma_tac_gia)
VALUES ('Cho tôi xin một vé đi tuổi thơ', 2008, 1),
('Mắt biếc', 1990, 1),
('Harry Potter và Hòn đá Phù thủy', 1997, 2),
('Harry Potter và Phòng chứa Bí mật', 1998, 2),
('Đắc nhân tâm', 1936, 4);
SELECT *
FROM sach
WHERE nam_xuat_ban >= 1990 AND nam_xuat_ban <= 2000;
SELECT *
FROM sach
WHERE ten_sach = 'Harry Potter và Hòn đá Phù thủy' OR ten_sach = 'Harry Potter và Phòng chứa Bí mật';
SELECT *
FROM sach
WHERE ma_tac_gia = 1 AND nam_xuat_ban > 2000;
SELECT *
FROM sach
ORDER BY nam_xuat_ban DESC;
SELECT *
FROM doc_gia
ORDER BY ten_doc_gia ASC;
CREATE TABLE phieu_muon (
	ma_phieu_muon INT AUTO_INCREMENT PRIMARY KEY,
    ngay_muon DATE NOT NULL,
    ngay_tra DATE NULL,
    ma_doc_gia INT NOT NULL,
    ma_sach INT NOT NULL,
    FOREIGN KEY (ma_doc_gia) REFERENCES doc_gia(ma_doc_gia),
	FOREIGN KEY (ma_sach) REFERENCES sach(ma_sach)
);
ALTER TABLE sach 
ADD COLUMN trang_thai VARCHAR(50);
UPDATE sach
SET trang_thai = 'Còn hàng'
WHERE nam_xuat_ban < 2000;
INSERT INTO phieu_muon (ma_doc_gia, ma_sach, ngay_muon, ngay_tra)
VALUES
(1, 1, '2024-01-10', '2024-01-25'),
(2, 3, '2024-02-15', NULL),
(1, 2, '2024-03-01', '2024-03-15'),
(3, 4, '2024-03-05', NULL),
(5, 5, '2024-04-20', '2024-05-01');
SELECT *
FROM phieu_muon
WHERE ma_doc_gia = 1;
SELECT *
FROM phieu_muon
WHERE ngay_tra IS NULL;
SET SQL_SAFE_UPDATES = 0;

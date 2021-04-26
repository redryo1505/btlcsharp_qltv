use master
go
create database QuanLyThuVien
go
use QuanLyThuVien
go

Create table NhanVien
(
	maNV Integer identity(1,1) primary key NOT NULL,
	tenDangNhap Varchar(20) NULL,
	matKhau Varchar(20) NULL,
	tenNV Nvarchar(30) NULL,
	diaChi Nvarchar(50) NULL,
	viTri Nvarchar(30) NULL,
	ngaySinh Date NULL
) 
go

Create table PhieuMuonTra
(
	maPhieu Integer identity(1,1) NOT NULL,
	ngayMuon Date NULL,
	ngayTra Date NULL,
	ghiChu Ntext NULL,
	maNV Integer NOT NULL,
	soThe Integer NOT NULL,
Primary Key (maPhieu)
) 
go

Create table DocGia
(
	soThe Integer identity(1,1) NOT NULL,
	tenDocGia Nvarchar(30) NULL,
	diaChi Nvarchar(50) NULL,
	dienThoai Char(10) NULL,
	ngayCap Date NULL,
	hanSD Date NULL,
	nguoiCN Nvarchar(30) NULL,
	ngayCN Date NULL,
Primary Key (soThe)
) 
go

Create table TheLoai
(
	maTheLoai Integer identity(1,1) NOT NULL,
	tenTheLoai Nvarchar(30) NULL,
Primary Key (maTheLoai)
) 
go

Create table TaiLieu
(
	maTaiLieu Integer identity(1,1) NOT NULL,
	tenTaiLieu Nvarchar(30) NOT NULL,
	soLuong Integer NULL,
	giaTien float NULL,
	namXuatBan Date NULL,
	maTheLoai Integer NOT NULL,
	maTacGia Integer NOT NULL,
	maNXB Integer NOT NULL,
Primary Key (maTaiLieu)
) 
go

Create table TacGia
(
	maTacGia Integer identity(1,1) NOT NULL,
	tenTacGia Nvarchar(30) NULL,
	dienThoai Char(10) NULL,
	diaChi Nvarchar(30) NULL,
Primary Key (maTacGia)
) 
go

Create table XyLyVP
(
	ID_Phat Integer identity(1,1) NOT NULL,
	liDoVP Nvarchar(50) NULL,
	htXuLy Nvarchar(50) NULL,
	ngayXL Date NULL,
	nguoiXL Nvarchar(30) NULL,
	ngayMoThe Date NULL,
	soThe Integer NOT NULL,
Primary Key (ID_Phat)
) 
go

Create table ChiTietPhieu
(
	maPhieu Integer NOT NULL,
	maTaiLieu Integer NOT NULL,
	soLuong Integer NULL,
Primary Key (maPhieu,maTaiLieu)
) 
go

Create table NhaXuatBan
(
	maNXB Integer identity(1,1) NOT NULL,
	tenNXB Nvarchar(30) NULL,
	diaChi Nvarchar(30) NULL,
	email Varchar(20) NULL,
Primary Key (maNXB)
) 
go


Alter table PhieuMuonTra add  foreign key(maNV) references NhanVien (maNV)  on update no action on delete no action 
go
Alter table ChiTietPhieu add  foreign key(maPhieu) references PhieuMuonTra (maPhieu)  on update no action on delete no action 
go
Alter table PhieuMuonTra add  foreign key(soThe) references DocGia (soThe)  on update no action on delete no action 
go
Alter table XyLyVP add  foreign key(soThe) references DocGia (soThe)  on update no action on delete no action 
go
Alter table TaiLieu add  foreign key(maTheLoai) references TheLoai (maTheLoai)  on update no action on delete no action 
go
Alter table ChiTietPhieu add  foreign key(maTaiLieu) references TaiLieu (maTaiLieu)  on update no action on delete no action 
go
Alter table TaiLieu add  foreign key(maTacGia) references TacGia (maTacGia)  on update no action on delete no action 
go
Alter table TaiLieu add  foreign key(maNXB) references NhaXuatBan (maNXB)  on update no action on delete no action 
go

insert into NhanVien values('admin', 'admin',N'Vũ Văn Hôm',N'Bắc Giang',N'Kĩ thuật','2000/05/15')
insert into NhanVien values('admin1', 'admin1',N'Đào Thu Hoài',N'Thái Bình',N'Quản lý','2000/06/09')
insert into NhanVien values('admin2', 'admin2',N'Nguyễn Thị Chang',N'Hải Dương',N'Thủ thư','2000/09/06')
insert into NhanVien values('admin3', 'admin3',N'Nguyễn Thị Hợp',N'Bắc Ninh',N'Quản lý','2000/11/22')


insert into TheLoai values (N'Chính trị – pháp luật')
insert into TheLoai values (N'Khoa học công nghệ')
insert into TheLoai values (N'Văn hóa xã hội')
insert into TheLoai values (N'Lịch sử')
insert into TheLoai values (N'Văn học nghệ thuật')
insert into TheLoai values (N'Giáo trình')
insert into TheLoai values (N'Kỹ thuật')
insert into TheLoai values (N'Du lịch')
insert into TheLoai values (N'Tiểu thuyết')

insert into NhaXuatBan values (N'Kim Đồng',N'Hà Nội','kimdong@gmail.com')
insert into NhaXuatBan values (N'Tuổi trẻ',N'Hà Nội','tuoitre@gmail.com')
insert into NhaXuatBan values (N'Hòa Bình',N'Hòa Bình','hoabinh@gmail.com')
insert into NhaXuatBan values (N'Thời đại mới',N'Hải Dương','thoidaimoi@gmail.com')
insert into NhaXuatBan values (N'Thủ Đô',N'Hà Nội','thudo@gmail.com')
insert into NhaXuatBan values (N'Hà Nội',N'Hà Nội','hanoi@gmail.com')
insert into NhaXuatBan values (N'Giáo dục',N'Bắc Ninh','giaoduc@gmail.com')
insert into NhaXuatBan values (N'Công Đoàn',N'Đà Nẵng','congdoan@gmail.com')
insert into NhaXuatBan values (N'Công Nghệ',N'TP.HCM','congnghe@gmail.com')
insert into NhaXuatBan values (N'Thống Nhất',N'Hà Nội','thongnhat@gmail.com')

insert into TacGia values (N'Vũ Văn Hôm','0388151485',N'Bắc Giang')
insert into TacGia values (N'Đào Thu Hoài','0329325325',N'Thái Bình')
insert into TacGia values (N'Nguyễn Thị Chang','0329349295',N'Hải Dương')
insert into TacGia values (N'Nguyễn Thị Hợp','0293523423',N'Bắc Ninh')
insert into TacGia values (N'Nguyễn Văn Đan','0329349353',N'Lạng Sơn')

insert into TaiLieu values (N'Lập trình căn bản',150,30000,'2010/6/5',7,1,7)
insert into TaiLieu values (N'Lập trình HĐT', 220, 40000,'2015/7/3',2,1,9)
insert into TaiLieu values (N'Kĩ thuật sửa ô tô', 143, 20000,'2017/10/3',7,2,1)
insert into TaiLieu values (N'Tâm lí người tiêu dùng',127,42000,'2018/11/4',3,3,2)
insert into TaiLieu values (N'Du lịch Asia',115,27000,'2016/5/6',8,4,3)
insert into TaiLieu values (N'Lập trình Winform',230, 57000,'2019/10/15',7,1,4)
insert into TaiLieu values (N'Cơ khí',96, 55000,'2019/5/10', 6,5,5)
insert into TaiLieu values (N'Làm giàu không khó',119,23000,'2018/12/12',9,3,5)
insert into TaiLieu values (N'Nghệ thuật làm móng', 126, 15000,'2020/11/11', 1,2,6)
insert into TaiLieu values (N'Nỗi buồn miên man', 219,18000,'2021/1/2',9,5,7)
insert into TaiLieu values (N'Ngọn nến trước gió', 116, 31000, '2015/10/7',5,4,8)
insert into TaiLieu values (N'Ngược lối đi về', 128, 42000,'2014/10/6',4,2,9)
insert into TaiLieu values (N'Đành thôi',78,34000,'2019/6/9',1,3,10)
insert into TaiLieu values (N'Bỏ lại hồi ức', 122, 45000,'2018/5/10', 9, 4,3)
insert into TaiLieu values (N'Nếu còn tồn tại', 94, 20000, '2017/4/14', 4,1,4)
insert into TaiLieu values (N'Xin một lần ngoại lệ', 85, 30000,'2013/12/10',3,2,3)
insert into TaiLieu values (N'Trước sau vẫn vậy', 83, 33000,'2000/12/12', 4,5,1)
insert into TaiLieu values (N'Đơn côi', 55,36000,'2001/6/8',6,4,2)
insert into TaiLieu values (N'Tàn bạo quá', 66,70000,'2011/10/7',9,3,6)
insert into TaiLieu values (N'Đơn giản thôi', 44,15000,'2015/11/12',4,1,7)

insert into DocGia values (N'Nguyễn Hữu Hoàng',N'Hà Tĩnh','0385219270','2018/10/5','2025/10/5',N'Vũ Văn Hôm','2021/3/1')
insert into DocGia values (N'Vũ Bảo Lộc',N'Hà Giang','0382459270','2018/11/5','2024/11/5',N'Nguyễn Thị Hợp','2021/3/12')
insert into DocGia values (N'Nguyễn Thị Giang',N'Thái Nguyên','0325219325','2018/12/5','2023/12/5',N'Đào Thu Hoài','2021/3/13')
insert into DocGia values (N'Trần Thủ Độ',N'Bắc Giang','0345219674','2018/10/6','2024/10/6',N'Nguyễn Thị Chang','2021/4/1')
insert into DocGia values (N'Nguyễn Quốc Cường',N'Thái Bình','0231219895','2018/6/3','2022/6/3',N'Đào Thu Hoài','2021/4/2')
insert into DocGia values (N'Bùi Hải Yến',N'Hải Phòng','0256219938','2018/9/15','2021/9/15',N'Nguyễn Thị Hợp','2021/4/3')

insert into XyLyVP values(N'Quá hạn',N'Khóa thẻ 1 ngày','2020/10/5','Đào Thu Hoài','2020/10/6',1)
insert into XyLyVP values(N'Mất sách',N'Phạt 50k','2020/10/8','Đào Thu Hoài','2020/10/8',2)
insert into XyLyVP values(N'Quá hạn',N'Khóa thẻ 1 tuần','2021/2/10','Nguyễn Thị Hợp','2021/2/17',3)
insert into XyLyVP values(N'Rách sách',N'Phạt 30k','2020/6/15','Đào Thu Hoài','2020/5/15',4)


insert into PhieuMuonTra values('2019/10/15','2019/10/20','',1,1)
insert into PhieuMuonTra values('2019/10/16','2019/10/17','',2,1)
insert into PhieuMuonTra values('2019/11/14','2019/11/20','',2,2)
insert into PhieuMuonTra values('2019/12/7','2019/12/14','',3,4)
insert into PhieuMuonTra values('2020/01/15','2020/01/20','',1,5)
insert into PhieuMuonTra values('2020/03/20','2020/03/24','',1,6)
insert into PhieuMuonTra values('2020/10/18','2020/10/20','',4,1)
insert into PhieuMuonTra values('2021/04/15','2021/04/22','',4,2)
insert into PhieuMuonTra values('2021/3/15','2021/04/01','',3,1)

insert into ChiTietPhieu values(1,1,20)
insert into ChiTietPhieu values(1,2,10)
insert into ChiTietPhieu values(1,3,6)
insert into ChiTietPhieu values(2,1,10)
insert into ChiTietPhieu values(2,4,15)
insert into ChiTietPhieu values(3,2,4)
insert into ChiTietPhieu values(4,5,1)
insert into ChiTietPhieu values(5,7,20)

select * from ChiTietPhieu
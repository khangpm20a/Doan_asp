USE Eshop
GO

DELETE FROM Carts;
DBCC CHECKIDENT ('Eshop.dbo.Carts', RESEED, 0);
GO
DELETE FROM InvoiceDetails;
DBCC CHECKIDENT ('Eshop.dbo.InvoiceDetails', RESEED, 0);
GO
DELETE FROM Invoices;
DBCC CHECKIDENT ('Eshop.dbo.Invoices', RESEED, 0);
GO
DELETE FROM Accounts;
DBCC CHECKIDENT ('Eshop.dbo.Accounts', RESEED, 0);
GO
DELETE FROM Products;
DBCC CHECKIDENT ('Eshop.dbo.Products', RESEED, 0);
GO
DELETE FROM ProductTypes;
DBCC CHECKIDENT ('Eshop.dbo.ProductTypes', RESEED, 0);
GO

INSERT INTO Accounts (Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('admin', 'admin', 'admin@Eshop.com', '01234567890', N'Tp.Hồ Chí Minh', N'Nguyễn Văn Ad Min', 1, 'admin.jpg', 1);
INSERT INTO Accounts (Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('john', '123456', 'john@gmail.com', '0905486957', N'Đà Nẵng', N'John Henry', 0, 'john.jpg', 1);
INSERT INTO Accounts (Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('dhphuoc', '123456', 'dhphuoc@gmail.com', '0904863125', N'Tp.Hồ Chí Minh', N'Dương Hữu Phước', 0, 'dhphuoc.jpg', 1);
INSERT INTO Accounts (Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('longvic', '123456', 'longvic@gmail.com', '0459123845', N'Nha Trang', N'Long Vic', 0, 'longvic.jpg', 1);
INSERT INTO Accounts (Username, Password, Email, Phone, Address, FullName, IsAdmin, Avatar, Status) VALUES ('customer', '123456', 'customer@gmail.com', '0987654321', N'Huế', N'Trần Thị B', 0, 'customer.jpg', 1);

INSERT INTO ProductTypes (Name, Status) VALUES (N'Sách giáo khoa', 1);
INSERT INTO ProductTypes (Name, Status) VALUES (N'Sách tham khảo', 1);
INSERT INTO ProductTypes (Name, Status) VALUES (N'Sách nước ngoài', 1);
INSERT INTO ProductTypes (Name, Status) VALUES (N'Báo & Tạp chí', 1);
INSERT INTO ProductTypes (Name, Status) VALUES (N'Tiểu thuyết & Tự truyện', 1);
INSERT INTO ProductTypes (Name, Status) VALUES (N'Khác', 1);

INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('WT3WPGZ9BTWB', N'Tuổi trẻ đáng giá bao nhiêu', N'Rosie Nguyễn', 45000, 40, 5, '1.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('98IOWWXWYVQ4', N'Bứt phá điểm thi THPT Quốc gia môn Hóa học', N'Nguyễn Đức Dũng', 51000, 15, 2, '2.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('21RH48HRFXX8', N'Khéo ăn khéo nói sẽ có được thiên hạ', N'Trác Nhã', 59000, 29, 6, '3.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('QOXYSDE605P5', N'Nhà giả kim', N'Paulo Coelho', 53000, 1, 3, '4.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('6YI6TZ3JPO1L', N'Để yên cho bác sĩ "Hiền"', N'BS. Ngô Đức Hùng', 52000, 36, 4, '5.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('YHB5JTSVRF8E', N'Mình là cá, việc của mình là bơi ', N'Takeshi Furukawa', 57000, 9, 3, '6.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('LXL64LZAR5M2', N'Đời ngắn đừng ngủ dài', N'Robin Sharma', 42000, 7, 3, '7.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('C5V645HVP91W', N'Bứt phá điểm thi THPT Quốc gia môn Toán', N'ThS. Đỗ Đường Hiếu', 51000, 0, 2, '8.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('4KLYT2UF7VB9', N'Cà phê cùng Tony ', N'Tony Buổi Sáng', 62000, 18, 6, '9.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('KBD67VI81M80', N'Em sẽ đến cùng cơn mưa', N'Ichikawa Takuji', 56000, 64, 5, '10.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('3RISEFVDWYVF', N'Quẳng gánh lo đi mà vui sống', N'Dale Carnegie', 45000, 120, 6, '11.jpg', 1);
INSERT INTO Products (SKU, Name, Description, Price, Stock, ProductTypeId, Image, Status) VALUES ('VIAZXR3Y24IY', N'Mình nói gì khi nói về hạnh phúc?', N'Rosie Nguyễn', 36000, 46, 5, '12.jpg', 1);

INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (1, 1, 2);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (2, 1, 4);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (5, 2, 2);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (5, 6, 1);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (5, 9, 3);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (5, 12, 5);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (2, 5, 7);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (2, 10, 2);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (2, 11, 4);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (4, 2, 1);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (4, 3, 1);
INSERT INTO Carts (AccountId, ProductId, Quantity) VALUES (4, 7, 2);

INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('299541176755', 5, '2020-01-15 15:06:12', N'Quận 3, Tp.HCM', '0987654321', 618000, 1);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('527777447269', 2, '2020-01-16 10:30:19', N'Quận 1, Tp.HCM', '0983564782', 167000, 1);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('228448970415', 2, '2020-01-18 18:02:07', N'Quận 5, Tp.HCM', '0983564782', 570000, 1);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('827349270900', 2, '2020-01-20 20:35:53', N'Quận 1, Tp.HCM', '0983564782', 480000, 0);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('127745305853', 3, '2020-01-24 08:20:17', N'Quận 7, Tp.HCM', '0905785346', 829000, 1);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('074407650817', 4, '2020-01-24 09:00:52', N'Nha Trang', '0459123845', 478000, 0);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('611108375524', 3, '2020-01-28 14:20:54', N'Quận 7, Tp.HCM', '0905785346', 642000, 1);
INSERT INTO Invoices (Code, AccountId, IssuedDate, ShippingAddress, ShippingPhone, Total, Status) VALUES ('178291648473', 4, '2020-01-24 18:29:07', N'Nha Trang', '0459123845', 327000, 1);

INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (1, 1, 2, 45000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (1, 3, 5, 59000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (1, 4, 1, 53000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (1, 9, 3, 60000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (2, 7, 1, 40000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (2, 8, 1, 55000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (2, 12, 2, 36000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (3, 6, 10, 57000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (4, 10, 4, 50000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (4, 11, 7, 40000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (5, 2, 4, 50000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (5, 3, 3, 59000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (5, 7, 6, 57000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (5, 10, 2, 55000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (6, 5, 7, 52000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (6, 6, 2, 57000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (7, 6, 2, 36000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (7, 12, 10, 57000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (8, 4, 1, 53000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (8, 9, 3, 60000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (8, 10, 1, 56000);
INSERT INTO InvoiceDetails (InvoiceId, ProductId, Quantity, UnitPrice) VALUES (8, 12, 1, 38000);
--create database gasManagement
--drop database gasManagement
------------------------------
create table Supplier(
	supplierID int IDENTITY(1,1) PRIMARY KEY,
	supplierName nvarchar(255) NOT NULL,
	companyName nvarchar(255),
	contactInfor varchar(100) UNIQUE,
	phoneContact varchar(15),
	[address] nchar(255), 
	[country] nvarchar(255),
	[status] tinyint
)

---------------------------------
create table Category(
	categoryID int IDENTITY(1,1) PRIMARY KEY,
	CategoryName nvarchar(255) NOT NULL,
	[image] varchar(max)
)

-----------------------------------------------------------
create table WarrantyPolicy(
	WarrantyPolicyID int IDENTITY(1,1) PRIMARY KEY,
	warrantyPeriod tinyint,
	WarrantyCategory NVARCHAR(255),
)
------------------------------------------
create table Product(
	productID int IDENTITY(1,1) PRIMARY KEY,
	supplierID int CONSTRAINT FK_Product_supplierID FOREIGN KEY REFERENCES Supplier(supplierID) NOT NULL,
	productName nvarchar(255) NOT NULL,
	categoryID int CONSTRAINT FK_Product_categoryID FOREIGN KEY REFERENCES Category(categoryID) NOT NULL,
	price money CONSTRAINT CHECK_price_Product CHECK(price >= 0),
	WarrantyPolicyID int CONSTRAINT FK_WarrantyPolicy_WarrantyPolicyID FOREIGN KEY REFERENCES WarrantyPolicy(WarrantyPolicyID),
	quantity int NOT NULL,
	productDetail ntext,
	describe ntext,
	discount float,
	[image] varchar(max),
	[status] tinyint
)

--------------------------------------------------x

create table [User](
	userID int IDENTITY(1,1) PRIMARY KEY,
	username varchar(255) UNIQUE,
	[password] varchar(255) NOT NULL,
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	email varchar(255) UNIQUE,
	phoneNumber varchar(15) UNIQUE,
	[address] nvarchar(255),
	[status] tinyint DEFAULT 0 CONSTRAINT CHECK_status_User CHECK([status] in (0,1,2)),
	discount float DEFAULT 0 CONSTRAINT CHECK_Range_Discount_User CHECK(discount >= 0 AND discount <= 1)
)
----------------------------------------------------------
create table Employee(
	EmployeeID int IDENTITY(1,1) PRIMARY KEY, 
	Employeename nvarchar(255) UNIQUE,
	[password] varchar(255) NOT NULL,
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	email varchar(255),
	phoneNumber varchar(15) UNIQUE,
	[address] nvarchar(255),
	[role] int
)

------------------------------------------------------
create table [Order](
	orderID int IDENTITY(1,1) PRIMARY KEY,
	userID int CONSTRAINT FK_Order_userID FOREIGN KEY REFERENCES [User](userID) NOT NULL,
	orderDate date,	
	deliveryAddress nvarchar(255),	
	[status] int,
	totalMoney money,
)
--------------------------------------------------------------
create table WarrantyInvoice(
	WarrantyInvoiceID int IDENTITY(1,1) PRIMARY KEY,
	productID int CONSTRAINT FK_Warranty_productID FOREIGN KEY REFERENCES Product(productID) NOT NULL,
	orderID int CONSTRAINT FK_Warranty_orderID FOREIGN KEY REFERENCES [Order](orderID) NOT NULL,
	EmployeeID int CONSTRAINT FK_Employee_EmployeeID FOREIGN KEY REFERENCES [Employee](EmployeeID) NOT NULL,
	maintenanceDate Date,
	appointmentDate Date,
	[money] money,
	[status] int,
	describe ntext,
	comment ntext,
)
-----------------------------------------------------
create table OrderDetail(
	OrderDetailID int IDENTITY(1,1) PRIMARY KEY,
	OrderID int CONSTRAINT FK_OrderDetail_OrderID FOREIGN KEY REFERENCES [Order](OrderID) NOT NULL,	
	productID int CONSTRAINT FK_OrderDetail_productID FOREIGN KEY REFERENCES Product(productID) NOT NULL,
	quantityOrder int NOT NULL,
	price money not null,
	contactForWarranty tinyint	
)

---------------------------------------------------

create table News(
	newsID int IDENTITY(1,1) PRIMARY KEY,
	EmployeeID int CONSTRAINT FK_News_EmployeeID FOREIGN KEY REFERENCES Employee(EmployeeID) NOT NULL,
	newsTitle ntext,
	tagname ntext,
	newContent ntext,
	[image] varchar(max),
	DateUpload Date DEFAULT GETDATE(),	
	isVisible bit,
	parentNewsID INT CONSTRAINT FK_News_parentNewsID FOREIGN KEY REFERENCES News(newsID)
)


----------------------------------------------------
GO
/* cập nhật hàng trong kho sau khi đặt hàng hoặc cập nhật */
CREATE TRIGGER trg_Order ON [OrderDetail] AFTER INSERT AS 
BEGIN
	UPDATE Product
	SET quantity = quantity - (
		SELECT quantityOrder
		FROM inserted
		WHERE productID = Product.productID
	)
	FROM Product
	JOIN inserted ON Product.productID = inserted.productID
END
select * from [order]
-------------------------------------------------------------------------------------
GO
/* cập nhật hàng trong kho sau khi hủy đặt hàng status trong [order] bang 5*/
CREATE TRIGGER trg_CancelOrder ON [Order] AFTER UPDATE AS 
BEGIN
    IF UPDATE(status)
    BEGIN
        IF EXISTS ( SELECT 1 FROM inserted WHERE status = 5 )
        BEGIN
            UPDATE Product
            SET quantity = quantity + od.quantityOrder
            FROM Product
            INNER JOIN OrderDetail od ON Product.productID = od.productID
            INNER JOIN deleted ON od.OrderID = deleted.orderID
            INNER JOIN inserted ON deleted.orderID = inserted.orderID
            WHERE inserted.status = 5
        END
    END
END

-------------------------------------------------------------------------------------
GO
	--Cap nhat discount 
create TRIGGER trg_UpdateDiscount ON [Order] FOR INSERT AS 
BEGIN
		IF (SELECT SUM([Order].totalMoney) from [Order], inserted WHERE [Order].userID = inserted.userID group by [Order].userID) >= 5000000
	BEGIN
		UPDATE [User]
		SET discount =  0.05
		FROM [User], inserted WHERE [User].userID = inserted.userID 
	END
		ELSE IF (SELECT SUM([Order].totalMoney) from [Order], inserted WHERE [Order].userID = inserted.userID group by [Order].userID) >= 20000000
	BEGIN
		UPDATE [User]
		SET discount =  0.1
		FROM [User], inserted WHERE [User].userID = inserted.userID 
	END
END
-------------------------------------------------------------------------------------
GO
--cap nhat trang thai nguoi dung
CREATE TRIGGER trg_UpdateStatus ON [Order] AFTER INSERT AS 
BEGIN
	UPDATE [User]
	SET [status] = 1
	FROM [User]
	WHERE [User].userID IN (SELECT inserted.userID FROM inserted)
END

-----------------------------------------------------
GO
--cap nhat status product khi status supplier thay doi
CREATE TRIGGER UpdateProductStatus
ON Supplier
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status)
    BEGIN
        DECLARE @NewStatus tinyint
        SELECT @NewStatus = status FROM inserted

        UPDATE Product
        SET [status] = @NewStatus
        WHERE supplierID IN (SELECT supplierID FROM inserted)
    END
END

-----------------------------------------------------------------
GO
--proc quan ly bao hanh
CREATE PROCEDURE GetExpiringWarrantyProducts
AS
BEGIN
	--DECLARE @CurrentDate DATE = GETDATE();
	DECLARE @CurrentDate DATE = '2024-6-24';
	SELECT O.orderDate, U.userID, U.username, U.firstName, U.lastName, U.phoneNumber, U.email, P.productID, P.productName, WP.WarrantyCategory,wp.warrantyPeriod
			FROM [Order] O
			JOIN [User] U ON O.userID = U.userID 
			JOIN OrderDetail OD ON O.orderID = OD.OrderID
			JOIN Product P ON OD.productID = P.productID
			JOIN WarrantyPolicy WP ON P.WarrantyPolicyID = WP.WarrantyPolicyID
			WHERE DATEADD(MONTH, WP.warrantyPeriod, O.orderDate) <= DATEADD(MONTH, 1, @CurrentDate)
				AND	 DATEDIFF(MONTH,  O.orderDate, @CurrentDate) <= wp.warrantyPeriod
				AND P.WarrantyPolicyID <> 7;
END;

EXEC GetExpiringWarrantyProducts;
-------------------------------------------------------------------------------------

GO
INSERT INTO [dbo].[Category]
           ([categoryName]
           ,[image])
     VALUES
           (N'Bếp','images/logobep.png')
GO
INSERT INTO [dbo].[Category]
           ([categoryName]
           ,[image])
     VALUES
           (N'Gas','images/logogas.png')
GO
INSERT INTO [dbo].[Category]
           ([categoryName]
           ,[image])
     VALUES
           (N'Phụ kiện','images/logophukien.png')
GO
INSERT INTO [dbo].[Supplier]
           ([supplierName]
		   ,[companyName]
           ,[contactInfor]
           ,[phoneContact]
           ,[address]
			,[country]
           ,[status])
     VALUES 
	('Fandi',N'Công ty cổ phần Fandi Việt Nam', 'Fandi@fandi.com', '0902.50.50.59',N'Số 36, Ngõ 116, Đường Nguyễn Xiển, Phường Hạ Đình, Quận Thanh Xuân, Hà Nội', N'Việt Nam',1 ),
	('Rosieres',N'Candy Hoover Group','Hoover@hoover.com','024 3537 6966',N'Villa C, số 3 Phố Thành Công, Q.Ba Đình, Hà Nội',N'Pháp',1),
	('Rinnai',N'Tổng công ty Rinnai','Rinnai@rinnai.com','(028) 3932 0897',N'174 Võ Thị Sáu, P. 7, Q. 3, TP. Hồ Chí Minh.',N'Nhật',1),
	('Grasso',N'CÔNG TY TNHH THƯƠNG MẠI VÀ XUẤT NHẬP KHẨU GRASSO','GRASSO@grasso.com','024 354 20296',N'Số 75 Yên Xá, xã Tân Triều, huyện Thanh Trì. Hà Nội',N'Việt Nam',1),
	('Faber',N'SENA Group','SENA@sena.com','84 4 37330817',N'Số 34, phố Bích Câu, quận Đống Đa, Hà Nội',N'Việt Nam',0),
	('Eurosun',N'Công Ty Cổ Phần EuroSun Việt Nam','EuroSun@eurosun.com','0338 644 456',N'Số 33 - V05A, Khu Đô thị mới Văn Phú, P. Phú La, Q. Hà Đông, TP. Hà Nội',N'Việt Nam',1),
	('Chefs',N'CÔNG TY CỔ PHẦN THIẾT BỊ GIA DỤNG CHÂU ÂU','Chefs@gmail.com','024 3559 0287',N'Số 122/168 Kim Giang, Đại Kim, Hoàng Mai, Hà Nội',N'Việt Nam',1),
	('Malloca',N'CÔNG TY TNHH MALLOCA VIỆT NAM','MALLOCA@malloca.com','1800 1212',N'10 Phố Chương Đương Độ, Chương Dương Độ, Hoàn Kiếm, Hà Nội',N'Tây Ban Nha',0),
	('Cata',N'ALC Corp','Cata@gmail.com','0969 40 77 77',N'192 Nguyễn Lương Bằng, Đống Đa',N'Tây Ban Nha',1),
	('Miele',N'TẬP ĐOÀN RITA','RITA@rita.com','1800 1246',N'327 Xa lộ Hà Nội, phường An Phú, TP. Thủ Đức, TP. Hồ Chí Minh, Việt Nam',N'Đức',1)
GO
INSERT INTO [dbo].[WarrantyPolicy]
           ([warrantyPeriod]
           ,[WarrantyCategory])
     VALUES
           (6,N'Một đổi một'),
		   (6,N'Miễn phí bảo hành'),
		   (12,N'Một đổi một'),
		   (12,N'Miễn phí bảo hành'),
		   (24,N'Một đổi một'),
		   (24,N'Miễn phí bảo hành'),
		   (0, 'N/A')

GO
--SELECT name, is_disabled
--FROM sys.triggers
--WHERE name = 'trg_UpdateDiscount'
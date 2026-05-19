CREATE TABLE VendorUsers (
    VendorID INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantID INT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Password VARCHAR(200) NOT NULL,
    IsApproved BIT DEFAULT 0,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);


ALTER TABLE Orders
ADD IsCancelled BIT DEFAULT 0,
    CancelReason NVARCHAR(200),
    CancelledAt DATETIME


select * from VendorUsers


CREATE TABLE VendorAttributeMaster (
    AttributeID INT IDENTITY(1,1) PRIMARY KEY,
    VendorID INT NOT NULL,              -- Vendor login user
    RestaurantID INT NOT NULL,           -- Restaurant mapping
    AttributeName NVARCHAR(200) NOT NULL,
    AttributeValues NVARCHAR(MAX) NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE VendorFoodCategory (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    VendorID INT NOT NULL,
    RestaurantID INT NOT NULL,
    CategoryName VARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    CategoryImage VARCHAR(200) NULL,
    Publish BIT DEFAULT 1,
    ShowInHomepage BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE FoodItems (
    FoodID INT IDENTITY(1,1) PRIMARY KEY,
    VendorID INT NOT NULL,              -- 🔑 Vendor mapping
    FoodName VARCHAR(150) NOT NULL,
    CategoryID INT NOT NULL,
    FoodType VARCHAR(20),
    Description NVARCHAR(MAX),
    Price DECIMAL(10,2) NOT NULL,
    OfferPrice DECIMAL(10,2),
    IsAvailable BIT DEFAULT 1,
    MainImage VARCHAR(200),
    GalleryImages NVARCHAR(MAX),
    AttributeData NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE AdminNotifications (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(400) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE AdminMessages (
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    Sender NVARCHAR(200) NULL,
    Message NVARCHAR(600) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE Coupons
(
    CouponID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(200),
    CouponCode VARCHAR(50),
    StartDate DATE NULL,
    EndDate DATE NULL,
    Quantity INT NULL,
    DiscountType VARCHAR(50),
    DiscountValue VARCHAR(255),
    Products VARCHAR(500) NULL,
    Category VARCHAR(200) NULL,
    MinSpend DECIMAL(10,2) NULL,
    MaxSpend DECIMAL(10,2) NULL,
    PerLimit VARCHAR(50) NULL,
    PerCustomer VARCHAR(50) NULL,
    Image VARCHAR(255) NULL,
    Status VARCHAR(50) DEFAULT 'Active',
    CreatedAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE OrderItems
(
    OrderItemID INT IDENTITY PRIMARY KEY,
    OrderID INT,

    FoodItemID INT,
    ItemName NVARCHAR(200),
    Price DECIMAL(10,2),
    Quantity INT,
    Total DECIMAL(10,2),

    CreatedAt DATETIME DEFAULT GETDATE()
);



CREATE TABLE Orders
(
    OrderID INT IDENTITY PRIMARY KEY,

    SessionID NVARCHAR(100),   -- guest + logged in dono ke liye
    UserID INT NULL,           -- login user ke liye (nullable)

    RestaurantID INT,
    AddressID INT,

    TotalAmount DECIMAL(10,2),

    PaymentMode NVARCHAR(50),  -- COD / ONLINE
    OrderStatus NVARCHAR(50),  -- Placed / Preparing / Delivered

    CreatedAt DATETIME DEFAULT GETDATE()
);


select * from VendorUsers

delete from Orders


SELECT OrderID, TotalAmount 
FROM Orders 
WHERE OrderID = 6; -- apna oid

SELECT ItemName, Quantity, Total 
FROM OrderItems 
WHERE OrderID = 6;




CREATE TABLE OrderTracking (
    TrackingID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,

    ProcessingTime NVARCHAR(50),
    PreProductionTime NVARCHAR(50),
    ProductionTime NVARCHAR(50),
    ShippedTime NVARCHAR(50),
    DeliveredTime NVARCHAR(50)
);


drop table OrderTracking


CREATE TABLE OrderTracking
(
    TrackID INT IDENTITY PRIMARY KEY,
    OrderID INT,
    Status NVARCHAR(50),
    Description NVARCHAR(200),
    Location NVARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

select * from VendorFoodCategory



CREATE TABLE SupportTickets (
    TicketID INT IDENTITY(1,1) PRIMARY KEY,
    TicketNumber VARCHAR(20),
    UserType VARCHAR(20), -- Admin / Vendor / User
    UserID INT,
    Subject VARCHAR(200),
    Message NVARCHAR(MAX),
    Status VARCHAR(20), -- Pending / Closed
    CreatedDate DATETIME DEFAULT GETDATE()
);







CREATE TABLE Drivers
(
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(150),
    Phone NVARCHAR(20),
    Password NVARCHAR(200),
    DriverImage NVARCHAR(200),
    CarNumber NVARCHAR(50),
    CarName NVARCHAR(100),
    CarImage NVARCHAR(200),
    IsActive BIT,
    CreatedAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE ProductReviews
(
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(150),
    ProductName NVARCHAR(200),
    Rating INT,
    Comment NVARCHAR(MAX),
    IsPublished BIT,
    CreatedAt DATETIME DEFAULT GETDATE()
);


ALTER TABLE OrderItems ADD FoodID INT NULL;


ALTER TABLE Drivers ADD VendorID INT NULL;

ALTER TABLE ProductReviews ADD FoodID INT NULL;
ALTER TABLE ProductReviews ADD VendorID INT NULL;


INSERT INTO SupportTickets
(TicketNumber,UserType,UserID,Subject,Message,Status)
VALUES
('453','Vendor',1,'Query about return','Return not processed','Pending'),
('782','User',5,'Payment issue','Payment deducted twice','Closed');



CREATE TABLE VendorRestaurants
(
    RestaurantID INT IDENTITY(1,1) PRIMARY KEY,
    VendorID INT NOT NULL,

    RestaurantName NVARCHAR(200),
    OwnerName NVARCHAR(150),
    Email NVARCHAR(150),
    Phone NVARCHAR(20),

    Address NVARCHAR(300),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Pincode NVARCHAR(10),

    Logo NVARCHAR(200),
    BannerImage NVARCHAR(200),

    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);


ALTER TABLE VendorRestaurants ADD
    IsPopular BIT DEFAULT 0,
    IsFeatured BIT DEFAULT 0,
    AvgRating DECIMAL(2,1) DEFAULT 0,
    CostForTwo INT DEFAULT 0;


  CREATE TABLE AdminUsers
(
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Password VARCHAR(200) NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);




INSERT INTO AdminUsers (Email, Password)
VALUES ('admin@zomo.com', 'admin123');



CREATE TABLE GlobalCategories
(
    GlobalCategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(150),
    CategoryImage NVARCHAR(200),
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);





SELECT * FROM VendorRestaurants


ALTER TABLE FoodItems
ADD IsActive BIT DEFAULT 1;



SELECT AvgRating FROM VendorRestaurants;

UPDATE VendorRestaurants SET CostForTwo = 150 WHERE RestaurantID = 1;
UPDATE VendorRestaurants SET CostForTwo = 250 WHERE RestaurantID = 2;
UPDATE VendorRestaurants SET CostForTwo = 400 WHERE RestaurantID = 3;
UPDATE VendorRestaurants SET CostForTwo = 300 WHERE RestaurantID = 4;
UPDATE VendorRestaurants SET CostForTwo = 120 WHERE RestaurantID = 5;
UPDATE VendorRestaurants SET CostForTwo = 180 WHERE RestaurantID = 6;
UPDATE VendorRestaurants SET CostForTwo = 320 WHERE RestaurantID = 7;


INSERT INTO VendorFoodCategory
(
    VendorID,
    RestaurantID,
    CategoryName,
    IsActive
)
VALUES
(1,1,'Best Seller',1),
(1,1,'Special Combos',1),
(1,1,'Sandwich',1),
(1,1,'Tacos',1),
(1,1,'Pasta',1),
(1,1,'Noodles',1),
(1,1,'Wrap',1),
(1,1,'Desserts',1),
(1,1,'Drinks',1);



delete from VendorFoodCategory


CREATE TABLE Cart
(
    CartID INT IDENTITY PRIMARY KEY,
    SessionID NVARCHAR(100),
    RestaurantID INT,
    FoodItemID INT,
    ItemName NVARCHAR(200),
    Price INT,
    Quantity INT,
    CreatedAt DATETIME DEFAULT GETDATE()
);



SELECT * FROM VendorFoodCategory WHERE RestaurantID=1 AND Publish=1;
SELECT * FROM FoodItems WHERE VendorID=1 AND IsActive=1;



create table Users
(
    UserID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(150),
    Email NVARCHAR(150),
    Phone NVARCHAR(20),
    Password NVARCHAR(200),
    IsActive BIT,
    CreatedAt DATETIME
)

ALTER TABLE Users
ADD ProfileImage NVARCHAR(200) NULL;




ALTER TABLE Cart ADD UserID INT NULL;


ALTER TABLE Users ADD
    IsVerified BIT DEFAULT 0,
    OTP VARCHAR(6) NULL,
    OTPExpiry DATETIME NULL;


	select * from GlobalCategories
	select * from VendorFoodCategory
	select * from FoodItems


	select * from VendorFoodCategory


SELECT *
FROM VendorFoodCategory
WHERE GlobalCategoryID = 6

SELECT *
FROM FoodItems
WHERE CategoryID = 3002

SELECT *
FROM VendorRestaurants
WHERE VendorID = 4


ALTER TABLE FoodItems
ADD RestaurantID INT;

UPDATE F
SET F.RestaurantID = R.RestaurantID
FROM FoodItems F
INNER JOIN VendorRestaurants R
ON F.VendorID = R.VendorID;





SELECT DISTINCT
    R.VendorID,
    R.RestaurantName
FROM VendorRestaurants R
INNER JOIN FoodItems F ON R.VendorID = F.VendorID
INNER JOIN VendorFoodCategory VC ON F.CategoryID = VC.CategoryID
WHERE VC.GlobalCategoryID = 4



	
	ALTER TABLE Users
ADD CONSTRAINT DF_Users_IsActive DEFAULT 1 FOR IsActive;


UPDATE VendorFoodCategory SET IsActive = 1 WHERE IsActive =0;


CREATE TABLE UserAddresses
(
    AddressID INT IDENTITY PRIMARY KEY,
    UserID INT NOT NULL,
    Title NVARCHAR(50),      -- Home / Office
    FullAddress NVARCHAR(300),
    Phone NVARCHAR(20),
    IsDefault BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);


-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]

IF OBJECT_ID('[dbo].[Room]', 'U') IS NOT NULL
DROP TABLE [dbo].[Room];

IF OBJECT_ID('[dbo].[Hotel]', 'U') IS NOT NULL
DROP TABLE [dbo].[Hotel];

IF OBJECT_ID('[dbo].[Amenity]', 'U') IS NOT NULL
DROP TABLE [dbo].[Amenity];

IF OBJECT_ID('[dbo].[RoomAmenity]', 'U') IS NOT NULL
DROP TABLE [dbo].[RoomAmenity];

IF OBJECT_ID('[dbo].[Payment]', 'U') IS NOT NULL
DROP TABLE [dbo].[Payment];

IF OBJECT_ID('[dbo].[Review]', 'U') IS NOT NULL
DROP TABLE [dbo].[Review];

IF OBJECT_ID('[dbo].[Booking]', 'U') IS NOT NULL
DROP TABLE [dbo].[Booking];

IF OBJECT_ID('[dbo].[BookingRoom]', 'U') IS NOT NULL
DROP TABLE [dbo].[BookingRoom];

GO

-- Create the table in the specified schema
CREATE TABLE [dbo].[Customer]
(
    [customerID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [FirstName] VARCHAR(50) NOT NULL,
    [LastName] VARCHAR(50) NOT NULL,
    [customerEmail] VARCHAR(50) NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
    [customerPhoneNumb] VARCHAR(20) NOT NULL,
    [CreatedTime] DATETIME DEFAULT GETDATE(),
    [UpdateDate] DATETIME DEFAULT GETDATE()
);

CREATE TABLE [dbo].[Hotel]
(
    [HotelID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [HotelName] VARCHAR(50) NOT NULL,
    [HotelAddress] VARCHAR(50) NOT NULL,
    [HotelPhoneNo] VARCHAR(20) NOT NULL,
    [HotelEmail] VARCHAR(50) NOT NULL,
);

CREATE TABLE [dbo].[Room]
(
    [RoomID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [HotelID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Hotel(HotelID), -- Foreing Key column
    [RoomNumber] VARCHAR(50) NOT NULL,
    [RoomType] VARCHAR(50) NOT NULL,
    [Description] VARCHAR(50) NOT NULL,
    [Pax] INT NOT NULL,
    [BasePrice] INT NOT NULL,
    [RoomStatus] VARCHAR(50) NOT NULL,
    [CreatedTime] DATETIME DEFAULT GETDATE(),
    [UpdateDate] DATETIME DEFAULT GETDATE()
);

CREATE TABLE [dbo].[Amenity]
(
    [AmenityID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [AmenityName] VARCHAR(50) NOT NULL,
);

CREATE TABLE [dbo].[RoomAmenity]
(
    [RoomID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Room(RoomID), -- Foreing Key column
    [AmenityID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Amenity(AmenityID), -- Foreing Key column
);

CREATE TABLE [dbo].[Payment]
(
    [PaymentID] INT NOT NULL IDENTITY PRIMARY KEY , -- Primary Key column
    [PaymentMethod] VARCHAR(50) NULL,
    [Amount] INT NULL,
    [PaymentStatus] VARCHAR(50) NOT NULL,
    [PaymentDate] DATETIME DEFAULT GETDATE()
);

CREATE TABLE [dbo].[Review]
(
    [ReviewID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [Rating] INT NULL,
    [Comment] VARCHAR(100) NULL,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
);

CREATE TABLE [dbo].[Booking]
(
    [BookingID] INT NOT NULL IDENTITY PRIMARY KEY, -- Primary Key column
    [customerID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Customer(customerID), -- Foreing Key column
    [PaymentID] INT NULL FOREIGN KEY REFERENCES dbo.Payment(PaymentID), -- Foreing Key column
    [ReviewID] INT NULL FOREIGN KEY REFERENCES dbo.Review(ReviewID), -- Foreing Key column
    [StartDate] DATE NULL,
    [EndDate] DATE NULL,
    [NumbOfRoomBooking] INT NULL,
    [TotalPrice] INT NULL,
    [Status] VARCHAR(50) NULL,
    [BookedDate] DATETIME DEFAULT GETDATE(),
    [UpdateDate] DATETIME DEFAULT GETDATE()
);

CREATE TABLE [dbo].[BookingRoom]
(
    [BookingID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Booking(BookingID), -- Foreing Key column
    [RoomID] INT NOT NULL FOREIGN KEY REFERENCES dbo.Room(RoomID), -- Foreing Key column
);

GO


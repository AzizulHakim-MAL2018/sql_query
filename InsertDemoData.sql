-- Insert rows into Customer table
INSERT INTO [dbo].[Customer]
([FirstName], [LastName], [customerEmail], [Password], [customerPhoneNumb])
VALUES
('Leo', 'Smith', 'leo91@tmail.com', 'password123', '015-5683149'),
('Heng', 'Ng', 'heng@tmail.com', 'password124', '018-6532816'),
('Ali', 'Abdul', 'ali32@tmail.com', 'password125', '011-9456186');
GO

-- Insert rows into Hotel table
INSERT INTO [dbo].[Hotel]
([HotelName], [HotelAddress], [HotelPhoneNo], [HotelEmail])
VALUES
('TSC1 Hotel', 'Penang', '03-76129457', 'TSCH1@TSCHotelTourism.my');
GO

-- Insert rows into Room table
INSERT INTO [dbo].[Room]
( [HotelID], [RoomNumber], [RoomType], [Description], [Pax], [BasePrice], [RoomStatus])
VALUES
(1, 201, 'Standart Delux', 'Have a sea view from room barcorny', 2, 250, 'Booked'),
(1, 202, 'Standart Delux', 'Have a sea view from room barcorny', 2, 250, 'Booked'),
(1, 203, 'Standart Delux', 'Have a sea view from room barcorny', 2, 250, 'Available'),
(1, 301, 'Family Room', 'Enjoy a great time with your family', 4, 400, 'Booked'),
(1, 302, 'Family Room', 'Enjoy a great time with your family', 4, 400, 'Booked'),
(1, 303, 'Family Room', 'Enjoy a great time with your family', 4, 400, 'Available'),
(1, 401, 'Suites', 'Have rest with the premium experincs', 2, 700, 'Available'),
(1, 402, 'Suites', 'Have rest with the premium experincs', 2, 700, 'Available');
GO

-- Insert rows into Amenity table
INSERT INTO [dbo].[Amenity]
([AmenityName])
VALUES
('Air condition'), ('Bathtub'), ('TV'), ('WiFi'), ('2 Single bed'), ('2 Queen bed'), ('1 King bed');
GO

-- Insert rows into RoomAmenity table
INSERT INTO [dbo].[RoomAmenity]
([RoomID], [AmenityID])
VALUES
(1, 1), (1, 2), (1, 4), (1, 3), (1, 5),
(2, 1), (2, 2), (2, 4), (2, 3), (2, 5),
(3, 1), (3, 2), (3, 4), (3, 3), (3, 5),
(4, 1), (4, 2), (4, 4), (4, 3), (4, 6),
(5, 1), (5, 2), (5, 4), (5, 3), (5, 6),
(6, 1), (6, 2), (6, 4), (6, 3), (6, 6),
(7, 1), (7, 2), (7, 4), (7, 3), (7, 7),
(8, 1), (8, 2), (8, 4), (8, 3), (8, 7);
GO

-- Insert rows into Payment table
INSERT INTO [dbo].[Payment]
([PaymentMethod], [Amount], [PaymentDate], [PaymentStatus])
VALUES
('Online', 1000, '2024-10-15', 'Paid'),
('Online', 800, '2024-10-19', 'Paid'),
('Cash', 1400, '2024-10-26', 'Paid');
GO

-- Insert rows into Review table
INSERT INTO [dbo].[Review]
([Rating], [Comment])
VALUES
(5, 'Have nice view'),
(4, 'Good Service'),
(5, 'Nice and clean room');
GO

-- Insert rows into Booking table
INSERT INTO [dbo].[Booking]
( [customerID], [PaymentID], [ReviewID], [StartDate], [EndDate], [NumbOfRoomBooking], [TotalPrice], [Status])
VALUES
('1', '1', '1','2024-10-23', '2024-10-25', 2, 1000, 'Confirm'),
('2', '2', '2', '2024-10-24', '2024-10-26', 1, 800, 'Confirm'),
('3', '3', '3', '2024-10-26', '2024-10-28', 1, 1400, 'Pending');
GO

-- Insert rows into BookingRoom table
INSERT INTO [dbo].[BookingRoom]
([BookingID], [RoomID])
VALUES
(1, 1), (1, 2),(2, 4), (3, 7);
GO


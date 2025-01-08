/*CREATE TRIGGER trg_UpdateBookingStatus
ON Booking
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Booking
    SET Status = CASE
                    WHEN EndDate < GETDATE() THEN 'Completed'
                    WHEN StartDate > GETDATE() THEN 'Upcoming'
                    ELSE 'Ongoing'
                 END
    WHERE BookingID IN (SELECT BookingID FROM INSERTED);
END;
GO*/

/*UPDATE Booking
SET UpdateDate = GETDATE()
GO*/

/*CREATE TRIGGER trg_CheckRoomAvailability
ON BookingRoom
INSTEAD OF INSERT
AS
BEGIN
    -- Check for conflicting bookings
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN Booking b ON i.BookingID = b.BookingID
        JOIN BookingRoom br ON br.RoomID = i.RoomID
        JOIN Booking b2 ON br.BookingID = b2.BookingID
        WHERE NOT (b.StartDate > b2.EndDate OR b.EndDate < b2.StartDate) -- Overlap condition
          AND b.BookingID != b2.BookingID -- Exclude same booking
    )
    BEGIN
        THROW 50001, 'One or more selected rooms are already booked for the specified dates.', 1;
    END;

    -- Insert valid rows
    INSERT INTO BookingRoom (BookingID, RoomID)
    SELECT BookingID, RoomID
    FROM INSERTED;
END;
GO*/


--select * FROM Booking

EXEC InsertBooking
    @CustomerID = 1,
    @StartDate ='2024-12-6',
    @EndDate ='2024-12-7',
    @NumbOfRoomBooking = 1,
    @RoomIDs = '7',
    @PaymentAmount = 700,
    @PaymentStatus = 'Paid';
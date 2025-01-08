/*UPDATE ON TRIGGER:
ALTER TRIGGER trg_UpdateBookingStatus
ON Booking
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the booking status
    UPDATE Booking
    SET Status = CASE
        WHEN EndDate < GETDATE() THEN 'Completed'
        WHEN StartDate > GETDATE() THEN 'Upcoming'
        ELSE 'Ongoing'
    END
    WHERE BookingID IN (SELECT BookingID FROM INSERTED);

    -- Update the room status
    UPDATE Room
    SET RoomStatus = CASE
        WHEN B.Status IN ('Completed', 'Upcoming') THEN 'Available'
        WHEN B.Status = 'Ongoing' THEN 'Booked'
        ELSE RoomStatus
    END
    FROM Room R
    INNER JOIN BookingRoom BR ON R.RoomID = BR.RoomID
    INNER JOIN Booking B ON BR.BookingID = B.BookingID
    WHERE B.BookingID IN (SELECT BookingID FROM INSERTED);
END;*/
GO

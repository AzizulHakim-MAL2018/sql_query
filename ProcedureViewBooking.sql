/*CREATE PROCEDURE ViewBooking 
    @BookingID INT = NULL, -- Default NULL to show all records if no value is provided
    @CustomerID INT = NULL
AS
BEGIN
    SELECT 
        b.BookingID, 
        c.CustomerID,
        c.FirstName + ' ' + c.LastName AS Customer_Full_Name,
        b.StartDate, 
        b.EndDate, 
        b.NumbOfRoomBooking, 
        STUFF((
            SELECT ', ' + r1.RoomNumber 
            FROM BookingRoom br1
            JOIN Room r1 ON br1.RoomID = r1.RoomID
            WHERE br1.BookingID = b.BookingID
            FOR XML PATH('')
        ), 1, 2, '') AS RoomNumbers, 
        STUFF((
        SELECT ', ' + r1.Roomtype 
        FROM BookingRoom br1
        JOIN Room r1 ON br1.RoomID = r1.RoomID
        WHERE br1.BookingID = b.BookingID
        FOR XML PATH('')
        ), 1, 2, '') AS RoomType,
        MIN(r.BasePrice) AS BasePrice,
        p.Amount, 
        p.PaymentStatus, 
        re.Rating, 
        re.Comment
    FROM
        dbo.Customer c
    LEFT JOIN 
        dbo.Booking b ON c.CustomerID = b.CustomerID
    LEFT JOIN 
        dbo.BookingRoom br ON b.BookingID = br.BookingID
    LEFT JOIN 
        dbo.Room r ON br.RoomID = r.RoomID
    LEFT JOIN 
        dbo.Payment p ON b.PaymentID = p.PaymentID
    LEFT JOIN 
        dbo.Review re ON b.ReviewID = re.ReviewID

    WHERE 
     (b.BookingID IS  NULL OR b.BookingID = @BookingID) -- Filter by BookingID if provided
    And
     (@CustomerID IS  NULL OR C.CustomerID = @CustomerID) -- Filter by CustomerID if provided

    GROUP BY 
        b.BookingID, 
        c.CustomerID,
        c.FirstName, 
        c.LastName, 
        b.StartDate, 
        b.EndDate, 
        b.NumbOfRoomBooking,
        p.Amount, 
        p.PaymentStatus, 
        re.Rating, 
        re.Comment
END;*/

EXEC ViewBooking
@BookingID=3,
@CustomerID=1
GO


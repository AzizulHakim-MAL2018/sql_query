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
    re.Comment;



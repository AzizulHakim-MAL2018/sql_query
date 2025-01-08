-- Stored Procedure for Inserting a Booking
/*CREATE PROCEDURE InsertBooking
    @CustomerID INT,
    @StartDate DATE,
    @EndDate DATE,
    @NumbOfRoomBooking INT,
    @RoomIDs NVARCHAR(MAX), -- Comma-separated Room IDs
    @PaymentAmount INT,
    @PaymentStatus VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @PaymentID INT;

        -- Insert into Payment table
        INSERT INTO Payment (Amount, PaymentStatus)
        VALUES (@PaymentAmount, @PaymentStatus);
        SET @PaymentID = SCOPE_IDENTITY();

        -- Insert into Booking table
        INSERT INTO Booking (
            customerID, 
            PaymentID, 
            StartDate, 
            EndDate, 
            NumbOfRoomBooking, 
            TotalPrice, 
            Status
        )
        VALUES (
            @CustomerID, 
            @PaymentID, 
            @StartDate, 
            @EndDate, 
            @NumbOfRoomBooking, 
            @PaymentAmount, 
            'Confirmed'
        );

        DECLARE @BookingID INT = SCOPE_IDENTITY();

        -- Parse @RoomIDs and insert into BookingRoom table
        DECLARE @RoomID INT;
        DECLARE @ParsedRoomIDs TABLE (RoomID INT);

        INSERT INTO @ParsedRoomIDs (RoomID)
        SELECT CAST(value AS INT)
        FROM STRING_SPLIT(@RoomIDs, ',')
        WHERE ISNUMERIC(value) = 1;

        -- Insert into BookingRoom table
        INSERT INTO BookingRoom (BookingID, RoomID)
        SELECT @BookingID, RoomID
        FROM @ParsedRoomIDs;

        -- Commit transaction
        COMMIT TRANSACTION;

        SELECT @BookingID AS NewBookingID;
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Rethrow error
        THROW;
    END CATCH
END;
GO*/
 
 /*EXEC InsertBooking
    @CustomerID = 3,
    @StartDate = '2024-12-20',
    @EndDate = '2024-12-21',
    @NumbOfRoomBooking = 1,
    @RoomIDs = "5",
    @PaymentAmount = "400",
    @PaymentStatus = "pending"*/

 --select * FROM Booking


 -- Stored Procedure for Updating a Booking
/*CREATE PROCEDURE UpdateBooking
    @BookingID INT,
    @StartDate DATE,
    @EndDate DATE,
    @NumbOfRoomBooking INT,
    @RoomIDs NVARCHAR(MAX), -- Comma-separated Room IDs
    @PaymentAmount INT,
    @PaymentStatus VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @PaymentID INT;

        -- Update Payment table
        SELECT @PaymentID = PaymentID FROM Booking WHERE BookingID = @BookingID;
        UPDATE Payment
        SET Amount = @PaymentAmount, PaymentStatus = @PaymentStatus
        WHERE PaymentID = @PaymentID;

        -- Update Booking table
        UPDATE Booking
        SET
            StartDate = @StartDate,
            EndDate = @EndDate,
            NumbOfRoomBooking = @NumbOfRoomBooking,
            TotalPrice = @PaymentAmount,
            UpdateDate = GETDATE()
        WHERE BookingID = @BookingID;

        -- Update BookingRoom table
        DELETE FROM BookingRoom WHERE BookingID = @BookingID;

        -- Parse @RoomIDs and insert into BookingRoom table
        DECLARE @ParsedRoomIDs TABLE (RoomID INT);

        INSERT INTO @ParsedRoomIDs (RoomID)
        SELECT CAST(value AS INT)
        FROM STRING_SPLIT(@RoomIDs, ',')
        WHERE ISNUMERIC(value) = 1;

        -- Insert parsed RoomIDs into BookingRoom table
        INSERT INTO BookingRoom (BookingID, RoomID)
        SELECT @BookingID, RoomID
        FROM @ParsedRoomIDs;

        -- Commit transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Rethrow error
        THROW;
    END CATCH
END;
GO*/

/*EXEC UpdateBooking
    @BookingID = 3, 
    @StartDate ='2024-12-5',
    @EndDate ='2024-12-7',
    @NumbOfRoomBooking = 1,
    @RoomIDs = '7' ,-- Comma-separated Room IDs
    @PaymentAmount = 1400,
    @PaymentStatus = "Paid";
GO*/

-- Prosedure for delete booking
/*CREATE PROCEDURE DeleteBooking
    @BookingID INT
AS
BEGIN
    DECLARE @PaymentID INT;

    -- Retrieve associated PaymentID
    SELECT @PaymentID = PaymentID FROM Booking WHERE BookingID = @BookingID;

    -- Delete from BookingRoom table
    DELETE FROM BookingRoom WHERE BookingID = @BookingID;

    -- Delete from Booking table
    DELETE FROM Booking WHERE BookingID = @BookingID;

    -- Delete from Payment table
    IF @PaymentID IS NOT NULL
        DELETE FROM Payment WHERE PaymentID = @PaymentID;
END;
GO*/


EXEC DeleteBooking
@BookingID = 1004

GO

SELECT * FROM Booking 
GO

 
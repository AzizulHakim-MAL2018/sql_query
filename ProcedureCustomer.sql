/*CREATE PROCEDURE InsertCustomer
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @CustomerEmail VARCHAR(50),
    @Password VARCHAR(50),
    @CustomerPhoneNo VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert the provided data into the Customer table
    INSERT INTO dbo.Customer
    (
        FirstName,
        LastName,
        CustomerEmail,
        Password,
        CustomerPhonenumb
    )
    VALUES
    (
        @FirstName,
        @LastName,
        @CustomerEmail,
        @Password,
        @CustomerPhoneNo
    );

    -- Optionally, return the ID of the newly inserted customer
    SELECT SCOPE_IDENTITY() AS NewCustomerID;
END;*/

/*EXEC InsertCustomer 
    @FirstName = 'kim',
    @LastName = 'joe',
    @CustomerEmail = 'joe22@tmail.com',
    @Password = 'password12345',
    @CustomerPhoneNo = '012-6614115';*/


-- Stored prosedure Update

/*CREATE PROCEDURE UpdateCustomer
    @CustomerID INT,               -- ID of the customer to update
    @FirstName VARCHAR(50) = NULL,  -- Optional new first name
    @LastName VARCHAR(50) = NULL,   -- Optional new last name
    @customerEmail VARCHAR(50) = NULL,  -- Optional new email
    @Password VARCHAR(50) = NULL,   -- Optional new password
    @customerPhoneNumb VARCHAR(20) = NULL  -- Optional new phone number
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the Customer table based on the provided parameters
    UPDATE dbo.Customer
    SET 
        FirstName = ISNULL(@FirstName, FirstName),
        LastName = ISNULL(@LastName, LastName),
        customerEmail = ISNULL(@customerEmail, customerEmail),
        Password = ISNULL(@Password, Password),
        customerPhoneNumb = ISNULL(@customerPhoneNumb, customerPhoneNumb),
        UpdateDate = GETDATE() -- Automatically update the timestamp
    WHERE 
        CustomerID = @CustomerID;

    -- Check if a record was updated
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No records updated. Ensure the CustomerID exists.';
    END
    ELSE
    BEGIN
        PRINT 'Customer information updated successfully.';
    END
END;*/

/*EXEC UpdateCustomer 
   @CustomerID = 1, 
   @LastName = 'Caremal',
   @Password = 'leo1234';
GO

EXEC UpdateCustomer 
   @CustomerID = 3, 
   @customerEmail = 'ali.ab42@tmail.com';
GO*/

-- Stroed procedure Delete customer 

/*CREATE PROCEDURE DeleteCustomer
@CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Attempt to delete the customer directly
    DELETE FROM Customer 
    WHERE CustomerID = @CustomerID;

    -- Check if a row was deleted
    IF @@ROWCOUNT = 0
    BEGIN
        RAISERROR('Customer with the specified ID does not exist.', 16, 1);
    END
    ELSE
    BEGIN
        PRINT 'Customer and associated data deleted successfully.';
    END
END;
GO*/


/*EXEC InsertCustomer 
    @FirstName = 'test',
    @LastName = 'delete',
    @CustomerEmail = 'delete@tmail.com',
    @Password = 'password32',
    @CustomerPhoneNo = '012-6685124';
*/

/*EXEC DeleteCustomer
@CustomerID = 1002*/

SELECT * FROM Customer 
GO





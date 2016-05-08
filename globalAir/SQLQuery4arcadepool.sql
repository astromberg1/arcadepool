use ArcadePoolDB
IF OBJECT_ID (N'CheckMachineIDAvailable', N'FN') IS NOT NULL
    DROP FUNCTION CheckMachineIDAvailable;
GO
CREATE FUNCTION CheckMachineIDAvailable
(
@SerialNumber AS nvarchar(max), @RentalDate as datetime, @ReturnDate as datetime
) 
RETURNS  int
AS 
BEGIN
declare @id int, @rentald datetime, @returnd datetime,@res as int

SELECT @id = dbo.Machines.MachineID, @rentald = dbo.Orders.RentalDate FROM     dbo.Orders INNER JOIN
                  dbo.OrderMachines ON dbo.Orders.OrderID = dbo.OrderMachines.OrderID RIGHT OUTER JOIN
                  dbo.Machines ON dbo.OrderMachines.MachineID = dbo.Machines.MachineID
WHERE  (dbo.Machines.SerialNumber = @SerialNumber)
set @res=@id
if  @rentald is not null
begin
SELECT @id = dbo.Machines.MachineID, @rentald = dbo.Orders.RentalDate, @returnd = dbo.Orders.ReturnDate FROM     dbo.Orders INNER JOIN
                 dbo.OrderMachines ON dbo.Orders.OrderID = dbo.OrderMachines.OrderID INNER JOIN
                  dbo.Machines ON dbo.OrderMachines.MachineID = dbo.Machines.MachineID INNER JOIN
                  dbo.Gametitles ON dbo.Machines.GametitleID = dbo.Gametitles.GametitleID where dbo.Machines.SerialNumber= @SerialNumber

if (@RentalDate>@returnd)
set @res= @id
else 
if @ReturnDate< @rentald
set @res= @id
else
set @res= Null
end
RETURN @res
END
go

IF OBJECT_ID (N'CalculateMachinePrice', N'FN') IS NOT NULL
    DROP FUNCTION CalculateMachinePrice;
GO
CREATE FUNCTION CalculateMachinePrice
(
@SerialNumber AS nvarchar(max), @RentalDate as datetime, @ReturnDate as datetime
) 
RETURNS  money
AS 
BEGIN
declare @price int, @noofdays int, @rentalpriceday money
set @noofdays=  DATEDIFF("d",@RentalDate,@ReturnDate);
set @rentalpriceday = (select dbo.Machines.DailyRentalprice from dbo.Machines where SerialNumber=@SerialNumber)
set @price = @noofdays*@rentalpriceday 

RETURN @price
END
go

select dbo.CalculateMachinePrice('122544458', '2016-03-01', '2016-04-01') 



declare @test as int 
set @test =  dbo.CheckMachineIDAvailable ('122544458', '2016-03-01', '2016-04-01')  

print @test


IF OBJECT_ID (N'GetCarrierID', N'FN') IS NOT NULL
    DROP FUNCTION GetCarrierID;
GO
CREATE FUNCTION GetCarrierID(@CarrierName AS nvarchar(50)) 

returns int
AS 

BEGIN
    RETURN (SELECT dbo.Carriers.CarrierID from dbo.Carriers where dbo.Carriers.CarrierName = @CarrierName )
     
END
GO

select dbo.GetCarrierID('Bring')

IF OBJECT_ID (N'GetProviderID', N'FN') IS NOT NULL
    DROP FUNCTION GetProviderID;
GO
CREATE FUNCTION GetProviderID(@OrgNo AS nvarchar(50)) 

returns int
AS 

BEGIN
    RETURN (SELECT dbo.Providers.ProviderID from dbo.Providers where dbo.Providers.OrganisationsNummer = @OrgNo )
     
END
GO

select dbo.GetProviderID('22222')

IF OBJECT_ID (N'GetCustomerID', N'FN') IS NOT NULL
    DROP FUNCTION GetCustomerID;
GO
CREATE FUNCTION GetCustomerID(@OrgNo AS nvarchar(50)) 

returns int
AS 

BEGIN
    RETURN (SELECT dbo.Customers.CustomerID from dbo.Customers where dbo.Customers.OrganisationsNummer = @OrgNo )
     
END
GO

select dbo.GetCustomerID('48165181613')

IF OBJECT_ID (N'GetNextContractNo', N'FN') IS NOT NULL
    DROP FUNCTION GetNextContractNo;
GO
CREATE FUNCTION GetNextContractNo
(
) 
RETURNS INT 
AS 
BEGIN
    DECLARE @var INT 
    SELECT @var=1+(SELECT TOP 1 dbo.Orders.ContractNumber from dbo.Orders ORDER by dbo.Orders.ContractNumber desc) 
    RETURN @var 
END

select dbo.GetNextContractNo()

IF OBJECT_ID (N'GetNextOrderlineNo', N'FN') IS NOT NULL
    DROP FUNCTION GetNextOrderlineNo;
GO
CREATE FUNCTION GetNextOrderlineNo
(
) 
RETURNS INT 
AS 
BEGIN
    DECLARE @var INT 
    SELECT @var=1+(SELECT TOP 1 dbo.OrderMachines.OrderLineNumber from dbo.OrderMachines ORDER by dbo.OrderMachines.OrderLineNumber desc) 
    RETURN @var 
END

select dbo.GetNextOrderlineNo()





IF OBJECT_ID (N'spBookMaschine', N'P') IS NOT NULL
    DROP proc spBookMaschine;
GO

CREATE PROC spBookMaschine
(
@Machine nvarchar(max),
@Carrier nvarchar(50),
@ProviderOrgNo nvarchar(50),
@CustomerOrgNo nvarchar(50),
@orderdate date,
@shippingdate date,
@rentaldate date,
@returndate date
)
AS

IF (dbo.CheckMachineIDAvailable(@Machine,  @rentaldate, @returndate) is Null)
 BEGIN
 PRINT @Machine + 'Not Possible to book choose another '
	RETURN
 END
ELSE
BEGIN
IF (dbo.GetCustomerID(@CustomerOrgNo) is Null)
BEGIN
 PRINT ' Customer is not registred'
	RETURN
 END
ELSE
BEGIN
IF (dbo.GetCarrierID(@Carrier) is Null)
BEGIN
 PRINT 'Carrier not registred'
	RETURN
 END
ELSE
BEGIN
IF (dbo.GetProviderID(@ProviderOrgNo) is Null)
BEGIN
 PRINT ' Provider is not registred'
	RETURN
 END
ELSE
BEGIN
DECLARE @NYTTORDERNR AS INT
DECLARE @NYTTORDERNR2 AS INT
DECLARE @fraktbID AS INT
DECLARE  @price AS money
declare @orderid as int



set @NYTTORDERNR =  dbo.GetNextContractNo();

set @NYTTORDERNR2 =  dbo.GetNextOrderlineNo();

set @fraktbID = dbo.GetCarrierID(@Carrier);

set @price = dbo.CalculateMachinePrice(@Machine,@rentaldate,@returndate)


INSERT INTO Orders(ContractNumber, OrderDate, ShippingDate, RentalDate,ReturnDate,Price,CustomerID,ProviderID,CarrierID)

VALUES (@NYTTORDERNR, @orderdate,@shippingdate,@rentaldate,@returndate,@price,dbo.GetCustomerID(@CustomerOrgNo),dbo.GetProviderID(@ProviderOrgNo),@fraktbID );

set @orderid = dbo.GetOrdersID(@NYTTORDERNR);

INSERT INTO OrderMachines(OrderID, MachineID ,OrderLineNumber,Price)
 VALUES (@orderid, dbo.CheckMachineIDAvailable(@Machine, @rentaldate, @returndate),@NYTTORDERNR2,@price) 
END
END
END
END
GO



select  dbo.GetNextContractNo();

EXEC dbo.spBookMaschine '66699987','Bring', '32422', '5469861586','2016-05-01','2016-06-02','2016-06-02','2016-08-01'

--boka delorder

IF OBJECT_ID (N'spBookPartMachine', N'P') IS NOT NULL
    DROP proc spBookPartMachine;
GO

CREATE PROC spBookPartMachine
(
@ContractNumber int,
@Machine nvarchar(max)
)
AS
DECLARE @orderid INT
DECLARE @returndate date
DECLARE @rentaldate date

set @orderid = dbo.GetOrdersID(@ContractNumber);
IF (@orderid IS NULL)
BEGIN
 PRINT ' There are no orders with that number '
	RETURN
 END
ELSE
BEGIN

SELECT  @returndate = dbo.Orders.ReturnDate, @rentaldate = dbo.Orders.RentalDate FROM  dbo.Orders 
WHERE  (dbo.Orders.OrderID = @orderid)


IF (dbo.CheckMachineIDAvailable(@Machine,  @rentaldate, @returndate) is Null)
 BEGIN
 PRINT @Machine + 'Not Possible to book choose another '
	RETURN
 END
ELSE
BEGIN
DECLARE @NYTTORDERNR AS INT
DECLARE @NYTTORDERNR2 AS INT
DECLARE @fraktbID AS INT
DECLARE  @price AS money
set @NYTTORDERNR2 =  dbo.GetNextOrderlineNo();

set @price = dbo.CalculateMachinePrice(@Machine,@rentaldate,@returndate)

INSERT INTO OrderMachines(OrderID, MachineID ,OrderLineNumber,Price)
 VALUES (@orderid, dbo.CheckMachineIDAvailable(@Machine, @rentaldate, @returndate),@NYTTORDERNR2,@price) 
END
END
GO

EXEC dbo.spBookPartMachine  193, '885586655'


--göra trigger som räknar om priset








IF OBJECT_ID (N'GetOrdersID', N'FN') IS NOT NULL
    DROP FUNCTION GetOrdersID;
GO
CREATE FUNCTION GetOrdersID
(
@OrderNr int
) 
RETURNS INT 
AS 
BEGIN
    DECLARE @var INT 
    SELECT @var=(SELECT dbo.Orders.OrderID from Orders where dbo.Orders.ContractNumber = @OrderNr) 
    RETURN @var 
END
GO

select  dbo.GetOrdersID(101); 

IF OBJECT_ID (N'spShowallBookings', N'P') IS NOT NULL
    DROP PROC spShowallBookings;
GO
create proc spShowallBookings

AS
SELECT dbo.Orders.ContractNumber, dbo.Machines.SerialNumber, dbo.Gametitles.GameName, dbo.Customers.CompanyName AS CustomerCompany, 
                  dbo.Customers.LastName AS CustomerLname, dbo.Providers.CompanyName AS ProviderCompany, dbo.Providers.LastName AS ProviderLname, dbo.Carriers.CarrierName, 
                  dbo.Orders.OrderDate, dbo.Orders.ShippingDate, dbo.Orders.RentalDate, dbo.Orders.ReturnDate, dbo.Orders.Price AS TotPrice, dbo.OrderMachines.OrderLineNumber, dbo.OrderMachines.Price
FROM     dbo.Customers INNER JOIN
                  dbo.Carriers INNER JOIN
                  dbo.Machines INNER JOIN
                  dbo.Gametitles ON dbo.Machines.GametitleID = dbo.Gametitles.GametitleID INNER JOIN
                  dbo.OrderMachines ON dbo.Machines.MachineID = dbo.OrderMachines.MachineID INNER JOIN
                  dbo.Orders ON dbo.OrderMachines.OrderID = dbo.Orders.OrderID ON dbo.Carriers.CarrierID = dbo.Orders.CarrierID ON dbo.Customers.CustomerID = dbo.Orders.CustomerID INNER JOIN
                  dbo.Providers ON dbo.Orders.ProviderID = dbo.Providers.ProviderID
go

IF OBJECT_ID (N'trgCalculatePrice', N'T') IS NOT NULL
    DROP TRIGGER trgCalculatePrice;
GO

create trigger CalculatePrice
ON dbo.Ordermachines
 AFTER INSERT,UPDATE,DELETE
AS
BEGIN
declare @price money
declare @newvalue int
set @newvalue=(select inserted.OrderID from inserted)

set @price = (SELECT SUM(Price) AS TotalPrice
FROM     dbo.OrderMachines
GROUP BY OrderID
HAVING (OrderID = @newvalue))


UPDATE ORDERS
set Price=@price
where (OrderID = @newvalue)

END
GO
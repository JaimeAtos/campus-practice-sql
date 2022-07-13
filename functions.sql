USE ejemplo
GO

CREATE FUNCTION GetLastProjetIdByEmployeeName(@FName VARCHAR(50)) RETURNS INT
AS
BEGIN 

DECLARE @ID INT

SELECT @ID = Projects.Id FROM Projects 
INNER JOIN PivoteProjectsEmployees ON Projects.Id = PivoteProjectsEmployees.ProjectID
INNER JOIN Employees ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE Employees.FirstName = @FName

RETURN @ID

END
GO

CREATE FUNCTION HasAnyProjec(@FName VARCHAR(50)) RETURNS BIT
AS
BEGIN 

DECLARE @ID INT
DECLARE @FLAG BIT

SELECT @ID = COUNT(Projects.Id) FROM Projects 
INNER JOIN PivoteProjectsEmployees ON Projects.Id = PivoteProjectsEmployees.ProjectID
INNER JOIN Employees ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE Employees.FirstName = @FName

SELECT @FLAG = IIF(@ID < 2, 0, 1)

RETURN @FLAG

END
GO
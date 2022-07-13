USE ejemplo;
SELECT * FROM Company;
GO

SELECT Id, FirstName, LastName, Email, Phone, Salary FROM Employees;
GO

SELECT * FROM Projects WHERE StatusId = 4;
GO

SELECT * FROM Projects WHERE DeadLine < FinishedOn;
GO

SELECT * FROM Projects WHERE StartDate > '2022-7-12'
GO

SELECT Id, FirstName, LastName, Email, Phone, Salary FROM Employees WHERE Salary > 10000;
GO

SELECT Employees.Id, Employees.FirstName, Employees.LastName, PivoteProjectsEmployees.ProjectID FROM Employees INNER JOIN PivoteProjectsEmployees 
ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE PivoteProjectsEmployees.ProjectID = 2
GO

SELECT Employees.Id, Employees.FirstName, Employees.LastName, PivoteProjectsEmployees.ProjectID FROM Employees INNER JOIN PivoteProjectsEmployees
ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE PivoteProjectsEmployees.ProjectID != 3 
GO

SELECT Projects.Name, Employees.LastName, Employees.FirstName FROM Projects 
INNER JOIN PivoteProjectsEmployees ON Projects.Id = PivoteProjectsEmployees.ProjectID
INNER JOIN Employees ON Employees.Id = PivoteProjectsEmployees.EmployeesID	
GO

SELECT Employees.LastName, Employees.FirstName FROM Projects 
INNER JOIN PivoteProjectsEmployees ON Projects.Id = PivoteProjectsEmployees.ProjectID
INNER JOIN Employees ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE Projects.StatusId = 2 
GO

SELECT Employees.LastName, Employees.FirstName FROM Projects 
INNER JOIN PivoteProjectsEmployees ON Projects.Id = PivoteProjectsEmployees.ProjectID
INNER JOIN Employees ON Employees.Id = PivoteProjectsEmployees.EmployeesID WHERE Projects.StatusId != 2 AND Projects.StatusId !=1 
GO
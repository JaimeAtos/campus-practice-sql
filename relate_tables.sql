USE ejemplo
GO
--Company con employees
ALTER TABLE Employees add CompanyID INT CONSTRAINT FK_company_employees FOREIGN KEY(CompanyID) REFERENCES Company(Id)
GO

--Tabla pivote
CREATE TABLE PivoteProjectsEmployees(
	ID INT PRIMARY KEY IDENTITY(1,1),
	ProjectID INT,
	EmployeesID INT
);
GO

ALTER TABLE PivoteProjectsEmployees ADD CONSTRAINT FK_privateProjectsEmployes_projects FOREIGN KEY(ProjectID) REFERENCES Projects(Id)
GO

ALTER TABLE PivoteProjectsEmployees ADD CONSTRAINT FK_privateProjectsEmployes_employees FOREIGN KEY (EmployeesID) REFERENCES Employees(Id)
GO
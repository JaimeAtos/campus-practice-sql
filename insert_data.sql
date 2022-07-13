USE ejemplo;
GO
--Employees
INSERT INTO Employees (FirstName, LastName, Email, Phone, Salary) VALUES 
	('Juan', 'Perez', 'juan@jmail.com', '9991808182', 9500),
	('Paco','Ochoa','paco@jmail.com','9991808183',8000),
	('Pedro','Fernandez','pedro@jmail.com','9991808184',12500),
	('Sofi','Hernandez','sofi@jmail.com','9991808185',11000),
	('Isabella','Smith','isabella@jmail.com','9991808186',9000),
	('Eduardo','Jimenez','eduardo@jmail.com','9991808187',11000),
	('Jose','Pavon','jose@jmail.com','9991808188',12000),
	('Pancho','Fernandez','pancho@jmail.com','9991808189',12500),
	('Francisco','Fernandez','francisco@jmail.com','9991808190',25000),
	('Diego','Olivarez','diego@jmail.com','9991808191',9000)
GO

--Companies
INSERT INTO Company (Name, Adress) VALUES 
	('IMC', '5151 W 29th St #2201Greeley, Colorado(CO), 80634'),
	('Atoz', 'Ardmore, Tennessee(TN), 384494226 Highgate Dr'),
	('Disnei', 'Horn Lake, Mississippi(MS), 38637')
GO

--Status
INSERT INTO Status (Name) VALUES 
	('Pendiente'),
	('En proceso'),
	('Cancelado'),
	('Finalizado'),
	('En pausa')
GO

--Projects
INSERT INTO Projects (Name, StartDate, DeadLine, FinishedOn, StatusId) VALUES
	('Dainler Learning', '1995-7-2', '2050-2-22', NULL, 2),
	('Provident Software', '2022-9-15', '2023-2-28', NULL, 1),
	('DataAnlysis SoftCentral', '2023-1-31', '2023-10-5', NULL, 1),
	('Migration', '2021-2-5','2022-7-7', '2022-1-1', 4),
	('Atoz Insight', '2022-12-30', '2024-10-1', NULL, 3)
GO

-- Inserts dentro de la tabla pivote
INSERT INTO PivoteProjectsEmployees (ProjectID, EmployeesID) VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(1, 6),
	(2, 7),
	(3, 8),
	(4, 9),
	(5, 10),
	(2, 1)
GO
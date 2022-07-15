USE ejemplo
GO
	
CREATE PROCEDURE AsignarProjecto (@comp VARCHAR(50), @project VARCHAR(50))
AS
BEGIN
	DECLARE @empleado VARCHAR(50), @idEmpleado INT, @idEmpresa INT, @flag BIT
	SELECT @idEmpresa = Id FROM Projects WHERE Name = @comp
	DECLARE empleadosCursor CURSOR
		FOR SELECT Id, FirstName FROM Employees
	OPEN empleadosCursor
	FETCH empleadosCursor INTO @idEmpleado, @empleado
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		SELECT @flag = dbo.HasAnyProjec(@empleado)
		IF(@flag = 1)
			BEGIN
				UPDATE PivoteProjectsEmployees SET ProjectID = @idEmpresa WHERE EmployeesID = @idEmpleado
			END
		ELSE IF (@flag = 0)
			BEGIN
				UPDATE PivoteProjectsEmployees SET ProjectID = @idEmpresa WHERE EmployeesID = @idEmpleado
			END
		FETCH empleadosCursor INTO @idEmpleado, @empleado
	END
	CLOSE empleadosCursor
	DEALLOCATE empleadosCursor
END
GO
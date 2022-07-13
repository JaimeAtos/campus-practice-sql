USE ejemplo
GO
CREATE TRIGGER TR_Deadline_insert 
--FOR = AFTER | INSTEAD OF 
ON Projects INSTEAD OF INSERT AS 
BEGIN
	DECLARE @Start DATETIME = (SELECT inserted.StartDate FROM inserted)
	DECLARE @Dead DATETIME = (SELECT inserted.DeadLine FROM inserted)

	IF(@Start < @Dead)
		BEGIN
			INSERT INTO Projects (Name, StartDate, DeadLine, FinishedOn, StatusId) 
			SELECT Name, StartDate, DeadLine, FinishedOn, StatusId FROM inserted 
		END
	ELSE
		BEGIN
			PRINT 'Es necesario que la fecha de inicio sea anterior a la fecha de finalizacion'
		END
END
GO

CREATE TRIGGER TR_Update_Status
--FOR = AFTER | INSTEAD OF 
ON Projects FOR INSERT AS 
BEGIN
	DECLARE @Start DATETIME = (SELECT inserted.StartDate FROM inserted)
	DECLARE @Dead DATETIME = (SELECT inserted.DeadLine FROM inserted)
	DECLARE @Actual DATETIME = (getDate())

	IF(@Start <= @Actual AND @Actual <= @Dead)
		BEGIN
			UPDATE Projects
			SET StatusId = 2 WHERE StartDate = @Start
		END
	ELSE IF (@Start > @Actual)
		BEGIN
			UPDATE Projects
			SET StatusId = 1 WHERE StartDate = @Start
		END
END
GO
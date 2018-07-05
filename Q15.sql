USE CursoBD13;
GO

SELECT * FROM Duplicata WHERE	Dt_Vencimento > DATEADD(day, -30, GETDATE())
AND Dt_Vencimento < getdate()
UNION
SELECT * FROM Duplicata WHERE Dt_Vencimento < DATEADD(day, 30, GETDATE())
AND Dt_Vencimento > getdate()
GO

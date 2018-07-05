USE CursoBD13;
GO
SELECT * FROM Nota_Fiscal nof
	FULL OUTER JOIN Pessoa_Fisica pef ON nof.Cd_Cliente = pef.Cd_Cliente
	FULL OUTER JOIN Pessoa_Juridica pej ON nof.Cd_Cliente = pej.Cd_Cliente
GO

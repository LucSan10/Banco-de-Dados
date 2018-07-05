USE CursoBD13;

CREATE VIEW Faturas_Vencidas AS
SELECT
  Cliente.Nm_Pessoa AS "Name",
	Duplicata.Dt_Vencimento AS "Vencimento",
	Duplicata.Dt_Pagamento AS "Pagamento"
FROM Duplicata
	INNER JOIN Nota_Fiscal ON Duplicata.Cd_Nota_Fiscal = NotaFiscal.Cd_Nota_Fiscal
	INNER JOIN Pessoa_Fisica ON NotaFiscal.Cd_Cliente = Pessoa_Fisica.Cd_Cliente
  INNER JOIN Cliente ON Cliente.Cd_Cliente = Pessoa_Fisica.Cd_Cliente
WHERE GETDATE() > Duplicata.Dt_Vencimento;
GO

SELECT * FROM Fatura_Vencida;
GO

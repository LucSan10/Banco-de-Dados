USE CursoBD13;
GO

DECLARE @Cd_Nota_Fiscal integer, @Ds_Produto char(20), @Dt_Vencimento datetime
DECLARE CursorDosProdutos CURSOR FOR

SELECT Duplicata.Cd_Nota_Fiscal, Produto.Ds_Produto, Duplicata.Dt_Vencimento FROM
    Duplicata
    INNER JOIN Compra ON Duplicata.Cd_Nota_Fiscal = Compra.Cd_Nota_Fiscal
    INNER JOIN Produto ON Compra.Cd_Produto = Produto.Cd_Produto
WHERE GETDATE() > Duplicata.Dt_Vencimento

OPEN CursorDosProdutos

FETCH NEXT FROM Cursor_Produtos_Faturados INTO @Cd_Nota_Fiscal, @Ds_Produto, @Dt_Vencimento
PRINT 'Cd_Nota_Fiscal/Ds_Produto/Dt_Vencimento'

WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT '' + CONVERT(varchar, @Cd_Nota_Fiscal) + '/' + @Ds_Produto + '/' CONVERT(varchar, @Dt_Vencimento, 103)
   FETCH NEXT FROM CursorDosProdutos INTO @Cd_Nota_Fiscal, @Ds_Produto, @Dt_Vencimento
END
CLOSE CursorDosProdutos
DEALLOCATE CursorDosProdutos;

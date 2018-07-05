USE CursoBD13;
GO

CREATE PROCEDURE MaisVendidos AS
  SELECT TOP 3
      pdt.Ds_Produto
      FROM Compra cmp, Produto pdt
      WHERE cmp.Cd_Produto = pdt.Cd_Produto
      GROUP BY pdt.Ds_Produto,
      ORDER BY SUM(cmp.Qt_Produtos) DESC
GO

EXECUTE MaisVendidos;
GO

USE CursoBD13;

SELECT pef.Nm_Cliente FROM Pessoa_Fisica pef inner join Cliente cli
  ON pef.Cd_Cliente = cli.Cd_Cliente

WHERE NOT EXISTS (
  SELECT * FROM Produto pdt WHERE NOT EXISTS (
      SELECT * FROM Compra cmp, Nota_Fiscal nof WHERE
            cmp.Cd_Nota_Fiscal = nof.Cd_Nota_Fiscal
            AND cmp.Cd_Produto = pdt.Cd_Produto
            AND nof.Cd_Cliente = pef.Cd_Cliente
    )
)
GO

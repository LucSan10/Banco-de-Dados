SELECT Cd_produto, Vl_Unitário
FROM Cd_produto
WHERE Cd_produto = 5

BEGIN TRANSACTION
UPDATE Produto 
Set Cd_produto = 12
WHERE Vl_Unitário = 40
COMMIT TRANSACTION

SELECT Cd_produto, Vl_Unitário
FROM Cd_produto
WHERE Cd_produto = 12

BEGIN TRANSACTION
UPDATE Produto 
Set Cd_produto = 5
WHERE Vl_Unitário = 9
ROLLBACK

SELECT Cd_produto, Vl_Unitário
FROM Cd_produto
WHERE Cd_produto = 12
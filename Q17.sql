ALTER TABLE 
	dbo.Produto 
ADD CONSTRAINT 
	Vl_Max_P CHECK (Vl_Unitário < 1001);

ALTER TABLE 
	dbo.Compra 
ADD CONSTRAINT 
	Vl_Max_C CHECK (Vl_Unitário < 1001);

UPDATE 
	dbo.Produto  
SET 
	Vl_Unitário = 1001 
WHERE 
	Cd_Produto = 99999;
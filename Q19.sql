USE CursoBD13
GO

CREATE TABLE objeto_xml(
  Cd_xml INT PRIMARY KEY,
  Ob_xml XML,
)
GO

INSERT INTO objeto_xml VALUES(1,'<Produto Cd_Produto="1" />');

SELECT * FROM objeto_xml;

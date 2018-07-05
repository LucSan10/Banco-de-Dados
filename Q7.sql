CREATE LOGIN sujeito WITH PASSWORD = 'secret_password';
GO

CREATE USER sujeito FOR LOGIN sujeito;
GO

GRANT SELECT ON [CursoBD13] TO sujeito;
GO
GRANT INSERT ON [CursoBD13] TO sujeito;
GO

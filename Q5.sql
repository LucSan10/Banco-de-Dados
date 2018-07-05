USE [master]
GO
CREATE DATABASE [CursoBD13]
 CONTAINMENT = NONE
GO
ALTER DATABASE [CursoBD13] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursoBD13].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursoBD13] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursoBD13] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursoBD13] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursoBD13] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursoBD13] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursoBD13] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursoBD13] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursoBD13] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursoBD13] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursoBD13] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursoBD13] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursoBD13] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursoBD13] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursoBD13] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursoBD13] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursoBD13] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursoBD13] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursoBD13] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursoBD13] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursoBD13] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursoBD13] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursoBD13] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursoBD13] SET RECOVERY FULL 
GO
ALTER DATABASE [CursoBD13] SET  MULTI_USER 
GO
ALTER DATABASE [CursoBD13] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursoBD13] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursoBD13] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursoBD13] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CursoBD13] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CursoBD13', N'ON'
GO
USE [CursoBD13]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [Agenda]
( 
	[Cd_Telefone]        integer  NOT NULL ,
	[Cd_Cliente]         integer  NOT NULL 
)
go

ALTER TABLE [Agenda]
	ADD CONSTRAINT [XPKAgenda] PRIMARY KEY  CLUSTERED ([Cd_Telefone] ASC,[Cd_Cliente] ASC)
go

CREATE TABLE [Bairro]
( 
	[Cd_Bairro]          integer  NOT NULL ,
	[Nm_Bairro]          varchar(50)  NULL ,
	[Cd_UF]              integer  NOT NULL ,
	[Cd_Municipio]       integer  NOT NULL 
)
go

ALTER TABLE [Bairro]
	ADD CONSTRAINT [XPKBairro] PRIMARY KEY  CLUSTERED ([Cd_Bairro] ASC)
go

CREATE TABLE [CEP]
( 
	[Cd_CEP]             integer  NOT NULL ,
	[Cd_Bairro]          integer  NOT NULL ,
	[Cd_Municipio]       integer  NOT NULL ,
	[Cd_UF]              integer  NOT NULL ,
	[Nu_CEP]             char(8)  NULL 
)
go

ALTER TABLE [CEP]
	ADD CONSTRAINT [XPKCEP] PRIMARY KEY  CLUSTERED ([Cd_CEP] ASC)
go

CREATE TABLE [Cliente]
( 
	[Cd_Cliente]         integer  NOT NULL 
)
go

ALTER TABLE [Cliente]
	ADD CONSTRAINT [XPKCliente] PRIMARY KEY  CLUSTERED ([Cd_Cliente] ASC)
go

CREATE TABLE [Compra]
( 
	[Cd_Produto]         integer  NOT NULL ,
	[Qt_Produtos]        integer  NULL ,
	[Cd_Nota_Fiscal]     integer  NOT NULL ,
	[Cd_Saida]           integer  NULL ,
	[Cd_Compra]          integer  NOT NULL 
)
go

ALTER TABLE [Compra]
	ADD CONSTRAINT [XPKCompra] PRIMARY KEY  CLUSTERED ([Cd_Compra] ASC)
go

CREATE TABLE [Duplicata]
( 
	[Cd_Duplicata]       integer  NOT NULL ,
	[Dt_Vencimento]      datetime  NULL ,
	[Vl_Valor]           float  NULL ,
	[Dt_Pagamento]       datetime  NULL ,
	[Vl_Pagamento]       float  NULL ,
	[Cd_Nota_Fiscal]     integer  NULL 
)
go

ALTER TABLE [Duplicata]
	ADD CONSTRAINT [XPKDuplicata] PRIMARY KEY  CLUSTERED ([Cd_Duplicata] ASC)
go

CREATE TABLE [Endereço]
( 
	[Cd_Endereço]        integer  NOT NULL ,
	[Nm_Complemento]     varchar(30)  NULL ,
	[Nu_Número]          integer  NULL ,
	[Nm_Endereço]        varchar(50)  NULL ,
	[Cd_Municipio]       integer  NULL ,
	[Cd_CEP]             integer  NULL ,
	[Cd_UF]              integer  NOT NULL ,
	[Cd_Bairro]          integer  NULL 
)
go

ALTER TABLE [Endereço]
	ADD CONSTRAINT [XPKEndereço] PRIMARY KEY  CLUSTERED ([Cd_Endereço] ASC)
go

CREATE TABLE [Logradouro]
( 
	[Cd_Cliente]         integer  NOT NULL ,
	[Cd_Endereço]        integer  NOT NULL 
)
go

ALTER TABLE [Logradouro]
	ADD CONSTRAINT [XPKLogradouro] PRIMARY KEY  CLUSTERED ([Cd_Cliente] ASC,[Cd_Endereço] ASC)
go

CREATE TABLE [Municipio]
( 
	[Cd_Municipio]       integer  NOT NULL ,
	[Nm_Municipio]       varchar(50)  NULL ,
	[Cd_UF]              integer  NOT NULL 
)
go

ALTER TABLE [Municipio]
	ADD CONSTRAINT [XPKMunicipio] PRIMARY KEY  CLUSTERED ([Cd_Municipio] ASC)
go

CREATE TABLE [Nota_Fiscal]
( 
	[Cd_Nota_Fiscal]     integer  NOT NULL ,
	[Dt_Emissão]         datetime  NULL ,
	[Dt_Entrega]         datetime  NULL ,
	[Cd_Cliente]         integer  NULL ,
	[Cd_Transporte]      integer  NULL 
)
go

ALTER TABLE [Nota_Fiscal]
	ADD CONSTRAINT [XPKNota_Fiscal] PRIMARY KEY  CLUSTERED ([Cd_Nota_Fiscal] ASC)
go

CREATE TABLE [Pessoa_Física]
( 
	[Cd_CPF]             char(11)  NULL ,
	[Nm_Cliente]         varchar(40)  NULL ,
	[Cd_Cliente]         integer  NULL ,
	[Cd_PF]              integer  NOT NULL 
)
go

ALTER TABLE [Pessoa_Física]
	ADD CONSTRAINT [XPKPessoa_Física] PRIMARY KEY  CLUSTERED ([Cd_PF] ASC)
go

CREATE TABLE [Pessoa_Jurídica]
( 
	[Cd_CPNJ]            char(14)  NULL ,
	[Nm_Razão_Social]    varchar(25)  NULL ,
	[Cd_Inscrição_Estadual] integer  NULL ,
	[Cd_Cliente]         integer  NULL ,
	[Cd_CFOP]            integer  NULL ,
	[Cd_NatOp]           integer  NULL ,
	[Cd_Inscrição_Estadual_ST] integer  NULL ,
	[Cd_PJ]              integer  NOT NULL 
)
go

ALTER TABLE [Pessoa_Jurídica]
	ADD CONSTRAINT [XPKPessoa_Jurídica] PRIMARY KEY  CLUSTERED ([Cd_PJ] ASC)
go

CREATE TABLE [Produto]
( 
	[Cd_Produto]         integer  NOT NULL ,
	[Ds_Produto]         varchar(40)  NULL ,
	[Vl_Unitário]        float  NULL ,
	[Ds_Marca]           varchar(30)  NULL ,
	[Ps_Peso]            float  NULL ,
	[In_ICMS]            float  NULL ,
	[In_IPI]             float  NULL ,
	[Vl_Seguro]          float  NULL 
)
go

ALTER TABLE [Produto]
	ADD CONSTRAINT [XPKProduto] PRIMARY KEY  CLUSTERED ([Cd_Produto] ASC)
go

CREATE TABLE [Saida]
( 
	[Dt_Saida]           datetime  NULL ,
	[Hh_Saida]           datetime  NULL ,
	[Cd_Saida]           integer  NOT NULL ,
	[Cd_Transporte]      integer  NULL 
)
go

ALTER TABLE [Saida]
	ADD CONSTRAINT [XPKSaida] PRIMARY KEY  CLUSTERED ([Cd_Saida] ASC)
go

CREATE TABLE [Telefone]
( 
	[Nu_Telefone]        varchar(9)  NULL ,
	[Cd_DDD]             varchar(2)  NULL ,
	[Cd_Telefone]        integer  NOT NULL 
)
go

ALTER TABLE [Telefone]
	ADD CONSTRAINT [XPKTelefone] PRIMARY KEY  CLUSTERED ([Cd_Telefone] ASC)
go

CREATE TABLE [Transporte]
( 
	[Cd_Transporte]      integer  NOT NULL ,
	[Cd_Espécie]         integer  NULL ,
	[Vl_Frete]           float  NULL ,
	[Cd_PJ]              integer  NOT NULL 
)
go

ALTER TABLE [Transporte]
	ADD CONSTRAINT [XPKTransporte] PRIMARY KEY  CLUSTERED ([Cd_Transporte] ASC)
go

CREATE TABLE [UF]
( 
	[Cd_UF]              integer  NOT NULL ,
	[Nm_Estado]          varchar(25)  NULL ,
	[Sg_UF]              varchar(2)  NULL 
)
go

ALTER TABLE [UF]
	ADD CONSTRAINT [XPKUF] PRIMARY KEY  CLUSTERED ([Cd_UF] ASC)
go

CREATE TABLE [Veiculo]
( 
	[Cd_Veiculo]         integer  NOT NULL ,
	[Cd_Placa]           varchar(7)  NULL ,
	[Cd_Transporte]      integer  NULL ,
	[Cd_Municipio]       integer  NOT NULL ,
	[Cd_UF]              integer  NOT NULL 
)
go

ALTER TABLE [Veiculo]
	ADD CONSTRAINT [XPKVeiculo] PRIMARY KEY  CLUSTERED ([Cd_Veiculo] ASC)
go


ALTER TABLE [Agenda]
	ADD CONSTRAINT [R_130] FOREIGN KEY ([Cd_Telefone]) REFERENCES [Telefone]([Cd_Telefone])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Agenda]
	ADD CONSTRAINT [R_131] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Bairro]
	ADD CONSTRAINT [R_59] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Bairro]
	ADD CONSTRAINT [R_61] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [CEP]
	ADD CONSTRAINT [R_56] FOREIGN KEY ([Cd_Bairro]) REFERENCES [Bairro]([Cd_Bairro])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CEP]
	ADD CONSTRAINT [R_57] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [CEP]
	ADD CONSTRAINT [R_65] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Compra]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([Cd_Produto]) REFERENCES [Produto]([Cd_Produto])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Compra]
	ADD CONSTRAINT [R_90] FOREIGN KEY ([Cd_Nota_Fiscal]) REFERENCES [Nota_Fiscal]([Cd_Nota_Fiscal])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Compra]
	ADD CONSTRAINT [R_117] FOREIGN KEY ([Cd_Saida]) REFERENCES [Saida]([Cd_Saida])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Duplicata]
	ADD CONSTRAINT [R_118] FOREIGN KEY ([Cd_Nota_Fiscal]) REFERENCES [Nota_Fiscal]([Cd_Nota_Fiscal])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Endereço]
	ADD CONSTRAINT [R_96] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Endereço]
	ADD CONSTRAINT [R_98] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Endereço]
	ADD CONSTRAINT [R_99] FOREIGN KEY ([Cd_Bairro]) REFERENCES [Bairro]([Cd_Bairro])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Endereço]
	ADD CONSTRAINT [R_97] FOREIGN KEY ([Cd_CEP]) REFERENCES [CEP]([Cd_CEP])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Logradouro]
	ADD CONSTRAINT [R_109] FOREIGN KEY ([Cd_Endereço]) REFERENCES [Endereço]([Cd_Endereço])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Logradouro]
	ADD CONSTRAINT [R_116] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Municipio]
	ADD CONSTRAINT [R_62] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Nota_Fiscal]
	ADD CONSTRAINT [R_112] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Nota_Fiscal]
	ADD CONSTRAINT [R_113] FOREIGN KEY ([Cd_Transporte]) REFERENCES [Transporte]([Cd_Transporte])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Pessoa_Física]
	ADD CONSTRAINT [R_110] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Pessoa_Jurídica]
	ADD CONSTRAINT [R_111] FOREIGN KEY ([Cd_Cliente]) REFERENCES [Cliente]([Cd_Cliente])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Saida]
	ADD CONSTRAINT [R_38] FOREIGN KEY ([Cd_Transporte]) REFERENCES [Transporte]([Cd_Transporte])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Transporte]
	ADD CONSTRAINT [R_106] FOREIGN KEY ([Cd_PJ]) REFERENCES [Pessoa_Jurídica]([Cd_PJ])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Veiculo]
	ADD CONSTRAINT [R_40] FOREIGN KEY ([Cd_Transporte]) REFERENCES [Transporte]([Cd_Transporte])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Veiculo]
	ADD CONSTRAINT [R_122] FOREIGN KEY ([Cd_Municipio]) REFERENCES [Municipio]([Cd_Municipio])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Veiculo]
	ADD CONSTRAINT [R_123] FOREIGN KEY ([Cd_UF]) REFERENCES [UF]([Cd_UF])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_Agenda ON Agenda FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Agenda */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cliente  Agenda on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026ce8", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Cliente
      WHERE
        /* %JoinFKPK(deleted,Cliente," = "," AND") */
        deleted.Cd_Cliente = Cliente.Cd_Cliente AND
        NOT EXISTS (
          SELECT * FROM Agenda
          WHERE
            /* %JoinFKPK(Agenda,Cliente," = "," AND") */
            Agenda.Cd_Cliente = Cliente.Cd_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Agenda because Cliente exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Telefone  Agenda on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Telefone"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="Cd_Telefone" */
    IF EXISTS (SELECT * FROM deleted,Telefone
      WHERE
        /* %JoinFKPK(deleted,Telefone," = "," AND") */
        deleted.Cd_Telefone = Telefone.Cd_Telefone AND
        NOT EXISTS (
          SELECT * FROM Agenda
          WHERE
            /* %JoinFKPK(Agenda,Telefone," = "," AND") */
            Agenda.Cd_Telefone = Telefone.Cd_Telefone
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Agenda because Telefone exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Agenda ON Agenda FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Agenda */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Telefone integer, 
           @insCd_Cliente integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cliente  Agenda on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002aa89", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cliente
        WHERE
          /* %JoinFKPK(inserted,Cliente) */
          inserted.Cd_Cliente = Cliente.Cd_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Agenda because Cliente does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Telefone  Agenda on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Telefone"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="Cd_Telefone" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Telefone)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Telefone
        WHERE
          /* %JoinFKPK(inserted,Telefone) */
          inserted.Cd_Telefone = Telefone.Cd_Telefone
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Agenda because Telefone does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Bairro ON Bairro FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Bairro */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Bairro  Endereço on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042224", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bairro because Endereço exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bairro  CEP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bairro because CEP exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Bairro on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM Bairro
          WHERE
            /* %JoinFKPK(Bairro,Municipio," = "," AND") */
            Bairro.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bairro because Municipio exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Bairro on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_59", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Bairro
          WHERE
            /* %JoinFKPK(Bairro,UF," = "," AND") */
            Bairro.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bairro because UF exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Bairro ON Bairro FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Bairro */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Bairro integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Bairro  Endereço on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00049c7d", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bairro because Endereço exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bairro  CEP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_Bairro = deleted.Cd_Bairro
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bairro because CEP exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Bairro on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bairro because Municipio does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Bairro on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_59", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bairro because UF does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CEP ON CEP FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on CEP */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* CEP  Endereço on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00041a47", PARENT_OWNER="", PARENT_TABLE="CEP"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Cd_CEP" */
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_CEP = deleted.Cd_CEP
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CEP because Endereço exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  CEP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM CEP
          WHERE
            /* %JoinFKPK(CEP,UF," = "," AND") */
            CEP.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CEP because UF exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  CEP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM CEP
          WHERE
            /* %JoinFKPK(CEP,Municipio," = "," AND") */
            CEP.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CEP because Municipio exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bairro  CEP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (SELECT * FROM deleted,Bairro
      WHERE
        /* %JoinFKPK(deleted,Bairro," = "," AND") */
        deleted.Cd_Bairro = Bairro.Cd_Bairro AND
        NOT EXISTS (
          SELECT * FROM CEP
          WHERE
            /* %JoinFKPK(CEP,Bairro," = "," AND") */
            CEP.Cd_Bairro = Bairro.Cd_Bairro
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last CEP because Bairro exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CEP ON CEP FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on CEP */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_CEP integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* CEP  Endereço on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004c8ea", PARENT_OWNER="", PARENT_TABLE="CEP"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Cd_CEP" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_CEP)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_CEP = deleted.Cd_CEP
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CEP because Endereço exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  CEP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CEP because UF does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  CEP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CEP because Municipio does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bairro  CEP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_56", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bairro
        WHERE
          /* %JoinFKPK(inserted,Bairro) */
          inserted.Cd_Bairro = Bairro.Cd_Bairro
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update CEP because Bairro does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Cliente ON Cliente FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Cliente */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cliente  Agenda on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004c56e", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Agenda
      WHERE
        /*  %JoinFKPK(Agenda,deleted," = "," AND") */
        Agenda.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cliente because Agenda exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Logradouro on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_116", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Logradouro
      WHERE
        /*  %JoinFKPK(Logradouro,deleted," = "," AND") */
        Logradouro.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cliente because Logradouro exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Nota_Fiscal on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /*  %JoinFKPK(Nota_Fiscal,deleted," = "," AND") */
        Nota_Fiscal.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cliente because Nota_Fiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Pessoa_Jurídica on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Jurídica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Jurídica
      WHERE
        /*  %JoinFKPK(Pessoa_Jurídica,deleted," = "," AND") */
        Pessoa_Jurídica.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cliente because Pessoa_Jurídica exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Pessoa_Física on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Física"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Física
      WHERE
        /*  %JoinFKPK(Pessoa_Física,deleted," = "," AND") */
        Pessoa_Física.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cliente because Pessoa_Física exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Cliente ON Cliente FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Cliente */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Cliente integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cliente  Agenda on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00058047", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_131", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Agenda
      WHERE
        /*  %JoinFKPK(Agenda,deleted," = "," AND") */
        Agenda.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cliente because Agenda exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Logradouro on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_116", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Logradouro
      WHERE
        /*  %JoinFKPK(Logradouro,deleted," = "," AND") */
        Logradouro.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cliente because Logradouro exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Nota_Fiscal on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /*  %JoinFKPK(Nota_Fiscal,deleted," = "," AND") */
        Nota_Fiscal.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cliente because Nota_Fiscal exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Pessoa_Jurídica on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Jurídica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Jurídica
      WHERE
        /*  %JoinFKPK(Pessoa_Jurídica,deleted," = "," AND") */
        Pessoa_Jurídica.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cliente because Pessoa_Jurídica exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Pessoa_Física on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Física"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Pessoa_Física
      WHERE
        /*  %JoinFKPK(Pessoa_Física,deleted," = "," AND") */
        Pessoa_Física.Cd_Cliente = deleted.Cd_Cliente
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cliente because Pessoa_Física exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Compra ON Compra FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Compra */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Saida  Compra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00038b0a", PARENT_OWNER="", PARENT_TABLE="Saida"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="Cd_Saida" */
    IF EXISTS (SELECT * FROM deleted,Saida
      WHERE
        /* %JoinFKPK(deleted,Saida," = "," AND") */
        deleted.Cd_Saida = Saida.Cd_Saida AND
        NOT EXISTS (
          SELECT * FROM Compra
          WHERE
            /* %JoinFKPK(Compra,Saida," = "," AND") */
            Compra.Cd_Saida = Saida.Cd_Saida
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Compra because Saida exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Nota_Fiscal  Compra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="Cd_Nota_Fiscal" */
    IF EXISTS (SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /* %JoinFKPK(deleted,Nota_Fiscal," = "," AND") */
        deleted.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal AND
        NOT EXISTS (
          SELECT * FROM Compra
          WHERE
            /* %JoinFKPK(Compra,Nota_Fiscal," = "," AND") */
            Compra.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Compra because Nota_Fiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Produto  Compra on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="Cd_Produto" */
    IF EXISTS (SELECT * FROM deleted,Produto
      WHERE
        /* %JoinFKPK(deleted,Produto," = "," AND") */
        deleted.Cd_Produto = Produto.Cd_Produto AND
        NOT EXISTS (
          SELECT * FROM Compra
          WHERE
            /* %JoinFKPK(Compra,Produto," = "," AND") */
            Compra.Cd_Produto = Produto.Cd_Produto
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Compra because Produto exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Compra ON Compra FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Compra */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Compra integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Saida  Compra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00042022", PARENT_OWNER="", PARENT_TABLE="Saida"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="Cd_Saida" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Saida)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Saida
        WHERE
          /* %JoinFKPK(inserted,Saida) */
          inserted.Cd_Saida = Saida.Cd_Saida
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Saida IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Compra because Saida does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Nota_Fiscal  Compra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="Cd_Nota_Fiscal" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Nota_Fiscal)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Nota_Fiscal
        WHERE
          /* %JoinFKPK(inserted,Nota_Fiscal) */
          inserted.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Compra because Nota_Fiscal does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Produto  Compra on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="Cd_Produto" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Produto)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Produto
        WHERE
          /* %JoinFKPK(inserted,Produto) */
          inserted.Cd_Produto = Produto.Cd_Produto
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Compra because Produto does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Duplicata ON Duplicata FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Duplicata */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Nota_Fiscal  Duplicata on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001635d", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="Cd_Nota_Fiscal" */
    IF EXISTS (SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /* %JoinFKPK(deleted,Nota_Fiscal," = "," AND") */
        deleted.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal AND
        NOT EXISTS (
          SELECT * FROM Duplicata
          WHERE
            /* %JoinFKPK(Duplicata,Nota_Fiscal," = "," AND") */
            Duplicata.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Duplicata because Nota_Fiscal exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Duplicata ON Duplicata FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Duplicata */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Duplicata integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Nota_Fiscal  Duplicata on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00019e87", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="Cd_Nota_Fiscal" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Nota_Fiscal)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Nota_Fiscal
        WHERE
          /* %JoinFKPK(inserted,Nota_Fiscal) */
          inserted.Cd_Nota_Fiscal = Nota_Fiscal.Cd_Nota_Fiscal
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Nota_Fiscal IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Duplicata because Nota_Fiscal does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Endereço ON Endereço FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Endereço */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Endereço  Logradouro on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000582ce", PARENT_OWNER="", PARENT_TABLE="Endereço"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="Cd_Endereço" */
    IF EXISTS (
      SELECT * FROM deleted,Logradouro
      WHERE
        /*  %JoinFKPK(Logradouro,deleted," = "," AND") */
        Logradouro.Cd_Endereço = deleted.Cd_Endereço
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Endereço because Logradouro exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Bairro  Endereço on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="Cd_Bairro" */
    IF EXISTS (SELECT * FROM deleted,Bairro
      WHERE
        /* %JoinFKPK(deleted,Bairro," = "," AND") */
        deleted.Cd_Bairro = Bairro.Cd_Bairro AND
        NOT EXISTS (
          SELECT * FROM Endereço
          WHERE
            /* %JoinFKPK(Endereço,Bairro," = "," AND") */
            Endereço.Cd_Bairro = Bairro.Cd_Bairro
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereço because Bairro exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Endereço on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Endereço
          WHERE
            /* %JoinFKPK(Endereço,UF," = "," AND") */
            Endereço.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereço because UF exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* CEP  Endereço on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CEP"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Cd_CEP" */
    IF EXISTS (SELECT * FROM deleted,CEP
      WHERE
        /* %JoinFKPK(deleted,CEP," = "," AND") */
        deleted.Cd_CEP = CEP.Cd_CEP AND
        NOT EXISTS (
          SELECT * FROM Endereço
          WHERE
            /* %JoinFKPK(Endereço,CEP," = "," AND") */
            Endereço.Cd_CEP = CEP.Cd_CEP
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereço because CEP exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Endereço on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM Endereço
          WHERE
            /* %JoinFKPK(Endereço,Municipio," = "," AND") */
            Endereço.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Endereço because Municipio exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Endereço ON Endereço FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Endereço */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Endereço integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Endereço  Logradouro on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000672db", PARENT_OWNER="", PARENT_TABLE="Endereço"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="Cd_Endereço" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Endereço)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Logradouro
      WHERE
        /*  %JoinFKPK(Logradouro,deleted," = "," AND") */
        Logradouro.Cd_Endereço = deleted.Cd_Endereço
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Endereço because Logradouro exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Bairro  Endereço on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bairro"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_99", FK_COLUMNS="Cd_Bairro" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Bairro)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bairro
        WHERE
          /* %JoinFKPK(inserted,Bairro) */
          inserted.Cd_Bairro = Bairro.Cd_Bairro
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Bairro IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereço because Bairro does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Endereço on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereço because UF does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* CEP  Endereço on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CEP"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_97", FK_COLUMNS="Cd_CEP" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_CEP)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CEP
        WHERE
          /* %JoinFKPK(inserted,CEP) */
          inserted.Cd_CEP = CEP.Cd_CEP
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_CEP IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereço because CEP does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Endereço on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Municipio IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Endereço because Municipio does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Logradouro ON Logradouro FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Logradouro */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cliente  Logradouro on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002756a", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_116", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Cliente
      WHERE
        /* %JoinFKPK(deleted,Cliente," = "," AND") */
        deleted.Cd_Cliente = Cliente.Cd_Cliente AND
        NOT EXISTS (
          SELECT * FROM Logradouro
          WHERE
            /* %JoinFKPK(Logradouro,Cliente," = "," AND") */
            Logradouro.Cd_Cliente = Cliente.Cd_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Logradouro because Cliente exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Endereço  Logradouro on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endereço"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="Cd_Endereço" */
    IF EXISTS (SELECT * FROM deleted,Endereço
      WHERE
        /* %JoinFKPK(deleted,Endereço," = "," AND") */
        deleted.Cd_Endereço = Endereço.Cd_Endereço AND
        NOT EXISTS (
          SELECT * FROM Logradouro
          WHERE
            /* %JoinFKPK(Logradouro,Endereço," = "," AND") */
            Logradouro.Cd_Endereço = Endereço.Cd_Endereço
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Logradouro because Endereço exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Logradouro ON Logradouro FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Logradouro */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Cliente integer, 
           @insCd_Endereço integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cliente  Logradouro on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a8cb", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_116", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cliente
        WHERE
          /* %JoinFKPK(inserted,Cliente) */
          inserted.Cd_Cliente = Cliente.Cd_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Logradouro because Cliente does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Endereço  Logradouro on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Endereço"
    CHILD_OWNER="", CHILD_TABLE="Logradouro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_109", FK_COLUMNS="Cd_Endereço" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Endereço)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Endereço
        WHERE
          /* %JoinFKPK(inserted,Endereço) */
          inserted.Cd_Endereço = Endereço.Cd_Endereço
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Logradouro because Endereço does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Municipio ON Municipio FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Municipio */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Municipio  Veiculo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004d035", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because Veiculo exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Endereço on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because Endereço exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Bairro on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because Bairro exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  CEP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Municipio because CEP exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Municipio on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Municipio
          WHERE
            /* %JoinFKPK(Municipio,UF," = "," AND") */
            Municipio.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Municipio because UF exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Municipio ON Municipio FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Municipio */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Municipio integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Municipio  Veiculo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00055b20", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because Veiculo exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Endereço on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_96", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because Endereço exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Bairro on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_61", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because Bairro exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  CEP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_Municipio = deleted.Cd_Municipio
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Municipio because CEP exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Municipio on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Municipio because UF does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Nota_Fiscal ON Nota_Fiscal FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Nota_Fiscal */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Nota_Fiscal  Duplicata on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00048d41", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="Cd_Nota_Fiscal" */
    IF EXISTS (
      SELECT * FROM deleted,Duplicata
      WHERE
        /*  %JoinFKPK(Duplicata,deleted," = "," AND") */
        Duplicata.Cd_Nota_Fiscal = deleted.Cd_Nota_Fiscal
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Nota_Fiscal because Duplicata exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Nota_Fiscal  Compra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="Cd_Nota_Fiscal" */
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Nota_Fiscal = deleted.Cd_Nota_Fiscal
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Nota_Fiscal because Compra exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transporte  Nota_Fiscal on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (SELECT * FROM deleted,Transporte
      WHERE
        /* %JoinFKPK(deleted,Transporte," = "," AND") */
        deleted.Cd_Transporte = Transporte.Cd_Transporte AND
        NOT EXISTS (
          SELECT * FROM Nota_Fiscal
          WHERE
            /* %JoinFKPK(Nota_Fiscal,Transporte," = "," AND") */
            Nota_Fiscal.Cd_Transporte = Transporte.Cd_Transporte
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Nota_Fiscal because Transporte exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Nota_Fiscal on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Cliente
      WHERE
        /* %JoinFKPK(deleted,Cliente," = "," AND") */
        deleted.Cd_Cliente = Cliente.Cd_Cliente AND
        NOT EXISTS (
          SELECT * FROM Nota_Fiscal
          WHERE
            /* %JoinFKPK(Nota_Fiscal,Cliente," = "," AND") */
            Nota_Fiscal.Cd_Cliente = Cliente.Cd_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Nota_Fiscal because Cliente exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Nota_Fiscal ON Nota_Fiscal FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Nota_Fiscal */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Nota_Fiscal integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Nota_Fiscal  Duplicata on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00052f9d", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Duplicata"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_118", FK_COLUMNS="Cd_Nota_Fiscal" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Nota_Fiscal)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Duplicata
      WHERE
        /*  %JoinFKPK(Duplicata,deleted," = "," AND") */
        Duplicata.Cd_Nota_Fiscal = deleted.Cd_Nota_Fiscal
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Nota_Fiscal because Duplicata exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Nota_Fiscal  Compra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Nota_Fiscal"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_90", FK_COLUMNS="Cd_Nota_Fiscal" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Nota_Fiscal)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Nota_Fiscal = deleted.Cd_Nota_Fiscal
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Nota_Fiscal because Compra exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transporte  Nota_Fiscal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Transporte
        WHERE
          /* %JoinFKPK(inserted,Transporte) */
          inserted.Cd_Transporte = Transporte.Cd_Transporte
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Transporte IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Nota_Fiscal because Transporte does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Nota_Fiscal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_112", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cliente
        WHERE
          /* %JoinFKPK(inserted,Cliente) */
          inserted.Cd_Cliente = Cliente.Cd_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Cliente IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Nota_Fiscal because Cliente does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Pessoa_Física ON Pessoa_Física FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Pessoa_Física */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Cliente  Pessoa_Física on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015741", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Física"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Cliente
      WHERE
        /* %JoinFKPK(deleted,Cliente," = "," AND") */
        deleted.Cd_Cliente = Cliente.Cd_Cliente AND
        NOT EXISTS (
          SELECT * FROM Pessoa_Física
          WHERE
            /* %JoinFKPK(Pessoa_Física,Cliente," = "," AND") */
            Pessoa_Física.Cd_Cliente = Cliente.Cd_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Pessoa_Física because Cliente exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Pessoa_Física ON Pessoa_Física FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Pessoa_Física */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_PF integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Cliente  Pessoa_Física on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018106", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Física"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_110", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cliente
        WHERE
          /* %JoinFKPK(inserted,Cliente) */
          inserted.Cd_Cliente = Cliente.Cd_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Cliente IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Pessoa_Física because Cliente does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Pessoa_Jurídica ON Pessoa_Jurídica FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Pessoa_Jurídica */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Pessoa_Jurídica  Transporte on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023c17", PARENT_OWNER="", PARENT_TABLE="Pessoa_Jurídica"
    CHILD_OWNER="", CHILD_TABLE="Transporte"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_106", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (
      SELECT * FROM deleted,Transporte
      WHERE
        /*  %JoinFKPK(Transporte,deleted," = "," AND") */
        Transporte.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Pessoa_Jurídica because Transporte exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Cliente  Pessoa_Jurídica on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Jurídica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="Cd_Cliente" */
    IF EXISTS (SELECT * FROM deleted,Cliente
      WHERE
        /* %JoinFKPK(deleted,Cliente," = "," AND") */
        deleted.Cd_Cliente = Cliente.Cd_Cliente AND
        NOT EXISTS (
          SELECT * FROM Pessoa_Jurídica
          WHERE
            /* %JoinFKPK(Pessoa_Jurídica,Cliente," = "," AND") */
            Pessoa_Jurídica.Cd_Cliente = Cliente.Cd_Cliente
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Pessoa_Jurídica because Cliente exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Pessoa_Jurídica ON Pessoa_Jurídica FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Pessoa_Jurídica */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_PJ integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Pessoa_Jurídica  Transporte on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00029e15", PARENT_OWNER="", PARENT_TABLE="Pessoa_Jurídica"
    CHILD_OWNER="", CHILD_TABLE="Transporte"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_106", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Transporte
      WHERE
        /*  %JoinFKPK(Transporte,deleted," = "," AND") */
        Transporte.Cd_PJ = deleted.Cd_PJ
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Pessoa_Jurídica because Transporte exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Cliente  Pessoa_Jurídica on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cliente"
    CHILD_OWNER="", CHILD_TABLE="Pessoa_Jurídica"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_111", FK_COLUMNS="Cd_Cliente" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Cliente)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cliente
        WHERE
          /* %JoinFKPK(inserted,Cliente) */
          inserted.Cd_Cliente = Cliente.Cd_Cliente
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Cliente IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Pessoa_Jurídica because Cliente does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Produto ON Produto FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Produto */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Produto  Compra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000111ad", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="Cd_Produto" */
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Produto = deleted.Cd_Produto
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Produto because Compra exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Produto ON Produto FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Produto */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Produto integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Produto  Compra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001249b", PARENT_OWNER="", PARENT_TABLE="Produto"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="Cd_Produto" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Produto)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Produto = deleted.Cd_Produto
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Produto because Compra exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Saida ON Saida FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Saida */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Saida  Compra on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00023f06", PARENT_OWNER="", PARENT_TABLE="Saida"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="Cd_Saida" */
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Saida = deleted.Cd_Saida
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Saida because Compra exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transporte  Saida on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Saida"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (SELECT * FROM deleted,Transporte
      WHERE
        /* %JoinFKPK(deleted,Transporte," = "," AND") */
        deleted.Cd_Transporte = Transporte.Cd_Transporte AND
        NOT EXISTS (
          SELECT * FROM Saida
          WHERE
            /* %JoinFKPK(Saida,Transporte," = "," AND") */
            Saida.Cd_Transporte = Transporte.Cd_Transporte
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Saida because Transporte exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Saida ON Saida FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Saida */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Saida integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Saida  Compra on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000290c6", PARENT_OWNER="", PARENT_TABLE="Saida"
    CHILD_OWNER="", CHILD_TABLE="Compra"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_117", FK_COLUMNS="Cd_Saida" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Saida)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Compra
      WHERE
        /*  %JoinFKPK(Compra,deleted," = "," AND") */
        Compra.Cd_Saida = deleted.Cd_Saida
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Saida because Compra exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transporte  Saida on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Saida"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Transporte
        WHERE
          /* %JoinFKPK(inserted,Transporte) */
          inserted.Cd_Transporte = Transporte.Cd_Transporte
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Transporte IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Saida because Transporte does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Telefone ON Telefone FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Telefone */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Telefone  Agenda on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010dc1", PARENT_OWNER="", PARENT_TABLE="Telefone"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="Cd_Telefone" */
    IF EXISTS (
      SELECT * FROM deleted,Agenda
      WHERE
        /*  %JoinFKPK(Agenda,deleted," = "," AND") */
        Agenda.Cd_Telefone = deleted.Cd_Telefone
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Telefone because Agenda exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Telefone ON Telefone FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Telefone */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Telefone integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Telefone  Agenda on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011abe", PARENT_OWNER="", PARENT_TABLE="Telefone"
    CHILD_OWNER="", CHILD_TABLE="Agenda"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_130", FK_COLUMNS="Cd_Telefone" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Telefone)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Agenda
      WHERE
        /*  %JoinFKPK(Agenda,deleted," = "," AND") */
        Agenda.Cd_Telefone = deleted.Cd_Telefone
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Telefone because Agenda exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Transporte ON Transporte FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Transporte */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* Transporte  Nota_Fiscal on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00043b47", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (
      SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /*  %JoinFKPK(Nota_Fiscal,deleted," = "," AND") */
        Nota_Fiscal.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Transporte because Nota_Fiscal exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transporte  Veiculo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Transporte because Veiculo exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transporte  Saida on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Saida"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (
      SELECT * FROM deleted,Saida
      WHERE
        /*  %JoinFKPK(Saida,deleted," = "," AND") */
        Saida.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Transporte because Saida exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Pessoa_Jurídica  Transporte on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Jurídica"
    CHILD_OWNER="", CHILD_TABLE="Transporte"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_106", FK_COLUMNS="Cd_PJ" */
    IF EXISTS (SELECT * FROM deleted,Pessoa_Jurídica
      WHERE
        /* %JoinFKPK(deleted,Pessoa_Jurídica," = "," AND") */
        deleted.Cd_PJ = Pessoa_Jurídica.Cd_PJ AND
        NOT EXISTS (
          SELECT * FROM Transporte
          WHERE
            /* %JoinFKPK(Transporte,Pessoa_Jurídica," = "," AND") */
            Transporte.Cd_PJ = Pessoa_Jurídica.Cd_PJ
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Transporte because Pessoa_Jurídica exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Transporte ON Transporte FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Transporte */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Transporte integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* Transporte  Nota_Fiscal on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a92c", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Nota_Fiscal"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_113", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Nota_Fiscal
      WHERE
        /*  %JoinFKPK(Nota_Fiscal,deleted," = "," AND") */
        Nota_Fiscal.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Transporte because Nota_Fiscal exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transporte  Veiculo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Transporte because Veiculo exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transporte  Saida on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Saida"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Saida
      WHERE
        /*  %JoinFKPK(Saida,deleted," = "," AND") */
        Saida.Cd_Transporte = deleted.Cd_Transporte
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Transporte because Saida exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Pessoa_Jurídica  Transporte on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pessoa_Jurídica"
    CHILD_OWNER="", CHILD_TABLE="Transporte"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_106", FK_COLUMNS="Cd_PJ" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_PJ)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Pessoa_Jurídica
        WHERE
          /* %JoinFKPK(inserted,Pessoa_Jurídica) */
          inserted.Cd_PJ = Pessoa_Jurídica.Cd_PJ
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Transporte because Pessoa_Jurídica does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_UF ON UF FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on UF */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* UF  Veiculo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00044e4b", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Veiculo exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Endereço on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Endereço exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  CEP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because CEP exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Municipio on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Municipio
      WHERE
        /*  %JoinFKPK(Municipio,deleted," = "," AND") */
        Municipio.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Municipio exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* UF  Bairro on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_59", FK_COLUMNS="Cd_UF" */
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete UF because Bairro exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_UF ON UF FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on UF */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_UF integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* UF  Veiculo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004bf0e", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Veiculo
      WHERE
        /*  %JoinFKPK(Veiculo,deleted," = "," AND") */
        Veiculo.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Veiculo exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Endereço on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Endereço"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_98", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Endereço
      WHERE
        /*  %JoinFKPK(Endereço,deleted," = "," AND") */
        Endereço.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Endereço exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  CEP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="CEP"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_65", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,CEP
      WHERE
        /*  %JoinFKPK(CEP,deleted," = "," AND") */
        CEP.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because CEP exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Municipio on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Municipio"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_62", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Municipio
      WHERE
        /*  %JoinFKPK(Municipio,deleted," = "," AND") */
        Municipio.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Municipio exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* UF  Bairro on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Bairro"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_59", FK_COLUMNS="Cd_UF" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bairro
      WHERE
        /*  %JoinFKPK(Bairro,deleted," = "," AND") */
        Bairro.Cd_UF = deleted.Cd_UF
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update UF because Bairro exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Veiculo ON Veiculo FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on Veiculo */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* UF  Veiculo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00039128", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="Cd_UF" */
    IF EXISTS (SELECT * FROM deleted,UF
      WHERE
        /* %JoinFKPK(deleted,UF," = "," AND") */
        deleted.Cd_UF = UF.Cd_UF AND
        NOT EXISTS (
          SELECT * FROM Veiculo
          WHERE
            /* %JoinFKPK(Veiculo,UF," = "," AND") */
            Veiculo.Cd_UF = UF.Cd_UF
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Veiculo because UF exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Municipio  Veiculo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="Cd_Municipio" */
    IF EXISTS (SELECT * FROM deleted,Municipio
      WHERE
        /* %JoinFKPK(deleted,Municipio," = "," AND") */
        deleted.Cd_Municipio = Municipio.Cd_Municipio AND
        NOT EXISTS (
          SELECT * FROM Veiculo
          WHERE
            /* %JoinFKPK(Veiculo,Municipio," = "," AND") */
            Veiculo.Cd_Municipio = Municipio.Cd_Municipio
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Veiculo because Municipio exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* Transporte  Veiculo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transporte" */
    IF EXISTS (SELECT * FROM deleted,Transporte
      WHERE
        /* %JoinFKPK(deleted,Transporte," = "," AND") */
        deleted.Cd_Transporte = Transporte.Cd_Transporte AND
        NOT EXISTS (
          SELECT * FROM Veiculo
          WHERE
            /* %JoinFKPK(Veiculo,Transporte," = "," AND") */
            Veiculo.Cd_Transporte = Transporte.Cd_Transporte
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Veiculo because Transporte exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Veiculo ON Veiculo FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on Veiculo */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCd_Veiculo integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* UF  Veiculo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00041be4", PARENT_OWNER="", PARENT_TABLE="UF"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_123", FK_COLUMNS="Cd_UF" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_UF)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,UF
        WHERE
          /* %JoinFKPK(inserted,UF) */
          inserted.Cd_UF = UF.Cd_UF
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Veiculo because UF does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Municipio  Veiculo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Municipio"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_122", FK_COLUMNS="Cd_Municipio" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Municipio)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Municipio
        WHERE
          /* %JoinFKPK(inserted,Municipio) */
          inserted.Cd_Municipio = Municipio.Cd_Municipio
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Veiculo because Municipio does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* Transporte  Veiculo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Transporte"
    CHILD_OWNER="", CHILD_TABLE="Veiculo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_40", FK_COLUMNS="Cd_Transporte" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cd_Transporte)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Transporte
        WHERE
          /* %JoinFKPK(inserted,Transporte) */
          inserted.Cd_Transporte = Transporte.Cd_Transporte
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cd_Transporte IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Veiculo because Transporte does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go

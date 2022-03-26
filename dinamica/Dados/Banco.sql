SET SQL DIALECT 1;

/* CREATE DATABASE 'D:\Dinamica\Dados\DADOS.GDB' PAGE_SIZE 4096

 DEFAULT CHARACTER SET  */
/* Domain definitions */
CREATE DOMAIN COD_CLI AS INTEGER NOT NULL;
CREATE DOMAIN COD_COMP AS INTEGER NOT NULL;

/* Table: CAD_CLIENTES, Owner: SYSDBA */

CREATE TABLE CAD_CLIENTES 
(
  COD_CLI	COD_CLI NOT NULL,
  CPF_CLI	CHAR(24) NOT NULL,
  NOME_CLI	VARCHAR(256) CHARACTER SET WIN1251,
  ENDERECO_CLI	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_CLI	CHAR(90) CHARACTER SET WIN1251,
  CIDADE_CLI	CHAR(90) CHARACTER SET WIN1251,
  CEP_CLI	CHAR(12) CHARACTER SET WIN1251,
  UF_CLI	CHAR(2) CHARACTER SET WIN1251,
  FONE1_CLI	CHAR(12) CHARACTER SET WIN1251,
  FONE2_CLI	CHAR(12) CHARACTER SET WIN1251,
  CELULAR_CLI	CHAR(12) CHARACTER SET WIN1251,
  CONTATO_CLI	CHAR(30) CHARACTER SET WIN1251,
  EMPRESA_CLI	CHAR(90) CHARACTER SET WIN1251,
  END_COM_CLI	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_COM_CLI	CHAR(90) CHARACTER SET WIN1251,
  CIDADE_COM_CLI	CHAR(90) CHARACTER SET WIN1251,
  UF_COM_CLI	CHAR(2) CHARACTER SET WIN1251,
  FONE_COM_CLI	CHAR(12) CHARACTER SET WIN1251,
CONSTRAINT PK_CAD_CLIENTES PRIMARY KEY (COD_CLI)
);

/* Table: CAD_COBRAD, Owner: SYSDBA */

CREATE TABLE CAD_COBRAD 
(
  COD_COBRAD	INTEGER NOT NULL,
  NOME_CBR	CHAR(90) CHARACTER SET WIN1251,
  ENDERECO_CBR	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_CBR	CHAR(90) CHARACTER SET WIN1251,
  CIDADE_CBR	CHAR(90) CHARACTER SET WIN1251,
  CEP_CBR	CHAR(12) CHARACTER SET WIN1251,
  UF_CBR	CHAR(2) CHARACTER SET WIN1251,
  FONE_CBR	CHAR(12) CHARACTER SET WIN1251,
  CEL_CBR	CHAR(12) CHARACTER SET WIN1251,
CONSTRAINT PK_CAD_COBRAD PRIMARY KEY (COD_COBRAD)
);

/* Table: CAD_LOJAS, Owner: SYSDBA */

CREATE TABLE CAD_LOJAS 
(
  COD_LOJAS	INTEGER NOT NULL,
  NOME_LOJA	CHAR(90) CHARACTER SET WIN1251,
  RASAO_LOJA	CHAR(90) CHARACTER SET WIN1251,
  CNPJ_LOJA	CHAR(30) CHARACTER SET WIN1251,
  IE_LOJA	CHAR(30) CHARACTER SET WIN1251,
  ENDERECO_LOJA	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_LOJA	CHAR(90) CHARACTER SET WIN1251,
  CIDADE_LOJA	CHAR(90) CHARACTER SET WIN1251,
  CEP_LOJA	CHAR(12) CHARACTER SET WIN1251,
  UF_LOJA	CHAR(2) CHARACTER SET WIN1251,
  FONE_LOJA	CHAR(12) CHARACTER SET WIN1251,
  FONE1_LOJA	CHAR(12) CHARACTER SET WIN1251,
CONSTRAINT PK_CAD_LOJAS PRIMARY KEY (COD_LOJAS)
);

/* Table: CLIENTES, Owner: SYSDBA */

CREATE TABLE CLIENTES 
(
  COD_CLIENTES	INTEGER,
  CPF_CLIENTE	VARCHAR(11) CHARACTER SET WIN1251,
  NOME_CLIENTE	VARCHAR(90) CHARACTER SET WIN1251,
  ENDERECO_CLIENTE	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_CLIENTE	VARCHAR(90) CHARACTER SET WIN1251,
  CIDADE_CLIENTE	VARCHAR(90) CHARACTER SET WIN1251,
  CEP_CLIENTE	CHAR(10) CHARACTER SET WIN1251,
  UF_CLIENTE	CHAR(2) CHARACTER SET WIN1251,
  CARNET_CLIENTE	VARCHAR(12) CHARACTER SET WIN1251,
  PARCELA_CLIENTE	INTEGER,
  DATA_COMPRA_CLIENTE	TIMESTAMP,
  VENCIMENTO	TIMESTAMP,
  VALOR_PARCELA	VARCHAR(8),
  TIPO_PAG	CHAR(2) CHARACTER SET WIN1251,
  END_COMERC	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRRO_COMER	VARCHAR(90) CHARACTER SET WIN1251,
  NUM_PARCELAS	INTEGER,
  UF_COMERCIAL	CHAR(2) CHARACTER SET WIN1251,
  TELEFONE__1	CHAR(16) CHARACTER SET WIN1251,
  TELEFONE_2	CHAR(16) CHARACTER SET WIN1251,
  CONTATO	VARCHAR(90) CHARACTER SET WIN1251,
  EMPRESA	VARCHAR(90) CHARACTER SET WIN1251,
  FUNCAO_CLIENTE	CHAR(90) CHARACTER SET WIN1251,
  PG	SMALLINT
);

/* Table: IMPORTACOES, Owner: SYSDBA */

CREATE TABLE IMPORTACOES 
(
  COD_IMPORT	INTEGER NOT NULL,
  NOME_ARQUIVO	CHAR(30) CHARACTER SET WIN1251,
  DATA	TIMESTAMP,
CONSTRAINT PK_IMPORTACOES PRIMARY KEY (COD_IMPORT)
);

/* Table: PARCELAS, Owner: SYSDBA */

CREATE TABLE PARCELAS 
(
  COD_PARCE	INTEGER NOT NULL,
  CPF_CLI	CHAR(24) CHARACTER SET WIN1251,
  VENC_PARCE	INTEGER,
  VALOR_PARCE	DOUBLE PRECISION,
  ESTATUS_PARCE	SMALLINT,
  DATA_PAG_PARCE	TIMESTAMP,
  VALOR_PG_PARCE	DOUBLE PRECISION,
  OBS_PARCE	VARCHAR(500) CHARACTER SET WIN1251,
  PARCELA_DE_PARCELAS	CHAR(7) CHARACTER SET WIN1251,
  NUM_CARNET	INTEGER,
  DATA_COMPRA	TIMESTAMP,
  COD_LOJA	INTEGER,
CONSTRAINT PK_PARCELAS PRIMARY KEY (COD_PARCE)
);

/* Table: REF_CLIENTES, Owner: SYSDBA */

CREATE TABLE REF_CLIENTES 
(
  COD_REF	INTEGER NOT NULL,
  CPF_CLI	INTEGER,
  NOME_REF	CHAR(90) CHARACTER SET WIN1251,
  ENDERECO_REF	VARCHAR(256) CHARACTER SET WIN1251,
  BAIRO_REF	CHAR(90) CHARACTER SET WIN1251,
  CIDADE_REF	CHAR(90) CHARACTER SET WIN1251,
  CEP_REF	CHAR(12) CHARACTER SET WIN1251,
  UF_REF	CHAR(2) CHARACTER SET WIN1251,
  FONE1_REF	CHAR(12) CHARACTER SET WIN1251,
  FONE2_REF	CHAR(12) CHARACTER SET WIN1251,
  CELULAR_REF	CHAR(12) CHARACTER SET WIN1251,
  CONTATO_REF	CHAR(30) CHARACTER SET WIN1251,
CONSTRAINT PK_REF_CLIENTES PRIMARY KEY (COD_REF)
);

/* Table: RENEGOCIAC, Owner: SYSDBA */

CREATE TABLE RENEGOCIAC 
(
  COD_RENEG	INTEGER NOT NULL,
  COD_COMPRA	INTEGER,
  CPF_CLI	CHAR(24) CHARACTER SET WIN1251,
  VENC_RENEG	INTEGER,
  VALOR_RENEG	DOUBLE PRECISION,
  ESTATUS_RENEG	SMALLINT,
  DATA_PG_RENEG	TIMESTAMP,
  VALOR_PG_RENEG	DOUBLE PRECISION,
  PARCELA_DE_RENEGOCIAC	CHAR(6) CHARACTER SET WIN1251,
  PG	SMALLINT,
CONSTRAINT PK_RENEGOCIAC PRIMARY KEY (COD_RENEG)
);

/*  Index definitions for all user tables */

CREATE INDEX IDX_CAD_CLIENTES ON CAD_CLIENTES(CPF_CLI);
CREATE INDEX IDX_CLIENTES ON CLIENTES(CPF_CLIENTE);
CREATE INDEX IDX_CLIENTES1 ON CLIENTES(CARNET_CLIENTE);

CREATE GENERATOR CAD_CLIENTES_COD_CLI_GEN;
CREATE GENERATOR CAD_COBRAD_COD_COBRAD_GEN;
CREATE GENERATOR CAD_LOJAS_COD_LOJAS_GEN;
CREATE GENERATOR CLIENTES_COD_CLIENTES_GEN;
CREATE GENERATOR IMPORTACOES_COD_IMPORT_GEN;
CREATE GENERATOR PARCELAS_COD_PARCE_GEN;
CREATE GENERATOR REF_CLIENTES_COD_REF_GEN;
CREATE GENERATOR RENEGOCIAC_COD_RENEG_GEN;
COMMIT WORK;
SET AUTODDL OFF;
SET TERM ^ ;

/* Stored procedures */

CREATE PROCEDURE CAD_CLIENTES_COD_CLI_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE CAD_COBRAD_COD_COBRAD_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE CAD_LOJAS_COD_LOJAS_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE CLIENTES_COD_CLIENTES_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE IMPORTACOES_COD_IMPORT_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE PARCELAS_COD_PARCE_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE REF_CLIENTES_COD_REF_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^

CREATE PROCEDURE RENEGOCIAC_COD_RENEG_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN EXIT; END ^


ALTER PROCEDURE CAD_CLIENTES_COD_CLI_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(CAD_CLIENTES_COD_CLI_GEN, 1);
END
 ^


ALTER PROCEDURE CAD_COBRAD_COD_COBRAD_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(CAD_COBRAD_COD_COBRAD_GEN, 1);
END
 ^


ALTER PROCEDURE CAD_LOJAS_COD_LOJAS_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(CAD_LOJAS_COD_LOJAS_GEN, 1);
END
 ^


ALTER PROCEDURE CLIENTES_COD_CLIENTES_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(CLIENTES_COD_CLIENTES_GEN, 1);
END
 ^


ALTER PROCEDURE IMPORTACOES_COD_IMPORT_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(IMPORTACOES_COD_IMPORT_GEN, 1);
END
 ^


ALTER PROCEDURE PARCELAS_COD_PARCE_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(PARCELAS_COD_PARCE_GEN, 1);
END
 ^


ALTER PROCEDURE REF_CLIENTES_COD_REF_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(REF_CLIENTES_COD_REF_GEN, 1);
END
 ^


ALTER PROCEDURE RENEGOCIAC_COD_RENEG_AUTOINC 
RETURNS
(
  NEW_VALUE INTEGER
)
AS
BEGIN
  NEW_VALUE = GEN_ID(RENEGOCIAC_COD_RENEG_GEN, 1);
END
 ^

SET TERM ; ^
COMMIT WORK;
SET AUTODDL ON;
SET TERM ^ ;


/* Triggers only will work for SQL triggers */

CREATE TRIGGER AI_CAD_CLIENTES_COD_CLI FOR CAD_CLIENTES 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_CLI IS NULL) THEN
      NEW.COD_CLI = GEN_ID(CAD_CLIENTES_COD_CLI_GEN, 1);
END
 ^

CREATE TRIGGER AI_CAD_COBRAD_COD_COBRAD FOR CAD_COBRAD 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_COBRAD IS NULL) THEN
      NEW.COD_COBRAD = GEN_ID(CAD_COBRAD_COD_COBRAD_GEN, 1);
END
 ^

CREATE TRIGGER AI_CAD_LOJAS_COD_LOJAS FOR CAD_LOJAS 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_LOJAS IS NULL) THEN
      NEW.COD_LOJAS = GEN_ID(CAD_LOJAS_COD_LOJAS_GEN, 1);
END
 ^

CREATE TRIGGER AI_CLIENTES_COD_CLIENTES FOR CLIENTES 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_CLIENTES IS NULL) THEN
      NEW.COD_CLIENTES = GEN_ID(CLIENTES_COD_CLIENTES_GEN, 1);
END
 ^

CREATE TRIGGER AI_IMPORTACOES_COD_IMPORT FOR IMPORTACOES 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_IMPORT IS NULL) THEN
      NEW.COD_IMPORT = GEN_ID(IMPORTACOES_COD_IMPORT_GEN, 1);
END
 ^

CREATE TRIGGER AI_PARCELAS_COD_PARCE FOR PARCELAS 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_PARCE IS NULL) THEN
      NEW.COD_PARCE = GEN_ID(PARCELAS_COD_PARCE_GEN, 1);
END
 ^

CREATE TRIGGER AI_REF_CLIENTES_COD_REF FOR REF_CLIENTES 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_REF IS NULL) THEN
      NEW.COD_REF = GEN_ID(REF_CLIENTES_COD_REF_GEN, 1);
END
 ^

CREATE TRIGGER AI_RENEGOCIAC_COD_RENEG FOR RENEGOCIAC 
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.COD_RENEG IS NULL) THEN
      NEW.COD_RENEG = GEN_ID(RENEGOCIAC_COD_RENEG_GEN, 1);
END
 ^

COMMIT WORK ^
SET TERM ;^

/* Grant Roles for this database */


/* Grant permissions for this database */


/*===========================================================================*/
/*Metadata Extract performed 28-mar-2004 20:40                               */
/*===========================================================================*/

/*===========================================================================*/
/*Create Database                                                            */
/*===========================================================================*/
create database 'D:\Dinamica\Dados\DADOS.GDB' user 'SYSDBA' page_size = 4096;



/*===========================================================================*/
/*Domain Definitions                                                         */
/*===========================================================================*/
create domain COD_CLI as integer not null;
create domain COD_COMP as integer not null;


/*===========================================================================*/
/*Generators                                                                 */
/*===========================================================================*/
create generator cad_clientes_cod_cli_gen;
create generator cad_cobrad_cod_cobrad_gen;
create generator cad_lojas_cod_lojas_gen;
create generator clientes_cod_clientes_gen;
create generator importacoes_cod_import_gen;
create generator parcelas_cod_parce_gen;
create generator ref_clientes_cod_ref_gen;
create generator renegociac_cod_reneg_gen;


/*===========================================================================*/
/*Table Definitions                                                          */
/*===========================================================================*/

/*Table: CAD_CLIENTES*/
create table cad_clientes(
     COD_CLI COD_CLI not null,
     CPF_CLI char(24) not null,
     NOME_CLI varchar(256) character set WIN1251,
     ENDERECO_CLI varchar(256) character set WIN1251,
     BAIRRO_CLI char(90) character set WIN1251,
     CIDADE_CLI char(90) character set WIN1251,
     CEP_CLI char(12) character set WIN1251,
     UF_CLI char(2) character set WIN1251,
     FONE1_CLI char(12) character set WIN1251,
     FONE2_CLI char(12) character set WIN1251,
     CELULAR_CLI char(12) character set WIN1251,
     CONTATO_CLI char(30) character set WIN1251,
     EMPRESA_CLI char(90) character set WIN1251,
     END_COM_CLI varchar(256) character set WIN1251,
     BAIRRO_COM_CLI char(90) character set WIN1251,
     CIDADE_COM_CLI char(90) character set WIN1251,
     UF_COM_CLI char(2) character set WIN1251,
     FONE_COM_CLI char(12) character set WIN1251);




/*Table: CAD_COBRAD*/
create table cad_cobrad(
     COD_COBRAD integer not null,
     NOME_CBR char(90) character set WIN1251,
     ENDERECO_CBR varchar(256) character set WIN1251,
     BAIRRO_CBR char(90) character set WIN1251,
     CIDADE_CBR char(90) character set WIN1251,
     CEP_CBR char(12) character set WIN1251,
     UF_CBR char(2) character set WIN1251,
     FONE_CBR char(12) character set WIN1251,
     CEL_CBR char(12) character set WIN1251);




/*Table: CAD_LOJAS*/
create table cad_lojas(
     COD_LOJAS integer not null,
     NOME_LOJA char(90) character set WIN1251,
     RASAO_LOJA char(90) character set WIN1251,
     CNPJ_LOJA char(30) character set WIN1251,
     IE_LOJA char(30) character set WIN1251,
     ENDERECO_LOJA varchar(256) character set WIN1251,
     BAIRRO_LOJA char(90) character set WIN1251,
     CIDADE_LOJA char(90) character set WIN1251,
     CEP_LOJA char(12) character set WIN1251,
     UF_LOJA char(2) character set WIN1251,
     FONE_LOJA char(12) character set WIN1251,
     FONE1_LOJA char(12) character set WIN1251);




/*Table: CLIENTES*/
create table clientes(
     COD_CLIENTES integer,
     CPF_CLIENTE varchar(11) character set WIN1251,
     NOME_CLIENTE varchar(90) character set WIN1251,
     ENDERECO_CLIENTE varchar(256) character set WIN1251,
     BAIRRO_CLIENTE varchar(90) character set WIN1251,
     CIDADE_CLIENTE varchar(90) character set WIN1251,
     CEP_CLIENTE char(10) character set WIN1251,
     UF_CLIENTE char(2) character set WIN1251,
     CARNET_CLIENTE varchar(12) character set WIN1251,
     PARCELA_CLIENTE integer,
     DATA_COMPRA_CLIENTE date,
     VENCIMENTO date,
     VALOR_PARCELA varchar(8),
     TIPO_PAG char(2) character set WIN1251,
     END_COMERC varchar(256) character set WIN1251,
     BAIRRO_COMER varchar(90) character set WIN1251,
     NUM_PARCELAS integer,
     UF_COMERCIAL char(2) character set WIN1251,
     TELEFONE__1 char(16) character set WIN1251,
     TELEFONE_2 char(16) character set WIN1251,
     CONTATO varchar(90) character set WIN1251,
     EMPRESA varchar(90) character set WIN1251,
     FUNCAO_CLIENTE char(90) character set WIN1251,
     PG smallint);




/*Table: IMPORTACOES*/
create table importacoes(
     COD_IMPORT integer not null,
     NOME_ARQUIVO char(30) character set WIN1251,
     DATA date);




/*Table: PARCELAS*/
create table parcelas(
     COD_PARCE integer not null,
     CPF_CLI char(24) character set WIN1251,
     VENC_PARCE integer,
     VALOR_PARCE double precision,
     ESTATUS_PARCE smallint,
     DATA_PAG_PARCE date,
     VALOR_PG_PARCE double precision,
     OBS_PARCE varchar(500) character set WIN1251,
     PARCELA_DE_PARCELAS char(7) character set WIN1251,
     NUM_CARNET integer,
     DATA_COMPRA date,
     COD_LOJA integer);




/*Table: REF_CLIENTES*/
create table ref_clientes(
     COD_REF integer not null,
     CPF_CLI integer,
     NOME_REF char(90) character set WIN1251,
     ENDERECO_REF varchar(256) character set WIN1251,
     BAIRO_REF char(90) character set WIN1251,
     CIDADE_REF char(90) character set WIN1251,
     CEP_REF char(12) character set WIN1251,
     UF_REF char(2) character set WIN1251,
     FONE1_REF char(12) character set WIN1251,
     FONE2_REF char(12) character set WIN1251,
     CELULAR_REF char(12) character set WIN1251,
     CONTATO_REF char(30) character set WIN1251);




/*Table: RENEGOCIAC*/
create table renegociac(
     COD_RENEG integer not null,
     COD_COMPRA integer,
     CPF_CLI char(24) character set WIN1251,
     VENC_RENEG integer,
     VALOR_RENEG double precision,
     ESTATUS_RENEG smallint,
     DATA_PG_RENEG date,
     VALOR_PG_RENEG double precision,
     PARCELA_DE_RENEGOCIAC char(6) character set WIN1251,
     PG smallint);





/*===========================================================================*/
/*Table Data                                                                 */
/*===========================================================================*/


/*===========================================================================*/
/*Stored Procedure Definitions                                               */
/*===========================================================================*/
commit work;
set autoddl off;
set term ^;

create procedure cad_clientes_cod_cli_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure cad_cobrad_cod_cobrad_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure cad_lojas_cod_lojas_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure clientes_cod_clientes_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure importacoes_cod_import_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure parcelas_cod_parce_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure ref_clientes_cod_ref_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




create procedure renegociac_cod_reneg_autoinc 
returns (NEW_VALUE integer)
as
begin
  exit;
end
^




commit work^
set autoddl on^
set term ;^


/*===========================================================================*/
/*Trigger Definitions                                                        */
/*===========================================================================*/
commit work;
set autoddl off;
set term ^;

create trigger ai_cad_clientes_cod_cli for CAD_CLIENTES active before insert position 0 AS
BEGIN
  IF (NEW.COD_CLI IS NULL) THEN
      NEW.COD_CLI = GEN_ID(CAD_CLIENTES_COD_CLI_GEN, 1);
END^




create trigger ai_cad_cobrad_cod_cobrad for CAD_COBRAD active before insert position 0 AS
BEGIN
  IF (NEW.COD_COBRAD IS NULL) THEN
      NEW.COD_COBRAD = GEN_ID(CAD_COBRAD_COD_COBRAD_GEN, 1);
END^




create trigger ai_cad_lojas_cod_lojas for CAD_LOJAS active before insert position 0 AS
BEGIN
  IF (NEW.COD_LOJAS IS NULL) THEN
      NEW.COD_LOJAS = GEN_ID(CAD_LOJAS_COD_LOJAS_GEN, 1);
END^




create trigger ai_clientes_cod_clientes for CLIENTES active before insert position 0 AS
BEGIN
  IF (NEW.COD_CLIENTES IS NULL) THEN
      NEW.COD_CLIENTES = GEN_ID(CLIENTES_COD_CLIENTES_GEN, 1);
END^




create trigger ai_importacoes_cod_import for IMPORTACOES active before insert position 0 AS
BEGIN
  IF (NEW.COD_IMPORT IS NULL) THEN
      NEW.COD_IMPORT = GEN_ID(IMPORTACOES_COD_IMPORT_GEN, 1);
END^




create trigger ai_parcelas_cod_parce for PARCELAS active before insert position 0 AS
BEGIN
  IF (NEW.COD_PARCE IS NULL) THEN
      NEW.COD_PARCE = GEN_ID(PARCELAS_COD_PARCE_GEN, 1);
END^




create trigger ai_ref_clientes_cod_ref for REF_CLIENTES active before insert position 0 AS
BEGIN
  IF (NEW.COD_REF IS NULL) THEN
      NEW.COD_REF = GEN_ID(REF_CLIENTES_COD_REF_GEN, 1);
END^




create trigger ai_renegociac_cod_reneg for RENEGOCIAC active before insert position 0 AS
BEGIN
  IF (NEW.COD_RENEG IS NULL) THEN
      NEW.COD_RENEG = GEN_ID(RENEGOCIAC_COD_RENEG_GEN, 1);
END^





commit work^
set autoddl on^
set term ;^



/*===========================================================================*/
/*Stored Procedure Definitions                                               */
/*===========================================================================*/
commit work;
set autoddl off;
set term ^;

alter procedure cad_clientes_cod_cli_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(CAD_CLIENTES_COD_CLI_GEN, 1);
END
^




alter procedure cad_cobrad_cod_cobrad_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(CAD_COBRAD_COD_COBRAD_GEN, 1);
END
^




alter procedure cad_lojas_cod_lojas_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(CAD_LOJAS_COD_LOJAS_GEN, 1);
END
^




alter procedure clientes_cod_clientes_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(CLIENTES_COD_CLIENTES_GEN, 1);
END
^




alter procedure importacoes_cod_import_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(IMPORTACOES_COD_IMPORT_GEN, 1);
END
^




alter procedure parcelas_cod_parce_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(PARCELAS_COD_PARCE_GEN, 1);
END
^




alter procedure ref_clientes_cod_ref_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(REF_CLIENTES_COD_REF_GEN, 1);
END
^




alter procedure renegociac_cod_reneg_autoinc 
returns (NEW_VALUE integer)
as
BEGIN
  NEW_VALUE = GEN_ID(RENEGOCIAC_COD_RENEG_GEN, 1);
END
^




commit work^
set autoddl on^
set term ;^


/*===========================================================================*/
/*Table Constraints                                                          */
/*===========================================================================*/
/*===========================================================================*/
/*Table Primary Key Definitions                                              */
/*===========================================================================*/
alter table cad_clientes add constraint PK_CAD_CLIENTES primary key (COD_CLI);
alter table cad_cobrad add constraint PK_CAD_COBRAD primary key (COD_COBRAD);
alter table cad_lojas add constraint PK_CAD_LOJAS primary key (COD_LOJAS);
alter table importacoes add constraint PK_IMPORTACOES primary key (COD_IMPORT);
alter table parcelas add constraint PK_PARCELAS primary key (COD_PARCE);
alter table ref_clientes add constraint PK_REF_CLIENTES primary key (COD_REF);
alter table renegociac add constraint PK_RENEGOCIAC primary key (COD_RENEG);
/*===========================================================================*/
/*Table Foreign Key Definitions                                              */
/*===========================================================================*/


/*===========================================================================*/
/*Table Indexes                                                              */
/*===========================================================================*/
/*===========================================================================*/
/*Table Index Definitions                                                    */
/*===========================================================================*/
create index IDX_CAD_CLIENTES on cad_clientes(CPF_CLI);

/*===========================================================================*/
/*Table Grants                                                               */
/*===========================================================================*/
/*===========================================================================*/
/*View Grants                                                                */
/*===========================================================================*/
/*===========================================================================*/
/*Stored Procedure Grants                                                    */
/*===========================================================================*/

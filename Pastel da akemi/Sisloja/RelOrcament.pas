{ QuickReport master detail template }

unit RelOrcament;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  TfrmrelremOrca = class(TQuickRep)
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    MasterDS: TDataSource;
    qryvendas: TQuery;
    qryitens: TQuery;
    qryitensPEDIDO: TIntegerField;
    qryitensPRODUTO: TIntegerField;
    qryitensValUnitario: TCurrencyField;
    qryitensDESCRICAO: TStringField;
    qryitensVALTOTAL: TCurrencyField;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLABEL15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape11: TQRShape;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRImage1: TQRImage;
    QRShape8: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    qryvendasPEDIDO: TIntegerField;
    qryvendasNOTA: TStringField;
    qryvendasDATA: TDateField;
    qryvendasPRAZO: TIntegerField;
    qryvendasVALOR: TCurrencyField;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText12: TQRDBText;
    qryvendasDATAALTERACAO: TDateField;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    qryvendasVENDEDOR: TIntegerField;
    qryvendasCLIENTE: TIntegerField;
    qryitensQUANTIDADE: TIntegerField;
    qryitensCLIENTE: TIntegerField;
    qryitensDESCRICAO_1: TStringField;
    qryitensVALTOTAL_1: TFloatField;
    Table1: TTable;
    Table1CODIGO: TIntegerField;
    Table1NOME: TStringField;
    Table1NOMEFANTASIA: TStringField;
    Table1ENDERECO: TStringField;
    Table1CIDADE: TStringField;
    Table1ESTADO: TStringField;
    Table1TELEFONE: TStringField;
    Table1FAX: TStringField;
    Table1EMAIL: TStringField;
    Table1CGC: TStringField;
    Table1PRAZO: TIntegerField;
    Table1RGINSC: TStringField;
    Table1STATUS: TStringField;
    Table1LIMITE: TFloatField;
    Table1TIPO: TIntegerField;
    Table1CONTATO: TStringField;
    Table1CELULAR: TStringField;
    Table1CEP: TStringField;
    Table1DATACAD: TDateTimeField;
    qryvendasNOMEVEND: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelremOrca: TfrmrelremOrca;

implementation
uses datamod;
{$R *.DFM}










end.

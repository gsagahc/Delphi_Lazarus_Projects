{ QuickReport master detail template }

unit RelOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  TFrmRelOrca = class(TQuickRep)
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    MasterDS: TDataSource;
    qryvendas: TQuery;
    qryitens: TQuery;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape11: TQRShape;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRImage1: TQRImage;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText3: TQRDBText;
    Table1: TTable;
    Table1Codigo: TIntegerField;
    Table1Nome: TStringField;
    Table1NomeFantasia: TStringField;
    QRDBText13: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel43: TQRLabel;
    Table1Telefone: TStringField;
    Table1Fax: TStringField;
    Table1EMail: TStringField;
    QRLabel44: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText16: TQRDBText;
    Table1Contato: TStringField;
    Table1Celular: TStringField;
    QRLabel46: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel23: TQRLabel;
    qryvendasDATAALTERACAO: TDateTimeField;
    qryvendasPEDIDO: TIntegerField;
    qryvendasNOTA: TStringField;
    qryvendasDATA: TDateTimeField;
    qryvendasVENDEDOR: TIntegerField;
    qryvendasCLIENTE: TIntegerField;
    qryvendasPRAZO: TIntegerField;
    qryvendasVALOR: TFloatField;
    qryvendasCODIGO: TIntegerField;
    qryvendasNOME: TStringField;
    qryvendasROTEIRO: TMemoField;
    qryitensPEDIDO: TIntegerField;
    qryitensPRODUTO: TIntegerField;
    qryitensQUANTIDADE: TIntegerField;
    qryitensVALUNITARIO: TFloatField;
    qryitensCLIENTE: TIntegerField;
    qryitensVALTOTAL: TFloatField;
    qryitensDESCRICAO: TStringField;
    qryitensNUMERO: TIntegerField;
    qryitensCODIGO: TIntegerField;
    qryitensDESCRICAO_1: TStringField;
    qryitensCODBARRAS: TStringField;
    qryitensPRECO: TFloatField;
    qryitensCUSTO: TFloatField;
    qryitensFORNECEDOR: TIntegerField;
    qryitensDATACADASTRO: TDateTimeField;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    qryvendasBAIRRO: TStringField;
    qryvendasCIDADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOrca: TFrmRelOrca;

implementation

{$R *.DFM}










end.

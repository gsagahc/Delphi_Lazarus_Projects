{ QuickReport master detail template }

unit relrem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  Tfrmrelrem = class(TQuickRep)
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
    qryvendasPEDIDO: TIntegerField;
    qryvendasDATA: TDateTimeField;
    qryvendasVALOR: TFloatField;
    qryvendasCLIENTE: TIntegerField;
    qryvendasVENDEDOR: TIntegerField;
    qryvendasPRAZO: TIntegerField;
    qryvendasNOTA: TStringField;
    qryvendasDATAALTERACAO: TDateTimeField;
    qryvendasNOME: TStringField;
    qryitensPEDIDO: TIntegerField;
    qryitensPRODUTO: TIntegerField;
    qryitensQUANTITADE: TIntegerField;
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
    qryvendasCODIGO: TIntegerField;
    qryvendasNOME_1: TStringField;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    qryvendasROTEIRO: TMemoField;
    QRMemo1: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    qryvendasCEP: TStringField;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    qryvendasCIDADE: TStringField;
    qryvendasBAIRRO: TStringField;
    QRLabel29: TQRLabel;
    QRDBText20: TQRDBText;
    qryvendasNOMEFANTASIA: TStringField;
    qryvendasENDERECO: TStringField;
    qryvendasESTADO: TStringField;
    qryvendasTELEFONE: TStringField;
    qryvendasFAX: TStringField;
    qryvendasEMAIL: TStringField;
    qryvendasCGC: TStringField;
    qryvendasPRAZO_1: TIntegerField;
    qryvendasRGINSC: TStringField;
    qryvendasSTATUS: TStringField;
    qryvendasLIMITE: TFloatField;
    qryvendasTIPO: TIntegerField;
    qryvendasCONTATO: TStringField;
    qryvendasCELULAR: TStringField;
    qryvendasDATACAD: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelrem: Tfrmrelrem;

implementation

{$R *.DFM}










end.

{ QuickReport master detail template }
unit ImprimePedSCMatricial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, IBCustomDataSet, IBQuery;

type
  TFrmPrinPedSCMatric = class(TQuickRep)
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    MasterDS: TDataSource;
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
    QRDBText10: TQRDBText;
    QRLABEL15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape11: TQRShape;
    QRLabel27: TQRLabel;
    QRShape12: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel40: TQRLabel;
    Table1: TTable;
    Table1Codigo: TIntegerField;
    Table1Nome: TStringField;
    Table1NomeFantasia: TStringField;
    QRLabel43: TQRLabel;
    Table1Telefone: TStringField;
    Table1Fax: TStringField;
    Table1EMail: TStringField;
    Table1Contato: TStringField;
    Table1Celular: TStringField;
    QRLabel22: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    IBQVendas: TIBQuery;
    IBQItens: TIBQuery;
    QRDBText14: TQRDBText;
    IBQVendasPEDIDO: TIntegerField;
    IBQVendasNOTA: TIBStringField;
    IBQVendasDATA: TDateTimeField;
    IBQVendasCLIENTE: TIBStringField;
    IBQVendasVALOR: TFloatField;
    IBQVendasNUMERO: TIBStringField;
    IBQItensPEDIDO: TIntegerField;
    IBQItensPRODUTO: TIntegerField;
    IBQItensQUANTIDADE: TIntegerField;
    IBQItensVALUNITARIO: TFloatField;
    IBQItensVALTOTAL: TFloatField;
    IBQItensCLIENTE: TIntegerField;
    IBQItensDESCRICAO: TIBStringField;
    IBQItensNUMERO: TIBStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrinPedSCMatric: TFrmPrinPedSCMatric;

implementation
  Uses Datamod;
{$R *.DFM}










end.

unit relcli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  relato, Db, DBTables, Qrctrls, quickrpt, ExtCtrls;

type
  Tfrmrelcli1 = class(Tfrmrelato)
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    Query1CODIGO: TIntegerField;
    Query1NOME: TStringField;
    Query1NOMEFANTASIA: TStringField;
    Query1ENDERECO: TStringField;
    Query1CIDADE: TStringField;
    Query1ESTADO: TStringField;
    Query1TELEFONE: TStringField;
    Query1FAX: TStringField;
    Query1EMAIL: TStringField;
    Query1CGC: TStringField;
    Query1PRAZO: TIntegerField;
    Query1RGINSC: TStringField;
    Query1STATUS: TStringField;
    Query1LIMITE: TFloatField;
    Query1TIPO: TIntegerField;
    Query1CONTATO: TStringField;
    Query1CELULAR: TStringField;
    Query1CEP: TStringField;
    Query1DATACAD: TDateTimeField;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    Query1BAIRRO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelcli1: Tfrmrelcli1;

implementation

{$R *.DFM}




end.

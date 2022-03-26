unit Relpro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  relato, Qrctrls, Db, DBTables, quickrpt, ExtCtrls;

type
  Tfrmrelpro = class(Tfrmrelato)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    Query1NUMERO: TIntegerField;
    Query1CODIGO: TIntegerField;
    Query1DESCRICAO: TStringField;
    Query1CODBARRAS: TStringField;
    Query1PRECO: TFloatField;
    Query1CUSTO: TFloatField;
    Query1FORNECEDOR: TIntegerField;
    Query1DATACADASTRO: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelpro: Tfrmrelpro;

implementation

{$R *.DFM}

end.

unit Reltab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  relato, Db, DBTables, Qrctrls, quickrpt, ExtCtrls;

type
  Tfrmreltab = class(Tfrmrelato)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Query1CODIGO: TIntegerField;
    Query1DESCRICAO: TStringField;
    Query1PRECO: TCurrencyField;
    Query1FORNECEDOR: TIntegerField;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreltab: Tfrmreltab;

implementation

{$R *.DFM}

end.

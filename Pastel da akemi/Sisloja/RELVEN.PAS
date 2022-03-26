unit Relven;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  relato, Db, DBTables, Qrctrls, quickrpt, ExtCtrls;

type
  Tfrmrelven = class(Tfrmrelato)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    Query1Endereco: TStringField;
    Query1Cidade: TStringField;
    Query1Estado: TStringField;
    Query1Cep: TStringField;
    Query1Telefone: TStringField;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelven: Tfrmrelven;

implementation

{$R *.DFM}

end.

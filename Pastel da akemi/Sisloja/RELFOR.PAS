{ QuickReport list template }

unit relfor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  Tfrmrelfor = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Query1: TQuery;
    QRSysData2: TQRSysData;
    qrlbtitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    Query1Endereco: TStringField;
    Query1Cidade: TStringField;
    Query1Estado: TStringField;
    Query1Cep: TStringField;
    Query1Telefone: TStringField;
    Query1Fax: TStringField;
    Query1EMail: TStringField;
    Query1Cgc: TStringField;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfor: Tfrmrelfor;

implementation

{$R *.DFM}

end.

{ QuickReport list template }

unit relpag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  Tfrmrelpag = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
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
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    Query1: TQuery;
    Query1NUMERO: TIntegerField;
    Query1FORNECEDOR: TStringField;
    Query1VENCTO: TDateTimeField;
    Query1VALOR: TFloatField;
    Query1PAGTO: TDateTimeField;
    Query1PAGO: TStringField;
    Query1NOTAFISCAL: TIntegerField;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelpag: Tfrmrelpag;

implementation

uses relrec;



{$R *.DFM}

end.

unit RelVendasporVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TFormRelVende = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlbtitulo: TQRLabel;
    QRImage1: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    Query1: TQuery;
    Query1Pedido: TIntegerField;
    Query1Valor: TCurrencyField;
    Query1Codven: TIntegerField;
    Query1Prazo: TIntegerField;
    Query1Nota: TStringField;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    Query1DataAlteracao: TDateField;
    QRLabel6: TQRLabel;
    Query1CLIENTE: TIntegerField;
    Query1VENDEDOR: TIntegerField;
    Query1NOME: TStringField;
    Query1DATA: TDateTimeField;
  private
    { Private declarations }
  public
    TotalGeral:Currency;
    { Public declarations }
  end;

var
  FormRelVende: TFormRelVende;

implementation

uses SelVendasporVendedor, DataMod;


{$R *.dfm}

end.

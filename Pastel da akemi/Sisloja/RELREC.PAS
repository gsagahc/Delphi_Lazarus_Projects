{ QuickReport list template }

unit relrec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  Tfrmrelrec = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlbtitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    QRLabel7: TQRLabel;
    Query1: TQuery;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Query2: TQuery;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    Query2CONTARECVENCTO: TDateTimeField;
    Query2CONTARECVALOR: TFloatField;
    Query2CONTARECPAGO: TStringField;
    Query2CONTARECPAGTO: TDateTimeField;
    Query2CONTARECDATAPED: TDateTimeField;
    Query2CLIENTESNOME: TStringField;
    QrySyscheque: TQuery;
    QrySyschequeTIPO: TStringField;
    QrySyschequeDT_EMISSAO: TDateTimeField;
    QrySyschequeDT_VENCIMENTO: TDateTimeField;
    QrySyschequeDT_COMPENSACAO: TDateTimeField;
    QrySyschequeEMITENTE: TStringField;
    QrySyschequeCLIENTE: TStringField;
    QrySyschequeSTATUS: TStringField;
    Query2CONTARECPEDIDO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelrec: Tfrmrelrec;

implementation

{$R *.DFM}




end.

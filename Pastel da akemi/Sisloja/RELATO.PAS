{ QuickReport list template }

unit relato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  Tfrmrelato = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Query1: TQuery;
    QRSysData2: TQRSysData;
    qrlbtitulo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelato: Tfrmrelato;

implementation

{$R *.DFM}

end.

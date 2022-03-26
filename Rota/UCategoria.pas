unit UCategoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFrmCategoria = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRMemo1: TQRMemo;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBImage1: TQRDBImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCategoria: TFrmCategoria;

implementation
Uses UMain;
{$R *.DFM}

procedure TFrmCategoria.FormShow(Sender: TObject);
begin
   FrmMain.IBTbCategoria.OPen; 
end;

procedure TFrmCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FrmMain.IBTbCategoria.Close;
     FrmMain.IbTbConfig.Close;
end;

procedure TFrmCategoria.FormCreate(Sender: TObject);
begin
  FrmMain.IbTbConfig.Open;
end;

end.

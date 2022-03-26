unit UImpressaoAniv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TFrmImpressaoAniv = class(TForm)
    RLReport1: TRLReport;
    RLBand2: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressaoAniv: TFrmImpressaoAniv;

implementation
Uses UAniversariantes;

{$R *.dfm}

end.

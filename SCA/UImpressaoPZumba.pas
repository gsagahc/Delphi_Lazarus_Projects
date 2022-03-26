unit UImpressaoPZumba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TFrmImpressaoPZumba = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    RLLabelTitulo: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    RLLabel7: TRLLabel;
    RLLabelBairro: TRLLabel;
    RLLabelLocal: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressaoPZumba: TFrmImpressaoPZumba;

implementation
Uses UConsultarPZumba;

{$R *.dfm}

end.

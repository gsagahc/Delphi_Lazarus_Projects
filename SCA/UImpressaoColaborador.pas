unit UImpressaoColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TFrmImpressaoPRua = class(TForm)
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
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBMemo1: TRLDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressaoPRua: TFrmImpressaoPRua;

implementation
Uses UConsultarAtendColaborador;

{$R *.dfm}

end.

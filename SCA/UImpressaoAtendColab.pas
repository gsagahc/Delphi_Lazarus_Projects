unit UImpressaoAtendColab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmImpressaoAtendColab = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpressaoAtendColab: TFrmImpressaoAtendColab;

implementation
USES UConsultarAtendColaborador;
{$R *.dfm}

end.

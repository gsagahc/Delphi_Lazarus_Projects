unit ShowCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, DBTables;

type
  TFrmShowCheques = class(TForm)
    TrackBar1: TTrackBar;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    DSEmitidos: TDataSource;
    DSRecebidos: TDataSource;
    QryChequesRecebids: TQuery;
    QryChequesEmitidos: TQuery;
    QryChequesEmitidosINDICE: TIntegerField;
    QryChequesEmitidosTIPO: TStringField;
    QryChequesEmitidosDT_EMISSAO: TDateTimeField;
    QryChequesEmitidosDT_VENCIMENTO: TDateTimeField;
    QryChequesEmitidosDT_COMPENSACAO: TDateTimeField;
    QryChequesEmitidosEMITENTE: TStringField;
    QryChequesEmitidosCLIENTE: TStringField;
    QryChequesEmitidosBANCO: TStringField;
    QryChequesEmitidosAG: TStringField;
    QryChequesEmitidosCC: TStringField;
    QryChequesEmitidosNUMCHEQUE: TStringField;
    QryChequesEmitidosVALOR: TFloatField;
    QryChequesEmitidosCPF: TStringField;
    QryChequesEmitidosOBS: TStringField;
    QryChequesEmitidosCHQ_TERCEIRO: TStringField;
    QryChequesEmitidosMES_EMISSAO: TStringField;
    QryChequesEmitidosSTATUS: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    QryChequesRecebidsINDICE: TIntegerField;
    QryChequesRecebidsTIPO: TStringField;
    QryChequesRecebidsDT_EMISSAO: TDateTimeField;
    QryChequesRecebidsDT_VENCIMENTO: TDateTimeField;
    QryChequesRecebidsDT_COMPENSACAO: TDateTimeField;
    QryChequesRecebidsEMITENTE: TStringField;
    QryChequesRecebidsCLIENTE: TStringField;
    QryChequesRecebidsBANCO: TStringField;
    QryChequesRecebidsAG: TStringField;
    QryChequesRecebidsCC: TStringField;
    QryChequesRecebidsNUMCHEQUE: TStringField;
    QryChequesRecebidsVALOR: TFloatField;
    QryChequesRecebidsCPF: TStringField;
    QryChequesRecebidsOBS: TStringField;
    QryChequesRecebidsCHQ_TERCEIRO: TStringField;
    QryChequesRecebidsMES_EMISSAO: TStringField;
    QryChequesRecebidsSTATUS: TStringField;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmShowCheques: TFrmShowCheques;

implementation
 Uses DataMod, ShowContaPag;

{$R *.dfm}

procedure TFrmShowCheques.TrackBar1Change(Sender: TObject);
begin
  FrmShowContaPag.AlphaBlendValue:=TrackBar1.Position;
end;

procedure TFrmShowCheques.FormShow(Sender: TObject);
begin
   FrmShowContaPag.AlphaBlendValue :=TrackBar1.Position;
   Label1.Caption:=Label1.Caption + FormatdateTime('DD/MM/YYYY', NOW);
   Label5.Caption:=Label5.Caption + FormatdateTime('DD/MM/YYYY', NOW);
end;

end.

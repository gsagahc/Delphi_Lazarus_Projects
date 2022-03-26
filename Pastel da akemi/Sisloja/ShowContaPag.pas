unit ShowContaPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, DBTables;

type
  TFrmShowContaPag = class(TForm)
    TrackBar1: TTrackBar;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    QryShowContaPag: TQuery;
    QryShowContaPagFORNECEDOR: TStringField;
    QryShowContaPagVENCTO: TDateTimeField;
    QryShowContaPagVALOR: TFloatField;
    QryShowContaPagPAGTO: TDateTimeField;
    QryShowContaPagPAGO: TStringField;
    QryShowContaRec: TQuery;
    QryShowContaRecVENCTO: TDateTimeField;
    QryShowContaRecVALOR: TFloatField;
    QryShowContaRecEMISSAO: TDateTimeField;
    QryShowContaRecDATAPED: TDateTimeField;
    QryShowContaRecCLIENTE: TIntegerField;
    QryShowContaRecNOTA: TStringField;
    QryShowContaRecCODIGO: TIntegerField;
    QryShowContaRecNOME: TStringField;
    DSShowContaPag: TDataSource;
    DSShowContaRec: TDataSource;
    QryShowContaRecPEDIDO: TStringField;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmShowContaPag: TFrmShowContaPag;

implementation
 Uses DataMod;

{$R *.dfm}

procedure TFrmShowContaPag.TrackBar1Change(Sender: TObject);
begin
  FrmShowContaPag.AlphaBlendValue:=TrackBar1.Position;
end;

procedure TFrmShowContaPag.FormShow(Sender: TObject);
begin
   FrmShowContaPag.AlphaBlendValue :=TrackBar1.Position;
   Label1.Caption:=Label1.Caption + FormatdateTime('DD/MM/YYYY', NOW);
   Label5.Caption:=Label5.Caption + FormatdateTime('DD/MM/YYYY', NOW);
end;

end.

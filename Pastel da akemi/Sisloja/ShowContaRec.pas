unit ShowContaRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons;

type
  TFrmShowContaRec = class(TForm)
    TrackBar1: TTrackBar;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmShowContaRec: TFrmShowContaRec;

implementation
 Uses DataMod, ShowContaPag;

{$R *.dfm}

procedure TFrmShowContaRec.TrackBar1Change(Sender: TObject);
begin
  FrmShowContaRec.AlphaBlendValue:=TrackBar1.Position;
end;

procedure TFrmShowContaRec.FormShow(Sender: TObject);
begin
   FrmShowContaRec.AlphaBlendValue :=TrackBar1.Position;
   Label1.Caption:=Label1.Caption + FormatdateTime('DD/MM/YYYY', NOW);
end;

end.

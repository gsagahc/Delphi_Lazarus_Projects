unit FrameShowContas;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrame1 = class(TFrame)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

unit Consulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ENTRADA, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  Tfrmconsulta = class(TFrmentrada)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsulta: Tfrmconsulta;

implementation

{$R *.DFM}

end.

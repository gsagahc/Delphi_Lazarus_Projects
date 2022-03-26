unit Entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Basica, DBCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrmentrada = class(TFrmbasica)
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmentrada: TFrmentrada;

implementation

{$R *.DFM}

end.

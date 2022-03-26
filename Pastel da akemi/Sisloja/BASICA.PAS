unit Basica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFrmbasica = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnfecha: TBitBtn;
    procedure btnfechaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmbasica: TFrmbasica;

implementation

{$R *.DFM}

procedure TFrmbasica.btnfechaClick(Sender: TObject);
begin
  Close;
end;

end.

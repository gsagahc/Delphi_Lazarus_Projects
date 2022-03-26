unit FrmAlertaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmAlertaSen = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlertaSen: TFrmAlertaSen;

implementation

uses Principal;

{$R *.dfm}

procedure TFrmAlertaSen.BitBtn1Click(Sender: TObject);
begin
  Frmprincipal.Senha:=Edit1.text;
  Close;
end;

procedure TFrmAlertaSen.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

unit Quantidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmQuantidade = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQuantidade: TFrmQuantidade;

implementation

{$R *.dfm}

procedure TFrmQuantidade.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuantidade.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  Edit1.SetFocus;  
end;

procedure TFrmQuantidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Close;
end;

end.

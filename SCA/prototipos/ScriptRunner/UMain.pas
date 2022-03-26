unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBSQL, IBX.IBDatabase,
  Data.DB, IBX.IBScript;

type
  TForm4 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    IBScript1: TIBScript;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  Button1.Enabled:=False;
  try
    IBScript1.ExecuteScript;

  Except
    ShowMessage('Erro ao executar script');

  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin

  if OpenDialog1.Execute   then
  begin
    Edit1.Text :=OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    If Trim(Edit1.Text)<>EmptyStr Then
    begin
      Button1.Enabled:=True;
      IBScript1.Script.LoadFromFile (OpenDialog1.FileName);
    end;
  end;
end;

end.

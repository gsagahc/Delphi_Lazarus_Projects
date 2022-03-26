unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, WinSkinData;

type
  TForm1 = class(TForm)
    SkinData1: TSkinData;
    FileListBox1: TFileListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SkinData1.Active :=False;
  Form1.Refresh;  

  SkinData1.SkinFile:= FileListBox1.FileName;
  SkinData1.Active :=True;
 
  Form1.Refresh;  
end;

end.

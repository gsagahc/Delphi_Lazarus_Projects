unit UAniver;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, Qrctrls, QuickRpt;

type
  TFrmRelAniversario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ListBox1: TListBox;
    PrintSetup: TPrinterSetupDialog;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAniversario: TFrmRelAniversario;

implementation
Uses Umain,UImprime;
{$R *.DFM}

procedure TFrmRelAniversario.FormShow(Sender: TObject);
 Var
  Dia,Mes,Ano:Word;
begin

end;

procedure TFrmRelAniversario.SpeedButton3Click(Sender: TObject);
begin
  if  PrintSetup.Execute then
       
end;

procedure TFrmRelAniversario.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelAniversario.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TForm2,Form2);
  Form2.ShowModal;
  Form2.Free;
end;

end.

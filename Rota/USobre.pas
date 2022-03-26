unit USobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, jpeg,ShellApi;

type
  TFormSobre = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    Bevel2: TBevel;
    Label17: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    copyright: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.DFM}

procedure TFormSobre.Timer1Timer(Sender: TObject);
begin
 Label2.Visible:= not Label2.visible;
end;

procedure TFormSobre.Label7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Label7.Cursor:=crHandPoint;
   label7.Font.Color:= clRed;
end;

procedure TFormSobre.Panel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  //Cursor:=crDefault ;
  label7.Font.Color:= clNavy   ;
end;

procedure TFormSobre.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFormSobre.Label7Click(Sender: TObject);
Var Mail:String;
begin
   Mail := 'mailto:'+ Label7.Caption;
  ShellExecute(GetDesktopWindow,'open',pchar(Mail),nil,nil,sw_ShowNormal);
end;

end.

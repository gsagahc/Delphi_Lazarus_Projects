unit UConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Buttons, DB;

type
  TFrmConfig = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBImage1: TDBImage;
    DSConfig: TDataSource;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton2Click(Sender: TObject);
    Procedure Restaura;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation
Uses uMain;

{$R *.dfm}

procedure TFrmConfig.Restaura;
begin
    SpeedButton2.Enabled:= Not SpeedButton2.Enabled;
    SpeedButton5.Enabled:= Not SpeedButton5.Enabled;
    SpeedButton8.Enabled:= Not SpeedButton8.Enabled;
    SpeedButton7.Enabled:= Not SpeedButton7.Enabled;
end;

procedure TFrmConfig.SpeedButton2Click(Sender: TObject);
begin

  With FrmMain Do
  Begin
    Restaura;
   If IbTbConfig.RecordCount>0 Then
      IbTbConfig.Edit
   Else
     IbTbConfig.Append;
     IbTbConfigCOD.AsInteger:=1;
    If OpenDialog1.Execute Then
       ibTbConfigIMAGEM.LoadFromFile(OpenDialog1.FileName);


  End;
end;

procedure TFrmConfig.SpeedButton5Click(Sender: TObject);
begin
  With FrmMain Do
  Begin
    Restaura;
    IbTbConfig.POst;
  End;
end;

procedure TFrmConfig.SpeedButton8Click(Sender: TObject);
begin
 With FrmMain Do
  Begin
    Restaura;
    IbTbConfig.Cancel;
  End;
end;

procedure TFrmConfig.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
   FrmMain.IbTbConfig.OPen;
end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmMain.IbTbConfig.Close;
end;

end.

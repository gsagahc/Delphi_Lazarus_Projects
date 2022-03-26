unit UCad_Cli;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, DB, IBCustomDataSet, IBTable, QExtCtrls, Provider,
  DBClient, DBLocal, DBLocalI, QMask, QDBCtrls;

type
  TFrmCadCli = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DbEdt_Nome_cli: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    SpeedButton11: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCli: TFrmCadCli;

implementation
uses Tela_Principal, Localizacao_cli;

{$R *.xfm}

procedure  TFrmCadCli.SpeedButton1Click(Sender: TObject);
begin
  FrmPrincipal.IBTb_clientes.Next;  
end;

procedure TFrmCadCli.SpeedButton8Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmCadCli.SpeedButton2Click(Sender: TObject);
begin
   FrmPrincipal.IBTb_clientes.Prior;
end;

procedure TFrmCadCli.SpeedButton3Click(Sender: TObject);
begin
   FrmPrincipal.IBTb_clientes.Last;
end;

procedure TFrmCadCli.SpeedButton4Click(Sender: TObject);
begin
   FrmPrincipal.IBTb_clientes.First;
end;

procedure TFrmCadCli.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmPrincipal.StatusBar1.Panels.Items[0].Text:=SpeedButton1.Hint;  
end;

procedure TFrmCadCli.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FrmPrincipal.StatusBar1.Panels.Items[0].Text:='';
end;

procedure TFrmCadCli.SpeedButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmPrincipal.StatusBar1.Panels.Items[0].Text:=SpeedButton2.Hint;
end;

procedure TFrmCadCli.SpeedButton11Click(Sender: TObject);
begin
   Application.CreateForm(TFrmLocaCli,FrmLocaCli);
   FrmLocaCli.ShowModal;
   FrmLocaCli.Free;

end;

end.

unit UConsultarPrt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBSQL;

type
  TFrmConsultarPrt = class(TForm)
    PnlMain: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DSProntuario: TDataSource;
    IBQProntuario: TIBQuery;
    EdtNome: TEdit;
    EdtRua: TEdit;
    EdtRG: TEdit;
    EdtCelular: TEdit;
    EdtCPF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnFechar: TBitBtn;
    TimerBusca: TTimer;
    BtnLimpar: TBitBtn;
    IBQProntuarioTBPRT_CELULAR: TIBStringField;
    IBQProntuarioTBPRT_CPF: TIBStringField;
    IBQProntuarioTBPRT_NOME: TIBStringField;
    IBQProntuarioTBPRT_ENDERECO: TIBStringField;
    IBQProntuarioID_TBPRT: TIntegerField;
    IBSQL1: TIBSQL;
    EditProntuario: TEdit;
    Label6: TLabel;
    IBQProntuarioTBPRT_RG: TIBStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure EdtNomeChange(Sender: TObject);
    procedure EdtCPFChange(Sender: TObject);
    procedure EdtRuaChange(Sender: TObject);
    procedure EdtRGChange(Sender: TObject);
    procedure EdtCelularChange(Sender: TObject);
    procedure EditProntuarioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarPrt: TFrmConsultarPrt;

implementation
Uses UPrincipal ;

{$R *.dfm}

procedure TFrmConsultarPrt.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPrt.BtnLimparClick(Sender: TObject);
begin
  EdtNome.Clear;
  EdtRG.Clear;
  EdtCPF.Clear;
  EdtRua.Clear;
  EdtCelular.Clear;
  EditProntuario.Clear;
end;

procedure TFrmConsultarPrt.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarPrt.EditProntuarioChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.EdtCelularChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.EdtCPFChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.EdtNomeChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.EdtRGChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.EdtRuaChange(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarPrt.TimerBuscaTimer(Sender: TObject);
var StrSql:string;
begin
  StrSql:= ' TBPRT_NOME LIKE'+QuotedStr(EdtNome.Text+'%');
  if EdtCPF.Text<>EmptyStr  then
    StrSql:= StrSql +  ' AND TBPRT_CPF LIKE'+QuotedStr(EdtCPF.Text+'%') ;
  if EdtRG.Text<> EmptyStr   then
    StrSql:=StrSql+   ' AND TBPRT_RG  LIKE'+QuotedStr(EdtRG.Text+'%') ;
  if EdtRua.Text <>EmptyStr  then
    StrSql:=StrSql + ' AND TBPRT_ENDERECO LIKE'+QuotedStr(EdtRua.Text+'%');
  if EdtCelular.Text<> EmptyStr  then
    StrSql:=StrSql+ ' AND  TBPRT_CELULAR LIKE'+QuotedStr(EdtCelular.Text+'%');

  if EditProntuario.Text<> EmptyStr  then
    StrSql:= '  ID_TBPRT='+EditProntuario.Text;

  IBQProntuario.Close;
  IBQProntuario.sql.Clear;
  IBQProntuario.sql.Add('SELECT ID_TBPRT, TBPRT_CELULAR, TBPRT_CPF, TBPRT_NOME, TBPRT_RG, TBPRT_ENDERECO,ID_TBPRT '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);

  IBSQL1.Close;
  IBSQL1.SQL.Clear ;
  IBSQL1.SQL.Add('SELECT COUNT(*) FROM TB_PRT WHERE ' +StrSql);
  IBSQL1.ExecQuery;

  IBQProntuario.Open;
  StatusBar1.Panels.Items[1].Text:= IBSQL1.FieldByName('COUNT').AsString;
  TimerBusca.Enabled:=False;
end;

end.

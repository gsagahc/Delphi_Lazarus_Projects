unit UConsultarPRua;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery, RLReport, IBX.IBSQL;

type
  TFrmConsultarpRua = class(TForm)
    PnlMain: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DSProntuario: TDataSource;
    IBQProntuario: TIBQuery;
    EdtRua: TEdit;
    Label3: TLabel;
    BtnFechar: TBitBtn;
    TimerBusca: TTimer;
    BtnLimpar: TBitBtn;
    IBQProntuarioTBPRT_CELULAR: TIBStringField;
    IBQProntuarioTBPRT_CPF: TIBStringField;
    IBQProntuarioTBPRT_NOME: TIBStringField;
    IBQProntuarioTBPRT_ENDERECO: TIBStringField;
    IBQProntuarioID_TBPRT: TIntegerField;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Shape1: TShape;
    IBQProntuarioTBPRT_BAIRRO: TIBStringField;
    IBQProntuarioTBPRT_ANOTACOES: TIBStringField;
    IBSQLCadastros: TIBSQL;
    IBQProntuarioTBPRT_RG: TIBStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtRuaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarpRua: TFrmConsultarpRua;

implementation
Uses UPrincipal, UCadProntuario, UImpressaoPRua;

{$R *.dfm}

procedure TFrmConsultarpRua.BitBtn1Click(Sender: TObject);
begin
  IBQProntuario.DisableControls;
  TimerBusca.Enabled:=False;
  Application.CreateForm(TFrmImpressaoPRua, FrmImpressaoPRua);
  FrmImpressaoPRua.RLReport1.PreviewModal;
  FrmImpressaoPRua.Free;
  TimerBusca.Enabled:=True;
  IBQProntuario.EnableControls;
end;

procedure TFrmConsultarpRua.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarpRua.BtnLimparClick(Sender: TObject);
begin
  EdtRua.Clear;

end;

procedure TFrmConsultarpRua.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarpRua.EdtRuaChange(Sender: TObject);
begin
    TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarpRua.TimerBuscaTimer(Sender: TObject);
var StrSql:string;
begin
  StrSql:= ' TBPRT_ENDERECO LIKE'+QuotedStr(EdtRua.Text+'%')+
           ' ORDER BY TBPRT_NOME';


  IBQProntuario.Close;
  IBQProntuario.sql.Clear;
  IBQProntuario.sql.Add('SELECT ID_TBPRT, TBPRT_BAIRRO, TBPRT_ANOTACOES,TBPRT_CELULAR, TBPRT_CPF, TBPRT_NOME, TBPRT_RG, TBPRT_ENDERECO,ID_TBPRT '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
  IBQProntuario.Open;
  IBSQLCadastros.Close;
  IBSQLCadastros.SQL.Clear;
  StrSql:= ' TBPRT_ENDERECO LIKE'+QuotedStr(EdtRua.Text+'%');
  IBSQLCadastros.SQL.Add('SELECT COUNT (*) '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
  IBSQLCadastros.ExecQuery;
  StatusBar1.Panels.Items[0].Text := 'Número total de cadastros: ' + IBSQLCadastros.FieldByName('COUNT').AsString;
  TimerBusca.Enabled:=False;

end;

end.

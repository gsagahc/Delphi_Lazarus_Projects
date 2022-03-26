unit UConsultarBairro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBSQL;

type
  TFrmConsultarBairro = class(TForm)
    PnlMain: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DSProntuario: TDataSource;
    IBQProntuario: TIBQuery;
    EdtBairro: TEdit;
    Label1: TLabel;
    BtnFechar: TBitBtn;
    TimerBusca: TTimer;
    BtnLimpar: TBitBtn;
    IBQProntuarioTBPRT_CELULAR: TIBStringField;
    IBQProntuarioTBPRT_CPF: TIBStringField;
    IBQProntuarioTBPRT_NOME: TIBStringField;
    IBQProntuarioTBPRT_ENDERECO: TIBStringField;
    IBQProntuarioID_TBPRT: TIntegerField;
    IBQProntuarioTBPRT_BAIRRO: TIBStringField;
    BitBtn1: TBitBtn;
    IBSQLCadastros: TIBSQL;
    IBQProntuarioTBPRT_RG: TIBStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtBairroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarBairro: TFrmConsultarBairro;

implementation
Uses UPrincipal, UCadProntuario, UImpressaoPBairro;

{$R *.dfm}

procedure TFrmConsultarBairro.BitBtn1Click(Sender: TObject);
begin
  IBQProntuario.DisableControls;
  TimerBusca.Enabled :=False;
  Application.CreateForm(TFrmImpressaoPBairro, FrmImpressaoPBairro);
  FrmImpressaoPBairro.RLReport1.PreviewModal;
  FrmImpressaoPBairro.Free;
  TimerBusca.Enabled := True;
  IBQProntuario.EnableControls;
end;

procedure TFrmConsultarBairro.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarBairro.BtnLimparClick(Sender: TObject);
begin
  EdtBairro.Clear;

end;

procedure TFrmConsultarBairro.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarBairro.EdtBairroChange(Sender: TObject);
begin
    TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarBairro.TimerBuscaTimer(Sender: TObject);
var StrSql:string;
begin
  StrSql:= ' TBPRT_BAIRRO LIKE '+QuotedStr(EdtBairro.Text+'%')+
           ' ORDER BY TBPRT_NOME ' ;




  IBQProntuario.Close;
  IBQProntuario.sql.Clear;
  IBQProntuario.sql.Add('SELECT ID_TBPRT, TBPRT_CELULAR, TBPRT_CPF, TBPRT_NOME, TBPRT_RG, TBPRT_ENDERECO,ID_TBPRT, TBPRT_BAIRRO '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
  IBQProntuario.Open;

 // IBQProntuario.Open;
  IBSQLCadastros.Close;
  IBSQLCadastros.SQL.Clear;
  StrSql:= ' TBPRT_BAIRRO LIKE '+QuotedStr(EdtBairro.Text+'%');
  IBSQLCadastros.SQL.Add('SELECT COUNT (*) '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
  IBSQLCadastros.ExecQuery;
  StatusBar1.Panels.Items[0].Text := 'Número total de cadastros: ' + IBSQLCadastros.FieldByName('COUNT').AsString;
  TimerBusca.Enabled:=False;
end;

end.

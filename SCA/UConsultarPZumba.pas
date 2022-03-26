unit UConsultarPZumba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery, RLReport, IBX.IBSQL;

type
  TFrmConsultarZumba = class(TForm)
    PnlMain: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DSProntuario: TDataSource;
    IBQProntuario: TIBQuery;
    Label3: TLabel;
    BtnFechar: TBitBtn;
    TimerBusca: TTimer;
    IBQProntuarioTBPRT_CELULAR: TIBStringField;
    IBQProntuarioTBPRT_CPF: TIBStringField;
    IBQProntuarioTBPRT_NOME: TIBStringField;
    IBQProntuarioTBPRT_ENDERECO: TIBStringField;
    IBQProntuarioID_TBPRT: TIntegerField;
    BitBtn1: TBitBtn;
    IBQProntuarioTBPRT_BAIRRO: TIBStringField;
    IBQProntuarioTBPRT_ANOTACOES: TIBStringField;
    IBSQLCadastros: TIBSQL;
    CbBoxSelecao: TComboBox;
    IBQProntuarioTBPRT_LZUMBA: TIBStringField;
    IBQProntuarioTBPRT_RG: TIBStringField;
    CheckBoxSalao: TCheckBox;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CbBoxSelecaoChange(Sender: TObject);
    procedure CheckBoxSalaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarZumba: TFrmConsultarZumba;

implementation
Uses UPrincipal, UCadProntuario, UImpressaoPZumba;

{$R *.dfm}

procedure TFrmConsultarZumba.BitBtn1Click(Sender: TObject);
begin
  TimerBusca.Enabled:=False;
  IBQProntuario.DisableControls;
  Application.CreateForm(TFrmImpressaoPZumba, FrmImpressaoPZumba);

  if (CbBoxSelecao.Text= '') And (CheckBoxSalao.Checked)   Then
  Begin
     FrmImpressaoPZumba.RLLabelTitulo.Caption :='Relatório de cadastrados no salão de festas';
     FrmImpressaoPZumba.RLLabelLocal.Visible :=False;
     FrmImpressaoPZumba.RLLabelBairro.Visible :=False;
  End;
  if (CbBoxSelecao.Text<> '') And (CheckBoxSalao.Checked)   Then
  Begin
    FrmImpressaoPZumba.RLLabelLocal.Visible:=True;
    FrmImpressaoPZumba.RLLabelBairro.Visible :=True;
    FrmImpressaoPZumba.RLLabelBairro.Caption  :=CbBoxSelecao.Text ;
    FrmImpressaoPZumba.RLLabelTitulo.Caption := 'Relatório de cadastrados na Zumba e também no salão de festas'
  End;

  if (CbBoxSelecao.Text<> '') And (Not CheckBoxSalao.Checked)   Then
  Begin
    FrmImpressaoPZumba.RLLabelLocal.Visible:=True;
    FrmImpressaoPZumba.RLLabelBairro.Visible :=True;
    FrmImpressaoPZumba.RLLabelBairro.Caption  :=CbBoxSelecao.Text ;
    FrmImpressaoPZumba.RLLabelTitulo.Caption := 'Relatório de cadastrados na Zumba'
  End;
  FrmImpressaoPZumba.RLReport1.PreviewModal;


  FrmImpressaoPZumba.Free;
  TimerBusca.Enabled:=True;
  IBQProntuario.EnableControls;
end;

procedure TFrmConsultarZumba.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarZumba.CbBoxSelecaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True;
end;

procedure TFrmConsultarZumba.CheckBoxSalaoClick(Sender: TObject);
begin
   TimerBusca.Enabled :=True;
end;

procedure TFrmConsultarZumba.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarZumba.FormShow(Sender: TObject);
begin
  TimerBusca.Enabled:=True;
end;

procedure TFrmConsultarZumba.TimerBuscaTimer(Sender: TObject);
var StrSql:string;
begin
  if (CbBoxSelecao.Text<> 'TODOS') And (CheckBoxSalao.Checked)  then
    StrSql:= 'TBPRT_ZUMBA=''S'' AND TBPRT_LZUMBA='+QuotedStr(CbBoxSelecao.Text) + ' AND TBPRT_SFESTAS=''S''';
  if (Trim(CbBoxSelecao.Text)<> '') And (Not CheckBoxSalao.Checked  ) AND (CbBoxSelecao.Text<> 'TODOS')  then
    StrSql:= 'TBPRT_ZUMBA=''S'' AND TBPRT_LZUMBA='+QuotedStr(CbBoxSelecao.Text)+ ' AND (TBPRT_SFESTAS IS NULL OR TBPRT_SFESTAS=''N'')';
  if (CbBoxSelecao.Text = 'TODOS') And (CheckBoxSalao.Checked  )  then
    StrSql:= '  TBPRT_SFESTAS=''S''' ;
  if (CbBoxSelecao.Text = 'TODOS') And (Not CheckBoxSalao.Checked  )  then
      StrSql:=' TBPRT_NOME IS NOT NULL';

  IBSQLCadastros.SQL.Clear;
  IBSQLCadastros.SQL.Add('SELECT COUNT (*) '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
  IBSQLCadastros.ExecQuery;
  StatusBar1.Panels.Items[0].Text := 'Número total de cadastros: ' + IBSQLCadastros.FieldByName('COUNT').AsString;

  StrSql:= StrSql+' ORDER BY TBPRT_NOME';

  IBQProntuario.Close;
  IBQProntuario.sql.Clear;
  IBQProntuario.sql.Add('SELECT ID_TBPRT, TBPRT_BAIRRO, TBPRT_ANOTACOES,TBPRT_CELULAR, TBPRT_CPF, TBPRT_NOME, TBPRT_RG,TBPRT_LZUMBA, TBPRT_ENDERECO,ID_TBPRT '+
                        '  FROM TB_PRT '+
                        'WHERE ' + StrSql);
 // ShowMessage(IBQProntuario.SQL.text);
  IBQProntuario.Open;
  IBSQLCadastros.Close;


  TimerBusca.Enabled:=False;

end;

end.

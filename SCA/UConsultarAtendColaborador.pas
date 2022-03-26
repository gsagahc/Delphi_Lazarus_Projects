unit UConsultarAtendColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery, RLReport, IBX.IBSQL, Vcl.DBCtrls, IBX.IBTable, Vcl.Menus;

type
  TFrmConsultaAtendColab = class(TForm)
    PnlMain: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DSAtendimentos: TDataSource;
    IBQAtedimentos: TIBQuery;
    Label3: TLabel;
    BtnFechar: TBitBtn;
    BitBtn1: TBitBtn;
    IBSQLCadastros: TIBSQL;
    DBLookupCBxCOLABORADOR: TDBLookupComboBox;
    Label2: TLabel;
    DateTimePickerIni: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    BitBtn2: TBitBtn;
    IBTableServico: TIBTable;
    DSServicos: TDataSource;
    IBTableServicoID_TBSERV: TIntegerField;
    IBTableServicoTBSERV_NOME: TIBStringField;
    IBTableServicoTBSERV_PRAZO: TIBStringField;
    DSColaborador: TDataSource;
    DBLookupCbxSERVICO: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    DBLookupListBox1: TDBLookupListBox;
    IBQueryColab: TIBQuery;
    DBLookupListBox2: TDBLookupListBox;
    IBQueryColabID_COLAB: TIntegerField;
    IBQueryColabTBCOLAB_NOME: TIBStringField;
    IBQAtedimentosID_TBPRT: TIntegerField;
    IBQAtedimentosID_TBSERV: TIntegerField;
    IBQAtedimentosTBATENDIMENTO_DATA: TDateField;
    IBQAtedimentosTBCOLAB_NOME: TIBStringField;
    IBQAtedimentosTBSERV_NOME: TIBStringField;
    IBQAtedimentosTBATENDIMENTO_OBS: TIBStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupCbxSERVICOExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaAtendColab: TFrmConsultaAtendColab;

implementation
Uses UPrincipal, UCadProntuario, URelatoAtendColab;

{$R *.dfm}

procedure TFrmConsultaAtendColab.BitBtn1Click(Sender: TObject);
begin
  IBQAtedimentos.DisableControls;
  Application.CreateForm(TFrmImpressaoAtendColab, FrmImpressaoAtendColab);
  FrmImpressaoAtendColab.RLReport1.PreviewModal;
  FrmImpressaoAtendColab.Free;
  IBQAtedimentos.EnableControls;

end;

procedure TFrmConsultaAtendColab.BitBtn2Click(Sender: TObject);
Var IdColab:String;
begin
  IdColab:= DBLookupCBxCOLABORADOR.KeyValue;
  IBQAtedimentos.Close;
  IBQAtedimentos.Sql.Clear;
  IBQAtedimentos.sql.Add('SELECT TB_ATENDIMENTO.ID_TBPRT,TB_ATENDIMENTO.ID_TBSERV, '+
                                 'TB_ATENDIMENTO.TBATENDIMENTO_DATA,TB_ATENDIMENTO.ID_TBCOLABORADOR, '+
                                 ' TB_COLABORADOR.tbcolab_nome, TB_SERV.tbserv_nome, TB_ATENDIMENTO.TBATENDIMENTO_OBS '+
                         '  FROM ((TB_ATENDIMENTO '+
                         ' INNER JOIN TB_COLABORADOR  ON '+
                         ' TB_COLABORADOR.id_colab =tb_atendimento.id_tbcolaborador)' +
                         ' INNER JOIN TB_SERV ON tb_serv.id_tbserv=tb_atendimento.id_tbserv) '+
                         ' WHERE ID_TBCOLABORADOR='+ IdColab +
                         '    AND TBATENDIMENTO_DATA '+
                        ' BETWEEN '''+ FormatDateTime('dd.MM.yyyy',DateTimePickerIni.Date) +''''+
                            ' AND '+''''+FormatDateTime('dd.MM.yyyy',DateTimePickerFinal.Date)+'''');
  IBQAtedimentos.Open;
  IBSQLCadastros.Close;
  IBSQLCadastros.SQL.Clear;
  IBSQLCadastros.SQL.Add('SELECT COUNT(*) '+
                         '  FROM ((TB_ATENDIMENTO '+
                         ' INNER JOIN TB_COLABORADOR  ON '+
                         ' TB_COLABORADOR.id_colab =tb_atendimento.id_tbcolaborador)' +
                         ' INNER JOIN TB_SERV ON tb_serv.id_tbserv=tb_atendimento.id_tbserv) '+
                         ' WHERE ID_TBCOLABORADOR='+ IdColab +
                         '    AND TBATENDIMENTO_DATA '+
                        ' BETWEEN '''+ FormatDateTime('dd.MM.yyyy',DateTimePickerIni.Date) +''''+
                             ' AND '+''''+FormatDateTime('dd.MM.yyyy',DateTimePickerFinal.Date)+'''');
 IBSQLCadastros.ExecQuery;
 StatusBar1.Panels.Items[0].Text :='Número de atendimentos: '+IBSQLCadastros.FieldByName('COUNT').AsString;
end;

procedure TFrmConsultaAtendColab.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaAtendColab.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaAtendColab.DBLookupCbxSERVICOExit(Sender: TObject);
begin

  IBQueryColab.Close;
  IBQueryColab.SQL.Clear;
  if DBLookupCbxSERVICO.Text<>EmptyStr   then
  begin
   //Carregar Combobox Colaboradores

    IBQueryColab.SQL.Add('SELECT ID_COLAB,TBCOLAB_NOME '+
                         '  FROM TB_COLABORADOR  '+
                         ' WHERE TBCOLAB_IDSERV='+IBTableServicoID_TBSERV.AsString);
    IBQueryColab.Open;
  end;

end;

procedure TFrmConsultaAtendColab.FormShow(Sender: TObject);
begin
  IBTableServico.Open;
  DateTimePickerIni.Date :=Now;
  DateTimePickerFinal.Date :=Now;
end;

end.

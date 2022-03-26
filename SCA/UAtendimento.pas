unit UAtendimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBTable, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.Buttons, IBX.IBQuery, IBX.IBSQL;

type
  TFrmAtendimento = class(TForm)
    PnlBotoes: TPanel;
    IBTbAtendimento: TIBTable;
    DSAtendimento: TDataSource;
    IBTbAtendimentoID_TBPRT: TIntegerField;
    IBTbAtendimentoID_TBSERV: TIntegerField;
    IBTbAtendimentoTBATENDIMENTO_DATA: TDateField;
    IBTbAtendimentoTBATENDIMENTO_OBS: TIBStringField;
    DsProntuario: TDataSource;
    IBTbProntuario: TIBTable;
    IBTbProntuarioID_TBPRT: TIntegerField;
    Panel1: TPanel;
    BtnFechar: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnInserir: TBitBtn;
    BtnCancelar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    IBTBServicos: TIBTable;
    DSServico: TDataSource;
    DBLookupCbxSERVICO: TDBLookupComboBox;
    DBMemo2: TDBMemo;
    DBEdit7: TDBEdit;
    IBQHistorico: TIBQuery;
    DSHistorico: TDataSource;
    IBTbProntuarioTBPRT_NOME: TIBStringField;
    IBTbProntuarioTBPRT_CPF: TIBStringField;
    IBTbProntuarioTBPRT_ENDERECO: TIBStringField;
    IBTbProntuarioTBPRT_NUMERO: TSmallintField;
    IBTbProntuarioTBPRT_COMPLEMENTO: TIBStringField;
    IBTbProntuarioTBPRT_EMAIL: TIBStringField;
    IBTbProntuarioTBPRT_BAIRRO: TIBStringField;
    IBTbProntuarioTBPRT_CIDADE: TIBStringField;
    IBTbProntuarioTBPRT_CELULAR: TIBStringField;
    IBTbProntuarioTBPRT_TELEFONE: TIBStringField;
    IBTbProntuarioTBPRT_CEP: TIBStringField;
    IBTbProntuarioTBPRT_ESTADOCIVIL: TIBStringField;
    IBTbProntuarioTBPRT_SEXO: TIBStringField;
    IBTbProntuarioTBPRT_NASCIMENTO: TDateField;
    IBTbProntuarioTBPRT_ZAP: TIBStringField;
    IBTbProntuarioTBPRT_ANIVERSARIO: TIBStringField;
    IBTbProntuarioTBPRT_OBS: TIBStringField;
    IBTbProntuarioTBPRT_PROFISSAO: TIBStringField;
    IBSQLPrazo15dias: TIBSQL;
    IBTbAtendimentoTBATENDIMENTO_PRAZOVOLTA: TIntegerField;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBNavigator1: TDBNavigator;
    IBQueryColab: TIBQuery;
    DSCOLABORADOR: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    IBTbAtendimentoID_TBCOLABORADOR: TIntegerField;
    IBQueryColabID_COLAB: TIntegerField;
    IBQueryColabTBCOLAB_NOME: TIBStringField;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupListBox2: TDBLookupListBox;
    IBTbProntuarioTBPRT_RG: TIBStringField;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBLookupCbxSERVICOExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    ID_PRT:String;
    function prazo15dias(sIDTBPRT,sIDTBSERV:String):Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtendimento: TFrmAtendimento;

implementation
Uses Uprincipal, UConsultarPrt, UMensagens;

{$R *.dfm}

procedure TFrmAtendimento.BtnCancelarClick(Sender: TObject);
begin
  IBTbAtendimento.Cancel;
  IBTbAtendimento.Close;
  IBTbProntuario.Close;
  BtnInserir.Enabled:=True;
  BtnFechar.Enabled:= True;
  BtnSalvar.Enabled:=False;
  BtnCancelar.Enabled:= False;
end;

procedure TFrmAtendimento.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtendimento.BtnInserirClick(Sender: TObject);
begin
  BtnInserir.Enabled:=False;
  BtnFechar.Enabled:= False;
  BtnSalvar.Enabled:=True;
  BtnCancelar.Enabled:= True;
  Application.CreateForm(TFrmConsultarPrt,FrmConsultarPrt);
  FrmConsultarPrt.ShowModal;
  IBTbProntuario.Open;
  IBTBServicos.Open;
  IBTbProntuario.Locate('ID_TBPRT', FrmConsultarPrt.IBQProntuario.FieldByName('ID_TBPRT').AsString, [loPartialKey]);
  IBTbAtendimento.Open;
  IBTbAtendimento.Append;
  ID_PRT:= FrmConsultarPrt.IBQProntuario.FieldByName('ID_TBPRT').AsString;

  IBTbAtendimentoID_TBPRT.AsInteger := StrToInt(ID_PRT);
  IBTbAtendimentoTBATENDIMENTO_DATA.AsString := FormatDateTime('dd/MM/yyyy', Now);
  FrmConsultarPrt.Free;


end;

procedure TFrmAtendimento.BtnSalvarClick(Sender: TObject);
begin

 if Not prazo15dias(DBEdit1.Text,DBLookupCbxSERVICO.KeyValue)      then
   IBTbAtendimento.Post;

  IBTbAtendimento.Cancel;
  IBTbAtendimento.Close;
  IBTbProntuario.Close;
  BtnInserir.Enabled:=True;
  BtnFechar.Enabled:= True;
  BtnSalvar.Enabled:=False;
  BtnCancelar.Enabled:= False;
  IBTbProntuario.Close;
  IBTBServicos.Close;
  IBTbAtendimento.Close;
end;

procedure TFrmAtendimento.DBLookupCbxSERVICOExit(Sender: TObject);
begin
 IBQueryColab.Close;
 IBQueryColab.SQL.Clear;
 if DBLookupCbxSERVICO.Text<>EmptyStr   then
 begin
   //Carregar Combobox Colaboradores

   IBQueryColab.SQL.Add('SELECT ID_COLAB,TBCOLAB_NOME '+
                        '  FROM TB_COLABORADOR  '+
                        ' WHERE TBCOLAB_IDSERV='+IBTbAtendimentoID_TBSERV.AsString);
   IBQueryColab.Open;

   //Consultar Historico
   IBQHistorico.Close;
   IBQHistorico.Sql.Clear;
   IBQHistorico.sql.Add('SELECT TBATENDIMENTO_DATA, TBATENDIMENTO_OBS '+
                        ' FROM TB_ATENDIMENTO '+
                        'WHERE ID_TBPRT='+ID_PRT +
                        ' AND ID_TBSERV='+DBLookupCbxSERVICO.Field.AsString );
   IBQHistorico.Open;
 end;
end;

procedure TFrmAtendimento.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=AnsiUppercase(key)[1];
end;

procedure TFrmAtendimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Perform(Wm_NextDlgCtl,0,0);

end;

function TFrmAtendimento.prazo15dias(sIDTBPRT, sIDTBSERV: String): Boolean;
var strData:String;
begin
  Result:=False;
  StrData:= FormatDateTime('dd/MM/yyyy', (Now));
  FrmPrincipal.IBQUtil.Close;
  FrmPrincipal.IBQUtil.SQL.Clear;
  FrmPrincipal.IBQUtil.SQL.Add('SELECT TBATENDIMENTO_DATA FROM  TB_ATENDIMENTO ' +
                           'WHERE ID_TBPRT='+sIDTBPRT +' AND '+
                           'ID_TBSERV='+sIDTBSERV);
  FrmPrincipal.IBQUtil.Open;
  if Not FrmPrincipal.IBQUtil.IsEmpty then
  Begin
    FrmPrincipal.IBQUtil.Last;
    if (StrToDate(StrData) - StrToDate(FrmPrincipal.IBQUtil.FieldByName('TBATENDIMENTO_DATA').AsString))< 15  then
      begin
        TFrmMensagens.Mensagem('Esta consulta não obedece ao prazo mínimo de 15 dias para este paciente.','I',[mbOK]);
        Result:=True;
        Exit;
      end;
  End;
end;

end.

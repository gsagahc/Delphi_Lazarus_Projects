unit UCadProntuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Buttons,
  Vcl.ExtCtrls, StrUtils, IBX.IBTable, Vcl.ComCtrls;

type
  TFrmCadProntuario = class(TForm)
    Panel1: TPanel;
    DSProntuario: TDataSource;
    PnlBotoes: TPanel;
    BtnFechar: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnConsultar: TBitBtn;
    BtnInserir: TBitBtn;
    IBTbProntuario: TIBTable;
    BtnCancelar: TBitBtn;
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
    IBTbProntuarioTBPRT_NASCIMENTO: TDateField;
    IBTbProntuarioTBPRT_ZAP: TIBStringField;
    IBTbProntuarioTBPRT_ANIVERSARIO: TIBStringField;
    IBTbProntuarioTBPRT_OBS: TIBStringField;
    IBTbProntuarioTBPRT_PROFISSAO: TIBStringField;
    IBTbProntuarioID_TBPRT: TIntegerField;
    PageControl1: TPageControl;
    TabSheetPrincipal: TTabSheet;
    TabSheetOBS: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEditCPF: TDBEdit;
    DBEdit7: TDBEdit;
    DBEditNOME: TDBEdit;
    DBEditRG: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit6: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    IBTbProntuarioTBPRT_ANOTACOES: TIBStringField;
    Label18: TLabel;
    Label19: TLabel;
    IBTbProntuarioTBPRT_NOMEMAE: TIBStringField;
    Label20: TLabel;
    DBEditNomeMAE: TDBEdit;
    IBTbProntuarioTBPRT_ORGEMISSOR: TIBStringField;
    DBEdit8: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit9: TDBEdit;
    IBTbProntuarioTBPRT_RG: TIBStringField;
    IBTbProntuarioTBPRT_ZUMBA: TIBStringField;
    IBTbProntuarioTBPRT_LZUMBA: TIBStringField;
    DBCBxLocalZumba: TDBComboBox;
    Label23: TLabel;
    DBCBxZumba: TDBComboBox;
    Label24: TLabel;
    IBTbProntuarioTBPRT_SFESTAS: TIBStringField;
    DBComboBox3: TDBComboBox;
    Label25: TLabel;
    DBComboBox2: TDBComboBox;
    IBTbProntuarioTBPRT_SEXO: TIBStringField;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure statusbotoes(acao:string);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBCBxZumbaChange(Sender: TObject);
  private
    function VerificaCampos:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProntuario: TFrmCadProntuario;

implementation
Uses UPrincipal, UConsultarPrt, UMensagens, COnsultaCEP;

{$R *.dfm}

procedure TFrmCadProntuario.BtnInserirClick(Sender: TObject);
begin
  try
    IBTbProntuario.Insert;
  finally
    statusbotoes('I');
    DBEditNOME.SetFocus;
  end;
end;

procedure TFrmCadProntuario.BtnSalvarClick(Sender: TObject);
begin
  if Trim(IBTbProntuarioTBPRT_CPF.AsString)<>EmptyStr then
  begin
  if FrmPrincipal.ValidaCPF(IBTbProntuarioTBPRT_CPF.AsString)    then
  begin
    if DSProntuario.State  in [dsInsert]  then
    begin
      if DBEditNOME.Text<>EmptyStr  then
      begin
        if not VerificaCampos then
        Begin
          try
            IBTbProntuario.Post;

          finally
            statusbotoes('S');
          end;
        End;
      end
      Else
       tFrmMensagens.Mensagem('Favor inserir um Nome válido','I',[mbOK]);
    end
    Else
    begin
       try
          IBTbProntuario.Post;

        finally
          statusbotoes('S');
        end;
    end;
  end
  else
    tFrmMensagens.Mensagem('Favor inserir um CPF válido','I',[mbOK]);
  end
  else
  begin
    if DSProntuario.State  in [dsInsert]  then
    begin
      if not VerificaCampos then
      Begin
        try
          IBTbProntuario.Post;

        finally
          statusbotoes('S');
        end;
      End;
    end
    Else
    begin
       try
          IBTbProntuario.Post;

        finally
          statusbotoes('S');
        end;
    end;
  end;
end;

procedure TFrmCadProntuario.BtnAlterarClick(Sender: TObject);
begin
  try
    IBTBProntuario.Edit;
  finally
    statusbotoes('A');
  end;
end;

procedure TFrmCadProntuario.BtnCancelarClick(Sender: TObject);
begin
  IBTbProntuario.Cancel;
  statusbotoes('S');
end;

procedure TFrmCadProntuario.BtnConsultarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarPrt,FrmConsultarPrt);
  FrmConsultarPrt.ShowModal;
  IBTbProntuario.Locate('ID_TBPRT', FrmConsultarPrt.IBQProntuario.FieldByName('ID_TBPRT').AsString, [loPartialKey]);
  statusbotoes('C');
  FrmConsultarPrt.Free;
end;

procedure TFrmCadProntuario.BtnExcluirClick(Sender: TObject);
begin
  if tFrmMensagens.Mensagem('Deseja excluir o registro selecionado?','Q',[mbSIM, MBNao]) then
   Begin
     IBTbProntuario.Delete;
   End;
  statusbotoes('S');
end;

procedure TFrmCadProntuario.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadProntuario.DBCBxZumbaChange(Sender: TObject);
begin
  if DBCBxZumba.Text='S' then
    DBCBxLocalZumba.Enabled :=True
  Else
  Begin
    DBCBxLocalZumba.Enabled :=False;
  End;

end;

procedure TFrmCadProntuario.DBEdit14Exit(Sender: TObject);
begin
  if (IBTbProntuarioTBPRT_NASCIMENTO.AsString <> '') and
    (IBTbProntuarioTBPRT_NASCIMENTO.AsString <>'  /  /    ') then
      IBTbProntuarioTBPRT_ANIVERSARIO.AsString:=copy(IBTbProntuarioTBPRT_NASCIMENTO.AsString,1,5);

end;

procedure TFrmCadProntuario.DBEdit3Exit(Sender: TObject);
var
 ws: AtendeCliente;
  Endereco: TEndereco;
begin
  if IBTbProntuarioTBPRT_CEP.AsString<>EmptyStr   then
  begin
      ws := GetAtendeCliente();
      try
      Endereco := ws.consultaCEP(IBTbProntuarioTBPRT_CEP.AsString);
      IBTbProntuarioTBPRT_ENDERECO.AsString:=Endereco.logradouro;
      IBTbProntuarioTBPRT_BAIRRO.AsString:=Endereco.bairro;
      IBTbProntuarioTBPRT_CIDADE.AsString:=Endereco.cidade;

      except
        on E: SigepClienteException do
        ShowMessage(E.Value);

      end;
  end;

end;

procedure TFrmCadProntuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Perform(Wm_NextDlgCtl,0,0);

end;

procedure TFrmCadProntuario.FormShow(Sender: TObject);
begin
  IBTBProntuario.Open;
end;

procedure TFrmCadProntuario.statusbotoes(acao: string);
begin
  case AnsiIndexStr(UpperCase(acao), ['I', 'A','C', 'S']) of
    0 : begin //Inserir
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=True;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=False;
          BtnConsultar.Enabled:=False;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=True;
        end;
    1 : begin  //Alterar
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=True;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=False;
          BtnConsultar.Enabled:=False;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=True;
        end;

    2 : begin  //Consultar
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=False;
          BtnExcluir.Enabled:=True;
          BtnInserir.Enabled:=False;
          BtnConsultar.Enabled:=False;
          BtnAlterar.Enabled := True;
          BtnCancelar.Enabled :=True;
        end;

    3 : begin      //Salvar
          BtnFechar.Enabled:=True;
          BtnSalvar.Enabled:=False;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=True;
          BtnConsultar.Enabled:=True;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=False;
        end;


  end;

end;

function TFrmCadProntuario.VerificaCampos: Boolean;
begin
  Result:=False;
  If FrmPrincipal.VerifcaDuplicide('TB_PRT', 'TBPRT_CPF', Trim(DBEditCPF.Text) ) Then
    Result:=True;

  If FrmPrincipal.VerifcaDuplicide('TB_PRT', 'TBPRT_RG', Trim(DBEditRG.Text) ) Then
    Result:=True;
 // Verificar nome e nome da mãe
  if DBEditNomeMAE.Text <> EmptyStr  then
  begin
    FrmPrincipal.IBSQL1.Close;
    FrmPrincipal.IBSQL1.SQL.Clear;
    FrmPrincipal.IBSQL1.SQL.Add('SELECT COUNT(*) FROM ' +
                                 'TB_PRT WHERE TBPRT_NOME='''+DBEditNOME.Text+'''' +
                                 ' AND TBPRT_NOMEMAE='''+DBEditNomeMAE.Text+'''');
    FrmPrincipal.IBSQL1.ExecQuery;
    if FrmPrincipal.IBSQL1.FieldByName('COUNT').AsInteger>0  then
    begin
      tFrmMensagens.Mensagem('Já existe um cadastro com mesmo nome e nome da mãe','I',[mbOK]);
      Result:=True;
    end;
  end;



end;

end.

unit UCADColab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBSQL, Vcl.DBCtrls,StrUtils, Vcl.Mask;

type
  TFrmCadColab = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PnlBotoes: TPanel;
    BtnFechar: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnInserir: TBitBtn;
    BtnCancelar: TBitBtn;
    IBSQLUTIL: TIBSQL;
    IBTableColab: TIBTable;
    DSColab: TDataSource;
    IBTableColabTBCOLAB_FONE: TIBStringField;
    IBTableColabTBCOLAB_NOME: TIBStringField;
    IBTableColabTBCOLAB_TIPO: TIBStringField;
    IBTableColabTBCOLAB_RG: TIBStringField;
    IBTableColabTBCOLAB_REGISTRO: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEditNOME: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEditRG: TDBEdit;
    Label5: TLabel;
    DBEditCPF: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    IBTableColabTBCOLAB_ENDERECO: TIBStringField;
    IBTableColabTBCOLAB_BAIRRO: TIBStringField;
    IBTableColabTBCOLAB_CIDADE: TIBStringField;
    IBTableColabTBCOLAB_CEP: TIBStringField;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    IBTableServicos: TIBTable;
    IBTableServicosID_TBSERV: TIntegerField;
    IBTableServicosTBSERV_NOME: TIBStringField;
    DSServicos: TDataSource;
    IBTableColabTBCOLAB_IDSERV: TIntegerField;
    IBTableColabTBCOLAB_ORGEMISSOR: TIBStringField;
    DBLookupListBox1: TDBLookupListBox;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    IBTableColabTBCOLAB_CPF: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3Exit(Sender: TObject);
  private
  procedure statusbotoes(acao:string);
  function verificaCampos:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadColab: TFrmCadColab;

implementation
uses UPrincipal, UMensagens, ConsultaCEP;

{$R *.dfm}

procedure TFrmCadColab.BtnAlterarClick(Sender: TObject);
begin
  try
    IBTableColab.Edit;
  finally
    statusbotoes('A');
  end;
end;

procedure TFrmCadColab.BtnCancelarClick(Sender: TObject);
begin
  IBTableColab.Cancel;
  statusbotoes('S');
end;

procedure TFrmCadColab.BtnExcluirClick(Sender: TObject);
begin
  if tFrmMensagens.Mensagem('Deseja excluir o registro selecionado?','Q',[mbSIM, MBNao]) then
    Begin
      IBTableColab.Delete;
    End;
   statusbotoes('S');
end;

procedure TFrmCadColab.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadColab.BtnInserirClick(Sender: TObject);
begin
  try
    IBTableColab.Insert;
  finally
     statusbotoes('I');
     DBEditNOME.SetFocus;
  end;
end;

procedure TFrmCadColab.BtnSalvarClick(Sender: TObject);
begin
 if Trim(IBTableColabTBCOLAB_CPF.AsString)<>EmptyStr then
  begin
  if FrmPrincipal.ValidaCPF(IBTableColabTBCOLAB_CPF.AsString)    then
  begin
    if DSColab.State  in [dsInsert]  then
    begin
      if DBEditNOME.Text<>EmptyStr  then
      begin
        if not VerificaCampos then
        Begin
          try
            IBTableColab.Post;

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
          IBTableColab.Post;

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
    if DSColab.State  in [dsInsert]  then
    begin
      if not VerificaCampos then
      Begin
        try
          IBTableColab.Post;

        finally
          statusbotoes('S');
        end;
      End;
    end
    Else
    begin
       try
          IBTableColab.Post;

        finally
          statusbotoes('S');
        end;
    end;
  end;
end;

procedure TFrmCadColab.DBEdit3Exit(Sender: TObject);
var
 ws: AtendeCliente;
  Endereco: TEndereco;
begin
  if IBTableColabTBCOLAB_CEP.AsString<>EmptyStr   then
  begin
      ws := GetAtendeCliente();
      try
      Endereco := ws.consultaCEP(IBTableColabTBCOLAB_CEP.AsString);
      IBTableColabTBCOLAB_ENDERECO.AsString:=Endereco.logradouro;
      IBTableColabTBCOLAB_BAIRRO.AsString:=Endereco.bairro;
      IBTableColabTBCOLAB_CIDADE.AsString:=Endereco.cidade;

      except
        on E: SigepClienteException do
        ShowMessage(E.Value);

      end;
  end;
end;

procedure TFrmCadColab.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Perform(Wm_NextDlgCtl,0,0);

end;

procedure TFrmCadColab.FormShow(Sender: TObject);
begin
  IBTableColab.Open;
  IBTableServicos.Open;
end;


procedure TFrmCadColab.statusbotoes(acao: string);
begin
  case AnsiIndexStr(UpperCase(acao), ['I', 'A','C', 'S']) of
    0 : begin //Inserir
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=True;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=False;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=True;
        end;
    1 : begin  //Alterar
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=True;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=False;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=True;
        end;

    2 : begin  //Consultar
          BtnFechar.Enabled:=False;
          BtnSalvar.Enabled:=False;
          BtnExcluir.Enabled:=True;
          BtnInserir.Enabled:=False;
          BtnAlterar.Enabled := True;
          BtnCancelar.Enabled :=True;
        end;

    3 : begin      //Salvar
          BtnFechar.Enabled:=True;
          BtnSalvar.Enabled:=False;
          BtnExcluir.Enabled:=False;
          BtnInserir.Enabled:=True;
          BtnAlterar.Enabled :=False;
          BtnCancelar.Enabled :=False;
        end;
  end;


end;

function TFrmCadColab.verificaCampos: Boolean;
begin
 { Result:=False;
  If (Trim(DBEditCPF.Text))<>EmptyStr Then
  begin
    If FrmPrincipal.VerifcaDuplicide('TB_COLABORADOR', 'TBCOLAB_CPF', Trim(DBEditCPF.Text) ) Then
    Result:=True;
  end;
  IF (Trim(DBEditRG.Text))<>EmptyStr Then
  Begin
    If FrmPrincipal.VerifcaDuplicide('TB_COLABORADOR', 'TBCOLAB_RG', Trim(DBEditRG.Text) ) Then
    Result:=True;
  End;}
end;

end.

unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.ToolWin,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, IBX.IBSQL, RLReport, Vcl.StdCtrls,
  IBX.IBServices;
type
  TAniversariante = class
    Nome:String;
    Celular:String;
    Endereco:String;
    Bairro:String;
    Complemento:String;
    Aniversario:String;
end;


type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Cadastros1: TMenuItem;
    Pronturio1: TMenuItem;
    Servios1: TMenuItem;
    Atendimento1: TMenuItem;
    ToolBar1: TToolBar;
    Sair1: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQUtil: TIBQuery;
    IBQUtil2: TIBQuery;
    Relatrios1: TMenuItem;
    Aniversariantes1: TMenuItem;
    Porrua1: TMenuItem;
    Sobre1: TMenuItem;
    Impressoporbairro1: TMenuItem;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    IBSQLCadastros: TIBSQL;
    Timer1: TTimer;
    IBSQL1: TIBSQL;
    SpeedButton5: TSpeedButton;
    Colaboradores1: TMenuItem;
    Atendimentosporcolaborador1: TMenuItem;
    Label1: TLabel;
    Impressoporzumba1: TMenuItem;
    Panel1: TPanel;
    TViewAniversariante: TTreeView;
    Panel2: TPanel;
    TimerHideMemo: TTimer;
    ImageListAniver: TImageList;
    MemoDados: TMemo;
    BitBtn1: TBitBtn;
    PanelSobre: TPanel;
    RichEditSobre: TRichEdit;
    procedure Servios1Click(Sender: TObject);
    procedure Pronturio1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Porrua1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Impressoporbairro1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Pronturioporrua1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Colaboradores1Click(Sender: TObject);
    procedure Atendimentosporcolaborador1Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
    procedure Impressoporzumba1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TViewAniversarianteClick(Sender: TObject);
    procedure Atendimento1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
  function VerifcaDuplicide(sTabela, sCampo,sValor:String):boolean;
    { Public declarations }
    function ValidaCPF(CPF:String):Boolean;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
Uses UServicos, UMensagens, UCadProntuario , UAtendimento, UConsultarPRua,
UConsultarBairro, UConsultarPrt, UCadColab, UConsultarAtendColaborador,
UAniversariantes, UConsultarPZumba;

{$R *.dfm}

procedure TFrmPrincipal.Aniversariantes1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAniversariantes, FrmAniversariantes);
  FrmAniversariantes.ShowModal;
  FrmAniversariantes.Free;
end;

procedure TFrmPrincipal.Atendimento1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAtendimento, FrmAtendimento);
  FrmAtendimento.ShowModal;
  FrmAtendimento.Free;
end;

procedure TFrmPrincipal.Atendimentosporcolaborador1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultaAtendColab, FrmConsultaAtendColab);
  FrmConsultaAtendColab.ShowModal;
  FrmConsultaAtendColab.Free;
end;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  PanelSobre.Visible :=False;
end;

procedure TFrmPrincipal.Colaboradores1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadColab, FrmCadColab );
  FrmCadColab.ShowModal;
  FrmCadColab.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
Var Aniver:TAniversariante;
begin

  IBQUtil.Close;
  IBQUtil.SQL.Clear;
  IBQUtil.SQL.Add('SELECT TBPRT_NOME, '+
                       '  TBPRT_ENDERECO, '+
                       '  TBPRT_NUMERO, '+
                       '  TBPRT_COMPLEMENTO, '+
                       '  TBPRT_EMAIL, '+
                       '  TBPRT_BAIRRO, '+
                       '  TBPRT_CIDADE, '+
                       '  TBPRT_CELULAR, '+
                       '  TBPRT_NASCIMENTO, '+
                       '  TBPRT_ANIVERSARIO '+
                 '   FROM TB_PRT '+
                '  WHERE TBPRT_ANIVERSARIO=:pData');
  IBQUtil.ParamByName('pData').AsString:=FormatDateTime('dd/mm',now);
  IBQUtil.Open;
  if Not IBQUtil.IsEmpty  then
  Begin
    IBQUtil.First;
    While not IBQUtil.Eof do
    Begin
      Aniver:=TAniversariante.Create;
      Aniver.Nome         :=IBQUtil.FieldByName('TBPRT_NOME').AsString;
      Aniver.Celular      :=IBQUtil.FieldByName('TBPRT_CELULAR').AsString;
      Aniver.Endereco     :=IBQUtil.FieldByName('TBPRT_ENDERECO').AsString;
      Aniver.Complemento  :=IBQUtil.FieldByName('TBPRT_COMPLEMENTO').AsString;
      Aniver.Bairro       :=IBQUtil.FieldByName('TBPRT_BAIRRO').AsString;
      TViewAniversariante.Items.AddObject(Nil,Aniver.Nome,Aniver);
      IBQUtil.Next;
    End;
   Panel1.Visible:=True;
  End;
  MemoDados.Left:=Panel2.Left + 625;

end;

procedure TFrmPrincipal.Impressoporbairro1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultarBairro, FrmConsultarBairro);
  FrmConsultarBairro.ShowModal;
  FrmConsultarBairro.Free;
end;

procedure TFrmPrincipal.Impressoporzumba1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarZumba, FrmConsultarZumba);
  FrmConsultarZumba.ShowModal;
  FrmConsultarZumba.Free;
end;

procedure TFrmPrincipal.Porrua1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarpRua,FrmConsultarpRua);
  FrmConsultarpRua.ShowModal;
  FrmConsultarpRua.Free;
end;

procedure TFrmPrincipal.Pronturio1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProntuario, FrmCadProntuario);
  FrmCadProntuario.ShowModal;
  FrmCadProntuario.Free;
end;

procedure TFrmPrincipal.Pronturioporrua1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsultarPrt,FrmConsultarPrt);
  FrmConsultarPrt.ShowModal;
  FrmConsultarPrt.Free;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.Servios1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmServicos, FrmServicos);
  FrmServicos.ShowModal;
  FrmServicos.Free;
end;

procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
  panelSobre.top := (self.Height div 2) - (panelSobre.height div 2);
  panelSobre.left := (self.Width div 2) - (panelSobre.width div 2);
  PanelSobre.Visible :=True;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadProntuario, FrmCadProntuario);
  FrmCadProntuario.ShowModal;
  FrmCadProntuario.Free;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmServicos, FrmServicos);
  FrmServicos.ShowModal;
  FrmServicos.Free;
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAtendimento, FrmAtendimento);
  FrmAtendimento.ShowModal;
  FrmAtendimento.Free;
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadColab, FrmCadColab );
  FrmCadColab.ShowModal;
  FrmCadColab.Free;

end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  IBSQLCadastros.Close;
  IBSQLCadastros.SQL.Clear;
  IBSQLCadastros.SQL.Add('SELECT COUNT (*) FROM TB_PRT');
  IBSQLCadastros.ExecQuery;
  StatusBar1.Panels.Items[0].Text := 'Número total de cadastros: ' + IBSQLCadastros.FieldByName('COUNT').AsString;
end;

procedure TFrmPrincipal.TViewAniversarianteClick(Sender: TObject);
begin
  if TViewAniversariante.Selected.Data <> Nil   then
   Begin
      MemoDados .Lines.Clear;
      MemoDados.Visible:=True;
      MemoDados.Lines.Add ('Nome: '       +TAniversariante(TViewAniversariante.Selected.Data).Nome);
      MemoDados.Lines.Add ('Celular: '    +TAniversariante(TViewAniversariante.Selected.Data).Celular );
      MemoDados.Lines.Add ('Endereço: '   +TAniversariante(TViewAniversariante.Selected.Data).Endereco );
      MemoDados.Lines.Add ('Complemento: '+TAniversariante(TViewAniversariante.Selected.Data).Complemento);
      MemoDados.Lines.Add ('Bairro: '     +    TAniversariante(TViewAniversariante.Selected.Data).Bairro);
      TimerHideMemo.Enabled :=True;
   End;
end;

function TFrmPrincipal.ValidaCPF(CPF: String): Boolean;
var
  i: Integer;
  cpfSoNumero: String;
  cpfRepetido: Boolean;
  digito1, digito2: Integer;
begin
  result := False;
  // Limpa o que não for numero
  cpfSoNumero := '';
  for i := 1 To length(CPF) do
  begin
    Case char(CPF[i]) of
      '0' .. '9':
        cpfSoNumero := cpfSoNumero + CPF[i];
    End;
  end;

  // verifica se possui os 11 digitos
  if length(cpfSoNumero) <> 11 then
  begin
    exit;
  end;

  // testar se o cpf é repetido como 000.000.000-00
  cpfRepetido := True;
  for i := 2 to length(cpfSoNumero) do
  begin
    if cpfSoNumero[1] <> cpfSoNumero[i] then
    begin
      // se o cpf possui um digito diferente ele passou no teste
      cpfRepetido := False;
      break;
    end;
  end;
  // se o CPF é composto por numeros repetido retorna true
  if (cpfRepetido) then
  begin
    exit;
  end;

  // executa o calculo para o primeiro digito verificador
  digito1 := 0;
  for i := 1 to 9 do
  begin
    digito1 := digito1 + (StrToInt(cpfSoNumero[10 - i]) * (i + 1));
  end;
  { formula do primeiro verificador soma=1°*2+2°*3+3°*4.. até 9°*10 digito1 = 11 - soma mod 11 se digito > 10 digito1 = 0 }
  digito1 := ((11 - (digito1 mod 11)) mod 11) mod 10;
  // verifica se o 1° digito confere
  if inttostr(digito1) <> cpfSoNumero[10] then
  begin
    exit;
  end;

  // executa o calculo para o segundo digito verificador
  digito2 := 0;
  for i := 1 to 10 do
  begin
    digito2 := digito2 + (StrToInt(cpfSoNumero[11 - i]) * (i + 1));
  end;
  { formula do segundo verificador soma=1°*2+2°*3+3°*4.. até 10°*11 digito2 = 11 - soma mod 11 se digito > 10 digito2 = 0 }
  digito2 := ((11 - (digito2 mod 11)) mod 11) mod 10;
  // confere o 2° digito verificador
  if inttostr(digito2) <> cpfSoNumero[11] then
  begin
    exit;
  end;

  // se chegar até aqui o CPF é valido
  result := True;
end;

function TFrmPrincipal.VerifcaDuplicide(sTabela,sCampo, sValor: String): boolean;
begin
  Result:= False;
  if sValor<>EmptyStr  then
  begin

    IBSQL1.Close;
    IBSQL1.Sql.Clear;

    IBSQL1.sql.Add('SELECT '+ sCampo+' FROM '+sTabela+' WHERE '+sCampo+'=' + QuotedStr ( sValor)  );
    IBSQL1.ExecQuery ;
    if not IBSQL1.IsEmpty  then
      begin
        tFrmMensagens.Mensagem('Já existe um cadastro com este '+ copy (sCampo, 7, Length(sCampo)),'I',[mbOK]);
        Result:=True;
      end;
    end;
end;

end.

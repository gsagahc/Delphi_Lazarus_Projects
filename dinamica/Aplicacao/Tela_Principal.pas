unit Tela_Principal;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QMenus, QTypes, Provider, QComCtrls, DBClient, DBLocal,
  DBLocalI, DB, IBCustomDataSet, IBTable, IBDatabase, IBUpdateSQL, IBQuery,
  QExtCtrls, QImgList;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Ferramentas1: TMenuItem;
    Importaodearquivos1: TMenuItem;
    Sair1: TMenuItem;
    IBClientDataSet1: TIBClientDataSet;
    OpenDialog1: TOpenDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Clientes1: TMenuItem;
    Estabelecimentos1: TMenuItem;
    Cobradores1: TMenuItem;
    Panel1: TPanel;
    Sobre1: TMenuItem;
    Siscob1: TMenuItem;
    IBTb_clientes: TIBTable;
    IBTb_Cad_Parc: TIBTable;
    DataSource1: TDataSource;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBUpdateSQL1: TIBUpdateSQL;
    IBQGeral: TIBQuery;
    IBTb_clientesCPF_CLI: TIBStringField;
    IBTb_clientesNOME_CLI: TIBStringField;
    IBTb_clientesENDERECO_CLI: TIBStringField;
    IBTb_clientesBAIRRO_CLI: TIBStringField;
    IBTb_clientesCIDADE_CLI: TIBStringField;
    IBTb_clientesCEP_CLI: TIBStringField;
    IBTb_clientesUF_CLI: TIBStringField;
    IBTb_clientesFONE1_CLI: TIBStringField;
    IBTb_clientesFONE2_CLI: TIBStringField;
    IBTb_clientesCELULAR_CLI: TIBStringField;
    IBTb_clientesCONTATO_CLI: TIBStringField;
    IBTb_clientesEMPRESA_CLI: TIBStringField;
    IBTb_clientesEND_COM_CLI: TIBStringField;
    IBTb_clientesBAIRRO_COM_CLI: TIBStringField;
    IBTb_clientesCIDADE_COM_CLI: TIBStringField;
    IBTb_clientesUF_COM_CLI: TIBStringField;
    IBTb_clientesFONE_COM_CLI: TIBStringField;
    IBTb_Cad_ParcCPF_CLI: TIBStringField;
    IBTb_Cad_ParcESTATUS_PARCE: TSmallintField;
    IBTb_Cad_ParcDATA_PAG_PARCE: TDateTimeField;
    IBTb_Cad_ParcVALOR_PG_PARCE: TFloatField;
    IBTb_Cad_ParcOBS_PARCE: TIBStringField;
    IBTb_Cad_ParcPARCELA_DE_PARCELAS: TIBStringField;
    IBTb_Cad_ParcNUM_CARNET: TIntegerField;
    IBTb_Cad_ParcDATA_COMPRA: TDateTimeField;
    IBTb_Cad_ParcCOD_LOJA: TIntegerField;
    IBTb_Cad_ParcTIPO_PAG: TIBStringField;
    IBTb_Cad_ParcNUM_PARCELAS: TIntegerField;
    IBTb_Cad_ParcVENC_PARCE: TDateTimeField;
    IBTb_Cad_ParcVALOR_PARCE: TIBStringField;
    procedure Sair1Click(Sender: TObject);
    procedure Importaodearquivos1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    Procedure ProcedureSair;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Siscob1Click(Sender: TObject);
  private
    procedure Sair;
   

    { Private declarations }
  public
    Caminho:String;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
Uses  importacao, UCad_Cli, UAbout;
{$R *.xfm}

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
   ProcedureSair;

end;

procedure TFrmPrincipal.Importaodearquivos1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
   Begin
     Caminho:= OpenDialog1.FileName ;
     If Not FileExists(Caminho) Then
       raise Exception.Create ('Arquivo não existente')
     Else
     Begin
        Application.CreateForm(TfrmImportacao, Frmimportacao);
        frmimportacao.ShowModal;

        Frmimportacao.Free;



     End;
   End;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
   Begin
     Caminho:= OpenDialog1.FileName ;
     If Not FileExists(Caminho) Then
       raise Exception.Create ('Arquivo não existente')
     Else
     Begin
        Application.CreateForm(TfrmImportacao, Frmimportacao);
        frmimportacao.ShowModal;

        Frmimportacao.Free;



     End;
   End;
end;

procedure TFrmPrincipal.ToolButton5Click(Sender: TObject);
begin
  ProcedureSair ;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  IBTb_clientes.Open;
  IBTb_clientes.First; 
  Application.CreateForm(TfrmCadcli, FrmCadCli);
  FrmCadcli.ShowModal;
  FrmCadCli.Free;

end;

procedure TFrmPrincipal.Sair;
begin

end;

procedure TFrmPrincipal.ProcedureSair;
begin
    if MessageDlg('Deseja encerrar a aplicação?', mtConfirmation, [mbYes,mbno], 0) = mrYes then
       Begin
        Application.Terminate;
       End;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  ProcedureSair ;
  CanClose:=False;
end;

procedure TFrmPrincipal.ToolButton2Click(Sender: TObject);
begin
 Application.CreateForm(TFrmCadCli,FrmCadCli );
 FrmCadcli.ShowModal;
 FrmCadCli.Free ;

end;

procedure TFrmPrincipal.ToolButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  StatusBar1.Panels.Items[0].Text :='Importação de arquivos de cobrança (apenas em formato txt)';
end;

procedure TFrmPrincipal.ToolBar1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   StatusBar1.Panels.Items[0].Text:='';   
end;

procedure TFrmPrincipal.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   StatusBar1.Panels.Items[0].Text:='';   
end;

procedure TFrmPrincipal.ToolButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   StatusBar1.Panels.Items[0].Text:='Cadastro de clientes';
end;

procedure TFrmPrincipal.ToolButton5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    StatusBar1.Panels.Items[0].Text:='Encerrar a aplicação';
end;

   
procedure TFrmPrincipal.ToolButton3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    StatusBar1.Panels.Items[0].Text:='Localizar clientes';
end;

procedure TFrmPrincipal.Siscob1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAboutbox, FrmAboutbox);
  FrmAboutbox.ShowModal;
  FrmAboutBox.Free;

end;

end.

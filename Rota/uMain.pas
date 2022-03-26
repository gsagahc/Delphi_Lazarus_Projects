unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ToolWin, ImgList, ExtCtrls, Db, IBCustomDataSet,
  IBDatabase, IBQuery, IBTable, DBTables, 
  jpeg, StdCtrls,IniFiles,FileCtrl,ShellApi;

type
  TFrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    StatusBar1: TStatusBar;
    ListadeAniversariantes1: TMenuItem;
    Sair1: TMenuItem;
    ImageList1: TImageList;
    Image1: TImage;
    Sobre1: TMenuItem;
    ToolButton5: TToolButton;
    DSClientes: TDataSource;
    DSCategoria: TDataSource;
    Panel1: TPanel;
    Shape1: TShape;
    Categorias1: TMenuItem;
    Image2: TImage;
    Label1: TLabel;
    Configuraes1: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTbCategoria: TIBTable;
    IBTbCategoriaID_CATEGORIA: TIntegerField;
    IBTbCategoriaDESCRICAO: TIBStringField;
    QryWork: TIBQuery;
    IBTbClientes: TIBQuery;
    IBTbClientesID_CATEGORIA: TIntegerField;
    IBTbClientesNOME: TIBStringField;
    IBTbClientesFUNCAO: TIBStringField;
    IBTbClientesEMPRESA: TIBStringField;
    IBTbClientesENDERECO: TIBStringField;
    IBTbClientesBAIRRO: TIBStringField;
    IBTbClientesCIDADE: TIBStringField;
    IBTbClientesCEP: TIBStringField;
    IBTbClientesFONE: TIBStringField;
    IBTbClientesFAX: TIBStringField;
    IBTbClientesCELULAR: TIBStringField;
    IBTbClientesEMAIL: TIBStringField;
    IBTbClientesDATA_NASC: TIBStringField;
    IBTbClientesESTADO: TIBStringField;
    IBTbClientesID_CLIENTE: TIntegerField;
    IbTbConfig: TIBTable;
    IbTbConfigCOD: TIntegerField;
    IbTbConfigIMAGEM: TBlobField;
    procedure Clientes1Click(Sender: TObject);
    procedure ListadeAniversariantes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Trataerros(Sender: TObject; E: Exception);
    procedure Configuraes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    IniFile:TIniFile;
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
Uses Unit1, USobre, UListagemDeAniversariantes, UCategoria, UConfig;
{$R *.DFM}

procedure TFrmMain.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFormCadClientes,FormCadClientes);
  FormCadClientes.ShowModal;
  FormCadClientes.Free;
end;

procedure TFrmMain.ListadeAniversariantes1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmListagem,FrmListagem);
  FrmListagem.ShowModal;
  FrmListagem.Free;
end;

procedure TFrmMain.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var LocalBanco:String;
begin
  IBDatabase1.Close;
  IniFile := TIniFile.Create (ChangeFileExt (
       Application.ExeName, '.ini'));
  LocalBanco:=IniFile.ReadString('BANCO', 'LOCAL',LocalBanco);
  IBDatabase1.DatabaseName :=LocalBanco;
  IBDatabase1.Open;
  Application.OnException := TrataErros;
  StatusBar1.Panels.Items[0].Text:=StatusBar1.Panels.Items[0].Text+' '+dateToSTr(Date);
end;

procedure TFrmMain.Sobre1Click(Sender: TObject);
begin
  Application.CreateForm(TformSobre,FormSobre);
  FormSobre.ShowMOdal;
  FormSobre.Free;
end;

procedure TFrmMain.ToolButton5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMain.ToolButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFormCadClientes,FormCadClientes);
  FormCadClientes.ShowModal;
  FormCadClientes.Free;
end;

procedure TFrmMain.ToolButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmListagem,FrmListagem);
  FrmListagem.ShowModal;
  FrmListagem.Free;
end;

procedure TFrmMain.Categorias1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCategoria,FrmCategoria);
  FrmMain.IBTbCategoria.OPen; 
  FrmCategoria.QuickRep1.Prepare;
  FrmCategoria.QuickRep1.Preview;
  FrmMain.IBTbCategoria.Close;
end;



procedure TFrmMain.Trataerros(Sender: TObject; E: Exception);
var mensagem: string;
    Pos1, Pos2: integer;
begin
  if E Is EDBEngineError Then
      MessageDlg('Ocorreu um ao acessar o banco de dados.', mtCustom,[mbOk],0)
  Else If E Is EOutOfMemory Then
      MessageDlg('Sem memória para efetuar esta operação.', mtCustom,[mbOk],0)
  Else  If E Is EAccessViolation Then
    Begin
      MessageDlg('Aconteceu uma operaçao anormal no programa, se o problema continuar favor avisar ao suporte.', mtCustom,[mbOk],0);
      Application.Terminate;
    end
  Else
    MessageDlg('Aconteceu uma operaçao anormal no programa, se o problema continuar favor avisar ao suporte.', mtCustom,[mbOk],0);
end;

procedure TFrmMain.Configuraes1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConfig,FrmConfig);
  FrmConfig.ShowModal;
  FrmConfig.Free;
end;

end.

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, WinSkinData, ComCtrls, DBTables, DB,  DBCtrls, Buttons,
  StdCtrls;
Type TFormMain=Procedure;StdCall;
type

  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    OS1: TMenuItem;
    StatusBar1: TStatusBar;
    Clientes1: TMenuItem;
    NovaOS1: TMenuItem;
    TbClientes: TTable;
    TbClientesCod_cli: TAutoIncField;
    TbClientesCliente: TStringField;
    TbClientesEndereco: TStringField;
    TbClientesBairro: TStringField;
    TbClientesCidade: TStringField;
    TbClientesTelefone: TStringField;
    TbClientesCep: TStringField;
    TbClientesContato: TStringField;
    TbClientesEmail: TStringField;
    TbClientesRoteiro: TMemoField;
    TbClientesObs: TMemoField;
    TbClientesFatura: TStringField;
    QrClientes: TQuery;
    Database1: TDatabase;
    DSLocCli: TDataSource;
    DSClientes: TDataSource;
    TBOS: TTable;
    QrOS: TQuery;
    DSOs: TDataSource;
    DSLOcOS: TDataSource;
    TBOSCod_cli: TIntegerField;
    TBOSEquipamento: TStringField;
    TBOSFabricante: TStringField;
    TBOSModelo: TStringField;
    TBOSSerie: TStringField;
    TBOSAtivo: TStringField;
    TBOSData: TDateField;
    TBOSDefeito_Cliente: TStringField;
    TBOSDiagnostico: TMemoField;
    TBOSOrcamento: TCurrencyField;
    TBOSSaida: TDateField;
    TBOSObs: TMemoField;
    TBOSSolucao: TMemoField;
    QrPrintOS: TQuery;
    QrPrintOSCod_Os: TIntegerField;
    QrPrintOSEquipamento: TStringField;
    QrPrintOSFabricante: TStringField;
    QrPrintOSModelo: TStringField;
    QrPrintOSSerie: TStringField;
    QrPrintOSAtivo: TStringField;
    QrPrintOSData: TDateField;
    QrPrintOSDefeito_Cliente: TStringField;
    QrPrintOSDiagnostico: TMemoField;
    QrPrintOSStatus: TStringField;
    QrPrintOSOrcamento: TCurrencyField;
    QrPrintOSSaida: TDateField;
    QrPrintOSObs: TMemoField;
    QrPrintOSSolucao: TMemoField;
    QrPrintOSCliente: TStringField;
    QrPrintOSEndereco: TStringField;
    QrPrintOSBairro: TStringField;
    QrPrintOSCidade: TStringField;
    QrPrintOSTelefone: TStringField;
    QrPrintOSCep: TStringField;
    QrPrintOSCnpj: TStringField;
    QrPrintOSIe: TStringField;
    QrPrintOSContato: TStringField;
    QrPrintOSEmail: TStringField;
    QrPrintOSRoteiro: TMemoField;
    Backup1: TMenuItem;
    TBOSOs: TIntegerField;
    QrPrintOSOS: TIntegerField;
    QrPrintOSCod_cli: TIntegerField;
    QrPrintOSCod_cli_1: TIntegerField;
    QrOSOs: TIntegerField;
    QrOSCod_cli: TIntegerField;
    QrOSEquipamento: TStringField;
    QrOSFabricante: TStringField;
    QrOSModelo: TStringField;
    QrOSSerie: TStringField;
    QrOSAtivo: TStringField;
    QrOSData: TDateField;
    QrOSDefeito_Cliente: TStringField;
    QrOSDiagnostico: TMemoField;
    QrOSStatus: TStringField;
    QrOSOrcamento: TCurrencyField;
    QrOSSaida: TDateField;
    QrOSObs: TMemoField;
    QrOSSolucao: TMemoField;
    TBOSCod_Os: TAutoIncField;
    Sobre1: TMenuItem;
    TbClientesCnpj: TStringField;
    TbClientesIe: TStringField;
    TBOSStatus: TStringField;
    TbClientesUF: TStringField;
    Sair1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    SkinData1: TSkinData;
    procedure NovaOS1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    Procedure SetControls(Form:TForm);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure ExecuteSqlQCli (StrSql: String);
    procedure Backup1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    Procedure  TotalOsPendentes;
  private
    { Private declarations }
  public
      CODCLI, CODOS: String;
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses CadOS, CadClientes, Sobre;


{$R *.dfm}

procedure TFPrincipal.NovaOS1Click(Sender: TObject);
begin
  Application.CreateForm(TFOs, FOs);
  FOs.Showmodal;
  FOs.Free;

end;

procedure TFPrincipal.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFCliente, FCliente);
  FCliente.Showmodal;
  FCliente.Free;
end;

procedure TFPrincipal.SetControls(Form: TForm);
Var Count:Integer;
    Componente:TComponent;
    DbEdit : TDbEdit;
    DbMemo : TDBMemo;
    SpeedBtn : TSpeedButton;
    DBCombo :  TDBComboBox;
    DBLookupCombo :TDBLookupComboBox;
begin
    For Count:= 0 To Form.ComponentCount -1 Do
      Begin
        Componente:= ( Form.Components[Count] As TComponent  );
           If Componente is TDBEdit Then
              Begin
                DbEdit:= (Componente As TDbEdit);
                DBEdit.ReadOnly:= Not DBEdit.ReadOnly;
              End;
           If Componente is TDBMemo Then
              Begin
                DbMemo:= (Componente As TDbMemo);
                DBMemo.ReadOnly:= Not DBMemo.ReadOnly;
              End;
           If Componente is TSpeedButton Then
              Begin
                SpeedBtn:= (Componente As TSpeedButton);
                SpeedBtn.Enabled := Not SpeedBtn.Enabled;
              End;
            If Componente is TDBComboBox  Then
              Begin
                DBCombo := (Componente As TDBComboBox );
                DBCombo.ReadOnly  := Not DBCombo.ReadOnly;
              End;
            If Componente is TDBLookupComboBox  Then
              Begin
                DBLookupCombo := (Componente As TDBLookupComboBox );
                DBLookupCombo.ReadOnly  := Not DBLookupCombo.ReadOnly;
              End;
      End;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  Database1.Open;
  Label2.Font.Color :=$58A56E3A;


end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 If MessageDlg('Deseja encerrar o sistema',mtConfirmation,[mbYes,mbNo], 0) = mrYes then
   Begin
     Database1.Close;
     Application.Terminate;
   End;
end;

procedure TFPrincipal.ExecuteSqlQCli(StrSql: String);
begin
   With QrClientes  Do
     Begin
       Close;
       Sql.Clear;
       Sql.Add (StrSql );
       Open;
      End;
end;

procedure TFPrincipal.Backup1Click(Sender: TObject);
var Erro:word;
    LibHandle:THandle;
    ChamarForm:TFormMain;
begin
  Try
    Database1.Close;
    LibHandle:=Loadlibrary('Backup.dll');
    If LibHandle<>0 Then
      Try
        @ChamarForm:=GetProcAddress(LIbHandle,'ChamarForm');
        If @ChamarForm<>Nil Then
          ChamarForm
        Else
          Raise Exception.Create('Função não pode ser carregada!');
        Finally
          FreeLibrary(LibHandle);
      End
    Else
    Raise Exception.Create('Erro ao carregar biblioteca');
  Finally
    Database1.OPen;

  End;
end;

procedure TFPrincipal.Sobre1Click(Sender: TObject);
begin
  Application.CreateForm(TFormSobre, FormSobre);
  FormSobre.Showmodal;
  FormSobre.Free;
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Close; 
end;

Procedure TFPrincipal.TotalOsPendentes;
Var Sql:String;
begin
  With QrOS Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM OS WHERE STATUS=''PENDENTE''');
      Open;
      First;

    End;
      StatusBar1.Panels.Items[0].Text :='Total de OS Pendentes:  ' +  IntToStr(QrOS.RecordCount);
end;

end.

unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, ToolWin, Buttons, StdCtrls, ShellApi, ImgList,
  DB, DBTables, BDE, WinSkinData, Grids, DBGrids, FrameShowContas, Inifiles;
Type TFormMain=Procedure;StdCall;
type
  Tfrmprincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    ConsultadeProdutos1: TMenuItem;
    CadastrodeVendedores1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    Sair1: TMenuItem;
    Vendas1: TMenuItem;
    Relatorios1: TMenuItem;
    Cadastros1: TMenuItem;
    ListagemdeProdutos1: TMenuItem;
    TabeladePreos1: TMenuItem;
    ListagemdeVendedores1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoSisloja1: TMenuItem;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    BtCadProdutos: TSpeedButton;
    BtCadVendedores: TSpeedButton;
    BtCadClientes: TSpeedButton;
    BtSair: TSpeedButton;
    ControledeVendas1: TMenuItem;
    COntas1: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Contas2: TMenuItem;
    ContasaPagar2: TMenuItem;
    ContasaReceber2: TMenuItem;
    N3: TMenuItem;
    Listagemdeclientes1: TMenuItem;
    CadastrodeFornecedores1: TMenuItem;
    ListagemdeFornecedores1: TMenuItem;
    Utilitrios1: TMenuItem;
    Backupdosistema1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Graficos1: TMenuItem;
    evolucaodevendas1: TMenuItem;
    ConsultadeClientes1: TMenuItem;
    Image1: TImage;
    ConsultadePedidos1: TMenuItem;
    Caixa1: TMenuItem;
    Vendasporvendedor1: TMenuItem;
    Timer1: TTimer;
    ListagemdeClientesInativos1: TMenuItem;
    Calculadora1: TMenuItem;
    Oramentos1: TMenuItem;
    Ferramentas1: TMenuItem;
    Syscheque1: TMenuItem;
    Correes1: TMenuItem;
    SkinData1: TSkinData;
    Usurios1: TMenuItem;
    Permisses1: TMenuItem;
    Vendassemcadastro1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ConsultadeProdutos1Click(Sender: TObject);
    procedure CadastrodeVendedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure BtCadProdutosClick(Sender: TObject);
    procedure CadastrodeClientes1Click(Sender: TObject);
    procedure ControledeVendas1Click(Sender: TObject);
    procedure Peodutos1Click(Sender: TObject);
    procedure TabeladePreos1Click(Sender: TObject);
    procedure ListagemdeVendedores1Click(Sender: TObject);
    procedure Listagemdeclientes1Click(Sender: TObject);
    procedure BtCadVendedoresClick(Sender: TObject);
    procedure BtCadClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastrodeFornecedores1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ListagemdeFornecedores1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure Backupdosistema1Click(Sender: TObject);
    procedure evolucaodevendas1Click(Sender: TObject);
    procedure ConsultadeClientes1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConsultadePedidos1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Vendasporvendedor1Click(Sender: TObject);
    procedure Correes1Click(Sender: TObject);
    procedure ListagemdeClientesInativos1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
    procedure Syscheque1Click(Sender: TObject);
    procedure SobreoSisloja1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure Vendassemcadastro1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Lerconfs;
    procedure FormCreate(Sender: TObject);
  private
    Edit:Tedit;
    { Private declarations }
  public
      GblPermicao:String;
      impressora,Vendedor:Integer;
//    Variaveis de conversão de pedidos
      Cliente, Descricao:String;
      CodVen,CodItens,Prazo,Tipo, produto:Integer;
      Senha,Pedido:String;
      CodUser:String;
      Servidor, Alias, Fone:String;
      Procedure FormAlertaSenha (Titulo:String;texto:String);
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;
  _v: String[1];
  _primeira: String[1];
   ArqIni: TIniFile;
  FlagBreak : Boolean;
  FlagDoing : Boolean;
implementation

uses Produtos, ConsProd, Vendedor, Fornecedor, clientes, ManVendas, relato,
  Relpro, Selpro, Reltab, Relven, Relcli, Gerpag, Rotinas, Gerrec, Sobre,Splash,
  relfor, relpag, Selpag, selrec, ubobususenha, ubobusu, ubobusuc , grafico,
  conscli, DataMod, CONSPED, SelVendasporVendedor, Orcamentos, VENDEDOR1,
  FrmAlertaSenha, ShowContaPag, ShowContaRec, ShowCheques, Permissoes,
  Vendas_SC, RelVendasSCadastro ;

  
{$R *.DFM}

procedure Tfrmprincipal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[1].Text:= TimeToStr (Now);
end;

procedure Tfrmprincipal.BtSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmprincipal.StatusBar1Click(Sender: TObject);
begin
  Statusbar1.Panels[0].Text:=DatetoStr(date);
 Statusbar1.Panels[1].Text:=TimetoStr(Now);
end;


procedure Tfrmprincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmprincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProdutos,FrmProdutos);
  frmprodutos.showmodal;
  FrmProdutos.Free;
end;

procedure Tfrmprincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =  #13 then
     begin
        key:=#0;
        Perform (CM_DialogKey, VK_TAB, 0);
     end;
end;

procedure Tfrmprincipal.ConsultadeProdutos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConsProd,frmConsProd);
  frmConsProd.showmodal;
  FrmConsProd.Free;
end;

procedure Tfrmprincipal.CadastrodeVendedores1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmvendedor,frmvendedor);
  frmvendedor.showmodal;
  FrmVendedor.Free;
end;

procedure Tfrmprincipal.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmfornecedor,frmfornecedor);
  frmfornecedor.showmodal;
end;

procedure Tfrmprincipal.BtCadProdutosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmprodutos,frmprodutos);
  frmprodutos.showmodal;
  frmprodutos.Free;
end;

procedure Tfrmprincipal.CadastrodeClientes1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmclientes, frmclientes);
  frmclientes.showmodal;
  FrmClientes.Free;
end;

procedure Tfrmprincipal.ControledeVendas1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmmanvendas,frmmanvendas);
  frmmanvendas.showmodal;
  frmManvendas.Free;
end;

procedure Tfrmprincipal.Peodutos1Click(Sender: TObject);
begin
 IF frmrelpro =Nil Then
   Application.CreateForm(Tfrmrelpro,frmrelpro);
  frmrelpro.query1.close;
  frmrelpro.query1.sql.clear;
  frmrelpro.query1.sql.add('select * from produtos order by codigo');
  frmrelpro.query1.open;
  Frmrelpro.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelpro.preview;
end;

procedure Tfrmprincipal.TabeladePreos1Click(Sender: TObject);
begin
 iF frmreltab = NIL Then
  Application.CreateForm(Tfrmreltab,frmreltab);
 frmreltab.query1.close;
 frmreltab.query1.sql.clear;
 frmreltab.query1.sql.add('select * from produtos order by codigo');
 frmreltab.query1.open;
 Frmreltab.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
 frmreltab.preview;
end;

procedure Tfrmprincipal.ListagemdeVendedores1Click(Sender: TObject);
begin
 If frmrelven = Nil Then
   Application.CreateForm(Tfrmrelven,frmrelven);
  frmrelven.query1.close;
  frmrelven.query1.sql.clear;
  frmrelven.query1.sql.add('select * from vendedores');
  frmrelven.query1.open;
  Frmrelven.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelven.preview;
end;

Procedure Tfrmprincipal.Listagemdeclientes1Click(Sender: TObject);
begin
  If FrmRelCli1 = Nil Then
    Application.CreateForm(TFrmrelcli1,FrmRelCli1);
  frmrelcli1.query1.close;
  frmrelcli1.query1.sql.clear;
  frmrelcli1.query1.sql.add('select * from clientes where Status=''N''');
  frmrelcli1.query1.open;
  Frmrelcli1.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelcli1.preview;
end;

procedure Tfrmprincipal.BtCadVendedoresClick(Sender: TObject);
begin
 Application.CreateForm(Tfrmvendedor,frmvendedor);
 frmvendedor.showmodal;
 frmvendedor.Free;
end;

procedure Tfrmprincipal.BtCadClientesClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmclientes,frmclientes);
  frmclientes.showmodal;
  frmclientes.Free;
end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
Var Total: Currency;
    MostrarContas, MostrarCheques:Boolean;
begin

 produto:=0;
 // frmSplash.free;
  with frmprincipal do
  begin
     Top   := 0;
     Left  := 0;
     Width := Screen.Width;
     Height:= Screen.Height;
     ShortDateFormat := 'dd/mm/yy';
     DecimalSeparator:= ',';
     ThousandSeparator:= '.';
//     TwoDigitYearCenturyWindow:=50;
  end;

  statusbar1.panels[0].text := Mostradata(date);
  statusbar1.Panels[1].text := Timetostr(Now);
  _v:=#39;
  _primeira:='S';
  bobususenha:=Tbobususenha.Create(Application);
  bobususenha.Showmodal;
  if _primeira='#' then
     bobususenha.Close;
  Image1.Picture.LoadFromFile('Akemi2.jpg');
  bobususenha.Free;
   MostrarContas:=False;
  {**************VERIFICANDO CONTAS A PAGAR E RECEBER COM VENCIMENTO PARA HOJE*************}
  Application.CreateForm(TFrmShowContaPag, FrmShowContaPag);
  with FrmShowContaPag.QryShowContaRec do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT CREC.VENCTO,CREC.VALOR,CREC.EMISSAO, CREC.PEDIDO, '+
                  ' CREC.dataped, CREC.cliente,CREC.nota, CL.codigo,CL.nome'+
                  ' FROM CONTAREC CREC INNER JOIN CLIENTES CL ON           '+
                  ' CREC.CLIENTE=CL.CODIGO WHERE VENCTO='''+
                  FormatDateTime('MM/DD/YYYY',(NOW))+''' AND PAGO=''N'' ORDER BY VENCTO');
         Open;
         {**calculando total*********}
         If FrmShowContaPag.QryShowContaRec.RecordCount>0 Then
            Begin
               MostrarContas:=True;
               Total:=0;
               FrmShowContaPag.QryShowContaRec.First;
               While NOt  FrmShowContaPag.QryShowContaRec.Eof  do
                     Begin
                        Total:= Total + FrmShowContaPag.QryShowContaRecVALOR.AsCurrency;
                        FrmShowContaPag.QryShowContaRec.Next;
                     End;
               FrmShowContaPag.Label4.Caption:= FrmShowContaPag.Label4.Caption+CurrToStrF (Total, ffCurrency, 2);


            End;
      End;

   with FrmShowContaPag.QryShowContaPAG do
      begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT * FROM CONTAPAG WHERE VENCTO='''+FormatdateTime('MM/DD/YYYY',now)+'''');
         Open;
         {**calculando total*********}
         If FrmShowContaPag.QryShowContaPag.RecordCount>0 Then
            Begin
                 MostrarContas:=True;
                 Total:=0;
                 FrmShowContaPag.QryShowContaPAG.First;
                 While NOt  FrmShowContaPag.QryShowContaPag.Eof  do
                       Begin
                          Total:= Total + FrmShowContaPag.QryShowContaPagVALOR.AsCurrency;
                          FrmShowContaPag.QryShowContaPag.Next;
                       End;
              FrmShowContaPag.Label2.Caption:= FrmShowContaPag.Label2.Caption+CurrToStrF (Total, ffCurrency, 2);
           End;
         If MostrarContas = True Then
            FrmShowContaPag.Show;
      End;

 {***************VERIFICANDO CHEQUES COM VENCIMENTO PARA HOJE*************************************}

  MostrarCheques:=False;
  Application.CreateForm(TFrmShowCheques, FrmShowCheques);
  With FrmShowCheques.QryChequesEmitidos do
      Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHEQUES WHERE TIPO =''E'' AND DT_VENCIMENTO=''' + FormatDateTime('MM/DD/YYYY',(NOW))+''' ORDER BY DT_VENCIMENTO');
          Open;
           If FrmShowCheques.QryChequesEmitidos.RecordCount>0 Then
            Begin
               MostrarCheques:=True;
               Total:=0;
               FrmShowCheques.QryChequesEmitidos.First;
               While NOt  FrmShowCheques.QryChequesEmitidos.Eof  do
                     Begin
                        Total:= Total + FrmShowCheques.QryChequesEmitidosVALOR.AsCurrency;
                        FrmShowCheques.QryChequesEmitidos.Next;
                     End;
               FrmShowCheques.Label2.Caption:= FrmShowCheques.Label2.Caption+CurrToStrF (Total, ffCurrency, 2);

            End;

      End;
   With FrmShowCheques.QryChequesRecebids  do
      Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHEQUES WHERE TIPO =''R'' AND DT_VENCIMENTO=''' + FormatDateTime('MM/DD/YYYY',(NOW))+''' ORDER BY DT_VENCIMENTO');
          Open;
           If FrmShowCheques.QryChequesRecebids.RecordCount>0 Then
            Begin
               MostrarCheques:=True;
               Total:=0;
               FrmShowCheques.QryChequesRecebids.First;
               While NOt  FrmShowCheques.QryChequesRecebids.Eof  do
                     Begin
                        Total:= Total + FrmShowCheques.QryChequesRecebidsVALOR.AsCurrency;
                        FrmShowCheques.QryChequesRecebids.Next;
                     End;
               FrmShowCheques.Label4.Caption:= FrmShowCheques.Label4.Caption+CurrToStrF (Total, ffCurrency, 2);

            End;

      End;
     If MostrarCheques = True Then
            FrmShowCheques .Show;
end;

procedure Tfrmprincipal.CadastrodeFornecedores1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmfornecedor,frmfornecedor);
  frmfornecedor.showmodal;
  FrmFornecedor.Free;
end;

procedure Tfrmprincipal.ContasaPagar1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmgerpag, frmgerpag);
  frmgerpag.showmodal;
  frmgerpag.Free;
end;

procedure Tfrmprincipal.ContasaReceber1Click(Sender: TObject);
begin
   Application.CreateForm(Tfrmgerrec,frmgerrec);
   frmgerrec.showmodal;
   frmgerrec.Free;
end;

procedure Tfrmprincipal.ListagemdeFornecedores1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmrelfor,frmrelfor);
  frmrelfor.query1.close;
  frmrelfor.query1.sql.clear;
  frmrelfor.query1.sql.add('select * from fornecedores');
  frmrelfor.query1.open;
  Frmrelfor.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelfor.preview;
  FrmRelfor.Free;
end;

procedure Tfrmprincipal.ContasaPagar2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmselpag,frmselpag);
  frmselpag.showmodal;
  FrmSelpag.Free;
end;

procedure Tfrmprincipal.ContasaReceber2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmselrec,frmselrec);
  frmselrec.showmodal;
  FrmSelrec.Free;
end;

procedure Tfrmprincipal.Backupdosistema1Click(Sender: TObject);
var
 StartupInfo:TStartupInfo;
 ProcessInformation:TProcessInformation ;
 Rc:Boolean;
Begin
  //Fechar Banco dados
   dmPrincipal.Database1.Close;
    //Inicializa StartupInfo com 0
    FillChar (StartupInfo, SizeOf(StartupInfo),#0);
    //Inicializa Campos StartupInfo
    With StartupInfo Do
       cb:=SizeOf(StartupInfo);
       //Dispara processo de backup
       rc:=CreateProcess(NIL,'SYSBACKUP.EXE',NIL,NIL,FALSE,NORMAL_PRIORITY_CLASS,NIL,
       NIL,StartupInfo, ProcessInformation );
   //Espera terminar
   If rc Then
      WaitForSingleObject(ProcessInformation.hProcess, INFINITE );

 //Abrir Banco dados
   dmPrincipal.Database1.Open;
End;
{var Erro:word;
    LibHandle:THandle;
    ExibeForm:TFormMain;
begin
  Try
    dmPrincipal.Database1.Close;
    LibHandle:=Loadlibrary('Sysbackup.dll');
    If LibHandle<>0 Then
      Try
        @ExibeForm:=GetProcAddress(LIbHandle,'ExibeForm');
        If @ExibeForm<>Nil Then
          ExibeForm
        Else
          Raise Exception.Create('Função não pode ser carregada!');
        Finally
          Begin
             FreeLibrary(LibHandle);
             dmPrincipal.Database1.OPen;
           End  
      End
    Else
    Raise Exception.Create('Verifique se a ferramenta de backup foi instalada!');
  Finally
    dmPrincipal.Database1.OPen;
  End;}


procedure Tfrmprincipal.evolucaodevendas1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmgrafevol,frmgrafevol);
  frmgrafevol.showmodal;
  FrmGrafevol.Free;
end;

procedure Tfrmprincipal.ConsultadeClientes1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmconscli,frmconscli);
  frmconscli.showmodal;
  frmconscli.Free; 
end;

procedure Tfrmprincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If  (Shift =[ssCtrl]) And (Key = Vk_F8)  Then
      Begin
        Application.CreateForm(Tbobususenha,bobususenha);
        bobususenha.ShowModal;
      End;
 If  (Shift =[ssCtrl]) And (Key = Vk_F5)  Then
      Begin
        Application.CreateForm(TfrmManVendas,frmManVendas);
        frmManVendas.ShowModal;
        frmManVendas.Free;
      End;
 If  (Shift =[ssCtrl]) And (Key = Vk_F6)  Then
      Begin
        Application.CreateForm(TfrmVendas_SC,frmVendas_SC);
        frmVendas_SC.ShowModal;
        frmVendas_SC.Free;
      End;
end;

procedure Tfrmprincipal.ConsultadePedidos1Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsPed,FrmConsPed);
   FrmConsPed.ShowModal;
   FrmConsPed.Free;
end;

procedure Tfrmprincipal.Caixa1Click(Sender: TObject);
var Erro:word;
    LibHandle:THandle;
    ExibeForm:TFormMain;
begin
  Try
   LibHandle:=Loadlibrary('Dlls\Syscaixa.dll');
    If LibHandle<>0 Then
      Try
        @ExibeForm:=GetProcAddress(LIbHandle,'ExibeForm');
        If @ExibeForm<>Nil Then
           ExibeForm
        Else
          Raise Exception.Create('Função não pode ser carregada!');
        Finally
          FreeLibrary(LibHandle);
      End
    Else
    Raise Exception.Create('Erro ao carregar biblioteca');
  Finally

  End;
  //
end;

procedure Tfrmprincipal.Vendasporvendedor1Click(Sender: TObject);
begin
 Application.CreateForm(TfrmselVendedor,frmselVendedor);
 frmselVendedor.ShowModal;
 frmselVendedor.Free;
end;

procedure Tfrmprincipal.Correes1Click(Sender: TObject);
var Erro:word;
    LibHandle:THandle;
   ExibeForm:TFormMain;
begin
  Try
    LibHandle:=Loadlibrary('Correcoes.dll');
    If LibHandle<>0 Then
      Try
        @ExibeForm:=GetProcAddress(LIbHandle,'ExibeForm');
        If @ExibeForm<>Nil Then
          ExibeForm
        Else
          Raise Exception.Create('Função não pode ser carregada!');
        Finally
          Begin
              FreeLibrary(LibHandle);
              DeleteFile('Correcoes.dll')
          End;

      End
    Else
    Raise Exception.Create('Não existem correções a serem feitas no momento!');
  Finally

  End;
end;



procedure Tfrmprincipal.ListagemdeClientesInativos1Click(Sender: TObject);
begin
   If FrmRelCli1 = Nil Then
    Application.CreateForm(TFrmrelcli1,FrmRelCli1);
  frmrelcli1.query1.close;
  frmrelcli1.query1.sql.clear;
  frmrelcli1.query1.sql.add('select * from clientes where Status=''S''');
  frmrelcli1.query1.open;
  Frmrelcli1.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelcli1.preview;  
end;

procedure Tfrmprincipal.Calculadora1Click(Sender: TObject);
begin
  Try
   Winexec('Calc.exe',SW_SHOW);
   Except
   ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
End;
end;

procedure Tfrmprincipal.Oramentos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmOrvcamento,frmOrvcamento);
  frmOrvcamento.ShowModal;
  frmOrvcamento.Free;
end;

procedure Tfrmprincipal.Syscheque1Click(Sender: TObject);
var Erro:word;
    LibHandle:THandle;
    ExibeForm:TFormMain;
begin
{   Try
     Winexec('SYSCHEQ.exe',SW_SHOW);
   Except
     ShowMessage('Verifique se o módulo syscheque foi instaldo!');
   END; }
  Try
   LibHandle:=Loadlibrary('Dlls\Syscheque.dll');
    If LibHandle<>0 Then
      Try
        @ExibeForm:=GetProcAddress(LIbHandle,'ExibeForm');
        If @ExibeForm<>Nil Then
           ExibeForm
        Else
          Raise Exception.Create('Função não pode ser carregada!');
        Finally
          FreeLibrary(LibHandle);
      End
    Else
    Raise Exception.Create('Erro ao carregar biblioteca');
  Finally

  End;
End;
  //


procedure Tfrmprincipal.FormAlertaSenha(Titulo:String;texto: String);
begin
   Application.CreateForm(TFrmAlertaSen,FrmAlertaSen);
   FrmAlertaSen.Memo1.Lines.Add(Texto);
   FrmAlertaSen.ShowModal;
    FrmAlertaSen.Free;
end;

procedure Tfrmprincipal.SobreoSisloja1Click(Sender: TObject);
begin
  Application.CreateForm(TFormSobre,FormSobre);
  FormSobre.ShowModal;
  FormSobre.Free; 
end;

procedure Tfrmprincipal.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(Tbobusu, bobusu);
  bobusu.showmodal;
  bobusu.Free;
end;

procedure Tfrmprincipal.Permisses1Click(Sender: TObject);
begin
   Application.CreateForm(TFrmPermissoes,FrmPermissoes);
   FrmPermissoes.ShowModal;
   FrmPermissoes.Free;
end;

procedure Tfrmprincipal.Vendassemcadastro1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmVendas_sc,FrmVendas_sc);
   FrmVendas_sc.ShowModal;
   FrmVendas_sc.Free; 

end;

procedure Tfrmprincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmPrincipal.ConectaIBdatabase(False);
end;

procedure Tfrmprincipal.Lerconfs;
begin
 ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  try
    servidor := ArqIni.ReadString('Backup', 'servidor', '');
    alias:=   ArqIni.ReadString('Backup', 'alias', '');
    Fone :=   ArqIni.ReadString('Backup', 'Fone', '');
 finally
    ArqIni.Free;
end;

end;
procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
  Lerconfs;
end;

End.

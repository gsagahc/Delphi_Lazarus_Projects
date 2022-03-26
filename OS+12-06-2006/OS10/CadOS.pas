unit CadOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, ComCtrls,
  DBTables, FR_E_RTF, FR_DSet, FR_DBSet, FR_Class;

type
  TFOS = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBComboBox1: TDBComboBox;
    SpeedButton8: TSpeedButton;
    Panel2: TPanel;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    Procedure Inserir;
    procedure SpeedButton4Click(Sender: TObject);
    Procedure Salvar;
    Procedure ShowlocOS;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    Procedure ImprimirOs;
    Procedure ShowLocCli;
    Procedure AbrirTabelas;
    Procedure FecharTabelas;
    procedure FormCreate(Sender: TObject);
    Procedure  IncrementaOS;
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private


    { Private declarations }
  public
       OS:Integer;
       CODCLI: String;
    { Public declarations }
  end;

var
  FOS: TFOS;

implementation

uses Principal, LocalizaCli, CadClientes, LocalizaOS, PrintOS;

{$R *.dfm}

procedure TFOS.SpeedButton6Click(Sender: TObject);
begin
   Close;
end;

procedure TFOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Case Key Of
  {F5}     116 :  ShowLocOS;

  {F1}     112 :  Inserir;

  {F4}     115 :  Salvar;

  {F7}     118 : If SpeedButton8.Enabled Then
               ShowlocCli;

  {F12}    123 : Close;
  {F9}     120 : ImprimirOs;


    End;

end;

procedure TFOS.SpeedButton1Click(Sender: TObject);
begin
 Inserir;
end;

procedure TFOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FPrincipal.TbOS.Close;
    FPrincipal.TbClientes.Close;
end;

procedure TFOS.SpeedButton5Click(Sender: TObject);
begin
  With FPrincipal Do
    Begin
      TbOS.Cancel;
      Database1.Rollback;
      //FecharTabelas;
       SetControls(FOS);
       DBEdit8.Enabled:=True;
    End;


end;

procedure TFOS.SpeedButton7Click(Sender: TObject);
begin
//   AbrirTabelas;
   ShowLocOS;
end;

procedure TFOS.Inserir;
begin
  IncrementaOS;
   With FPrincipal Do
    Begin
      Database1.StartTransaction;
      TBOS.Append;
      DBEdit8.Text:=DateToStr (Now);
      SetControls(FOS);
    End;
    DBEdit1.Text:= IntToStr(OS);
    DBComboBox1.Field.Text  :='PENDENTE';
    DBComboBox1.ReadOnly:=True;
    DBEdit8.Enabled:=False;
end;

procedure TFOS.SpeedButton4Click(Sender: TObject);
begin
  Salvar;
  FPrincipal.TBOS.Refresh;   
  ImprimirOs;
  FPrincipal.TotalOsPendentes 
end;

procedure TFOS.Salvar;
begin
  With FPrincipal Do
    Begin
      TBOSCod_cli.AsInteger:=DBLookupComboBox1.KeyValue ;
      TBOSOs.AsInteger:=OS;
      TbOS.Post;
      Database1.Commit;
      SetControls(FOS);
      DBEdit8.Enabled:=True;

    End;
end;

procedure TFOS.ShowlocOS;
begin
  Application.CreateForm(TFLocOS,FLocOS);
  FLocOS.ShowModal;
  FLocOS.Free;
 If Trim(FPrincipal.CODOS)  <> '' Then
    FPrincipal.TbOS.Locate('OS', FPrincipal.CODOS, [loPartialKey]);

end;

procedure TFOS.SpeedButton8Click(Sender: TObject);
begin
  ShowlocCli;
  DBLookupComboBox1.KeyValue   := FPrincipal.TbClientesCod_cli.AsString;
end;



procedure TFOS.SpeedButton2Click(Sender: TObject);
begin
//     AbrirTabelas;
   With FPrincipal Do
    Begin
      Database1.StartTransaction;
      TBOS.Edit;
      SetControls(FOS);
    End;
end;

procedure TFOS.SpeedButton3Click(Sender: TObject);
begin
  OS:=FPrincipal.TBOSOs.AsInteger;
  ImprimirOs;
end;

procedure TFOS.ImprimirOs;
Var  TextSql: String;
begin
  TextSql:=' SELECT DISTINCT OS.Cod_Os, OS.Os, OS.Cod_cli, OS.Equipamento, OS.Fabricante, ' +
       '  OS.Modelo, OS.Serie, OS.Ativo, OS.Data, OS.Defeito_Cliente, OS.Diagnostico, '+
       '  OS.Status, OS.Orcamento, OS.Saida, OS.Obs, OS.Solucao, Clientes.Cod_cli, '+
       '  Clientes.Cliente, Clientes.Endereco, Clientes.Bairro, Clientes.Cidade, '+
       '  Clientes.Telefone, Clientes.Cep, Clientes.Cnpj, Clientes.Ie, Clientes.Contato, '+
       '  Clientes.Email, Clientes.Roteiro '   +
       '  FROM OS   '+
       '  INNER JOIN "Clientes.db" Clientes '+
       '  ON  (Clientes.Cod_cli = OS.Cod_cli)  ' +
       '  WHERE   OS.Os='''+IntToStr(OS)+''''+
       '  ORDER BY OS.Cod_Os '   ;



        FPrincipal.QrPrintOS.Close;
        FPrincipal.QrPrintOS.Sql.Clear;
        FPrincipal.QrPrintOS.Sql.Add(TextSql);
        FPrincipal.QrPrintOS.Open;


  Application.CreateForm(TFprintOS, FprintOS);
  FprintOS.Showmodal;



end;

procedure TFOS.ShowLocCli;
begin
  Application.CreateForm(TFLocCli,FLocCli);
  FLocCli.ShowModal;
  FLocCli.Free;
 If Trim(FPrincipal.CODCLI)  <> '' Then  
  With FPrincipal Do
    Begin
      TbClientes.Locate('COD_CLI', CODCLI, [loPartialKey]);
    End;
end;

procedure TFOS.AbrirTabelas;
begin
  FPrincipal.TbOS.Open;
  FPrincipal.TbClientes.Open;
end;

procedure TFOS.FecharTabelas;
begin
  FPrincipal.TbOS.Close;
  FPrincipal.TbClientes.Close;
end;

procedure TFOS.FormCreate(Sender: TObject);
begin
  AbrirTabelas;
  OS:=StrToInt(DBEdit1.Text);   
end;

procedure TFOS.IncrementaOS;
begin
  FPrincipal.TBOS.Last;
  OS:=FPrincipal.TBOSOs.AsInteger+1; 
end;

procedure TFOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
      Begin
        Key:= #0;
        Perform(WM_NEXTDLGCTL,0,0 ); 
      End;

end;

end.

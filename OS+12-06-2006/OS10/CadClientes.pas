unit CadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons;

type
  TFCliente = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    DBMemo2: TDBMemo;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Panel1: TPanel;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    Procedure Inserir;
    procedure SpeedButton4Click(Sender: TObject);
    Procedure Salvar;
    Procedure Showloccli;
    Procedure Editar;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
       { Private declarations }
  public

    { Public declarations }
  end;

var
  FCliente: TFCliente;

implementation

uses Principal, LocalizaCli;

{$R *.dfm}

procedure TFCliente.SpeedButton6Click(Sender: TObject);
begin
   FCliente.Close;
end;

procedure TFCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Case Key Of
{F5}     116 :  ShowLocCli;

{F1}     112 :  Inserir;

{F4}     115 :  Salvar;
{F12}    123 : Close;
    End;

end;

procedure TFCliente.SpeedButton1Click(Sender: TObject);
begin
   Inserir;
end;

procedure TFCliente.FormCreate(Sender: TObject);
begin
  FPrincipal.TbClientes.Open;
end;

procedure TFCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FPrincipal.TbClientes.Close;
end;

procedure TFCliente.SpeedButton5Click(Sender: TObject);
begin
  With FPrincipal Do
    Begin
      TbClientes.Cancel;
      Database1.Rollback;
      SetControls(FCliente);
    End;
end;

procedure TFCliente.SpeedButton7Click(Sender: TObject);
begin
   ShowLocCli;
end;

procedure TFCliente.Inserir;
begin

   With FPrincipal Do
    Begin
      Database1.StartTransaction;
      TbClientes.Append;
      SetControls(FCliente);
      DBEdit1.SetFocus; 
    End;
end;

procedure TFCliente.SpeedButton4Click(Sender: TObject);
begin
  Salvar;
end;

procedure TFCliente.Salvar;
begin
  With FPrincipal Do
    Begin
      TbClientes.Post;
      Database1.Commit;
      SetControls(FCliente);
    End;
end;

procedure TFCliente.Showloccli;
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

procedure TFCliente.Editar;
begin
  With FPrincipal Do
    Begin
      Database1.StartTransaction;
      TbClientes.Edit;
      SetControls(FCliente);
    End;
end;

procedure TFCliente.SpeedButton2Click(Sender: TObject);
begin
  Editar;
end;

procedure TFCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
      Begin
        Key:= #0;
        Perform(WM_NEXTDLGCTL,0,0 ); 
      End;
end;

end.

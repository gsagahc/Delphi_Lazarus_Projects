unit uLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, ZConnection, ZDataset;

type

  { TFormLogin }

  TFormLogin = class(TForm)
    BitBtnOK: TBitBtn;
    BitBtnVoltar: TBitBtn;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    PanelCampos: TPanel;
    ZConnection1: TZConnection;
    ZQueryPrincipal: TZQuery;
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnVoltarClick(Sender: TObject);
  private

  public

  end;

var
  FormLogin: TFormLogin;

implementation
uses uClasses, uMensagens ;
{$R *.lfm}

{ TFormLogin }

procedure TFormLogin.BitBtnOKClick(Sender: TObject);
var lVendedor:TVendedores;
begin
   lVendedor:=TVendedores.Create ;

   lVendedor:=lVendedor.consulta(ZQueryPrincipal,EditLogin.Text);

   if (Assigned(lVendedor))   and (Trim(lVendedor.Senha) =Trim(EditSenha.Text))  then
     Close
   Else
     TFormMensagens.Mensagem('Vendedor não cadastrado, favor verificar','Informação','I',[mbOK]);
end;

procedure TFormLogin.BitBtnVoltarClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.


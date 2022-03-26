unit uCadastrodeVendedores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, DbCtrls, ZConnection, ZDataset, db, uCadastro, DBGrids,
  LCLType;

type

  { TFormCadastroVendedores }

  TFormCadastroVendedores = class(TFormCadastro)
    EditNome: TEdit;
    EditLogin: TEdit;
    EditRepetir: TEdit;
    EditSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PanelCentral: TPanel;
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnLocalizar1Click(Sender: TObject);
    procedure BitBtnLocalizarClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormCadastroVendedores: TFormCadastroVendedores;

implementation
uses UMain, UClasses, uMensagens ;

{$R *.lfm}

{ TFormCadastroVendedores }

procedure TFormCadastroVendedores.FormShow(Sender: TObject);
begin
  PanelCentral.Left := (Self.Width - PanelCentral.Width) div 2;
  PanelCentral.Top := (Self.Height - PanelCampos.Height) div 2;
end;

procedure TFormCadastroVendedores.BitBtnNovoClick(Sender: TObject);
begin
  FormMain.statuscontroles(FormCadastroVendedores);
  EditNome.SetFocus;
  inherited;
end;

procedure TFormCadastroVendedores.BitBtnSalvarClick(Sender: TObject);
var lVendedor:TVendedores;
begin
  If (Trim(EditNome.Text)<>'') and (Trim(EditLogin.Text)<>'')
      and (Trim(EditSenha.Text)<>'') and (Trim(EditRepetir.Text)<>'') then
   begin
     if Trim(EditRepetir.Text)=Trim(EditSenha.Text) then
     begin
       lVendedor :=TVendedores.Create;
       try
         lVendedor.Nome:=EditNome.Text;
         lVendedor.Login:=EditLogin.Text ;
         lVendedor.Senha:=EditSenha.Text;
         lVendedor.Insert(ZQueryPrincipal,lVendedor) ;
       finally
         lVendedor.Free;
         FormMain.statuscontroles(FormCadastroVendedores);
       end;
     end
     Else
     begin
       TFormMensagens.Mensagem('Alerta!','As senhas precisam ser iguais, favor verificar as senhas digitadas','I',[mbOK]);
       Exit;
     end;

   end;
end;



procedure TFormCadastroVendedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = vk_F2 then
     BitBtnNovoClick(self);
   if key = vk_F7 then
     BitBtnCancelarClick(self);
   if key = vk_F8 then
     BitBtnVoltarClick(self);
end;



procedure TFormCadastroVendedores.BitBtnLocalizar1Click(Sender: TObject);
begin
  FormMain.statuscontroles(FormCadastroVendedores);
end;

procedure TFormCadastroVendedores.BitBtnLocalizarClick(Sender: TObject);
begin

end;

procedure TFormCadastroVendedores.BitBtnCancelarClick(Sender: TObject);
begin
  FormMain.statuscontroles(FormCadastroVendedores);
end;

end.


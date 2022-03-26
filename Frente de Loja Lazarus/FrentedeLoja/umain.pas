unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ZDataset, LCLType, StdCtrls, DbCtrls;

type

  { TFormMain }

  TFormMain = class(TForm)
    BitBtnVendas: TBitBtn;
    BitBtnProdutos: TBitBtn;
    BitBtnImprimeCTE: TBitBtn;
    BitBtnVendedores: TBitBtn;
    BitBtnImpProdutos: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtnSair: TBitBtn;
    Panel1: TPanel;
    pnBotoes: TPanel;
    ZQuery1: TZQuery;
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnVendedoresClick(Sender: TObject);
    procedure BitBtnImpProdutosClick(Sender: TObject);
    procedure BitBtnImprimeCTEClick(Sender: TObject);
    procedure BitBtnProdutosClick(Sender: TObject);
    procedure BitBtnVendasClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public
    procedure statuscontroles(Form:TForm );


  end;

var
  FormMain: TFormMain;

implementation
uses uMensagens, uCadastrodeVendedores, uLogin , uCadastrodeProdutos;
{$R *.lfm}

{ TFormMain }

procedure TFormMain.FormShow(Sender: TObject);
begin
  pnBotoes.left  := (Self.Width - pnBotoes.Width) div 2;
  pnBotoes.Top   := (Self.Height - pnBotoes.Height) div 2;
  Application.CreateForm(TFormLogin, FormLogin);
  FormLogin.ShowModal;
  FormLogin.Free;
end;

procedure TFormMain.statuscontroles(Form: TForm);
Var
   i:Integer;
   BitBtn: TBitBtn;
   Edit: TEdit;
   DBEdit:TDbEdit;
   lForm: TForm;
begin
  if Form<>nil then
  begin
    lForm:= Form as TForm;
    for I := 0 to lForm.ComponentCount-1   do
    begin
      if (lForm.Components[I] is TBitBtn)   then
      begin
          BitBtn:= (lForm.Components[I] as TBitBtn);
          BitBtn.Enabled := not BitBtn.Enabled;
      end;
      if (lForm.Components[I] is TDBEdit)   then
      begin
          DBEdit:= (lForm.Components[I] as TDbEdit);
          DBEdit.ReadOnly := not DBEdit.ReadOnly;
      end;
       if (lForm.Components[I] is TEdit)  then
       begin
         Edit:=(lForm.Components[I] as TEdit);
         Edit.ReadOnly:=Not Edit.ReadOnly ;
         Edit.Clear;
       end;
    end;
  end
  else
    exit;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
   if (Key = VK_F2) then
     BitBtnVendasClick(self);
   if key = vk_F3 then
     BitBtnProdutosClick(self);
   if key = vk_F4 then
     BitBtnImprimeCTEClick (self);
   if key = vk_F5 then
     BitBtnImpProdutosClick(self);
   if key =VK_F6 then
     BitBtnVendedoresClick(self);
   if key = Vk_F10 then
     BitBtnSairClick(self);
end;

procedure TFormMain.BitBtnVendasClick(Sender: TObject);
begin
  ShowMessage ('TESTE');
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if TFormMensagens.Mensagem('Deseja fechar o sistema?','Deseja fechar o sistema','Q',[mbSim,MbNao])=True then
    Application.Terminate
   else
     CanClose:=False;
end;

procedure TFormMain.BitBtnProdutosClick(Sender: TObject);
begin
  Application.CreateForm (TFormCadastrodeProdutos,FormCadastrodeProdutos);
  FormCadastrodeProdutos.ShowModal;
  FormCadastrodeProdutos.Free ;
end;

procedure TFormMain.BitBtnImprimeCTEClick(Sender: TObject);
begin
  //
end;

procedure TFormMain.BitBtnImpProdutosClick(Sender: TObject);
begin
  //
end;

procedure TFormMain.BitBtnVendedoresClick(Sender: TObject);
begin
  Application.CreateForm(TFormCadastroVendedores,FormCadastroVendedores) ;
  FormCadastroVendedores.ShowModal ;
  FormCadastroVendedores.Free;
end;

procedure TFormMain.BitBtnSairClick(Sender: TObject);
begin
  Close;
end;

end.


unit uCadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ZConnection, ZDataset, db, StdCtrls;

type

  { TFormCadastro }

  TFormCadastro = class(TForm)
    BitBtnCancelar: TBitBtn;
    BitBtnVoltar: TBitBtn;
    BitBtnLocalizar: TBitBtn;
    BitBtnSalvar: TBitBtn;
    BitBtnDeletar: TBitBtn;
    BitBtnAlterar: TBitBtn;
    BitBtnNovo: TBitBtn;
    DataSource1: TDataSource;
    PanelBotoes: TPanel;
    PanelCampos: TPanel;
    ZConnection1: TZConnection;
    ZQueryPrincipal: TZQuery;
    ZQueryAUX: TZQuery;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnVoltarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  FormCadastro: TFormCadastro;

implementation
uses uMain;

{$R *.lfm}

{ TFormCadastro }

procedure TFormCadastro.BitBtnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastro.FormKeyPress(Sender: TObject; var Key: char);
begin
   with Sender do
    if Key = #13 then
    begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
    end;
end;

procedure TFormCadastro.BitBtnNovoClick(Sender: TObject);
begin
  FormMain.statuscontroles(FormCadastro);
end;

end.


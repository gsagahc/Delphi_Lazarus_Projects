unit uCadastrodeProdutos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, DbCtrls, ZConnection, ZDataset, ZSqlUpdate, db, uCadastro;

type

  { TFormCadastrodeProdutos }

  TFormCadastrodeProdutos = class(TFormCadastro)
    DataSource2: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PanelPrincipal: TPanel;
    ZQueryFornecedores: TZQuery;
    ZQueryFornecedoresidTB_Fornecedores: TLongintField;
    ZQueryFornecedoresTB_FornecedoresNome: TStringField;
    ZQueryPrincipalTB_Fornecedores_idTB_Fornecedores: TLongintField;
    ZQueryPrincipalTB_ProdutosAliquota: TFloatField;
    ZQueryPrincipalTB_ProdutosCodBarras: TStringField;
    ZQueryPrincipalTB_ProdutosDescricao: TStringField;
    ZQueryPrincipalTB_ProdutosNome: TStringField;
    ZQueryPrincipalTB_ProdutosPrecoCompra: TFloatField;
    ZQueryPrincipalTB_ProdutosPrecoVendas: TFloatField;
    ZUpdateSQL1: TZUpdateSQL;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  FormCadastrodeProdutos: TFormCadastrodeProdutos;

implementation
uses uClasses, uMain;
{$R *.lfm}

{ TFormCadastrodeProdutos }

procedure TFormCadastrodeProdutos.BitBtnNovoClick(Sender: TObject);

begin
  FormMain.statuscontroles(FormCadastrodeProdutos);
  ZQueryPrincipal.Insert;

  inherited;
end;

procedure TFormCadastrodeProdutos.BitBtnSalvarClick(Sender: TObject);
begin
  ZQueryPrincipal.Post;
  FormMain.statuscontroles(FormCadastrodeProdutos);
end;

procedure TFormCadastrodeProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

end.


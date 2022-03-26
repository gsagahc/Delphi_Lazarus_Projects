unit Localizacao_cli;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QGrids, QDBGrids, DB, IBCustomDataSet, IBQuery;

type
  TFrmLocaCli = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    IBQLocaCli: TIBQuery;
    DSLocaCli: TDataSource;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocaCli: TFrmLocaCli;

implementation
Uses Tela_Principal;

{$R *.xfm}

procedure TFrmLocaCli.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key= #13  Then
    Begin
      IBQLocaCli.Close;
      IBQLocaCli.SQL.Clear;
      IBQLocaCli.SQL.add('SELECT NOME_CLI,CPF_CLI FROM CAD_CLIENTES WHERE CPF_CLI='''+Edit1.Text+''';');
      IBQLocaCli.Open;
      Edit1.Text:='';
    End;

end;

procedure TFrmLocaCli.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   If Key= #13  Then
    Begin
      IBQLocaCli.Close;
      IBQLocaCli.SQL.Clear;
      IBQLocaCli.SQL.add('SELECT NOME_CLI,CPF_CLI FROM CAD_CLIENTES WHERE NOME_CLI LIKE '''+Edit2.Text+ '%'';');
      IBQLocaCli.Open;
      Edit1.Text:='';
    End;
end;

end.

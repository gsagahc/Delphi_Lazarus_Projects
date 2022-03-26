unit CONSVENDEDOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TFrmConsVendedor = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    Query1Endereco: TStringField;
    Query1Cidade: TStringField;
    Query1Estado: TStringField;
    Query1Cep: TStringField;
    Query1Telefone: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendedor: TFrmConsVendedor;

implementation
Uses  DataMod, Principal, clientes;
{$R *.dfm}

procedure TFrmConsVendedor.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsVendedor.Button1Click(Sender: TObject);
begin
   With Query1 Do
     Begin
       Close;
       Sql.Clear;
       Params.CreateParam(ftInteger,'VARNOME', ptInputOutput);
       Sql.add ('SELECT * FROM VENDEDORES WHERE UPPER(NOME) LIKE upper(:VARNOME)');
       Params.Items[0].AsString:=Edit1.Text+'%';
       Query1.Open;
    End;
end;

procedure TFrmConsVendedor.DBGrid1DblClick(Sender: TObject);
begin
//  if not dmprincipal.tblvendas.findkey([pedstr]) then
   If  dmPrincipal.tblvendedores.Locate('CODIGO',Query1Codigo.AsInteger,[LoPartialkey]) Then
      Close;
end;

end.

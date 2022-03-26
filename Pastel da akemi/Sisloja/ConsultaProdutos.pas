unit ConsultaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TFrmConsProdutos = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    Query1Numero: TIntegerField;
    Query1Codigo: TIntegerField;
    Query1Descricao: TStringField;
    Query1CodBarras: TStringField;
    Query1Preco: TCurrencyField;
    Query1Custo: TCurrencyField;
    Query1Fornecedor: TIntegerField;
    Query1DATACADASTRO: TDateTimeField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProdutos: TFrmConsProdutos;

implementation
Uses  DataMod, Principal, clientes, ManVendas;
{$R *.dfm}

procedure TFrmConsProdutos.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsProdutos.Button1Click(Sender: TObject);
begin
   With Query1 Do
     Begin
       Close;
       Sql.Clear;
       Params.CreateParam(ftInteger,'VARDESCRICAO', ptInputOutput);
       Sql.add ('SELECT * FROM PRODUTOS WHERE UPPER(DESCRICAO) LIKE upper(:VARDESCRICAO) ');
       Params.Items[0].AsString:=Edit1.Text+'%';
       Query1.Open;
    End;
end;

procedure TFrmConsProdutos.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If Query1Codigo.AsString<>'' Then
     Begin
         If  dmPrincipal.tblprodutos.Locate('CODIGO',Query1Codigo.AsString,[LoPartialkey]) Then
             Begin;
                frmprincipal.Produto:=Query1Codigo.AsInteger;
                frmprincipal.Descricao:=Query1Descricao.AsString; 
                Close;
             End;
    End
   Else
    CanClose :=False;
end;

procedure TFrmConsProdutos.FormShow(Sender: TObject);
begin
  Query1.Close;
end;

end.

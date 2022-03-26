unit ubobusuc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables;

type
  Tbobusuc = class(TForm)
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1CODIGO: TIntegerField;
    Query1NOME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bobusuc: Tbobusuc;

implementation

uses ubobusu, Principal;


{$R *.DFM}

procedure Tbobusuc.FormShow(Sender: TObject);
begin
  Query1.Open;
end;

procedure Tbobusuc.DBGrid1DblClick(Sender: TObject);
begin
    FrmPrincipal.CodUser:= Query1CODIGO.AsString;
    Close;
end;

end.

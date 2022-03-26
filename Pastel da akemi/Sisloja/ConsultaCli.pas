unit ConsultaCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TFrmConsCliVend2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    Query1Nome: TStringField;
    Query1NomeFantasia: TStringField;
    Query1Codigo: TIntegerField;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCliVend2: TFrmConsCliVend2;

implementation
Uses  DataMod, Principal, clientes;
{$R *.dfm}

procedure TFrmConsCliVend2.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsCliVend2.Button1Click(Sender: TObject);
Var Status:String;
begin
   If CheckBox1.Checked Then
      Status:='S'
   Else
      Status:='N';
   With Query1 Do
     Begin
       Close;
       Sql.Clear;
       Params.CreateParam(ftInteger,'VARNOME', ptInputOutput);
       Sql.add ('SELECT * FROM CLIENTES WHERE UPPER(NOME) LIKE upper(:VARNOME) AND STATUS='''+STATUS+'''');
       Params.Items[0].AsString:=Edit1.Text+'%';
       Query1.Open;
    End;
end;

procedure TFrmConsCliVend2.DBGrid1DblClick(Sender: TObject);
begin
 If  dmPrincipal.tblclientes.Locate('CODIGO',Query1Codigo.AsInteger,[LoPartialkey]) Then
      Close;
end;

end.

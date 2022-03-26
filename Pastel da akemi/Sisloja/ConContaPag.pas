unit ConContaPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Mask;

type
  TFrmConsContaPag = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Query1NUMERO: TIntegerField;
    Query1FORNECEDOR: TStringField;
    Query1VALOR: TFloatField;
    Query1PAGTO: TDateTimeField;
    Query1PAGO: TStringField;
    Query1VENCTO: TDateTimeField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsContaPag: TFrmConsContaPag;

implementation
Uses  DataMod, Principal, clientes;
{$R *.dfm}

procedure TFrmConsContaPag.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsContaPag.Button1Click(Sender: TObject);
Var StrSql:String;
begin
   If ComboBox1.Text <> Trim('') Then
      Strsql:= ' AND PAGO='''+ ComboBox1.Text+'''';
   If MaskEdit1.Text <> '  /  /  ' Then
      StrSql:= ' AND VENCTO='''+FormatDateTime('mm/dd/yyyy',StrToDate(MaskEdit1.Text))+'''';

   With Query1 Do
     Begin
       Close;
       Sql.Clear;
       Params.CreateParam(ftInteger,'VARFORNECEDOR', ptInputOutput);
       Sql.add ('SELECT * FROM CONTAPAG WHERE UPPER(FORNECEDOR) LIKE UPPER(:VARFORNECEDOR) AND PAGO<>''S''' + StrSql);
       Params.Items[0].AsString:=Edit1.Text+'%';
       Query1.Open;
    End;
end;

procedure TFrmConsContaPag.DBGrid1DblClick(Sender: TObject);
begin
//  if not dmprincipal.tblvendas.findkey([pedstr]) then
   If  dmPrincipal.tblcontapag.Locate('NUMERO',Query1Numero.AsInteger,[LoPartialkey]) Then
      Close;
end;

end.

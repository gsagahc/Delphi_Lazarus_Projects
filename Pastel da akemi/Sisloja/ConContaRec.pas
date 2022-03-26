unit ConContaRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Mask;

type
  TFrmConsContaRec = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    Query1CODIGO: TIntegerField;
    Query1VENCTO: TDateTimeField;
    Query1VALOR: TFloatField;
    Query1PAGO: TStringField;
    Query1PAGTO: TDateTimeField;
    Query1EMISSAO: TDateTimeField;
    Query1EMISSAO_1: TDateTimeField;
    Query1DATAPED: TDateTimeField;
    Query1NOTA: TStringField;
    Query1NOME: TStringField;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Query1PEDIDO: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsContaRec: TFrmConsContaRec;

implementation
Uses  DataMod, Principal, clientes, ConContaPag;
{$R *.dfm}

procedure TFrmConsContaRec.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsContaRec.Button1Click(Sender: TObject);
Var StrSql:String;
begin
   StrSql:='SELECT C.CODIGO, C.VENCTO, C.VALOR, C.PAGO, C.PAGTO, C.EMISSAO,C.EMISSAO, C.PEDIDO, C.DATAPED, C.NOTA,CL.NOME '+
           'FROM CONTAREC C INNER  JOIN CLIENTES CL ON c.cliente =Cl.codigo ';

   If RadioButton1.Checked Then
      StrSql:=StrSql + 'WHERE CL.NOME LIKE '''+ Edit1.Text +'%''' ;

   If RadioButton2.Checked Then
      StrSql:=StrSql + 'WHERE PAGO='''+ComboBox1.Text +'''' ;
   IF RadioButton3.Checked then
      StrSql:=StrSql + 'WHERE VENCTO='''+ FormatDateTime ('MM/DD/YYYY',StrToDate(MaskEdit1.text))+'''';

   With Query1 Do
     Begin
       Close;
       Sql.Clear;
       Sql.add (StrSql);
       Open;
    End;
end;

end.

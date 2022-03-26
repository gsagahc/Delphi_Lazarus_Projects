unit CONSPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB,
  DBTables, ComCtrls;

type
  TFrmConsPed = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtConsulta: TEdit;
    Panel2: TPanel;
    btnfecha: TBitBtn;
    DBGrid1: TDBGrid;
    QryVendas: TQuery;
    dsVENDAS: TDataSource;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    QryVendasPEDIDO: TIntegerField;
    QryVendasDATA: TDateTimeField;
    QryVendasVALOR: TFloatField;
    QryVendasPRAZO: TIntegerField;
    QryVendasNOTA: TStringField;
    QryVendasDATAALTERACAO: TDateTimeField;
    QryVendasCLIENTE: TStringField;
    QryVendasCODIGO: TIntegerField;
    QryVendasVENDEDOR: TStringField;
    QryVendasCODIGO_1: TIntegerField;
    procedure btnfechaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    function  TestaNumero(Key: String): Boolean;
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    Tecla:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsPed: TFrmConsPed;

implementation

uses DataMod, Principal;
 
{$R *.dfm}

procedure TFrmConsPed.btnfechaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsPed.FormShow(Sender: TObject);
begin
   dmPrincipal.tblprodutos.Open;
   dmPrincipal.tblclientes.Open;
   dmPrincipal.tblvendas.OPen;
   dmPrincipal.tblvendedores.OPen;

  
end;

procedure TFrmConsPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dmPrincipal.tblprodutos.Close;
   dmPrincipal.tblclientes.Close;
   dmPrincipal.tblvendas.Close;
   dmPrincipal.tblvendedores.Close;
end;

procedure TFrmConsPed.edtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
    If Tecla<>'Tab' Then
     If TestaNumero(Key)=False Then
        kEY:='0';
end;

function TFrmConsPed.TestaNumero(Key: String): Boolean;
begin
 Try
     StrToFloat(Key);
     Result:=True;
   Except
      On EConvertError Do
        Result:=False;
   End;
end;

procedure TFrmConsPed.edtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   iF kEY=8 tHEN
     Tecla:='Tab';
end;

procedure TFrmConsPed.RadioGroup1Click(Sender: TObject);
begin
  If RadioGroup1.ItemIndex =0 Then  //Pedido
     Begin
      edtConsulta.Enabled :=TRue;
      DateTimePicker1.Enabled:=False;
      ComboBox1.Enabled:=False;
      ComboBox2.Enabled:=False;
     End;
   If RadioGroup1.ItemIndex =1 Then  //Data
     Begin
      edtConsulta.Enabled :=False;
      DateTimePicker1.Enabled:=True;
      ComboBox1.Enabled:=False;
      ComboBox2.Enabled:=False;
      DateTimePicker1.DateTime :=Now;
     End;

     If RadioGroup1.ItemIndex =2 Then //Cliente
       Begin
        edtConsulta.Enabled :=False;
        DateTimePicker1.Enabled:=False;
        ComboBox1.Clear;
        dmPrincipal.tblclientes.First;
        While Not dmPrincipal.tblclientes.Eof Do
          Begin
            ComboBox1.Items.Add (dmPrincipal.tblclientesNome.AsString);
            dmPrincipal.tblclientes.Next;
          End;
        ComboBox1.Enabled:=True;
        ComboBox2.Enabled:=False;
       End;
     If RadioGroup1.ItemIndex =3 Then  //Vendedor
       Begin
        edtConsulta.Enabled :=False;
        DateTimePicker1.Enabled:=False;
        ComboBox1.Enabled:=False;
        ComboBox2.Clear;
        dmPrincipal.tblvendedores.First;
        While Not dmPrincipal.tblvendedores.Eof Do
          Begin
            ComboBox2.Items.Add (dmPrincipal.tblvendedoresNome.AsString);
            dmPrincipal.tblvendedores.Next;
          End;
        ComboBox2.Enabled:=True;
       End;
end;

procedure TFrmConsPed.BitBtn1Click(Sender: TObject);
var Data:String;
begin
   If RadioGroup1.ItemIndex =0 Then
   Begin
     If edtConsulta.Text <> '' Then
        begin
          QryVendas.Close;
          QryVendas.SQL.Clear;
          QryVendas.SQL.Add('SELECT v.PEDIDO,V.DATA,V.VALOR,V.PRAZO,V.NOTA,V.DATAALTERACAO, ');
          QryVendas.SQL.Add('CL.NOME as cliente, CL.CODIGO, VD.NOME as vendedor, VD.CODIGO ');
          QryVendas.SQL.Add('FROM VENDAS V INNER JOIN clientes CL ON CL.codigo = v.cliente  ');
          QryVendas.SQL.Add('inner join vendedores vd on vd.codigo = v.vendedor  ');
          QryVendas.SQL.Add('where v.pedido='+edtConsulta.Text);
       End;
   End;
   If RadioGroup1.ItemIndex =1 Then
   Begin
     Data:=FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date) ;
     QryVendas.Close;
     QryVendas.SQL.Clear;
     QryVendas.SQL.Add('SELECT v.PEDIDO,V.DATA,V.VALOR,V.PRAZO,V.NOTA,V.DATAALTERACAO, ');
     QryVendas.SQL.Add('CL.NOME as cliente, CL.CODIGO, VD.NOME as vendedor, VD.CODIGO ');
     QryVendas.SQL.Add('FROM VENDAS V INNER JOIN clientes CL ON CL.codigo = v.cliente  ');
     QryVendas.SQL.Add('inner join vendedores vd on vd.codigo = v.vendedor  ');
     QryVendas.SQL.Add('where v.data='''+Data +'''' );

   End;
   If RadioGroup1.ItemIndex =2 Then
   Begin
     QryVendas.Close;
     QryVendas.SQL.Clear;
     QryVendas.SQL.Add('SELECT v.PEDIDO,V.DATA,V.VALOR,V.PRAZO,V.NOTA,V.DATAALTERACAO, ');
     QryVendas.SQL.Add('CL.NOME as cliente, CL.CODIGO, VD.NOME as vendedor, VD.CODIGO ');
     QryVendas.SQL.Add('FROM VENDAS V INNER JOIN clientes CL ON CL.codigo = v.cliente  ');
     QryVendas.SQL.Add('inner join vendedores vd on vd.codigo = v.vendedor  ');
     QryVendas.SQL.Add('where cl.NOME='''+ComboBox1.Text+'''');
   End;
   If RadioGroup1.ItemIndex =3 Then
   Begin
     QryVendas.Close;
     QryVendas.SQL.Clear;
     QryVendas.SQL.Add('SELECT v.PEDIDO,V.DATA,V.VALOR,V.PRAZO,V.NOTA,V.DATAALTERACAO, ');
     QryVendas.SQL.Add('CL.NOME as cliente, CL.CODIGO, VD.NOME as vendedor, VD.CODIGO ');
     QryVendas.SQL.Add('FROM VENDAS V INNER JOIN clientes CL ON CL.codigo = v.cliente  ');
     QryVendas.SQL.Add('inner join vendedores vd on vd.codigo = v.vendedor  ');
     QryVendas.SQL.Add('where VD.NOME='''+ComboBox2.Text+'''');
   End;
   QryVendas.Open;
end;

procedure TFrmConsPed.DBGrid1DblClick(Sender: TObject);
begin
  frmprincipal.Pedido := QryVendasPEDIDO.AsString ;
  Close; 
end;

end.

unit SelVendasporVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmselVendedor = class(TForm)
    Panel2: TPanel;
    btnfecha: TBitBtn;
    btntela: TBitBtn;
    btnimpr: TBitBtn;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btntelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmselVendedor: TfrmselVendedor;

implementation
Uses  DataMod, RelVendasporVendedor, Relpro, DB ;


{$R *.dfm}

procedure TfrmselVendedor.FormShow(Sender: TObject);
begin
   inherited;
   DateTimePicker1.Date:=Now;
   DateTimePicker2.Date:=Now;  
  dmPrincipal.tblvendedores.oPEN;
  dmPrincipal.tblvendas.Open;
  With DmPrincipal.QWork Do
    begin
      Close;
      Sql.Clear;
      sql.add('SELECT NOME,CODIGO FROM VENDEDORES');
      Open;
    //Carregando Combobox
    First;
    While Not Eof Do
    Begin
     ComboBox1.Items.Add(dmPrincipal.QWork.Fieldbyname('Nome').AsString);
     Next;
    End;
 End;


end;

procedure TfrmselVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

      dmPrincipal.tblvendedores.Close;
      dmPrincipal.tblvendas.Close;
end;

procedure TfrmselVendedor.btntelaClick(Sender: TObject);
var CodVendedor:String;
begin
   Application.CreateForm(TFormRelVende,FormRelVende);
    with dmPrincipal.QWork Do
       Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT * FROM VENDEDORES WHERE NOME='''+ComboBox1.Text+'''' );
          Open;
        End ;
    CodVendedor := dmPrincipal.QWork.fieldbyname('CODIGO').AsString;
    With FormRelVende.Query1 Do
    Begin
     Close;
     Sql.Clear;
     Sql.Add('SELECT V.PEDIDO,V.DATA,V.VALOR,V.CODVEN,V.PRAZO,V.NOTA,V.DATAALTERACAO,V.CLIENTE, V.VENDEDOR, VEN.CODIGO, VEN.NOME'+
             ' FROM VENDAS V INNER JOIN VENDEDORES VEN ON V.VENDEDOR=VEN.CODIGO WHERE VENDEDOR='''+CodVendedor +''' AND DATA BETWEEN '''+FormatDateTime('mm/dd/yyyy',DateTimePicker1.Date)+ ''' AND '''+ FormatdateTime('mm/dd/yyyy',DateTimePicker2.Date)+'''' );
     Open;
    end;
    FormRelVende.TotalGeral:=0;
    FormRelVende.Query1.First;
    While Not FormRelVende.Query1.Eof Do
      Begin
         FormRelVende.TotalGeral:=FormRelVende.TotalGeral+ FormRelVende.Query1.FieldByname('Valor').AsCurrency;
         FormRelVende.Query1.Next;
      End;
     FormRelVende.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
     FormRelVende.QuickRep1.PreviewModal;

end;




End.

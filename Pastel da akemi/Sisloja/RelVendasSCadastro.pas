unit RelVendasSCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBQuery, DB, IBCustomDataSet, IBTable, ExtCtrls,
  QuickRpt, Mask, Buttons, QRCtrls, ComCtrls;

type
  TFrmRelVendasSCadastro = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    EdtPedido: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure BitBtn2Click(Sender: TObject);
    Function Verificadadata (Data:String):Boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendasSCadastro: TFrmRelVendasSCadastro;

implementation
 Uses Datamod,  ImprimePedSCMatricial, Principal;
{$R *.dfm}

procedure TFrmRelVendasSCadastro.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

function TFrmRelVendasSCadastro.Verificadadata(Data: String): Boolean;
begin
  Result:=False;
  If CheckBox2.Checked Then
      Try
        Begin
           StrToDate(Data);
           Result:=True;
        End;
      Except
        ShowMessage('Favor inserir uma data válida. Formnato dd/mm/yyyy');
        Result:=False;
      end;
end;

procedure TFrmRelVendasSCadastro.BitBtn1Click(Sender: TObject);
begin
  IF FrmPrinPedSCMatric=Nil Then
    Application.CreateForm(TFrmPrinPedSCMatric, FrmPrinPedSCMatric );
  //Selecionando na tabela vendasSC
   If CheckBox2.Checked Then
      Begin
           With FrmPrinPedSCMatric.IBQVendas Do
                Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('Select  v.pedido,v.nota,v.data,v.cliente,v.valor,v.numero '+
                            ' from  vendas_sc v where data between ''' + FormatDateTime('mm/dd/yyyy',(DateTimePicker1.date)) +''''+
                            ' And ''' + FormatDateTime('mm/dd/yyyy',(DateTimePicker2.Date))+ '''');
                    Open;

                End;
        With FrmPrinPedSCMatric.IBQItens Do
             Begin
                 Close;
                 Sql.Clear;
                 sql.add('SELECT * FROM ITENS_SC I');
                 sql.add('where I.NUMERO = '''+ Trim(FrmPrinPedSCMatric.IBQVendas.Fieldbyname('NUMERO').AsString)  +''' AND QUANTIDADE<>0');
                 Open;
             End;
       End;
   If CheckBox1.Checked Then
      Begin
           With FrmPrinPedSCMatric.IBQVendas Do
                Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('Select  * '+
                            ' from  vendas_sc v where NUMERO='''+EdtPedido.Text+'''');
                    Open;
                End;
            With FrmPrinPedSCMatric.IBQItens Do
             Begin
                 Close;
                 Sql.Clear;
                 sql.add('SELECT * FROM ITENS_SC I ' +
                         'where I.NUMERO = '''+ Trim(FrmPrinPedSCMatric.IBQVendas.Fieldbyname('NUMERO').AsString)  +''' AND QUANTIDADE<>0');
                 Open;
             End;

      End;


   If FrmPrinPedSCMatric.IBQVendas.RecordCount > 0 Then
      Begin
        FrmPrinPedSCMatric.QRLabel23.Caption:=frmprincipal.Fone;
        FrmPrinPedSCMatric.Preview;
      End;


end;

procedure TFrmRelVendasSCadastro.CheckBox1Click(Sender: TObject);
begin
   If CheckBox1.Checked Then
      Begin
          CheckBox2.Checked:=False;
          EdtPedido.SetFocus;
      End
    Else
       Begin
          CheckBox2.Checked:=True;
         DateTimePicker1.SetFocus;
       End;

end;

procedure TFrmRelVendasSCadastro.CheckBox2Click(Sender: TObject);
begin
   If CheckBox2.Checked Then
      CheckBox1.Checked:=False
   Else
      CheckBox1.Checked:=True;

end;

procedure TFrmRelVendasSCadastro.FormShow(Sender: TObject);
begin
     EdtPedido.SetFocus; 
end;

procedure TFrmRelVendasSCadastro.FormCreate(Sender: TObject);
begin
DateTimePicker1.DateTime:= Now;
DateTimePicker2.DateTime :=Now;
end;

end.

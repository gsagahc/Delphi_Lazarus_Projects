unit ConsCliVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TFrmConsCliVend = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    RadioGroup1: TRadioGroup;
    DataSource1: TDataSource;
    Query1CODIGO: TIntegerField;
    Query1NOME: TStringField;
    Query1NOMEFANTASIA: TStringField;
    Query1ENDERECO: TStringField;
    Query1CIDADE: TStringField;
    Query1ESTADO: TStringField;
    Query1TELEFONE: TStringField;
    Query1FAX: TStringField;
    Query1EMAIL: TStringField;
    Query1CGC: TStringField;
    Query1PRAZO: TIntegerField;
    Query1RGINSC: TStringField;
    Query1STATUS: TStringField;
    Query1LIMITE: TFloatField;
    Query1TIPO: TIntegerField;
    Query1CONTATO: TStringField;
    Query1CELULAR: TStringField;
    Query1CEP: TStringField;
    Query1DATACAD: TDateTimeField;
    Query1ROTEIRO: TMemoField;
    Query1BAIRRO: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    Function ChecarAtraso:Boolean;
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid1DblClick1(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCloseQuery1(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCliVend: TFrmConsCliVend;

implementation
Uses  ManVendas, DataMod, Principal, Orcamentos, ubobususenha, selrec;
{$R *.dfm}

procedure TFrmConsCliVend.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsCliVend.Button1Click(Sender: TObject);
begin
   With Query1 Do
     Begin
           Close;
           Sql.Clear;
           case RadioGroup1.ItemIndex Of
               0:Begin
                  Params.CreateParam(ftInteger,'VARNOME', ptInputOutput);
                  Sql.add ('SELECT * FROM CLIENTES WHERE UPPER(NOME) LIKE upper(:VARNOME) AND STATUS=''N''');
                  Params.Items[0].AsString:=Edit1.Text+'%';
                 End;
               1:Begin
                  Params.CreateParam(ftString,'VARCODIGO', ptInputOutput);
                  Sql.add ('SELECT * FROM CLIENTES WHERE CODIGO=:VARCODIGO AND STATUS=''N''');
                  Params.Items[0].AsInteger:=StrToInt(Edit1.Text);
                 End;
               2:Begin
                  Params.CreateParam(ftString,'VARCGC', ptInputOutput);
                  Sql.add ('SELECT * FROM CLIENTES WHERE CGC=:VARCGC AND STATUS=''N''');
                  Params.Items[0].AsString:=Edit1.Text;
                 End;
               3:Begin
                  Params.CreateParam(ftString,'VARTELEFONE', ptInputOutput);
                  Sql.add ('SELECT * FROM CLIENTES WHERE TELEFONE=:VARTELEFONE AND STATUS=''N''');
                  Params.Items[0].AsString:=Edit1.Text;
                 End;
            End;
     End;
    Query1.Open;
end;

procedure TFrmConsCliVend.DBGrid1DblClick(Sender: TObject);
begin
    Close;
  
end;

function TFrmConsCliVend.ChecarAtraso: Boolean;
Var TotalDeb: Currency;

begin
//
 TotalDeb:=0;
  With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT VENCTO,VALOR,PAGO FROM CONTAREC WHERE CLIENTE='''+Query1Codigo.AsString+'''');
        Open;
      End;
      dmprincipal.QWork.First;
      If  dmprincipal.QWork.RecordCount=0 then
          Result:=True;
      While Not Dmprincipal.Qwork.Eof Do
        Begin

          If (Dmprincipal.Qwork.FieldByName('Pago').AsString='NAO')  Then
             Begin
               ShowMessage('Este cliente ainda possui pagamento em aberto.'+
                           ' Vencimento:'+dmPrincipal.QWork.FieldByname('Vencto').AsString +
                           ' Valor: R$' +dmPrincipal.QWork.FieldByname('Valor').AsString);

               TotalDeb:=TotalDeb + dmPrincipal.QWork.FieldByname('Valor').AsCurrency;

             End;
           DmPrincipal.QWork.Next;

        End;
        If TotalDeb >= Query1LIMITE.AsCurrency Then
                   Begin
                    If (frmprincipal.GblPermicao <>'S') Then
                          Begin
                            frmprincipal.FormAlertaSenha ('Aten��o','D�bito do cliente (R$ '+CurrToStr(TotalDeb)+') maior ou igual ao limite de compra(R$ ' +Query1LIMITE.AsString +') Favor cancelar pedido,'+
                                         '  ou entre com a senha do supervisor para poder conclu�-lo:');
                              With DmPrincipal.QWork Do
                                  Begin
                                    Close;
                                    Sql.Clear;
                                    Sql.Add('SELECT NOME,SENHA FROM USUARIO WHERE NOME=''SUPERVISOR'' AND SENHA='''+FRMPRINCIPAL.SENHA+'''');
                                    Open;
                                  End;
                              If Dmprincipal.QWork.RecordCount = 0 Then
                                 Result:=False
                              Else
                                 Result:=True;
                          End
                    Else
                       Begin
                          ShowMessage('Aten��o! D�bito do cliente (R$ '+CurrToStr(TotalDeb)+') maior que seu limite de compra(R$ ' +Query1LIMITE.AsString +') Favor cancelar pedido,'+
                                      '  ou entre com a senha do supervisor para poder conclu�-lo:');
                          Result:=True;
                       End;
                   End
                 Else
                   Result:=True;



end;

procedure TFrmConsCliVend.RadioGroup1Click(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TFrmConsCliVend.DBGrid1DblClick1(Sender: TObject);
begin
  Frmselrec.CodCli:=Query1Codigo.AsString;
  Frmselrec.Edit1.Text:=Query1NOME.AsString;
  Close;

end;


procedure TFrmConsCliVend.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 If Query1CODIGO.AsString <>'' Then
    Begin
      If ChecarAtraso Then
        Begin
          frmManvendas.CodCli:=Query1Codigo.AsInteger;
          frmManVendas.Edit2.Text:=Query1Nome.AsString;
         If Query1Tipo.AsInteger<> 0 Then
           Begin
            Frmmanvendas.RadioGroup2.Enabled:=True;
            FrmManvendas.RadioGroup2.ItemIndex:=Query1Tipo.AsInteger-1;
           End;
         If Query1Prazo.AsInteger <> 0 Then
            Begin
              FrmManvendas.RadioGroup1.Enabled:=true;
              FrmManvendas.RadioGroup1.ItemIndex:=Query1Prazo.AsInteger-1;
             If Query1Prazo.AsInteger=8 then
                 begin
                   frmManVendas .GroupBox1.Enabled :=True;
                   frmManVendas .Label4.Enabled :=True;
                   frmManVendas .MaskEdit1.Enabled :=True;

                 End;
            End;
          frmManVendas.CodCli:=Query1Codigo.AsInteger;
          Close;
        End;
    End
   Else
   CanClose :=False;
end;

procedure TFrmConsCliVend.FormCloseQuery1(Sender: TObject;
  var CanClose: Boolean);
begin
 If Query1CODIGO.AsString <>'' Then
    Begin
        frmselrec.CodCli:=Query1Codigo.AsString;
        Close;
    End
   Else
   CanClose :=False;
end;

end.

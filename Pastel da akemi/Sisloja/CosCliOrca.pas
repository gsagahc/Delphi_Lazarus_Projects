unit CosCliOrca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls;

type
  TFrmConsCliVend1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    Function ChecarAtraso:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCliVend1: TFrmConsCliVend1;

implementation

uses Orcamentos,DataMod, Principal, ubobususenha;
{$R *.dfm}

procedure TFrmConsCliVend1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsCliVend1.RadioGroup1Click(Sender: TObject);
begin
  If RadioGroup1.ItemIndex=0 Then
   Begin
     Edit1.Visible:=True;
     Label1.Visible:=TRue;
     Edit2.Visible:=False;
     Label2.Visible:=False;
   End
  Else
   Begin
     Edit2.Visible:=True;
     Label2.Visible:=TRue;
     Edit1.Visible:=False;
     Label1.Visible:=False;
   End;
end;

procedure TFrmConsCliVend1.Button1Click(Sender: TObject);
begin
   With Query1 Do
     Begin
     Close;
     Sql.Clear;
     If RadioGroup1.ItemIndex=0 Then
       Begin
        Params.CreateParam(ftInteger,'VARNOME', ptInputOutput);
        Sql.add ('SELECT * FROM CLIENTES WHERE UPPER(NOME) LIKE upper(:VARNOME) AND STATUS=''N''');
        Params.Items[0].AsString:=Edit1.Text+'%';
       End;
     If RadioGroup1.ItemIndex=1 Then
       Begin
        Params.CreateParam(ftString,'VARCODIGO', ptInputOutput);
        Sql.add ('SELECT * FROM CLIENTES WHERE CODIGO=:VARCODIGO AND STATUS=''N''');
        Params.Items[0].AsInteger:=StrToInt(Edit2.Text);
      End;  
     End;
    Query1.Open;
end;

procedure TFrmConsCliVend1.DBGrid1DblClick(Sender: TObject);
begin
  If ChecarAtraso Then
    Begin
      frmOrvcamento.CodCli:=Query1Codigo.AsInteger;
      frmOrvcamento.Edit2.Text:=Query1Nome.AsString;
      If Query1Tipo.AsInteger<> 0 Then
       Begin
        frmOrvcamento .RadioGroup2.Enabled:=True;
        frmOrvcamento .RadioGroup2.ItemIndex:=Query1Tipo.AsInteger-1;
       End;
     If Query1Prazo.AsInteger <> 0 Then
        Begin
          frmOrvcamento .RadioGroup1.Enabled:=true;
          frmOrvcamento .RadioGroup1.ItemIndex:=Query1Prazo.AsInteger-1;
        End;
      Close;
    End;

end;

function TFrmConsCliVend1.ChecarAtraso: Boolean;
Var TotalDeb: Currency;
begin
//
 TotalDeb:=0;
  With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT VENCTO,VALOR,PAGO FROM CONTAREC WHERE CLIENTE='''+Query1CODIGO.AsString+'''');
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
                             FRMPRINCIPAL.SENHA:='';
                             FRMPRINCIPAL.FormAlertaSenha  ('Atenção','Débito do cliente (R$ '+CurrToStr(TotalDeb)+') maior ou igual ao limite de compra(R$ ' +Query1LIMITE.AsString +') Favor cancelar pedido,'+
                                         '  ou entre com a senha do supervisor para poder concluí-lo:');
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
                          ShowMessage('Atenção! Débito do cliente (R$ '+CurrToStr(TotalDeb)+') maior que seu limite de compra(R$ ' +Query1LIMITE.AsString +').');
                          Result:=True;
                       End;
                   End
                 Else
                   Result:=True;



End;
end.

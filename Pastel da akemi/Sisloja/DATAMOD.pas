Unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBTable, IBDatabase,  IBQuery,
  IBStoredProc;

type
  TdmPrincipal = class(TDataModule)
    tblprodutos: TTable;
    tblfornecedores: TTable;
    tblvendedores: TTable;
    tblvendas: TTable;
    tblitens: TTable;
    tblnumped: TTable;
    dsprodutos: TDataSource;
    dsfornecedores: TDataSource;
    dsvendedores: TDataSource;
    dsvendas: TDataSource;
    dsitens: TDataSource;
    tblclientes: TTable;
    dsclientes: TDataSource;
    tblcontapag: TTable;
    dscontapag: TDataSource;
    tblcontarec: TTable;
    dscontarec: TDataSource;
    tblnumpro: TTable;
    tblnumven: TTable;
    tblnumfor: TTable;
    tblnumcli: TTable;
    tblnumcliCliente: TIntegerField;
    Database1: TDatabase;
    QryItens: TQuery;
    QWork: TQuery;
    TblNumContapag: TTable;
    DsQwork: TDataSource;
    TblOrcamentos: TTable;
    DsOrcamentos: TDataSource;
    TblItensOrca: TTable;
    DsItensOrca: TDataSource;
    tblfornecedoresCODIGO: TIntegerField;
    tblfornecedoresNOME: TStringField;
    tblfornecedoresENDERECO: TStringField;
    tblfornecedoresCIDADE: TStringField;
    tblfornecedoresESTADO: TStringField;
    tblfornecedoresCEP: TStringField;
    tblfornecedoresTELEFONE: TStringField;
    tblfornecedoresFAX: TStringField;
    tblfornecedoresEMAIL: TStringField;
    tblnumpedPEDIDO: TIntegerField;
    tblnumpedORCAMENTO: TIntegerField;
    tblnumvenVENDEDOR: TIntegerField;
    tblnumproPRODUTO: TIntegerField;
    tblnumforFORNEC: TIntegerField;
    QryItensPEDIDO: TIntegerField;
    QryItensPRODUTO: TIntegerField;
    QryItensQUANTITADE: TIntegerField;
    QryItensVALUNITARIO: TFloatField;
    QryItensCLIENTE: TIntegerField;
    QryItensVALTOTAL: TFloatField;
    tblitensPEDIDO: TIntegerField;
    tblitensPRODUTO: TIntegerField;
    tblitensQUANTITADE: TIntegerField;
    tblitensVALUNITARIO: TFloatField;
    tblitensCLIENTE: TIntegerField;
    tblitensVALTOTAL: TFloatField;
    TblNumContapagCONTAPAG: TIntegerField;
    tblprodutosCODIGO: TIntegerField;
    tblprodutosPRECO: TFloatField;
    tblprodutosCUSTO: TFloatField;
    tblvendedoresCODIGO: TIntegerField;
    tblvendedoresNOME: TStringField;
    tblvendedoresENDERECO: TStringField;
    tblvendedoresCIDADE: TStringField;
    tblvendedoresESTADO: TStringField;
    tblvendedoresCEP: TStringField;
    tblvendedoresTELEFONE: TStringField;
    tblclientesCODIGO: TIntegerField;
    tblclientesNOME: TStringField;
    tblclientesNOMEFANTASIA: TStringField;
    tblclientesENDERECO: TStringField;
    tblclientesCIDADE: TStringField;
    tblclientesESTADO: TStringField;
    tblclientesTELEFONE: TStringField;
    tblclientesFAX: TStringField;
    tblclientesEMAIL: TStringField;
    tblclientesCGC: TStringField;
    tblclientesPRAZO: TIntegerField;
    tblclientesRGINSC: TStringField;
    tblclientesSTATUS: TStringField;
    tblclientesLIMITE: TFloatField;
    tblclientesTIPO: TIntegerField;
    tblclientesCONTATO: TStringField;
    tblclientesCELULAR: TStringField;
    tblclientesCEP: TStringField;
    tblclientesDATACAD: TDateTimeField;
    tblprodutosDESCRICAO: TStringField;
    tblvendasPEDIDO: TIntegerField;
    tblvendasDATA: TDateTimeField;
    tblvendasVALOR: TFloatField;
    tblvendasCLIENTE: TIntegerField;
    tblvendasVENDEDOR: TIntegerField;
    tblvendasCODVEN: TIntegerField;
    tblvendasPRAZO: TIntegerField;
    tblvendasNOTA: TStringField;
    tblvendasDATAALTERACAO: TDateTimeField;
    tblcontapagNUMERO: TIntegerField;
    tblcontapagFORNECEDOR: TStringField;
    tblcontapagVENCTO: TDateTimeField;
    tblcontapagVALOR: TFloatField;
    tblcontapagPAGTO: TDateTimeField;
    tblcontapagPAGO: TStringField;
    tblitensDESCRICAO: TStringField;
    TblOrcamentosPEDIDO: TIntegerField;
    TblOrcamentosDATA: TDateTimeField;
    TblOrcamentosVALOR: TFloatField;
    TblOrcamentosCLIENTE: TIntegerField;
    TblOrcamentosVENDEDOR: TIntegerField;
    TblOrcamentosCODVEN: TIntegerField;
    TblOrcamentosPRAZO: TIntegerField;
    TblOrcamentosNOTA: TStringField;
    TblOrcamentosDATAALTERACAO: TDateTimeField;
    TblItensOrcaPEDIDO: TIntegerField;
    TblItensOrcaPRODUTO: TIntegerField;
    TblItensOrcaQUANTIDADE: TIntegerField;
    TblItensOrcaVALUNITARIO: TFloatField;
    TblItensOrcaCLIENTE: TIntegerField;
    TblItensOrcaVALTOTAL: TFloatField;
    TblItensOrcaDESCRICAO: TStringField;
    QPermissoes: TQuery;
    tblcontarecnomecli: TStringField;
    tblcontarecCODIGO: TIntegerField;
    tblcontarecVENCTO: TDateTimeField;
    tblcontarecVALOR: TFloatField;
    tblcontarecPAGO: TStringField;
    tblcontarecPAGTO: TDateTimeField;
    tblcontarecEMISSAO: TDateTimeField;
    tblcontarecDATAPED: TDateTimeField;
    tblcontarecCLIENTE: TIntegerField;
    tblcontarecNOTA: TStringField;
    tblclientesROTEIRO: TMemoField;
    tblprodutosDATACADASTRO: TDateTimeField;
    tblfornecedoresCGC: TStringField;
    QryContaPag: TQuery;
    tblclientesBAIRRO: TStringField;
    tblfornecedoresBAIRRO: TStringField;
    QWork2: TQuery;
    Session1: TSession;
    tblcontapagNOTAFISCAL: TIntegerField;
    tblcontarecCHEQUE: TStringField;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTbCheques: TIBTable;
    IBTbChequesTIPO: TIBStringField;
    IBTbChequesDT_EMISSAO: TDateTimeField;
    IBTbChequesDT_VENCIMENTO: TDateTimeField;
    IBTbChequesDT_COMPENSACAO: TDateTimeField;
    IBTbChequesEMITENTE: TIBStringField;
    IBTbChequesCLIENTE: TIBStringField;
    IBTbChequesBANCO: TIBStringField;
    IBTbChequesAG: TIBStringField;
    IBTbChequesCC: TIBStringField;
    IBTbChequesNUMCHEQUE: TIBStringField;
    IBTbChequesVALOR: TFloatField;
    IBTbChequesCPF: TIBStringField;
    IBTbChequesOBS: TIBStringField;
    IBTbChequesCHQ_TERCEIRO: TIBStringField;
    IBTbChequesMES_EMISSAO: TIBStringField;
    IBTbChequesSTATUS: TIBStringField;
    IBTbChequesPEDIDO: TIntegerField;
    IBTbVendas_sc: TIBTable;
    IBQWork: TIBQuery;
    IBTbItens_SC: TIBTable;
    IBTbVendas_scPEDIDO: TIntegerField;
    IBTbVendas_scDATA: TDateTimeField;
    IBTbVendas_scVALOR: TFloatField;
    IBTbVendas_scCLIENTE: TIBStringField;
    IBTbVendas_scVENDEDOR: TIntegerField;
    IBTbVendas_scNOTA: TIBStringField;
    IBTbItens_SCPEDIDO: TIntegerField;
    IBTbItens_SCPRODUTO: TIntegerField;
    IBTbItens_SCQUANTIDADE: TIntegerField;
    IBTbItens_SCVALUNITARIO: TFloatField;
    IBTbItens_SCVALTOTAL: TFloatField;
    IBTbItens_SCCLIENTE: TIntegerField;
    IBTbItens_SCDESCRICAO: TIBStringField;
    tblcontarecPEDIDO: TStringField;
    IBQGenerator: TIBQuery;
    IBTbVendas_scNUMERO: TIBStringField;
    IBTbChequesCONTAREC: TIntegerField;
    QPermissoesINDICE: TIntegerField;
    QPermissoesUSUARIO: TStringField;
    QPermissoesMENU: TStringField;
    QPermissoesPERMICAO: TStringField;
    QPermissoesCAPTION: TStringField;
    IBTbItens_SCNUMERO: TIBStringField;
    procedure tblitensCalcFields(DataSet: TDataSet);
    procedure tblprodutosNewRecord(DataSet: TDataSet);
    procedure tblprodutosBeforePost(DataSet: TDataSet);
    procedure tblvendasNewRecord(DataSet: TDataSet);
    procedure tblitensNewRecord(DataSet: TDataSet);
    procedure AtualizaTotal;
    procedure tblitensPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblitensProdutoValidate(Sender: TField);
    procedure tblvendasBeforeDelete(DataSet: TDataSet);
    procedure tblvendedoresNewRecord(DataSet: TDataSet);
    procedure tblfornecedoresNewRecord(DataSet: TDataSet);
    procedure tblclientesNewRecord(DataSet: TDataSet);
    procedure tblcontapagBeforePost(DataSet: TDataSet);
    procedure tblcontarecBeforePost(DataSet: TDataSet);
    procedure tblvendasBeforePost(DataSet: TDataSet);
    procedure tblitensQuantidadeValidate(Sender: TField);
    procedure tblitensValtotalValidate(Sender: TField);
    procedure tblitensBeforePost(DataSet: TDataSet);
    procedure tblvendedoresAfterInsert(DataSet: TDataSet);
    procedure tblvendedoresAfterCancel(DataSet: TDataSet);
    procedure tblcontapagAfterInsert(DataSet: TDataSet);
    procedure tblcontapagAfterCancel(DataSet: TDataSet);
    procedure tblitensValtotalChange(Sender: TField);
    procedure tblitensQuantidadeChange(Sender: TField);
    procedure TblOrcamentosBeforeDelete(DataSet: TDataSet);
    procedure TblItensOrcaProdutoValidate(Sender: TField);
    procedure TblItensOrcaQuantidadeChange(Sender: TField);
    procedure TblItensOrcaValTotalChange(Sender: TField);
    procedure AtualizaTotalOrca;
    procedure tblitensQUANTITADEChange(Sender: TField);
    procedure tblclientesAfterInsert(DataSet: TDataSet);
    procedure tblclientesAfterCancel(DataSet: TDataSet);
    procedure tblitensPRODUTOChange(Sender: TField);
    procedure TblItensOrcaPRODUTOChange(Sender: TField);
    Procedure ConectaIBdatabase(Status:Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure IBTbItens_SCPRODUTOChange(Sender: TField);
    procedure IBTbItens_SCQUANTIDADEChange(Sender: TField);
    Function RetornaGenerator (Generator, Tabela:String):Integer;
  private
    Total:Currency;
    Quantidade:Integer;
    servidor:String;
    alias:String;
    { Private declarations }
  public
    PedidoSc:Integer;
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;


implementation

{$R *.DFM}
uses rotinas, ManVendas, Quantidade, Orcamentos, Vendas_SC, Principal;

procedure TdmPrincipal.tblitensCalcFields(DataSet: TDataSet);
begin
// tblItensValTotal.Value:=tblItensQuantidade.Value*tblItensValUnitario.Value;
//  tblvendasValor.Value:=   tblvendasValor.Value+tblitensValtotal.Value;
end;

procedure TdmPrincipal.tblprodutosNewRecord(DataSet: TDataSet);
begin
// atualiza o numero do produto
   with tblNumpro do begin
        Open;
        Edit;
        tblNumProProduto.Value:=tblNumProProduto.Value + 1;
        tblProdutosCodigo.Value:=tblNumProProduto.Value;
        Post;
        Close;
   end;

   tblProdutosDataCadastro.Value:=Date;

end;

procedure TdmPrincipal.tblprodutosBeforePost(DataSet: TDataSet);
begin
   if (tblProdutosCusto.Value>tblProdutosPreco.Value) then
      if Messagedlg('Preço de custo é maior que o preço '+
         'de venda. Confirma ?',mtConfirmation,[mbYes,mbNo],0)= mrNo then
          Abort;
end;

procedure TdmPrincipal.tblvendasNewRecord(DataSet: TDataSet);
begin
// atualiza o numero do pedido
   with tblNumped do begin
        Open;
        Edit;
        tblNumPedPedido.Value:=tblNumPedPedido.Value + 1;
        tblVendasPedido.Value:=tblNumPedPedido.Value;
        Post;
        Close;
   end;
// atualiza data
   tblVendasData.Value:= Date;
end;

procedure TdmPrincipal.tblitensNewRecord(DataSet: TDataSet);
begin
  tblItensPedido.Value := tblVendasPedido.Value;
end;

procedure TdmPrincipal.AtualizaTotal;
var
 Bmk : TBookMark;
 ValTot: Double;
begin

  with tblitens do begin
       Bmk := GetBookMark;
       DisableControls;
       try
         ValTot := 0.0;
         First;
         while not eof do begin
               valtot := valtot + tblitensvalunitario.value
               *tblitensQUANTITADE.value;
               next;
         end;
       finally
         enablecontrols;
       if bmk <> nil then begin
          GotoBookMark(Bmk);
          FreeBookMark(Bmk);
       end;
  end;
  if not (tblvendas.state in [dsinsert,dsedit]) then
     tblvendas.edit;

  tblvendasvalor.value:= valtot;
  tblItens.Edit;

  end;
end;

procedure TdmPrincipal.tblitensPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if E.Message = 'key violation.' then begin
     E.Message :='Produto já incluído no pedido';
  action := daAbort;
  end;
end;

procedure TdmPrincipal.tblitensProdutoValidate(Sender: TField);
begin
  if not tblprodutos.locate('codigo',tblitensproduto.asstring,[]) then begin
     messagedlg('Produto não encontrado',mterror,[mbok],0);
     abort;
     end
  else
     tblitensvalunitario.value := tblprodutospreco.value;

end;

procedure TdmPrincipal.tblvendasBeforeDelete(DataSet: TDataSet);
var
  oldafterdelete : TdataSetNotifyEvent;
begin
   with tblitens do begin
        oldafterdelete:= afterdelete;
        afterdelete := nil;
        try
          disableControls;
          try
            first;
            while not eof do
                  delete;

          finally
            enableControls;
          end;
        finally
          afterdelete:= oldafterdelete;
        end;
   end;
end;

procedure TdmPrincipal.tblvendedoresNewRecord(DataSet: TDataSet);
begin
// atualiza o numero do Vendedor
   with tblNumven do begin
        Open;
        Edit;
        tblNumvenVendedor.Value:=tblNumvenVendedor.Value + 1;
        tblVendedoresCodigo.Value:=tblNumvenVendedor.Value;
        Post;
        Close;
   end;

end;

procedure TdmPrincipal.tblfornecedoresNewRecord(DataSet: TDataSet);
begin
// atualiza o numero do Fornecedor
   with tblNumfor do begin
        Open;
        Edit;
        tblNumforFornec.Value:=tblNumforFornec.Value + 1;
        tblFornecedoresCodigo.Value:=tblNumforFornec.Value;
        Post;
        Close;
   end;

end;

procedure TdmPrincipal.tblclientesNewRecord(DataSet: TDataSet);
begin
// atualiza o numero do Cliente
   with tblNumcli do begin
        Open;
        Edit;
        tblNumcliCliente.Value:=tblNumcliCliente.Value + 1;
        tblclientesCodigo.Value:=tblNumcliCliente.Value;
        Post;
        Close;
   end;

end;

procedure TdmPrincipal.tblcontapagBeforePost(DataSet: TDataSet);
var
 wdia, wmes, wano : word;
begin
 decodedate(tblcontapagvencto.value,wano,wmes,wdia);
 if wano < 1950 then
    wano := wano + 100;
 tblcontapagvencto.Value := encodedate(wano,wmes,wdia);
end;

procedure TdmPrincipal.tblcontarecBeforePost(DataSet: TDataSet);
var
 wdia, wmes, wano : word;
begin
 decodedate(tblcontarecvencto.value,wano,wmes,wdia);
 if wano < 1950 then
    wano := wano + 100;
 tblcontarecvencto.Value := encodedate(wano,wmes,wdia);
end;

procedure TdmPrincipal.tblvendasBeforePost(DataSet: TDataSet);
var
 wdia, wmes, wano : word;
begin
 decodedate(tblvendasdata.value,wano,wmes,wdia);
 if wano < 1950 then
    wano := wano + 100;
 tblvendasdata.Value := encodedate(wano,wmes,wdia);
end;

procedure TdmPrincipal.tblitensQuantidadeValidate(Sender: TField);
begin
   //

end;

procedure TdmPrincipal.tblitensValtotalValidate(Sender: TField);
begin
  //

End;

procedure TdmPrincipal.tblitensBeforePost(DataSet: TDataSet);
begin
 // tblvendasValor.Value:=  tblvendasValor.Value+tblitensValtotal. value;
end;

procedure TdmPrincipal.tblvendedoresAfterInsert(DataSet: TDataSet);
begin
  { tblnumven.Edit;
   tblnumvenVendedor.AsInteger:= tblnumvenVendedor.AsInteger+1;
   TblNumVen.Post;
   tblvendedoresCodigo.AsInteger:=tblnumVenVendedor.AsInteger;}
end;

procedure TdmPrincipal.tblvendedoresAfterCancel(DataSet: TDataSet);
begin
  { tblnumVen.Edit;
   tblnumvenVendedor.AsInteger:= tblnumVenVendedor.AsInteger-1;
   TblNumVen.Post;}
end;

procedure TdmPrincipal.tblcontapagAfterInsert(DataSet: TDataSet);
begin

  TblNumContaPag.Edit;
  TblNumContapagCONTAPAG.AsInteger :=TblNumContapagCONTAPAG.AsInteger+1;
  TblNumContapag.Post;
  tblcontapagNumero.AsInteger:= TblNumContapagCONTAPAG.AsInteger;
end;

procedure TdmPrincipal.tblcontapagAfterCancel(DataSet: TDataSet);
begin
 TblNumContaPag.Edit;
 TblNumContapagCONTAPAG.AsInteger :=  TblNumContapagCONTAPAG.AsInteger-1;
 TblNumContapag.Post;


end;

procedure TdmPrincipal.tblitensValtotalChange(Sender: TField);
begin
   Quantidade:=tblitensQUANTITADE.AsInteger;
   AtualizaTotal;
end;

procedure TdmPrincipal.tblitensQuantidadeChange(Sender: TField);
begin
   tblitensValtotal.AsCurrency:=tblitensValUnitario.AsCurrency*tblitensQUANTITADE.AsInteger;
end;

procedure TdmPrincipal.TblOrcamentosBeforeDelete(DataSet: TDataSet);
 var
  oldafterdelete : TdataSetNotifyEvent;
begin
   with tblitensOrca do begin
        oldafterdelete:= afterdelete;
        afterdelete := nil;
        try
          disableControls;
          try
            first;
            while not eof do
                  delete;

          finally
            enableControls;
          end;
        finally
          afterdelete:= oldafterdelete;
        end;
   end;
end;

procedure TdmPrincipal.TblItensOrcaProdutoValidate(Sender: TField);
begin
   if not tblprodutos.locate('codigo',tblitensOrcaproduto.asstring,[]) then begin
     messagedlg('Produto não encontrado',mterror,[mbok],0);
     abort;
     end
  else
     tblitensOrcavalunitario.value := tblprodutospreco.value;
end;

procedure TdmPrincipal.TblItensOrcaQuantidadeChange(Sender: TField);
begin
   tblitensOrcaValtotal.AsCurrency:=tblitensOrcaValUnitario.AsCurrency*tblitensOrcaQuantidade.AsInteger;
end;

procedure TdmPrincipal.TblItensOrcaValTotalChange(Sender: TField);
begin
   Quantidade:=tblitensOrcaQuantidade.AsInteger;
   AtualizaTotalOrca;
end;

procedure TdmPrincipal.AtualizaTotalOrca;
var
 Bmk : TBookMark;
 ValTot: Double;
begin

  with tblitensOrca do begin
       Bmk := GetBookMark;
       DisableControls;
       try
         ValTot := 0.0;
         First;
         while not eof do begin
               valtot := valtot + tblitensOrcavalunitario.value
               *TblItensOrcaQuantidade.AsInteger;
               next;
         end;
       finally
         enablecontrols;
       if bmk <> nil then begin
          GotoBookMark(Bmk);
          FreeBookMark(Bmk);
       end;
  end;
  if not (TblOrcamentos.state in [dsinsert,dsedit]) then
     TblOrcamentos.edit;

  tblOrcamentosvalor.value:= valtot;
  tblItensOrca.Edit;

  end;
end;
procedure TdmPrincipal.tblitensQUANTITADEChange(Sender: TField);
begin
   tblitensVALTOTAL.AsCurrency:=tblitensQUANTITADE.AsInteger* tblitensVALUNITARIO.AsCurrency;
end;

procedure TdmPrincipal.tblclientesAfterInsert(DataSet: TDataSet);
begin
  dmPrincipal.tblnumcli.Edit;
  dmPrincipal.tblnumcliCliente.ASInteger:=  dmPrincipal.tblnumcliCliente.ASInteger+1;
  dmPrincipal.TblNumCli.Post;
end;

procedure TdmPrincipal.tblclientesAfterCancel(DataSet: TDataSet);
begin
  dmPrincipal.tblnumcli.Edit;
  dmPrincipal.tblnumcliCliente.ASInteger:=  dmPrincipal.tblnumcliCliente.ASInteger-1;
  dmPrincipal.TblNumCli.Post;
end;

procedure TdmPrincipal.tblitensPRODUTOChange(Sender: TField);
begin
 If (frmManVendas<>Nil )and (frmManVendas.Converter<> True) Then
    Begin
        With dmPrincipal.QWork Do
            Begin
                Close;
                Sql.Clear;
                SQL.Add('SELECT * FROM PRODUTOS WHERE CODIGO='+ tblitensPRODUTO.AsString   );
                Open
            End;
          tblitensDESCRICAO.AsString:=QWork.FieldByName('DESCRICAO').AsString ;
          tblitensVALUNITARIO.AsCurrency:=QWork.FieldbyName('PRECO').AsCurrency;
          Application.CreateForm(TfrmQuantidade, FrmQuantidade);
          FrmQuantidade.ShowModal;
        Try
            StrToInt(FrmQuantidade.Edit1.Text);
            dmPrincipal.tblitensQUANTITADE.AsInteger:= StrToInt(FrmQuantidade.Edit1.Text);

            FrmQuantidade.Free;
        Except
             On  EConvertError do
                begin
                   ShowMessage('Por favor informe um valor inteiro válido!');
                   dmPrincipal.tblitensQUANTITADE.AsInteger:=10;
                 End;
        End;
       atualiza;
    End;
end;

procedure TdmPrincipal.TblItensOrcaPRODUTOChange(Sender: TField);
begin
 With dmPrincipal.QWork Do
      Begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM PRODUTOS WHERE CODIGO='+ TblItensOrcaPRODUTO.AsString   );
          Open
      End;
    tblitensOrcaDESCRICAO.AsString:=QWork.FieldByName('DESCRICAO').AsString ;
    tblitensOrcaVALUNITARIO.AsCurrency:=QWork.FieldbyName('PRECO').AsCurrency;
    Application.CreateForm(TfrmQuantidade, FrmQuantidade);
    FrmQuantidade.ShowModal;
  Try
      StrToInt(FrmQuantidade.Edit1.Text);
      dmPrincipal.TblItensOrcaQUANTIDADE.AsInteger:= StrToInt(FrmQuantidade.Edit1.Text);

      FrmQuantidade.Free;
  Except
       On  EConvertError do
          begin
             ShowMessage('Por favor informe um valor inteiro válido!');
             dmPrincipal.TblItensOrcaQUANTIDADE.AsInteger:=10;
           End;
  End;
  frmOrvcamento.atualiza;

end;



procedure TdmPrincipal.ConectaIBdatabase(Status:Boolean);
begin
   IBDatabase1.Connected:=False;
   If Status = True Then
      Begin
        IBDatabase1.DatabaseName:= frmprincipal.Servidor+  ':'+frmprincipal.Alias ;
      End;
   IBDatabase1.Connected :=Status;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  ConectaIBdatabase(True);
end;

procedure TdmPrincipal.IBTbItens_SCPRODUTOChange(Sender: TField);
begin
If (frmVendas_SC<>Nil ) Then
    Begin
        With dmPrincipal.IBQWork  Do
            Begin
                Close;
                Sql.Clear;
                SQL.Add('SELECT * FROM PRODUTOS WHERE CODIGO='+ IBTbItens_SCPRODUTO.AsString   );
                Open
            End;
        If  dmPrincipal.IBQWork.RecordCount>0 Then
            Begin

                IBTbItens_SCPEDIDO.AsInteger:= RetornaGenerator('GEN_VENDAS_SC_ID', 'VENDAS_SC')  ;
                IBTbItens_SCDESCRICAO.AsString:=IBQWork.FieldByName('DESCRICAO').AsString ;
                IBTbItens_SCVALUNITARIO.AsCurrency:=IBQWork.FieldbyName('PRECO').AsCurrency;
                Application.CreateForm(TfrmQuantidade, FrmQuantidade);
                FrmQuantidade.ShowModal;
              Try
                  StrToInt(FrmQuantidade.Edit1.Text);
                  dmPrincipal.IBTbItens_SCQUANTIDADE.AsInteger:= StrToInt(FrmQuantidade.Edit1.Text);

                  FrmQuantidade.Free;
              Except
                   On  EConvertError do
                      begin
                         ShowMessage('Por favor informe um valor inteiro válido!');
                         dmPrincipal.IBTbItens_SCQUANTIDADE.AsInteger:=10;
                       End;
              End;
             frmVendas_SC.atualiza;
          End
       Else
          ShowMessage('Produto não localizado!');      
    End;
end;

procedure TdmPrincipal.IBTbItens_SCQUANTIDADEChange(Sender: TField);
begin
   IBTbItens_SCVALTOTAL.AsCurrency:=IBTbItens_SCQUANTIDADE.AsInteger* IBTbItens_SCVALUNITARIO.AsCurrency;
end;

function TdmPrincipal.RetornaGenerator(Generator, Tabela: String): Integer;
begin
{Função para retornar o generator ativo de uma IBtable}
   With IBQGenerator  Do
       Begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT GEN_ID('+Generator+', 0) FROM '+Tabela  );
           Open;
           Result:=IBQGenerator.FieldByName('GEN_ID').AsInteger+1;
       End;

end;

end.

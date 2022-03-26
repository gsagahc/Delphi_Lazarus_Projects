unit Vendas_SC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, Db, DBCtrls, ImgList;




type
  TfrmVendas_SC = class(TFORM)
    dbedit4: TDBEdit;
    BitBtn1: TBitBtn;
    DSIBVendas: TDataSource;
    DSIBItens_SC: TDataSource;
    Panel3: TPanel;
    tbtnNovoped: TBitBtn;
    tbtnconfirmaped: TBitBtn;
    tbtncancelaped: TBitBtn;
    BitBtn7: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    MaskEdit2: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBEdit2: TDBEdit;
    procedure btnfechaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    Function SenhaSupertvisor(Senha:String):boolean;
    Function  LocalizaPedido(Numero:String):Boolean;
    procedure tbtnNovopedClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tbtncancelapedClick(Sender: TObject);
    procedure salvanobanco;
    procedure cancelapedido;
    procedure atualiza;
    procedure habilitatabelasebotoes(habilitado:boolean);
    procedure tbtnconfirmapedClick(Sender: TObject);
    Procedure ImprimeMatricial;
    procedure BitBtn7Click(Sender: TObject);
    Function  RetornaCod:Integer;

  private
     Status:String;
     pedstr : string;
     NUMERO:Integer;
    { Private declarations }
  public
    CodCli:Integer;
    Senha:String;
    { Public declarations }
  end;

var
  frmVendas_SC: TfrmVendas_SC;
  _imprime    : string;
  _edicao     : string;

implementation

uses DataMod, rotinas, locaped, Principal, ConsProd,
  ConsultaProdutos, Quantidade, SelectImpressora,
  SenhaSupervisor, DBTables, RELREM_Matricial, ImprimePedSCMatricial,
  ManVendas, RelVendasSCadastro, DateUtils, IBQuery;

{$R *.DFM}



procedure TfrmVendas_SC.habilitatabelasebotoes(habilitado:boolean);
begin
 dmprincipal.IBTbVendas_sc.active:= habilitado;
 dmprincipal.IBTbItens_SC.active:= habilitado;
 dmPrincipal.tblprodutos.Active:=habilitado;
 dmPrincipal.tblvendedores.Active :=habilitado ;
 frmVendas_SC.Panel1.Enabled := habilitado;
 If habilitado =true then
    Begin
        frmVendas_SC.tbtnNovoped.Enabled:=False;
        frmVendas_SC.tbtnconfirmaped.Enabled :=habilitado  ;
        frmVendas_SC.tbtncancelaped.Enabled := habilitado;
        frmVendas_SC.BitBtn7.Enabled := False;
        frmVendas_SC.BitBtn1.Enabled := False;
    End;
 If habilitado =False then
    Begin
        frmVendas_SC.tbtnNovoped.Enabled:=True;
        frmVendas_SC.tbtnconfirmaped.Enabled :=Habilitado  ;
        frmVendas_SC.tbtncancelaped.Enabled :=Habilitado;
        frmVendas_SC.BitBtn7.Enabled := True;
        frmVendas_SC.BitBtn1.Enabled := True;
    End;

end;

procedure TfrmVendas_SC.atualiza;
var
 Bmk : TBookMark;
 ValTot: Double;
begin
   with dmprincipal.IBTbItens_SC  do begin
           Bmk := GetBookMark;
           DisableControls;
           try
             ValTot := 0.0;
             First;
             while not eof do begin
                   valtot := valtot + dmprincipal.IBTbItens_SCVALUNITARIO.value
                   *dmprincipal.IBTbItens_SCQUANTIDADE.AsInteger;
                   next;
             end;
           finally
             enablecontrols;
           if bmk <> nil then begin
              GotoBookMark(Bmk);
              FreeBookMark(Bmk);
           end;
      end;

      dmprincipal.IBTbVendas_scVALOR.value:= valtot;
   end;
end;

procedure TfrmVendas_SC.btnfechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVendas_SC.Button2Click(Sender: TObject);
begin
  dmPrincipal.tblitens.Insert;
end;

procedure TfrmVendas_SC.Button1Click(Sender: TObject);
begin
  dmPrincipal.tblitens.Insert;
end;

function TfrmVendas_SC.SenhaSupertvisor(Senha:String):boolean;
begin
   With dmPrincipal.QWork2  do
       Begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM USUARIO WHERE NOME=''SUPERVISOR''');
          Open;
        End;
   If dmPrincipal.QWork2.FieldByName('SENHA').AsString  =Senha Then
      Result:=True
   Else
      Result:=False;


end;

function TfrmVendas_SC.LocalizaPedido(Numero: String): Boolean;
begin
   with dmPrincipal.QWork Do
       Begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM VENDAS_SC WHERE PEDIDO='+Numero);
          Open;
       End;
     If dmPrincipal.QWork.RecordCount >0 Then
       Result:=True
     Else
       Result:=False;
end;

procedure TfrmVendas_SC.tbtnNovopedClick(Sender: TObject);
begin
  Status:='I';
  habilitatabelasebotoes(True);
  dmprincipal.IBTbVendas_sc.Insert;
  _imprime:='*';
 // _prazo:=0;
  maskedit2.text:=' ';
  maskedit2.setfocus;
  pedstr := IntToStr(RetornaCod+1);
  dmPrincipal.IBTbVendas_scNUMERO.AsString:= pedstr+'SC';

end;

procedure TfrmVendas_SC.BitBtn2Click(Sender: TObject);
begin
  dmPrincipal.IBTbItens_SC.Append;
  Application.CreateForm(TFrmConsProdutos,FrmConsProdutos);
  FrmConsProdutos.showmodal;
  FrmConsProdutos.Free;
  dmPrincipal.IBTbItens_SCNUMERO.AsString:=Trim(pedstr+'SC');
  dmPrincipal.IBTbItens_SCPRODUTO.AsInteger:=frmprincipal.produto;
  //dmPrincipal.IBTbItens_SC.Post;

  atualiza;
end;

procedure TfrmVendas_SC.BitBtn3Click(Sender: TObject);
var Descricao: String;
begin
 If Not dmprincipal.IBTbItens_SC.IsEmpty Then
        Begin
            With dmPrincipal.IBQWork do
                 Begin
                      Close;
                      Sql.Clear;
                      Sql.Add('DELETE FROM ITENS_SC WHERE NUMERO='''+PEDSTR+'SC'''+ ' AND DESCRICAO='''+dmprincipal.IBTbItens_SCDESCRICAO.AsString+'''');
                      dmPrincipal.IBQWork.ExecSQL;

                 End;
            DSIBItens_SC.DataSet.Filter:=('NUMERO='''+pedstr+'SC'''+' AND DESCRICAO='''+ dmprincipal.IBTbItens_SCDESCRICAO.AsString+'''');
            DSIBItens_SC.DataSet.Filtered:=True;


        End;

   atualiza;
  _edicao:='*';
end;

procedure TfrmVendas_SC.tbtncancelapedClick(Sender: TObject);
begin
  CancelaPedido;
  BitBtn1.Enabled:=True;
end;

procedure TfrmVendas_SC.salvanobanco;
begin
  With dmPrincipal do
    Begin
       IBTbVendas_sc.Post;
       IBTbItens_SC.Post;
       IBTransaction1.Commit; 


    End;
end;

procedure TfrmVendas_SC.cancelapedido;
begin
  dmPrincipal.IBTbVendas_sc.Cancel;
  dmPrincipal.IBTbItens_SC.Cancel ;
  dmPrincipal.IBTransaction1.Rollback;
  // Excluir Itens SC caso tenha salvo algum
     With dmPrincipal.IBQWork Do
         Begin
              Close;
              Sql.Clear;
              Sql.Add('DELETE FROM ITENS_SC WHERE NUMERO='''+PEDSTR+'SC''');
              Prepare;
              ExecSQL;
         End;
  habilitatabelasebotoes(False);
end;

procedure TfrmVendas_SC.tbtnconfirmapedClick(Sender: TObject);
begin
      maskedit2.text:=' ';
      _edicao:=' ';
      If Status='I' Then
        DmPrincipal.IBTbVendas_scData.AsDateTime:=(date);


      if (dmprincipal.IBTbItens_SC.state in [dsinsert,dsedit]) and
         (dmprincipal.IBTbItens_SCQUANTIDADE.value <> 0) then
              dmprincipal.IBTbItens_SC.post;
         

      if (dmprincipal.IBTbItens_SC.state in [dsinsert,dsedit]) then
          _edicao:='*';

      if (dmprincipal.IBTbVendas_scValor.value <> 0) then begin
         if (dmprincipal.IBTbVendas_sc.state in [dsinsert, dsedit]) then
            begin
              if dmprincipal.tblvendedores.findkey([dmprincipal.tblvendascodven]) then
                 dmprincipal.IBTbVendas_sc.fieldbyname('vendedor').asstring:=
                 dmprincipal.tblvendedores.fieldbyname('CODIGO').asstring;
            end;


            dmprincipal.IBTbVendas_sc.FieldByName('nota').asstring:=maskedit2.text;
            dmprincipal.IBTbVendas_sc.Post;
//********************** Gera Contas a Receber a vista (pago)**************************************
               
//********************** Fim gera Contas a receber************************
    dmPrincipal.IBTransaction1.Commit;
            if _imprime = '*' then begin
               if confirma('Deseja Imprimir o Pedido ?') = IDYES then
                      Begin
                           ImprimeMatricial
                       End;
                       _imprime:= ' ';

            end;



         end
      else
         begin
           messagedlg('Pedido com valor 0.'+ 'Não há nada a confirmar',mterror,
           [mbok],0);
           habilitatabelasebotoes(false);
           maskedit2.text:=' ';
         end;
     habilitatabelasebotoes(False);
     BitBtn1.Enabled:=True;
     dmPrincipal.IBTbItens_SC.Close;
     dmPrincipal.IBTbVendas_sc.Close;

end;

procedure TfrmVendas_SC.ImprimeMatricial;
begin

  IF FrmPrinPedSCMatric=Nil Then
    Application.CreateForm(TFrmPrinPedSCMatric,FrmPrinPedSCMatric);
  // Filtrando vendas SC
  FrmPrinPedSCMatric.IBQVendas.close;
  FrmPrinPedSCMatric.IBQVendas.close;
  FrmPrinPedSCMatric.IBQVendas.sql.clear;
  FrmPrinPedSCMatric.IBQVendas.sql.add('Select  v.pedido,v.nota,v.data,v.cliente,v.valor,v.numero ');
  FrmPrinPedSCMatric.IBQVendas.sql.add('from  vendas_sc v ');
  FrmPrinPedSCMatric.IBQVendas.sql.add('where v.numero = '''+ Trim(PedStr+'SC'''));
  //Filtrando Itens SC
  FrmPrinPedSCMatric.IBQItens.close;
  FrmPrinPedSCMatric.IBQItens.close;
  FrmPrinPedSCMatric.IBQItens.sql.clear;
  FrmPrinPedSCMatric.IBQItens.sql.add('SELECT * FROM ITENS_SC I');
  FrmPrinPedSCMatric.IBQItens.sql.add('where I.numero = '''+ Trim(pedstr +'SC'' AND QUANTIDADE<>0'));


  FrmPrinPedSCMatric.IBQVendas.open;
  FrmPrinPedSCMatric.IBQItens.open;


  FrmPrinPedSCMatric.QRLabel23.Caption:=frmprincipal.Fone;  

  FrmPrinPedSCMatric.Preview ;

  FrmPrinPedSCMatric.IBQVendas.close;
  FrmPrinPedSCMatric.IBQItens.close;
 // FrmPrinPedSCMatric.Free;
  habilitatabelasebotoes(false);

end;

procedure TfrmVendas_SC.BitBtn7Click(Sender: TObject);
begin
   Application.CreateForm(TFrmRelVendasSCadastro,FrmRelVendasSCadastro);
   FrmRelVendasSCadastro.ShowModal;
   FrmRelVendasSCadastro.Free;
end;

function TfrmVendas_SC.RetornaCod:Integer;
Var
   I: integer;
   S: string;
   Texto: String;
begin
//Função para retornar ultimo número de pedido de vendas SC
  With dmPrincipal.IBQWork   Do
       Begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT * FROM VENDAS_SC ' );
           Open;
           dmPrincipal.IBQWork.Last;
           //ShowMessageStringReplace()
           Texto:=dmPrincipal.IBQWork.FieldByname('NUMERO').AsString;
         End;
         S := '';
        for I := 1 To Length(Texto) Do
        begin
           if (Texto[I] in ['0'..'9']) then
              begin
                  S := S + Copy(Texto, I, 1);
              end;
       end;
    result := StrToInt(S);
end;

end.

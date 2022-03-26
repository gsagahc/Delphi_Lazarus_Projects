{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit Orcamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, Db, DBCtrls, ImgList;
  procedure imprimerelacao;
  procedure habilitatabelasebotoes(habilitado:boolean);


type
  TfrmOrvcamento = class(TFORM)
    ImageList1: TImageList;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    dbedit4: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    Edit2: TEdit;
    Panel3: TPanel;
    tbtnNovoped: TBitBtn;
    tbtnExcluiPed: TBitBtn;
    tbtnAlteraped: TBitBtn;
    tbtnconfirmaped: TBitBtn;
    tbtncancelaped: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnNovopedClick(Sender: TObject);
    procedure tbtnAlterapedClick(Sender: TObject);
    procedure tbtnExcluiPedClick(Sender: TObject);
    procedure tbtnconfirmapedClick(Sender: TObject);
    procedure tbtncancelapedClick(Sender: TObject);
    procedure tbtnexcluiitemClick(Sender: TObject);
    procedure tbtnimprimepedClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function ChecarLimiteCred:Boolean;
    procedure btnfechaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure imprimerelacaomatricial;
    procedure atualiza;
    Function  LocalizaPedido(Numero:String):Boolean;
  private
     Status:String;
     PedStr:String;
    { Private declarations }
  public
    CodCli:Integer;
    { Public declarations }
  end;

var
  frmOrvcamento: TfrmOrvcamento;
  _imprime    : string;
  _prazo      : integer;
  _edicao     : string;

implementation

uses DataMod, rotinas, relrem, locaped, ConsCliVend, Principal, ManVendas,
  CosCliOrca, RelOrcamento, DBTables, ConsultaProdutos, Quantidade,
  SelectImpressora, RELREM_Matricial,  RELREM_Matricial2, ConsultaCli_Orca;

{$R *.DFM}

procedure TfrmOrvcamento.FormCreate(Sender: TObject);
begin
  dmprincipal.tblOrcamentos.close;
  dmprincipal.TblItensOrca.close;
  frmOrvcamento.radiogroup2.enabled:=false;
  frmOrvcamento.radiogroup1.enabled:=false;
  frmOrvcamento.maskedit2.enabled:=false;

end;

procedure TfrmOrvcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmprincipal.tblOrcamentos.state in [dsedit,dsinsert] then
     if confirma('Confirma Orçamento?') = IDYES then
        tbtnconfirmapedclick(self)
     else if dmprincipal.tblOrcamentos.state in [dsedit,dsinsert] then
        tbtncancelapedclick(self)
  else
     begin
      radiogroup1.enabled:=false;
      radiogroup1.enabled:=false;
      radiogroup2.itemindex:=-1;
      radiogroup1.itemindex:=-1;
      maskedit2.enabled:=false;
      maskedit2.text:=' ';
      tbtnNovoped.enabled:=true;
      tbtnAlteraped.enabled:=true;
      tbtnExcluiped.enabled:=true;
      tbtnconfirmaped.enabled:= false;
      tbtncancelaped.enabled:= false;

     end;


end;

procedure TfrmOrvcamento.tbtnNovopedClick(Sender: TObject);
begin
  Status:='I';
  EDit2.Clear;
  habilitatabelasebotoes(true);

  dmprincipal.TblOrcamentos.insert;
  _imprime:='*';
  _prazo:=0;
  radiogroup2.enabled:=true;
  maskedit2.text:=' ';
  maskedit2.enabled:=true;
  maskedit2.setfocus;
  DmPrincipal.tblnumped.Open;
  dmPrincipal.tblnumped.Last;
  dmPrincipal.TblOrcamentosPedido.AsInteger :=dmPrincipal.tblnumpedOrcamento.ASInteger+1;
  dmPrincipal.tblnumped.Edit;
  dmPrincipal.tblnumpedOrcamento.AsInteger:=dmPrincipal.tblnumpedOrcamento.AsInteger+1;
  dmPrincipal.tblnumped.Post;

end;

procedure TfrmOrvcamento.tbtnAlterapedClick(Sender: TObject);
var
 pedstr : string;
begin

  Status:='A';
  pedstr :='';
  _prazo :=0;
  if inputquery('Alteração de Pedidos','Número do Pedido',pedstr) then
     if pedstr <> '' then
        try
          strtoint(pedstr);
          dmprincipal.TblOrcamentos.Open;
          if not dmprincipal.TblOrcamentos.Locate('PEDIDO',pedstr,[LoPartialkey]) then
             begin
               messagedlg('Pedido não encontrado',mterror,[mbok],0);
               dmprincipal.TblOrcamentos.close;
               radiogroup2.enabled:=false;
               radiogroup1.enabled:=false;
               radiogroup2.itemindex:=-1;
               radiogroup1.itemindex:=-1;
               maskedit2.enabled:=false;
             end
          else begin
             habilitatabelasebotoes(true);
             radiogroup2.enabled:=true;


             dmprincipal.TblOrcamentos.edit;
             maskedit2.enabled:=true;
             maskedit2.text:=dmprincipal.TblOrcamentos.fieldbyname('Nota').asstring;
             CodCli:= dmPrincipal.tblOrcamentosCliente.AsInteger;
             With dmPrincipal.QWork do
                Begin
                    Close;
                    SQL.Clear;
                    Sql.Add('SELECT CODIGO, NOME FROM CLIENTES WHERE CODIGO='+IntToStr(CODCLI));
                    Open;
                End;
             EDit2.Text:=dmPrincipal.QWork.FieldByName('NOME').AsString;
             if dmprincipal.tblOrcamentosprazo.value<8 then    // Geral
                begin
                  radiogroup1.enabled:=true;
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=0;
                  case dmprincipal.tblOrcamentosprazo.value of
                       0: radiogroup1.itemindex:=0;
                       1: radiogroup1.itemindex:=1;
                       2: radiogroup1.itemindex:=2;
                       3: radiogroup1.itemindex:=3;
                       4: radiogroup1.itemindex:=4;
                       5: radiogroup1.itemindex:=5;
                       6: radiogroup1.itemindex:=6;
                       7: radiogroup1.itemindex:=7;

                  end;
                end;

             end;

             if dmprincipal.tblOrcamentosprazo.value=8 then    // Colegios
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=1;
                end;

             if dmprincipal.TblOrcamentosPrazo.value=9 then    // reposicao
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=2;
                end;
             if dmprincipal.tblOrcamentosprazo.value=10 then    // A Vista 15%
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=0;
                  RadioGroup1.ItemIndex:=8;

               end;

        except
             On Econverterror do begin
             messagedlg('Número do pedido inválido',mterror,[mbok],0);
             radiogroup2.enabled:=false;
             radiogroup1.enabled:=false;
             radiogroup2.itemindex:=-1;
             radiogroup1.itemindex:=-1;
             maskedit2.enabled:=false;
             maskedit2.text:=' ';
             end;
        end;

end;

procedure TfrmOrvcamento.tbtnExcluiPedClick(Sender: TObject);

begin
  Status:='E';
  _prazo:=0;
  if inputquery('Exclusão de Orçamentos','Número do Orçamento', pedstr) then
     if pedstr <> '' then
        try
          strtoint(pedstr);
             if not LocalizaPedido(pedstr) then begin
             messagedlg('Orçamento não encontrado',mterror,[mbok],0);
             dmprincipal.tblOrcamentos.close;
             radiogroup2.enabled:=false;
             radiogroup1.enabled:=false;
             radiogroup2.itemindex:=-1;
             radiogroup1.itemindex:=-1;
             maskedit2.enabled:=false;
             end
          else begin
             habilitatabelasebotoes(true);
             radiogroup2.enabled:=true;
             tbtncancelaped.enabled:= True;
             dmprincipal.tblOrcamentos.open;
             dmPrincipal.tblOrcamentos.Locate('pedido',pedstr, [LoPartialkey]);
                   maskedit2.text:=dmprincipal.tblOrcamentos.fieldbyname('Nota').asstring;
                   {Localizar Cliente}
                   With dmPrincipal.QWork Do
                       Begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select nome from clientes where codigo='+dmPrincipal.tblOrcamentosCliente.AsString);
                          Open;
                          Edit2.Text:=dmPrincipal.QWork.FieldByName('NOME').AsString;
                       End;

             maskedit2.text:=dmprincipal.tblOrcamentos.fieldbyname('Nota').asstring;
             Edit2.Text:=dmPrincipal.tblOrcamentosCliente.AsString;

             if dmprincipal.tblOrcamentosprazo.value<8 then    // Geral
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=0;
                  case dmprincipal.tblOrcamentosprazo.value of
                       0: radiogroup1.itemindex:=0;
                       1: radiogroup1.itemindex:=1;
                       2: radiogroup1.itemindex:=2;
                       3: radiogroup1.itemindex:=3;
                       4: radiogroup1.itemindex:=4;
                       5: radiogroup1.itemindex:=5;
                       6: radiogroup1.itemindex:=6;
                       7: radiogroup1.itemindex:=7;
                  end;
                end;

             if dmprincipal.tblOrcamentosprazo.value=8 then    // Colegios
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=1;
                  maskedit2.enabled:=true;

                end;

             if dmprincipal.tblOrcamentosPrazo.value=9 then    // reposicao
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=2;
                end;

             if confirma('Confirma exclusão do Orçamento ?') = IDYES then
                begin
                  dmprincipal.tblOrcamentos.delete;
                  habilitatabelasebotoes(false);
                  radiogroup1.itemindex:=-1;
                end;
          end;
        except
             on econverterror do begin
             messagedlg('Número do Pedido inválido',mterror,[mbok],0);
             radiogroup2.enabled:=false;
             radiogroup1.enabled:=false;
             radiogroup2.itemindex:=-1;
             radiogroup1.itemindex:=-1;
             maskedit2.enabled:=false;
             maskedit2.text:=' ';
             end;
        end;

end;

procedure TfrmOrvcamento.tbtnconfirmapedClick(Sender: TObject);
begin
 if ChecarLimiteCred Then
   Begin
      _edicao:=' ';
      If Status='I' Then
        DmPrincipal.tblorcamentosData.AsDateTime:=(date);
      DmPrincipal.tblOrcamentosDataAlteracao.AsDateTime:=(Date);
      Dmprincipal.tblOrcamentosCliente.AsInteger:=CodCli;

      if (dmprincipal.TblItensOrca .state in [dsinsert,dsedit]) and
         (dmprincipal.tblitensOrcaQuantidade.value <> 0) then
          dmprincipal.tblitensOrca.post;

      if (dmprincipal.tblitensOrca.state in [dsinsert,dsedit]) then
          _edicao:='*';

      if (dmprincipal.tblOrcamentosValor.value <> 0) or
         (dmprincipal.tblOrcamentosValor.value = 0) and (radiogroup2.itemindex=2) then begin
         if (dmprincipal.tblOrcamentos.state in [dsinsert, dsedit]) then
            begin
              if dmprincipal.tblvendedores.findkey([dmprincipal.tblOrcamentoscodven]) then
                 dmprincipal.tblOrcamentos.fieldbyname('vendedor').asstring:=
                 dmprincipal.tblvendedores.fieldbyname('nome').asstring;
            end;

            if radiogroup2.itemindex=0 then begin    // Geral
               if (radiogroup1.itemindex <> dmprincipal.tblorcamentosprazo.value) or (_edicao='*') then begin
                  atualiza; // atualiza total do Pedido
                  case radiogroup1.itemindex of
                       1: dmprincipal.tblOrcamentosvalor.value:=
                          dmprincipal.tblOrcamentosvalor.value-(dmprincipal.tblOrcamentosvalor.value*0.05);
                       2: dmprincipal.tblOrcamentosvalor.value:=
                          dmprincipal.tblOrcamentosvalor.value-(dmprincipal.tblOrcamentosvalor.value*0.10);
                       3: _prazo:=07;
                       4: _prazo:=14;
                       5: _prazo:=21;
                       6: _prazo:=25;
                       7: dmprincipal.tblOrcamentosvalor.value:=
                          dmprincipal.tblOrcamentosvalor.value-(dmprincipal.tblOrcamentosvalor.value*0.03);
                       8:dmprincipal.tblOrcamentosvalor.value:=
                         dmprincipal.tblOrcamentosvalor.value-(dmprincipal.tblOrcamentosvalor.value*0.15);
                  end;
               end;
               dmprincipal.tblOrcamentosprazo.value:=radiogroup1.itemindex
            end;

            if radiogroup2.itemindex=1 then       // Colegios
               begin
                 _prazo:=8;
                 dmprincipal.tblOrcamentosprazo.value:=_prazo;
               end;

            if radiogroup2.itemindex=2 then      // Reposicao
               begin
                _prazo:=9;
                dmprincipal.tblOrcamentosprazo.value:=_prazo;
               end;
            If RadioGroup1.ItemIndex=8 Then  // A Vista 15%
               DmPrincipal.tblOrcamentosPrazo.AsInteger:=10;


            dmprincipal.tblOrcamentos.FieldByName('nota').asstring:=maskedit2.text;
            dmprincipal.tblOrcamentos.Post;
//            dmPrincipal.Database1.Commit;

            if _imprime = '*' then begin
               if confirma('Deseja Imprimir o Orçamento?') = IDYES then
                  begin
                    Begin
                         Application.CreateForm(TFrmSelecionaPrint, FrmSelecionaPrint);
                         FrmSelecionaPrint.ShowModal;
                         FrmSelecionaPrint.Free;
                         If frmPrincipal.impressora = 0 then
                            imprimerelacaomatricial
                         Else
                            imprimerelacao;

                       End;
                       _imprime:= ' ';
                  end;
            end;
            radiogroup2.enabled:=false;
            radiogroup1.enabled:=false;
            radiogroup2.itemindex:=-1;
            radiogroup1.itemindex:=-1;
            maskedit2.enabled:=false;
            maskedit2.text:=' ';
            habilitatabelasebotoes(false);
            Edit2.Clear;
            dmPrincipal.TblItensOrca .Close;
            dmPrincipal.TblOrcamentos.Close;


         end
      else
         begin
           messagedlg('Orçamento com valor 0.'+ 'Não há nada a confirmar',mterror,
           [mbok],0);
           habilitatabelasebotoes(false);
           radiogroup1.itemindex:=-1;
           maskedit2.text:=' ';
         end;
   End


end;
procedure TfrmOrvcamento.tbtncancelapedClick(Sender: TObject);
begin
  dmprincipal.tblOrcamentos.BeforeDelete(dmprincipal.tblitensOrca);
     dmprincipal.tblOrcamentos.edit;
     // atualiza o numero do pedido
     with dmprincipal.tblNumped do begin
          Open;
          Edit;
          dmprincipal.tblnumpedOrcamento.Value:=dmprincipal.tblnumpedOrcamento.Value - 1;
          dmprincipal.TblOrcamentosPedido.Value:=dmprincipal.tblNumPedOrcamento.Value;
          Post;
          Close;
     end;

  dmprincipal.tblOrcamentos.cancel;
//  dmPrincipal.Database1.Rollback;
  habilitatabelasebotoes(false);
  radiogroup2.enabled:=false;
  radiogroup1.enabled:=false;
  radiogroup2.itemindex:=-1;
  radiogroup1.itemindex:=-1;
  maskedit2.enabled:=false;
  maskedit2.text:=' ';
end;

procedure imprimerelacao;
begin
  dmprincipal.tblclientes.open;
 iF FrmRelOrca=Nil Then
    Application.CreateForm(TFrmRelOrca,FrmRelOrca);
  FrmRelOrca.qryvendas.close;
  FrmRelOrca.qryitens.close;
  FrmRelOrca.qryvendas.sql.clear;
  FrmRelOrca.qryvendas.sql.add('Select V.DataAlteracao, v.pedido,v.nota,v.data,v.vendedor,v.cliente,v.prazo,v.valor,cl.*,vd.nome,');
  FrmRelOrca.qryvendas.sql.add('from  ORCAMENTOS V inner join clientes cl  on V.cliente = cl.codigo');
  FrmRelOrca.qryvendas.sql.add('inner join vendedores vd on vd.codigo=v.vendedor');
  FrmRelOrca.qryvendas.sql.add('where v.pedido = '+ dmprincipal.TblOrcamentosPEDIDO.asstring);
     If dmprincipal.tblclientes.Locate('CODIGO',dmprincipal.TblOrcamentos.fieldbyname('cliente').asstring,[LoPartialkey]) Then

     begin
       FrmRelOrca.qrlabel14.caption:=dmprincipal.tblclientes.fieldbyname('endereco').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('cidade').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('estado').asstring+' Telefone(s) '+
       dmprincipal.tblclientes.fieldbyname('telefone').asstring;
       FrmRelOrca.qrlabel31.caption:=dmprincipal.tblclientes.fieldbyname('cgc').asstring;
       FrmRelOrca.QRLabel35.Caption:=dmPrincipal.tblclientes.FieldByName('RgINSC').AsString;
       FrmRelOrca.qrlabel32.caption:='Código '+dmprincipal.tblclientes.fieldbyname('codigo').asstring;
       FrmRelOrca.QRLabel39.Caption:=Dmprincipal.tblclientes.FieldByName('DataCad').AsString;
     end
  else
     FrmRelOrca.qrlabel14.caption:='CLIENTE NAO CADASTRADO';

  dmprincipal.tblclientes.indexname:='';
  FrmRelOrca.qryvendas.open;
  FrmRelOrca.qryitens.open;

  case FrmRelOrca.qryvendasprazo.value of
       0:FrmRelOrca.qrlabel12.caption:='A vista';
       1:FrmRelOrca.qrlabel12.caption:='A vista 05% desconto';
       2:FrmRelOrca.qrlabel12.caption:='A vista 10% desconto';
       7:FrmRelOrca.qrlabel12.caption:='A vista 03% desconto';
       10:  begin
              FrmRelOrca.qrlabel12.caption:='A vista 15% desconto';
            End;
       9:FrmRelOrca.qrlabel12.caption:='*** P E D I D O  D E  R E P O S I Ç Ã O ***'
  end;
  FrmRelOrca.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  FrmRelOrca.Preview;
  FrmRelOrca.qryvendas.close;
  FrmRelOrca.qryitens.close;
  habilitatabelasebotoes(false);
  frmOrvcamento.radiogroup2.enabled:=false;
  frmOrvcamento.radiogroup1.enabled:=false;
  frmOrvcamento.radiogroup2.itemindex:=-1;
  frmOrvcamento.radiogroup1.itemindex:=-1;
  frmOrvcamento.maskedit2.enabled:=false;

end;

procedure habilitatabelasebotoes(habilitado:boolean);
begin
 dmprincipal.TblOrcamentos.active:= habilitado;
 dmprincipal.TblItensOrca.active:= habilitado;
 dmPrincipal.tblprodutos.Active:=habilitado;
 dmprincipal.tblclientes.Active := habilitado;
 dmPrincipal.tblvendedores.Active :=habilitado ;
 frmOrvcamento.tbtnconfirmaped.enabled:= habilitado;
 frmOrvcamento.tbtncancelaped.enabled:= habilitado;
 frmOrvcamento.tbtnNovoped.enabled:= not habilitado;
 frmOrvcamento.tbtnAlteraped.enabled:= not habilitado;
 frmOrvcamento.tbtnExcluiped.enabled:= not  habilitado;
 frmOrvcamento.BitBtn4.Enabled := habilitado;
 frmOrvcamento.BitBtn5.Enabled := habilitado;
 frmOrvcamento.BitBtn6.Enabled := habilitado;
 frmOrvcamento.BitBtn3.Enabled := not habilitado;
 frmOrvcamento.BitBtn2.Enabled := not habilitado;
 frmOrvcamento.BitBtn7.Enabled := not habilitado;
 frmOrvcamento.Edit2.Clear;
end;

procedure TfrmOrvcamento.tbtnexcluiitemClick(Sender: TObject);
begin
  If Not dmprincipal.tblitensOrca.IsEmpty Then
      dmprincipal.tblitensOrca.delete;
  _edicao:='*';
end;

procedure TfrmOrvcamento.tbtnimprimepedClick(Sender: TObject);
var
 pedstr : string;
begin
  pedstr :='';
  if inputquery('Impressão de Orçamentos','Número do Orçamento',pedstr) then
     if pedstr <> '' then
        try
          strtoint(pedstr);
          dmprincipal.tblOrcamentos.Open;
          if not dmprincipal.tblOrcamentos.Locate('PEDIDO',pedstr,[LoPartialkey]) then begin
             messagedlg('Orçamento não encontrado',mterror,[mbok],0);
             dmprincipal.tblOrcamentos.close;
             end
          else
              Begin
               Application.CreateForm(TFrmSelecionaPrint, FrmSelecionaPrint);
               FrmSelecionaPrint.ShowModal;
               FrmSelecionaPrint.Free;
               If frmPrincipal.impressora = 0 then
                  imprimerelacaomatricial
               Else
                  imprimerelacao;

             End ;
        except
          On Econverterror do
          messagedlg('Número do orçamento inválido',mterror,[mbok],0);
        end;

end;



procedure TfrmOrvcamento.atualiza;
var
 Bmk : TBookMark;
 ValTot: Double;
begin
  with dmprincipal.tblitensOrca do begin
       Bmk := GetBookMark;
       DisableControls;
       try
         ValTot := 0.0;
         First;
         while not eof do begin
               valtot := valtot + dmprincipal.tblitensOrcavalunitario.value
               *dmprincipal.tblitensOrcaquantidade.value;
               next;
         end;
       finally
         enablecontrols;
       if bmk <> nil then begin
          GotoBookMark(Bmk);
          FreeBookMark(Bmk);
       end;
  end;

  dmprincipal.tblOrcamentosvalor.value:= valtot;

  if dmprincipal.tblOrcamentosvalor.value = 0 then
     begin
       frmOrvcamento.radiogroup2.enabled:=false;
       frmOrvcamento.radiogroup1.enabled:=false;
       frmOrvcamento.maskedit2.enabled:=false;
     end;

  end;
end;



procedure TfrmOrvcamento.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  case radiogroup2.itemindex of
    0: begin
         radiogroup1.enabled:=true;
         radiogroup1.itemindex:=-1;
      end;

    1: begin
        radiogroup1.enabled:=false;
        radiogroup1.itemindex:=-1;
       end;

     2: begin
         radiogroup1.enabled:=false;
         radiogroup1.itemindex:=-1;

        end;

  end;

end;

procedure TfrmOrvcamento.FormShow(Sender: TObject);
begin
  inherited;
  dmprincipal.tblprodutos.oPEN;
  dmprincipal.tblclientes.Open;
  dmprincipal.tblvendedores.Open;
end;

function TfrmOrvcamento.ChecarLimiteCred: Boolean;
begin
  With DmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT LIMITE FROM CLIENTES WHERE NOME='''+EDIT2.TEXT+'''');
      Open;
    End;
  If (DmPrincipal.QWork.FieldByName('Limite').AsCurrency < dbedit4.Field.AsCurrency) And (frmprincipal.GblPermicao <> 'S') Then
      Begin
        FRMPRINCIPAL.SENHA:='';
        frmprincipal.FormAlertaSenha('Atenção!',' O Limite de crédito do cliente é menor do que '+
                                     'o valor total do orçamento. Entre com a senha do supervisor, ou'+
                                     'Diminua o valor para poder concluí-la.');
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
  If (DmPrincipal.QWork.FieldByName('Limite').AsCurrency < dbedit4.Field.AsCurrency) Then
      ShowMessage   ('Atenção!  O Limite de crédito do cliente é menor do que '+
                     'o valor total do orçamento. ');
       Result:=True;


End;

procedure TfrmOrvcamento.btnfechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrvcamento.BitBtn2Click(Sender: TObject);
begin

  If  Confirma('Deseja converter este orçamento para pedido?') =IDYES Then
     Begin
       With frmprincipal Do
         Begin
          Cliente:=IntToStr(CodCli) ;
          CodVen:=DBLookupComboBox1.KeyValue;
          CodItens:=dmPrincipal.TblItensOrcaPedido.AsInteger;
          Tipo:=RadioGroup2.ItemIndex;
          Prazo:=RadioGroup1.ItemIndex;
           
         End;
       Application.CreateForm(TfrmManVendas,frmManVendas);
       frmManVendas.Converter:=true;
       frmManVendas.ShowModal;
       frmManVendas.Free;

      Close;
     End;
end;

procedure TfrmOrvcamento.BitBtn3Click(Sender: TObject);
var
  pedstr : string;
begin
  _prazo:=0;
  if inputquery('Localização de orçamentos','Número do Orçamento', pedstr) then
     if pedstr <> '' then
        try
          strtoint(pedstr);
          dmprincipal.tblOrcamentos.open;

          if not dmprincipal.tblOrcamentos.Locate('PEDIDO',pedstr,[lopartialkey]) then begin
             messagedlg('Pedido não encontrado',mterror,[mbok],0);
             dmprincipal.tblOrcamentos.close;
            end
          else
          begin

             dmprincipal.tblOrcamentos.Open;
             dmprincipal.tblclientes.Open;
             dmprincipal.tblitensOrca.Open;
             DBLookupComboBox1.Enabled:=False;
             DBGrid1.ReadOnly:=TRUE;
             maskedit2.text:=dmprincipal.tblOrcamentos.fieldbyname('Nota').asstring;
             dmPrincipal.tblclientes.Locate('CODIGO',dmPrincipal.TblOrcamentosCLIENTE.AsString,[loPartialkey]);
             Edit2.Text :=dmPrincipal.tblclientesNOME.AsString;
             CodCli :=dmPrincipal.tblORCAMENTOSCLIENTE.AsInteger;
             dmprincipal.TblItensOrca.Open;
             dmprincipal.TblItensOrca.Locate('PEDIDO',dmprincipal.TblOrcamentosPEDIDO.AsString,[LoPartialKey]);
             DBLookupComboBox1.KeyValue:=dmPrincipal.TblOrcamentosVENDEDOR.AsInteger;
             frmprincipal.Vendedor :=dmPrincipal.TblOrcamentosVENDEDOR.AsInteger;
             if dmprincipal.tblOrcamentosprazo.value<8 then    // Geral
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=0;
                  case dmprincipal.tblOrcamentosprazo.value of
                       0: radiogroup1.itemindex:=0;
                       1: radiogroup1.itemindex:=1;
                       2: radiogroup1.itemindex:=2;
                       3: radiogroup1.itemindex:=3;
                       4: radiogroup1.itemindex:=4;
                       5: radiogroup1.itemindex:=5;
                       6: radiogroup1.itemindex:=6;
                       7: radiogroup1.itemindex:=7;
                  end;
                end;

             if dmprincipal.tblOrcamentosprazo.value=8 then    // Colegios
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=1;
                  maskedit2.enabled:=true;

                end;

             if dmprincipal.tblOrcamentosPrazo.value=9 then    // reposicao
                begin
                  radiogroup2.enabled:=true;
                  radiogroup2.itemindex:=2;
                end;

        end;
        except
             on econverterror do begin
             messagedlg('Número do Orçamento inválido',mterror,[mbok],0);
             radiogroup2.enabled:=false;
             radiogroup1.enabled:=false;
             radiogroup2.itemindex:=-1;
             radiogroup1.itemindex:=-1;
             maskedit2.enabled:=false;
             maskedit2.text:=' ';
             end;

        end;


end;

procedure TfrmOrvcamento.BitBtn5Click(Sender: TObject);
begin
  dmPrincipal.TblItensOrca.Insert;
  Application.CreateForm(TFrmConsProdutos,FrmConsProdutos);
  FrmConsProdutos.showmodal;
  FrmConsProdutos.Free;
  dmPrincipal.TblItensOrcaPRODUTO.AsInteger:=frmprincipal.produto;
  atualiza;
end;

procedure TfrmOrvcamento.BitBtn6Click(Sender: TObject);
begin
   If Not dmprincipal.tblitensOrca.IsEmpty Then

      dmprincipal.tblitensOrca.delete;

  atualiza;
  _edicao:='*';
end;

procedure TfrmOrvcamento.BitBtn4Click(Sender: TObject);
begin
inherited;
  Application.CreateForm(TFrmConsCliOrca,FrmConsCliOrca);
  FrmConsCliOrca.ShowModal;
  FrmConsCliOrca.Free;

end;

procedure TfrmOrvcamento.imprimerelacaomatricial;
begin
  dmprincipal.tblclientes.open;
  dmprincipal.tblcontarec.open;
  iF frmrelrem2=Nil Then
    Application.CreateForm(Tfrmrelrem2,frmrelrem2);
  frmrelrem2.qryvendas.close;
  frmrelrem2.qryitens.close;
  frmrelrem2.qryvendas.sql.clear;
  frmrelrem2.qryvendas.sql.add('select o.DataAlteracao, o.pedido,o.nota,o.data,o.vendedor,o.cliente,o.prazo,o.valor, cl.*, vd.nome,');
  frmrelrem2.qryvendas.sql.add('from  orcamentos o inner join clientes cl  on o.cliente = cl.codigo');
  frmrelrem2.qryvendas.sql.add('inner join vendedores vd on vd.codigo=o.vendedor');
  frmrelrem2.qryvendas.sql.add('where O.pedido = '+
  dmprincipal.TblOrcamentosPEDIDO.asstring);

  if dmprincipal.tblclientes.Locate('CODIGO',dmprincipal.TblOrcamentos.fieldbyname('cliente').asstring,[LoPartialKey]) then
     begin
       frmrelrem2.qrlabel14.caption:=dmprincipal.tblclientes.fieldbyname('endereco').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('cidade').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('estado').asstring+' Telefone(s) '+
       dmprincipal.tblclientes.fieldbyname('telefone').asstring;
       frmrelrem2.qrlabel31.caption:=dmprincipal.tblclientes.fieldbyname('cgc').asstring;
       frmrelrem2.QRLabel35.Caption:=dmPrincipal.tblclientes.FieldByName('RgINSC').AsString;
       frmrelrem2.qrlabel32.caption:='Código '+dmprincipal.tblclientes.fieldbyname('codigo').asstring;
       frmrelrem2.QRLabel39.Caption:=Dmprincipal.tblclientes.FieldByName('DataCad').AsString;
     end
  else
     frmrelrem2.qrlabel14.caption:='CLIENTE NAO CADASTRADO';

  dmprincipal.tblclientes.indexname:='';
  frmrelrem2.qryvendas.open;
  frmrelrem2.qryitens.open;

  if frmrelrem2.qryvendasprazo.value > 2 then
     begin
       if dmprincipal.tblcontarec.Locate('PEDIDO',dmprincipal.TblOrcamentosPEDIDO.asstring,[LoPartialKey]) then
          frmrelrem2.qrlabel12.caption:=datetostr(dmprincipal.tblcontarecVencto.Value)
       else
          frmrelrem2.qrlabel12.caption:='NAO ENCONTREI O VENCTO';
     end;

  case frmrelrem2.qryvendasprazo.value of
       0:frmrelrem2.qrlabel12.caption:='A vista';
       1:frmrelrem2.qrlabel12.caption:='A vista 05% desconto';
       2:frmrelrem2.qrlabel12.caption:='A vista 10% desconto';
       7:frmrelrem2.qrlabel12.caption:='A vista 03% desconto';
       10:  begin
               With dmPrincipal.Qwork Do
                  Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT * FROM CONTAREC WHERE PEDIDO='+frmrelrem2.qryvendasPEDIDO.AsString);
                    Open;
                  End;
               frmrelrem2.qrlabel12.caption:='A vista 15% desconto (Vencimento:'+dmPrincipal.Qwork.FieldByName('Vencto').AsString+')';
            End;
       9:Begin
            frmrelrem2.qrlabel12.Font.Color := Clred;
            frmrelrem2.qrlabel12.caption:='*** P E D I D O  D E  R E P O S I Ç Ã O ***';
         End;
  end;

  frmrelrem2.Preview;
  frmrelrem2.qrlabel12.Font.Color := clBlack ;
  frmrelrem2.qryvendas.close;
  frmrelrem2.qryitens.close;
  habilitatabelasebotoes(false);
  frmOrvcamento.radiogroup2.enabled:=false;
  frmOrvcamento.radiogroup1.enabled:=false;
  frmOrvcamento.radiogroup2.itemindex:=-1;
  frmOrvcamento.radiogroup1.itemindex:=-1;
  frmOrvcamento.maskedit2.enabled:=false;

end;

function TfrmOrvcamento.LocalizaPedido(Numero: String): Boolean;
begin
   with dmPrincipal.QWork Do
       Begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM VENDAS WHERE PEDIDO='+Numero);
          Open;
       End;
     If dmPrincipal.QWork.RecordCount >0 Then
       Result:=True
     Else
       Result:=False;
end;

end.

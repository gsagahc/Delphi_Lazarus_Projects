unit ManVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, Db, DBCtrls, ImgList;
  procedure imprimerelacao;
  procedure habilitatabelasebotoes(habilitado:boolean);
  procedure atualiza;

type
  TfrmManVendas = class(TFORM)
    ImageList1: TImageList;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    dbedit4: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnNovopedClick(Sender: TObject);
    procedure tbtnAlterapedClick(Sender: TObject);
    procedure tbtnExcluiPedClick(Sender: TObject);
    procedure tbtnconfirmapedClick(Sender: TObject);
    procedure tbtncancelapedClick(Sender: TObject);
    procedure tbtnimprimepedClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    Function ChecarLimiteCred:Boolean;
    procedure btnfechaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure imprimerelacaomatricial;
    Function SenhaSupertvisor(Senha:String):boolean;
    Function  LocalizaPedido(Numero:String):Boolean;

  private
     Status:String;
     pedstr : string;
    { Private declarations }
  public
    Converter:Boolean;
    CodCli:Integer;
    Senha:String;
    { Public declarations }
  end;

var
  frmManVendas: TfrmManVendas;
  _imprime    : string;
  _prazo      : integer;
  _edicao     : string;

implementation

uses DataMod, rotinas, relrem, locaped, ConsCliVend, Principal, ConsProd,
  ConsultaProdutos, Quantidade, RELREM_Matricial, SelectImpressora,
  SenhaSupervisor, CONSPED, DBTables;

{$R *.DFM}

procedure TfrmManVendas.FormCreate(Sender: TObject);
begin
  dmprincipal.tblvendas.close;
  dmprincipal.tblitens.close;
  frmmanvendas.radiogroup2.enabled:=false;
  frmmanvendas.radiogroup1.enabled:=false;
  frmmanvendas.groupBox1.enabled:=false;
  frmmanvendas.label4.enabled:=false;
  frmmanvendas.maskedit1.enabled:=false;
  frmmanvendas.maskedit2.enabled:=false;

end;

procedure TfrmManVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmprincipal.tblvendas.state in [dsedit,dsinsert] then
     if confirma('Confirma Pedido ?') = IDYES then
        tbtnconfirmapedclick(self)
     else if dmprincipal.tblvendas.state in [dsedit,dsinsert] then
        tbtncancelapedclick(self)
  else
     begin
      radiogroup1.enabled:=false;
      radiogroup1.enabled:=false;
      radiogroup2.itemindex:=-1;
      radiogroup1.itemindex:=-1;
      groupBox1.enabled:=false;
      label4.enabled:=false;
      maskedit1.enabled:=false;
      maskedit2.enabled:=false;
      maskedit1.text:='  /  /  ';
      maskedit2.text:=' ';
      tbtnNovoped.enabled:=true;
      tbtnAlteraped.enabled:=true;
      tbtnExcluiped.enabled:=true;
      tbtnconfirmaped.enabled:= false;
      tbtncancelaped.enabled:= false;
     end;
end;

procedure TfrmManVendas.tbtnNovopedClick(Sender: TObject);
begin
  Status:='I';
  EDit2.Clear;
  habilitatabelasebotoes(true);

  dmprincipal.tblvendas.insert;
  _imprime:='*';
  _prazo:=0;
  radiogroup2.enabled:=true;
  maskedit1.text:='  /  /  ';
  maskedit2.text:=' ';
  maskedit2.enabled:=true;
  maskedit2.setfocus;
  DmPrincipal.tblnumped.Open;
  dmPrincipal.tblnumped.Last;
  dmPrincipal.tblvendasPedido.AsInteger :=dmPrincipal.tblnumpedPedido.ASInteger+1;
  dmPrincipal.tblnumped.Edit;
  dmPrincipal.tblnumpedPedido.AsInteger:=dmPrincipal.tblnumpedPedido.AsInteger+1;
  pedstr :=dmPrincipal.tblnumpedPedido.AsString;
  dmPrincipal.tblnumped.Post;

end;

procedure TfrmManVendas.tbtnAlterapedClick(Sender: TObject);
begin
  Application.CreateForm(TFrmSenhaSupervisor,FrmSenhaSupervisor);
  FrmSenhaSupervisor.ShowModal;
  FrmSenhaSupervisor.Free;

  If SenhaSupertvisor(Senha) Then
     Begin
      Status:='A';
      pedstr :='';
      _prazo :=0;
      Application.CreateForm(TFrmConsPed, FrmConsPed);
      FrmConsPed.ShowModal;
      FrmConsPed.Free;
      pedstr:=frmprincipal.Pedido;
         if pedstr <> '' then
            try
              StrToInt(pedstr);
  //            PedStr:= IntToStr(StrToInt(PedStr)-1);
              dmprincipal.tblvendas.Open;
              if not dmprincipal.tblvendas.Locate('PEDIDO',(PedStr),[lopartialkey]) then
                 begin
                   messagedlg('Pedido não encontrado',mterror,[mbok],0);
                   dmprincipal.tblvendas.close;
                   radiogroup2.enabled:=false;
                   radiogroup1.enabled:=false;
                   radiogroup2.itemindex:=-1;
                   radiogroup1.itemindex:=-1;
                   groupBox1.enabled:=false;
                   label4.enabled:=false;
                   maskedit1.enabled:=false;
                   maskedit2.enabled:=false;
                 end
              else begin
                 habilitatabelasebotoes(true);
                 radiogroup2.enabled:=true;
                 //tbtncancelaped.enabled:= False;
                 dmprincipal.tblvendas.edit;
                 maskedit2.enabled:=true;
                 maskedit2.text:=dmprincipal.tblvendas.fieldbyname('Nota').asstring;
                 dmPrincipal.tblclientes.Locate('CODIGO',dmPrincipal.tblvendasCLIENTE.AsString,[loPartialkey]);
                 Edit2.Text :=dmPrincipal.tblclientesNOME.AsString;
                 CodCli :=dmPrincipal.tblvendasCLIENTE.AsInteger;
                 if dmprincipal.tblvendasprazo.value<8 then    // Geral
                    begin
                      radiogroup1.enabled:=true;
                      radiogroup2.enabled:=true;
                      radiogroup2.itemindex:=0;
                      case dmprincipal.tblvendasprazo.value of
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

                 if dmprincipal.tblvendasprazo.value=8 then    // Colegios
                    begin
                      radiogroup2.enabled:=true;
                      radiogroup2.itemindex:=1;
                      groupBox1.enabled:=true;
                      label4.enabled:=true;
                      maskedit1.enabled:=true;
                      dmprincipal.tblcontarec.open;
                      if dmprincipal.tblcontarec.locate('PEDIDO',dmprincipal.tblvendaspedido.asstring,[LoPartialkey]) then
                         maskedit1.text:=datetostr(dmprincipal.tblcontarecvencto.value);
                      dmprincipal.tblcontarec.close;
                    end;

                 if dmprincipal.tblvendasprazo.value=9 then    // reposicao
                    begin
                      radiogroup2.enabled:=true;
                      radiogroup2.itemindex:=2;
                    end;
                 if dmprincipal.tblvendasprazo.value=10 then    // A Vista 15%
                    begin
                      radiogroup2.enabled:=true;
                      radiogroup2.itemindex:=0;
                      groupBox1.enabled:=true;
                      label4.enabled:=true;
                      RadioGroup1.ItemIndex:=8;
                      maskedit1.enabled:=true;
                      dmprincipal.tblcontarec.open;
                      if dmprincipal.tblcontarec.findkey([dmprincipal.tblvendaspedido.asstring]) then
                         maskedit1.text:=datetostr(dmprincipal.tblcontarecvencto.value);
                      dmprincipal.tblcontarec.close;
                    end;

            except
                 On Econverterror do begin
                 messagedlg('Número do pedido inválido',mterror,[mbok],0);
                 radiogroup2.enabled:=false;
                 radiogroup1.enabled:=false;
                 radiogroup2.itemindex:=-1;
                 radiogroup1.itemindex:=-1;
                 groupBox1.enabled:=false;
                 label4.enabled:=false;
                 maskedit1.enabled:=false;
                 maskedit2.enabled:=false;
                 maskedit1.text:='  /  /  ';
                 maskedit2.text:=' ';
                 end;
            end;

   End
   Else
     ShowMessage('SENHA INCORRETA!');

end;

procedure TfrmManVendas.tbtnExcluiPedClick(Sender: TObject);
begin
  Application.CreateForm(TFrmSenhaSupervisor,FrmSenhaSupervisor);
  FrmSenhaSupervisor.ShowModal;
  FrmSenhaSupervisor.Free;

  If SenhaSupertvisor(Senha) Then
     Begin
        Status:='E';
        _prazo:=0;
        if inputquery('Exclusão de Pedidos','Número do Pedido', pedstr) then
           if pedstr <> '' then
              try
                StrToInt(pedStr);

                if not LocalizaPedido(pedstr) then begin
                   messagedlg('Pedido não encontrado',mterror,[mbok],0);
                   dmprincipal.tblvendas.close;
                   radiogroup2.enabled:=false;
                   radiogroup1.enabled:=false;
                   radiogroup2.itemindex:=-1;
                   radiogroup1.itemindex:=-1;
                   groupBox1.enabled:=false;
                   label4.enabled:=false;
                   maskedit1.enabled:=false;
                   maskedit2.enabled:=false;
                   end
                else begin
                   habilitatabelasebotoes(true);
                   radiogroup2.enabled:=true;
                   tbtncancelaped.enabled:= false;
                   dmprincipal.tblvendas.open;
                  // pedstr:=IntToStr(StrToInt(PedStr)-1);
                   dmPrincipal.tblvendas.Locate('pedido',pedstr, [LoPartialkey]);
                   maskedit2.text:=dmprincipal.tblvendas.fieldbyname('Nota').asstring;
                   {Localizar Cliente}
                   With dmPrincipal.QWork Do
                       Begin
                          Close;
                          SQL.Clear;
                          SQL.Add('select nome from clientes where codigo='+dmPrincipal.tblvendasCliente.AsString);
                          Open;
                          Edit2.Text:=dmPrincipal.QWork.FieldByName('NOME').AsString;
                       End;


                   if dmprincipal.tblvendasprazo.value<8 then    // Geral
                      begin
                        radiogroup2.enabled:=true;
                        radiogroup2.itemindex:=0;
                        case dmprincipal.tblvendasprazo.value of
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

                   if dmprincipal.tblvendasprazo.value=8 then    // Colegios
                      begin
                        radiogroup2.enabled:=true;
                        radiogroup2.itemindex:=1;
                        groupBox1.enabled:=true;
                        label4.enabled:=true;
                        maskedit1.enabled:=true;
                        maskedit2.enabled:=true;
                        dmprincipal.tblcontarec.open;
                        if dmprincipal.tblcontarec.findkey([dmprincipal.tblvendaspedido.asstring]) then
                           maskedit1.text:=datetostr(dmprincipal.tblcontarecvencto.value);
                        dmprincipal.tblcontarec.close;

                      end;

                   if dmprincipal.tblvendasprazo.value=9 then    // reposicao
                      begin
                        radiogroup2.enabled:=true;
                        radiogroup2.itemindex:=2;
                      end;

                   if confirma('Confirma exclusão do Pedido ?') = IDYES then
                      begin
                        dmprincipal.tblcontarec.open;
                        if dmprincipal.tblcontarec.locate('PEDIDO',dmprincipal.tblvendaspedido.asstring,[LoPartialkey]) then
                           dmprincipal.tblcontarec.delete;

                        dmprincipal.tblvendas.delete;
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
                   groupBox1.enabled:=false;
                   label4.enabled:=false;
                   maskedit1.enabled:=false;
                   maskedit2.enabled:=false;
                   maskedit1.text:='  /  /  ';
                   maskedit2.text:=' ';
                   end;
              end;
     End;
end;

procedure TfrmManVendas.tbtnconfirmapedClick(Sender: TObject);
begin

 frmprincipal.Pedido:=dmPrincipal.tblvendasPEDIDO.AsString;
// Verificar se a data foi inserida
 If (MaskEdit1.Enabled =True) And (MaskEdit1.Text='  /  /  ') Then
     Begin
        ShowMessage('Favor inserir uma data válida no campo "vencimento"');
        Exit;
     End;

 if ChecarLimiteCred Then
   Begin
      _edicao:=' ';
      If Status='I' Then
        DmPrincipal.tblvendasData.AsDateTime:=(date);
        DmPrincipal.tblvendasDataAlteracao.AsDateTime:=(Date);
        Dmprincipal.tblvendasCliente.AsInteger :=CodCli ;

      if (dmprincipal.tblitens.state in [dsinsert,dsedit]) and
         (dmprincipal.tblitensQUANTITADE.value <> 0) then
          dmprincipal.tblitens.post;

      if (dmprincipal.tblitens.state in [dsinsert,dsedit]) then
          _edicao:='*';

      if (dmprincipal.tblvendasValor.value <> 0) or
         (dmprincipal.tblvendasValor.value = 0) and (radiogroup2.itemindex=2) then begin
         if (dmprincipal.tblvendas.state in [dsinsert, dsedit]) then
            begin
              if dmprincipal.tblvendedores.findkey([dmprincipal.tblvendascodven]) then
                 dmprincipal.tblvendas.fieldbyname('vendedor').asstring:=
                 dmprincipal.tblvendedores.fieldbyname('CODIGO').asstring;
            end;

            if radiogroup2.itemindex=0 then begin    // Geral
               if (radiogroup1.itemindex <> dmprincipal.tblvendasprazo.value) or (_edicao='*') then begin
                  atualiza; // atualiza total do Pedido
                  case radiogroup1.itemindex of
                       ///*****Compras a Vista******************
                       0:_prazo :=0;
                       1:Begin
                          dmprincipal.tblvendasvalor.value:= dmprincipal.tblvendasvalor.value-(dmprincipal.tblvendasvalor.value*0.05);
                          _prazo :=0;
                         End;
                       2:Begin
                          dmprincipal.tblvendasvalor.value:=dmprincipal.tblvendasvalor.value-(dmprincipal.tblvendasvalor.value*0.10);
                         _prazo :=0;
                         End;
                       7:Begin
                           dmprincipal.tblvendasvalor.value:=dmprincipal.tblvendasvalor.value-(dmprincipal.tblvendasvalor.value*0.03);
                           _prazo :=0;
                         End;
                       8:Begin
                           dmprincipal.tblvendasvalor.value:= dmprincipal.tblvendasvalor.value-(dmprincipal.tblvendasvalor.value*0.15);
                          _prazo :=0;
                         End;
                      ///************Compras a prazo*******************
                       3: _prazo:=07;
                       4: _prazo:=14;
                       5: _prazo:=21;
                       6: _prazo:=25;

                  end;
               end;
               dmprincipal.tblvendasprazo.value:=radiogroup1.itemindex
            end;

            if radiogroup2.itemindex=1 then       // Colegios
               begin
                 _prazo:=8;
                 dmprincipal.tblvendasprazo.value:=_prazo;
               end;

            if radiogroup2.itemindex=2 then      // Reposicao
               begin
                _prazo:=9;
                dmprincipal.tblvendasprazo.value:=_prazo;
               end;
            If RadioGroup1.ItemIndex=8 Then  // A Vista 15%
                Begin
                  DmPrincipal.tblvendasPrazo.AsInteger:=10;
                  _Prazo:=0;
                End;

            dmprincipal.tblvendas.FieldByName('nota').asstring:=maskedit2.text;
            dmprincipal.tblvendas.Post;
//********************** Gera Contas a Receber**************************************
                    dmprincipal.tblcontarec.open;
                    if (not dmprincipal.tblcontarec.Locate('PEDIDO',dmprincipal.tblvendaspedido.asstring,[LoPartialkey])) and
                       (radiogroup2.itemindex <> 2) then
                       begin
                          dmprincipal.tblcontarec.append;
                        //  dmprincipal.tblcontareccodigo.asstring:=dmprincipal.tblvendasPedido.asstring;
                          dmprincipal.tblcontareccliente.asstring:=IntToStr(CodCli) ;
                          dmprincipal.tblcontarecvalor.value:=dmprincipal.tblvendasvalor.value;
                          dmprincipal.tblcontarecDataPed.Value :=dmprincipal.tblvendasData.VALUE;
                          dmprincipal.tblcontarecPedido.AsInteger:=dmPrincipal.tblvendasPedido.AsInteger;
                          dmprincipal.tblcontarecNOTA.AsString :=dmPrincipal.tblvendasNOTA.AsString;
                          IF _prazo <>0 Then
                             dmprincipal.tblcontarecPAGO.AsString:='N'
                          Else
                             Begin
                                dmprincipal.tblcontarecPAGO.AsString:='S';
                                dmprincipal.tblcontarecvencto.value:=dmprincipal.tblvendasData.VALUE;
                                dmprincipal.tblcontarecPAGTO.value:=dmprincipal.tblvendasData.VALUE;
                             End;
                          if radiogroup2.itemindex=0 then
                            begin   // Geral
                             If RadioGroup1.ItemIndex <>8 Then
                                dmprincipal.tblcontarecvencto.value:=date+_prazo
                             Else
                                dmprincipal.tblcontarecvencto.value:=strtodate(maskedit1.text);

                             //   dmprincipal.tblcontarecpago.asstring:='N'
                             end
                          else

                             if radiogroup2.itemindex=1 then    // Colegios
                               dmprincipal.tblcontarecvencto.value:=strtodate(maskedit1.text);
                       end
                    else
                       begin
                          dmprincipal.tblcontarec.edit;
                          dmprincipal.tblcontareccliente.asstring:=dmprincipal.tblvendascliente.asstring;
                          dmprincipal.tblcontarecvalor.value:=dmprincipal.tblvendasvalor.value;

                          if radiogroup2.itemindex=0 then begin   // Geral
                             If MaskEdit1.Enabled = False Then
                               dmprincipal.tblcontarecvencto.value:=date+_prazo
                             Else
                               dmprincipal.tblcontarecvencto.value:=strtodate(maskedit1.text);
                                 dmprincipal.tblcontarecpago.asstring:='N';
                                 dmprincipal.tblcontarecpagto.clear;


                             end
                          else
                             if radiogroup2.itemindex=1 then  // Colegios
                                dmprincipal.tblcontarecvencto.value:=strtodate(maskedit1.text);

                       end;


                    dmprincipal.tblcontarec.post;
            
//********************** Fim gera Contas a receber************************
            if _imprime = '*' then begin
               if confirma('Deseja Imprimir o Pedido ?') = IDYES then
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
            groupBox1.enabled:=false;
            label4.enabled:=false;
            maskedit1.enabled:=false;
            maskedit2.enabled:=false;
            maskedit1.text:='  /  /  ';
            maskedit2.text:=' ';
            habilitatabelasebotoes(false);
            Edit2.Clear;
            dmPrincipal.tblitens.Close;
            dmPrincipal.tblvendas.Close;


         end
      else
         begin
           messagedlg('Pedido com valor 0.'+ 'Não há nada a confirmar',mterror,
           [mbok],0);
           habilitatabelasebotoes(false);
           radiogroup1.itemindex:=-1;
           maskedit1.text:='  /  /  ';
           maskedit2.text:=' ';
         end;
   //  dmPrincipal.Database1.Commit;
   End
  ELSE
    Showmessage('Atenção!! O Limite de crédito do cliente é menor do que '+
                 'o valor total da compra. Entre com a senha do supervisor, ou'+
                 ' Diminua o valor para poder concluí-la.');

//Converter:=False;
end;
procedure TfrmManVendas.tbtncancelapedClick(Sender: TObject);
begin
  dmprincipal.tblvendasBeforeDelete(dmprincipal.tblitens);
  //if ( dmprincipal.tblvendas.findkey([dmprincipal.tblNumpedpedido.asstring])) then begin
     dmprincipal.tblvendas.edit;
     // atualiza o numero do pedido
     with dmprincipal.tblNumped do begin
          Open;
          Edit;
          dmprincipal.tblNumPedPedido.Value:=dmprincipal.tblNumPedPedido.Value - 1;
          dmprincipal.tblVendasPedido.Value:=dmprincipal.tblNumPedPedido.Value;
          Post;
          Close;
     end;
  //end;
  dmprincipal.tblvendas.cancel;
  If  dmPrincipal.Database1.InTransaction Then
      dmPrincipal.Database1.Rollback;
  habilitatabelasebotoes(false);
  radiogroup2.enabled:=false;
  radiogroup1.enabled:=false;
  radiogroup2.itemindex:=-1;
  radiogroup1.itemindex:=-1;
  groupBox1.enabled:=false;
  label4.enabled:=false;
  maskedit1.enabled:=false;
  maskedit2.enabled:=false;
  maskedit1.text:='  /  /  ';
  maskedit2.text:=' ';
end;

procedure imprimerelacao;
begin
  dmprincipal.tblclientes.open;
  dmprincipal.tblcontarec.open;
  iF frmrelrem=Nil Then
    Application.CreateForm(Tfrmrelrem,frmrelrem);
  frmrelrem.qryvendas.close;
  frmrelrem.qryitens.close;
  frmrelrem.qryvendas.sql.clear;
  frmrelrem.qryvendas.sql.add('Select V.DataAlteracao, v.pedido,v.nota,v.data,v.vendedor,v.cliente,v.prazo,v.valor,cl.*, vd.nome');
  frmrelrem.qryvendas.sql.add('  from  VENDAS V inner join clientes cl  on V.cliente = cl.codigo');
  frmrelrem.qryvendas.sql.add('inner join vendedores vd on vd.codigo=v.vendedor');
  frmrelrem.qryvendas.sql.add('where v.pedido = '+ frmprincipal.Pedido);
  //dmprincipal.tblclientes.indexname:='nomcli';
  if dmprincipal.tblclientes.Locate('CODIGO',dmprincipal.tblvendas.fieldbyname('cliente').asstring,[LoPartialKey]) then
     begin
       frmrelrem.QRLabel23.Caption:=frmprincipal.Fone;
       frmrelrem.qrlabel14.caption:=dmprincipal.tblclientes.fieldbyname('endereco').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('cidade').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('estado').asstring+' Telefone(s) '+
       dmprincipal.tblclientes.fieldbyname('telefone').asstring;
       frmrelrem.qrlabel31.caption:=dmprincipal.tblclientes.fieldbyname('cgc').asstring;
       frmrelrem.QRLabel35.Caption:=dmPrincipal.tblclientes.FieldByName('RgINSC').AsString;
       frmrelrem.qrlabel32.caption:='Código '+dmprincipal.tblclientes.fieldbyname('codigo').asstring;
       FrmRelrem.QRLabel39.Caption:=Dmprincipal.tblclientes.FieldByName('DataCad').AsString;
       frmrelrem.QRMemo1.Lines.Text:= dmPrincipal.tblclientes.FieldByName('ROTEIRO').AsString ;

     end
  else
     frmrelrem.qrlabel14.caption:='CLIENTE NAO CADASTRADO';

  dmprincipal.tblclientes.indexname:='';
  frmrelrem.qryvendas.open;
  frmrelrem.qryitens.open;

  if frmrelrem.qryvendasprazo.value > 2 then
     begin
       if dmprincipal.tblcontarec.Locate('PEDIDO',dmprincipal.tblvendaspedido.asstring,[LoPartialKey]) then
          frmrelrem.qrlabel12.caption:=datetostr(dmprincipal.tblcontarecVencto.Value)
       else
          frmrelrem.qrlabel12.caption:='NAO ENCONTREI O VENCTO';
     end;

  case frmrelrem.qryvendasprazo.value of
       0:frmrelrem.qrlabel12.caption:='A vista';
       1:frmrelrem.qrlabel12.caption:='A vista 05% desconto';
       2:frmrelrem.qrlabel12.caption:='A vista 10% desconto';
       7:frmrelrem.qrlabel12.caption:='A vista 03% desconto';
       10:  begin
               With dmPrincipal.Qwork Do
                  Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT * FROM CONTAREC WHERE PEDIDO='+frmrelrem.qryvendasPEDIDO.AsString);
                    Open;
                  End;
               frmrelrem.qrlabel12.caption:='A vista 15% desconto (Vencimento:'+dmPrincipal.Qwork.FieldByName('Vencto').AsString+')';
            End;
       9:Begin
            frmrelrem.qrlabel12.Font.Color := Clred;
            frmrelrem.qrlabel12.caption:='*** P E D I D O  D E  R E P O S I Ç Ã O ***';
         End;
  end;
  frmrelrem.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelrem.Preview;
  frmrelrem.qrlabel12.Font.Color := clBlack ;
  frmrelrem.qryvendas.close;
  frmrelrem.qryitens.close;
  habilitatabelasebotoes(false);
  frmmanvendas.radiogroup2.enabled:=false;
  frmmanvendas.radiogroup1.enabled:=false;
  frmmanvendas.radiogroup2.itemindex:=-1;
  frmmanvendas.radiogroup1.itemindex:=-1;
  frmmanvendas.groupBox1.enabled:=false;
  frmmanvendas.label4.enabled:=false;
  frmmanvendas.maskedit1.enabled:=false;
  frmmanvendas.maskedit2.enabled:=false;

end;

procedure habilitatabelasebotoes(habilitado:boolean);
begin
 dmprincipal.tblvendas.active:= habilitado;
 dmprincipal.tblitens.active:= habilitado;
 dmPrincipal.tblprodutos.Active:=habilitado;
 dmprincipal.tblclientes.Active := habilitado;
 dmPrincipal.tblvendedores.Active :=habilitado ;
 frmmanvendas.tbtnconfirmaped.enabled:= habilitado;
 frmmanvendas.tbtncancelaped.enabled:= habilitado;
 frmmanvendas.tbtnNovoped.enabled:= not habilitado;
 frmmanvendas.tbtnAlteraped.enabled:= not habilitado;
 frmmanvendas.tbtnExcluiped.enabled:= not habilitado;
 frmManVendas.BitBtn2.Enabled :=  habilitado;
 frmManVendas.BitBtn3.Enabled :=  habilitado;
 frmManVendas.BitBtn4.Enabled := habilitado;
 frmManVendas.Edit2.Clear ;

end;

procedure TfrmManVendas.tbtnimprimepedClick(Sender: TObject);
var
 pedstr : string;
begin
  pedstr :='';
  Application.CreateForm(TFrmConsPed, FrmConsPed);
  FrmConsPed.ShowModal;
  FrmConsPed.Free;
  pedstr:=frmprincipal.Pedido;
     if Trim(pedstr) <> '' then
        try
          StrToInt(PedStr);
          dmprincipal.tblvendas.Open;
          if not dmprincipal.tblvendas.Locate('PEDIDO',pedstr,[loPartialkey]) then begin
             messagedlg('Pedido não encontrado',mterror,[mbok],0);
             dmprincipal.tblvendas.close;
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

             End
        except
          On Econverterror do
          messagedlg('Número do pedido inválido',mterror,[mbok],0);
        end;

end;

procedure atualiza;
var
 Bmk : TBookMark;
 ValTot: Double;
begin
  with dmprincipal.tblitens do begin
       Bmk := GetBookMark;
       DisableControls;
       try
         ValTot := 0.0;
         First;
         while not eof do begin
               valtot := valtot + dmprincipal.tblitensvalunitario.value
               *dmprincipal.tblitensQUANTITADE.value;
               next;
         end;
       finally
         enablecontrols;
       if bmk <> nil then begin
          GotoBookMark(Bmk);
          FreeBookMark(Bmk);
       end;
  end;

  dmprincipal.tblvendasvalor.value:= valtot;

  if dmprincipal.tblvendasvalor.value = 0 then
     begin
       frmmanvendas.radiogroup2.enabled:=false;
       frmmanvendas.radiogroup1.enabled:=false;
       frmmanvendas.groupBox1.enabled:=false;
       frmmanvendas.label4.enabled:=false;
       frmmanvendas.maskedit1.enabled:=false;
       frmmanvendas.maskedit2.enabled:=false;
     end;

  end;
end;

procedure TfrmManVendas.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  case radiogroup2.itemindex of
    0: begin
         radiogroup1.enabled:=true;
         radiogroup1.itemindex:=-1;
         groupBox1.enabled:=false;
         label4.enabled:=false;
         maskedit1.text:='  /  /  ';
         maskedit1.enabled:=false;
       end;

    1: begin
        radiogroup1.enabled:=false;
        radiogroup1.itemindex:=-1;
        groupBox1.enabled:=true;
        label4.enabled:=true;
        maskedit1.enabled:=true;
        maskedit1.text:='  /  /  ';
        maskedit1.setfocus;
       end;

     2: begin
         radiogroup1.enabled:=false;
         radiogroup1.itemindex:=-1;
         groupBox1.enabled:=false;
         label4.enabled:=false;
         maskedit1.enabled:=false;
         maskedit1.text:='  /  /  ';
        end;

  end;

end;

procedure TfrmManVendas.FormShow(Sender: TObject);
Var i:Integer;
begin
  inherited;

 // RadioGroup1.Enabled:=True;
  If Converter=True Then
    Begin
       tbtnNovoped.Click;

       DBLookupComboBox1.KeyValue:=frmprincipal.CodVen;
       RadioGroup2.ItemIndex:=frmprincipal.Tipo;
       RadioGroup2Click(Sender);
       RadioGroup1.ItemIndex:=frmprincipal.Prazo ;
       dmPrincipal.tblvendasVendedor.ASInteger:=frmprincipal.CodVen ;
       Dmprincipal.tblvendasCodven.AsInteger:=frmprincipal.CodVen ;
       With dmPrincipal.QWork Do
          begin
            Close;
            Sql.Clear;
            Sql.add('SELECT CODIGO, NOME FROM CLIENTES WHERE CODIGO='+Frmprincipal.Cliente);
            Open;

          End;
     Edit2.text:=dmPrincipal.QWork.FieldbyName('NOME').AsString;
     CodCli:=StrToInt(Frmprincipal.Cliente);
    With dmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ITENS_ORCA WHERE PEDIDO='+ IntTostr(frmprincipal.CodItens));
      open;
      First;
      While Not Eof Do
        Begin
              dmPrincipal.tblitens.Append;
              dmPrincipal.tblitensDESCRICAO.AsString:= dmPrincipal.QWork.FieldByName('DESCRICAO').AsString;
              dmPrincipal.tblitensProduto.AsInteger:= dmPrincipal.QWork.FieldByName('Produto').AsInteger;
              DmPrincipal.tblitensQUANTITADE.AsInteger:=dmPrincipal.QWork.FieldByName('QUANTIDADE').AsInteger;
              dmPrincipal.tblitensVALUNITARIO.AsCurrency:= dmPrincipal.QWork.FieldByName('VALUNITARIO').AsCurrency ;
              dmPrincipal.tblitensVALTOTAL.AsCurrency :=dmPrincipal.tblitensVALUNITARIO.AsCurrency*DmPrincipal.tblitensQUANTITADE.AsInteger;
              DmPrincipal.QWork.Next;


        End;
    End;
    Atualiza;
  End;
end;

procedure TfrmManVendas.RadioGroup1Click(Sender: TObject);
begin
  inherited;
    If RadioGroup1.ItemIndex=8 Then
       Begin
         GroupBox1.Enabled :=True;
         Label4.Enabled :=True;
         MaskEdit1.Enabled :=True;
       End
    Else
      Begin
         GroupBox1.Enabled :=False;
         Label4.Enabled :=False;
         MaskEdit1.Enabled :=False;
      End;
end;

function TfrmManVendas.ChecarLimiteCred: Boolean;
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
          ShowMessage               ('Atenção! O Limite de crédito do cliente é: R$ '+DmPrincipal.QWork.FieldByName('Limite').AsString+
                                     ' Menor do que o valor total do pedido. Entre com a senha do supervisor, ou'+
                                     ' diminua o valor para poder concluí-la. ' );
          Application.CreateForm(TFrmSenhaSupervisor,FrmSenhaSupervisor);
          FrmSenhaSupervisor.ShowModal;
          FrmSenhaSupervisor.Free;

          If SenhaSupertvisor(Senha) Then
                 Result:=True
                Else
                 Result:=False;

      End
   Else
       If (DmPrincipal.QWork.FieldByName('Limite').AsCurrency < dbedit4.Field.AsCurrency) And (frmprincipal.GblPermicao = 'S')  Then
                Begin
                   if confirma('Atenção! O Limite de crédito do cliente é menor do que '+
                                 'o valor total do pedido. Deseja continuar ?') = IDYES then
                            Result:=True
                   Else
                           Result:=False;
                End;

End;

procedure TfrmManVendas.btnfechaClick(Sender: TObject);
begin
  Close;              
end;

procedure TfrmManVendas.Button2Click(Sender: TObject);
begin
  dmPrincipal.tblitens.Insert;
end;

procedure TfrmManVendas.BitBtn4Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TFrmConsCliVend,FrmConsCliVend);
    FrmConsCliVend.OnCloseQuery:=FrmConsCliVend.FormCloseQuery;
    FrmConsCliVend.DBGrid1.OnDblClick :=FrmConsCliVend.DBGrid1DblClick;
    FrmConsCliVend.ShowModal;
    FrmConsCliVend.Free;
    If RadioGroup2.ItemIndex=1 Then
       Begin
         MaskEdit1.Enabled :=True;
         GroupBox1.Enabled :=True;
       End;
end;

procedure TfrmManVendas.BitBtn3Click(Sender: TObject);
begin
   If Not dmprincipal.tblitens.IsEmpty Then

      dmprincipal.tblitens.delete;

   atualiza;
  _edicao:='*';
end;

procedure TfrmManVendas.Button1Click(Sender: TObject);
begin
  dmPrincipal.tblitens.Insert;
end;

procedure TfrmManVendas.BitBtn2Click(Sender: TObject);
begin
  dmPrincipal.tblitens.Insert;
  Application.CreateForm(TFrmConsProdutos,FrmConsProdutos);
  FrmConsProdutos.showmodal;
  FrmConsProdutos.Free;
  dmPrincipal.tblitensPRODUTO.AsInteger:=frmprincipal.produto;
  atualiza;

end;



procedure TfrmManVendas.imprimerelacaomatricial;
begin
 dmprincipal.tblclientes.open;
  dmprincipal.tblcontarec.open;
  iF frmrelrem1=Nil Then
    Application.CreateForm(Tfrmrelrem1,frmrelrem1);
  frmrelrem1.qryvendas.close;
  frmrelrem1.qryitens.close;
  frmrelrem1.qryvendas.sql.clear;
  frmrelrem1.qryvendas.sql.add('Select V.DataAlteracao, v.pedido,v.nota,v.data,v.vendedor,v.cliente,v.prazo,v.valor,cl.*, vd.nome ');
  frmrelrem1.qryvendas.sql.add('from  vendas V inner join clientes cl  on V.cliente = cl.codigo');
  frmrelrem1.qryvendas.sql.add('inner join vendedores vd on vd.codigo=v.vendedor');
  frmrelrem1.qryvendas.sql.add('where v.pedido = '+frmprincipal.Pedido  );
  //dmprincipal.tblclientes.indexname:='nomcli';
  if dmprincipal.tblclientes.Locate('CODIGO',dmprincipal.tblvendas.fieldbyname('cliente').asstring,[LoPartialkey]) then
     begin
       frmrelrem1.QRLabel23.Caption := frmprincipal.Fone;
       frmrelrem1.qrlabel14.caption:=dmprincipal.tblclientes.fieldbyname('endereco').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('cidade').asstring+'  '+
       dmprincipal.tblclientes.fieldbyname('estado').asstring+' Telefone(s) '+
       dmprincipal.tblclientes.fieldbyname('telefone').asstring;
       frmrelrem1.qrlabel31.caption:=dmprincipal.tblclientes.fieldbyname('cgc').asstring;
       frmrelrem1.QRLabel35.Caption:=dmPrincipal.tblclientes.FieldByName('RgINSC').AsString;
       frmrelrem1.qrlabel32.caption:='Código '+dmprincipal.tblclientes.fieldbyname('codigo').asstring;
       FrmRelrem1.QRLabel39.Caption:=Dmprincipal.tblclientes.FieldByName('DataCad').AsString;
       frmrelrem1.QRMemo1.Lines.Text:= dmPrincipal.tblclientes.FieldByName('ROTEIRO').AsString ;
     end
  else
     frmrelrem1.qrlabel14.caption:='CLIENTE NAO CADASTRADO';

  dmprincipal.tblclientes.indexname:='';
  frmrelrem1.qryvendas.open;
  frmrelrem1.qryitens.open;

  if frmrelrem1.qryvendasprazo.value > 2 then
     begin
       if dmprincipal.tblcontarec.Locate('PEDIDO',dmprincipal.tblvendaspedido.asstring,[LoPartialKey]) then
          frmrelrem1.qrlabel12.caption:=datetostr(dmprincipal.tblcontarecVencto.Value)
       else
          frmrelrem1.qrlabel12.caption:='NAO ENCONTREI O VENCTO';
     end;

  case frmrelrem1.qryvendasprazo.value of
       0:frmrelrem1.qrlabel12.caption:='A vista';
       1:frmrelrem1.qrlabel12.caption:='A vista 05% desconto';
       2:frmrelrem1.qrlabel12.caption:='A vista 10% desconto';
       7:frmrelrem1.qrlabel12.caption:='A vista 03% desconto';
       10:  begin
               With dmPrincipal.Qwork Do
                  Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT * FROM CONTAREC WHERE PEDIDO='+frmrelrem1.qryvendasPEDIDO.AsString);
                    Open;
                  End;
               frmrelrem1.qrlabel12.caption:='A vista 15% desconto (Vencimento:'+dmPrincipal.Qwork.FieldByName('Vencto').AsString+')';
            End;
       9:Begin
            frmrelrem1.qrlabel12.Font.Color := Clred;
            frmrelrem1.qrlabel12.caption:='*** P E D I D O  D E  R E P O S I Ç Ã O ***';
         End;
  end;

  frmrelrem1.Preview ;
  frmrelrem1.qrlabel12.Font.Color := clBlack ;
  frmrelrem1.qryvendas.close;
  frmrelrem1.qryitens.close;
 // frmrelrem1.Free;
  habilitatabelasebotoes(false);
  frmmanvendas.radiogroup2.enabled:=false;
  frmmanvendas.radiogroup1.enabled:=false;
  frmmanvendas.radiogroup2.itemindex:=-1;
  frmmanvendas.radiogroup1.itemindex:=-1;
  frmmanvendas.groupBox1.enabled:=false;
  frmmanvendas.label4.enabled:=false;
  frmmanvendas.maskedit1.enabled:=false;
  frmmanvendas.maskedit2.enabled:=false;

end;

function TfrmManVendas.SenhaSupertvisor(Senha:String):boolean;
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

function TfrmManVendas.LocalizaPedido(Numero: String): Boolean;
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

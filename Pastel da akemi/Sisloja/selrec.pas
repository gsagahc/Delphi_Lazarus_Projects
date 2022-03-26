unit selrec;

interface                                                   

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, Selpag, DBCtrls, Db, DBTables, Menus;

type
  Tfrmselrec = class(Tfrmselpag)
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    RadioGroup2: TRadioGroup;
    procedure btntelaClick(Sender: TObject);
    procedure btnimprClick(Sender: TObject);
    Function limitarelatorio1:Boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnfechaClick(Sender: TObject);
    procedure meddataateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    Procedure MenuItemClic (Sender:TObject);
    procedure BtClientesClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
   MenuItem:TMenuItem;
    { Private declarations }
  public
   Total:Currency;
   Pedidos:Integer;
   CodCli:String;
   { Public declarations }
  end;

var
  frmselrec: Tfrmselrec;
  _pago : string;
  _v : string;

implementation
{$R *.DFM}

uses relrec, rotinas, relpag, DataMod, relato, ConsCliVend, ConsFornecedor,
  ConsultaProdutos, Principal;

procedure Tfrmselrec.btntelaClick(Sender: TObject);
begin

  If limitarelatorio1=True Then
    Begin

      //Frmrelrec.QRLabel4.Caption := 'Produtos: '+ IntToStr(Produtos );
      Frmrelrec.QRLabel4.Caption:='Pedidos: ';
     // Frmrelrec.QRLabel11.Caption:= 'Total : R$'+ CurrToStr(Total);
      Frmrelrec.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
      frmrelrec.Preview;
         
     
     End;

end;

procedure Tfrmselrec.btnimprClick(Sender: TObject);
begin
  if frmrelrec=Nil Then
     Application.CreateForm(Tfrmrelrec,frmrelrec);
  limitarelatorio1;
  frmrelrec.Print;
  Frmrelrec.Free;
end;


Function Tfrmselrec.limitarelatorio1:Boolean;
var
 STATUS,CODIGO, StrSql, Strcli, Strprodutos,Moeda:String;
 Indice:Integer;
begin
   Total :=0;
   Pedidos:=0;
  _v:=#39;
  case RadioGroup1.ItemIndex Of
     0: Status:=' AND CONTARECPAGO=''N''';
     1: Status:=' AND CONTARECPAGO=''S''';
     2: Status:='';
  End ;
   case RadioGroup2.ItemIndex Of
     0: Moeda:=' AND CONTERECCHEQUE=''N''';
     1: Moeda:=' AND CONTERECCHEQUE=''S''';

  End;
  If RadioButton2.Checked Then  //Localização por Produtos
     Begin

       CODIGO :=IntToStr(frmprincipal.produto  );
         If CODIGO<>'' Then
            Strprodutos :=' AND ITENSPRODUTO='''+CODIGO+''''
         Else
           Begin
             ShowMessage('Favor selecionar a massa');
             Exit
           End;

     End;
  If RadioButton1.Checked Then
     Begin
        If Edit1.Text <>'' Then
          Begin
              With  frmrelrec.Query1 Do // Localizar codigo do cliente selecionado
                 Begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT * FROM CLIENTES WHERE NOME='''+Edit1.Text+'''');
                    Open;
                 End;
             CODIGO :=frmrelrec.Query1.FieldByName('CODIGO').AsString;
             StrCli :=' AND CONTARECCliente='+CODIGO;
          End;
     End;

  StrSql:='SELECT DISTINCT VENDASPEDIDO ,CONTARECVENCTO,CONTARECVALOR,CONTARECPAGO,CONTARECPAGTO,CONTARECPEDIDO,'
         +'CONTARECDATAPED,CLIENTESCODIGO, CLIENTESNOME FROM  CONTAS_RECEBER WHERE CONTARECVENCTO BETWEEN '''+
         FormatDateTime('MM/DD/YYYY',StrTodate(meddatade.Text ))+''''+
         '  AND '''+FormatDateTime('MM/DD/YYYY', StrToDate(meddataate.Text)) +''''  + StrProdutos +  StrCli + STATUS+ Moeda;

  With frmrelrec.Query2 Do    //Executando query com opções selecionadas
      Begin
         Close;
         Sql.Clear;
         Sql.Add(StrSql);
         Open;
     End;
  If frmrelrec.Query2.RecordCount >0 Then
     Result :=True;
end;


procedure Tfrmselrec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =  #13 then
     begin
        key:=#0;
        Perform (CM_DialogKey, VK_TAB, 0);
     end;
end;

procedure Tfrmselrec.btnfechaClick(Sender: TObject);
begin
  {frmrelrec.query1.close;
  meddatade.SetFocus;
  meddatade.text:='  /  /  ';
  meddataate.text:='  /  /  ';
  forn.keyvalue:='';
  dmprincipal.tblclientes.indexfieldnames:='';
  radiogroup1.itemindex:=-1; }
  frmselrec.close;
  Close;

end;

procedure Tfrmselrec.meddataateExit(Sender: TObject);
begin

   if (meddatade.text<> '  /  /  ') and (meddataate.text<> '  /  /  ') then
      begin
        if trunc(strtodate(meddataate.text)) < trunc(strtodate(meddatade.text)) then
           begin
            mensagem('Data Inicial é maior que Data Final');
            meddataate.setfocus;
           end;
      end
   else
      begin
        mensagem('Existe Irregularidade nas Datas Informadas');
        meddatade.setfocus;
      end;



end;

procedure Tfrmselrec.FormShow(Sender: TObject);
begin
  inherited;

If  frmrelrec=nil Then
   Application.CreateForm(Tfrmrelrec,frmrelrec);
end;

procedure Tfrmselrec.RadioButton2Click(Sender: TObject);
begin
  inherited;
  Edit1.Clear;
  BitBtn2.Enabled   :=True;
  BitBtn1.Enabled   :=False;

end;

procedure Tfrmselrec.RadioButton1Click(Sender: TObject);
begin
  inherited;
   Edit3.Clear;
   BitBtn1.Enabled   :=True;
   BitBtn2.Enabled   :=False;
end;

procedure Tfrmselrec.MenuItemClic(Sender:TOBject);
Var Menu:TMenuItem ;
begin
   Menu:=TMenuItem(Sender);
   EDit1.Text:=Menu.Hint;
end;

procedure Tfrmselrec.BtClientesClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsCliVend, FrmConsCliVend);
   FrmConsCliVend.OnCloseQuery:=FrmConsCliVend.FormCloseQuery1;
   FrmConsFornecedor.Hide;
   FrmConsCliVend.DBGrid1.OnDblClick :=FrmConsCliVend.DBGrid1DblClick1;
   FrmConsCliVend.ShowModal;
   FrmConsCliVend.Free;
end;

procedure Tfrmselrec.BitBtn1Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsCliVend, FrmConsCliVend);
   FrmConsCliVend.OnCloseQuery:=FrmConsCliVend.FormCloseQuery1;
   FrmConsCliVend.DBGrid1.OnDblClick :=FrmConsCliVend.DBGrid1DblClick1;
   FrmConsCliVend.ShowModal;
   FrmConsCliVend.Free;

end;

procedure Tfrmselrec.BitBtn2Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsProdutos,FrmConsProdutos);
   FrmConsProdutos.ShowModal;
   FrmConsProdutos.free;
   IF frmPrincipal.Produto<>0 Then
      Begin
          Edit3.Text := Trim(frmprincipal.Descricao );
      end;


end;

end.

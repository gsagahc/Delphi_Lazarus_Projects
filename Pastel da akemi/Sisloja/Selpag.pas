unit Selpag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, StdCtrls, Buttons, ExtCtrls, Relato, Mask, DBCtrls,
  Menus, BASICA;

type
  Tfrmselpag = class(TFrmbasica)
    btntela: TBitBtn;
    btnimpr: TBitBtn;
    Label1: TLabel;
    meddatade: TMaskEdit;
    Label2: TLabel;
    meddataate: TMaskEdit;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    Edit2: TEdit;
    PopupMenu2: TPopupMenu;
    BtClientes: TBitBtn;
    procedure btntelaClick(Sender: TObject);
    procedure btnimprClick(Sender: TObject);
    procedure limitarelatorio;
    procedure btnfechaClick(Sender: TObject);
    procedure meddataateExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure MenuItemClic(Sender:TOBject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtClientesClick(Sender: TObject);
  private
   MenuItem:TMenuItem;
   { Private declarations }
  public
    { Public declarations }
  end;

var
  frmselpag: Tfrmselpag;
  _dat1,_dat2 : tdatetime;

implementation

uses relpag, rotinas, DataMod, selrec, ConsFornecedor;

{$R *.DFM}

procedure Tfrmselpag.btntelaClick(Sender: TObject);
begin
  iF Frmrelpag =Nil Then
   Application.CreateForm(TFrmrelpag,FrmRelPag);
   limitarelatorio;
  Frmrelpag.QRImage1.Picture.LoadFromFile('LogoSmall.bmp');
  frmrelpag.preview;
end;

procedure Tfrmselpag.btnimprClick(Sender: TObject);
begin
  limitarelatorio;
  frmrelpag.print;
end;

procedure Tfrmselpag.limitarelatorio;
var
 strliga,_v,_pago : string;
 data   : tdatetime;
begin
  _v:=#39;
  strliga :=' where ';
  frmrelpag.query1.close;
  frmrelpag.query1.sql.clear;
  frmrelpag.query1.sql.add('select * from contapag');

  if frmselpag.meddatade.text <> '  /  /  ' then
     try
       data := strtodate(frmselpag.meddatade.text);
       frmrelpag.query1.sql.add(strliga+'vencto >='''+
       formatdatetime('mm/dd/yyyy',data)+'''');
       strliga := 'and ';
     except
       on econverterror do begin
       mensagem('Data Inicial Inválida');
       meddatade.setfocus;
       end;

     end;

  if frmselpag.meddataate.text <> '  /  /  ' then
     try
       data := strtodate(frmselpag.meddataate.text);
       frmrelpag.query1.sql.add(strliga+'vencto <= '''+
       formatdatetime('mm/dd/yyyy', data)+'''');
       strliga := 'and ';
     except
       on econverterror do begin
       mensagem('Data Final Inválida');
       meddataate.setfocus;
       end;

     end;

   if Edit2.text <> '' then begin
      frmrelpag.query1.Sql.Add(strliga+'fornecedor='''+Edit2.text+'''' );
      strliga := 'and ';
   end;

   if frmselpag.radiogroup1.itemindex=0 then
      begin
        _pago:='N';
        frmrelpag.query1.Sql.Add(strliga+'pago='+_v+_pago+_v)
      end
   else
      begin
        _pago:='S';
        frmrelpag.query1.Sql.Add(strliga+'pago='+_v+_pago+_v);
      end;
   frmrelpag.query1.Sql.Add(' ORDER BY VENCTO');
   frmrelpag.Query1.open;
   meddatade.text:='  /  /  ';
   meddataate.text:='  /  /  ';
   Edit2.Text:='';
   radiogroup1.itemindex:=-1;
   meddatade.setfocus;

end;


procedure Tfrmselpag.btnfechaClick(Sender: TObject);
begin

//  frmrelpag.query1.close;
  meddatade.text:='  /  /  ';
  meddataate.text:='  /  /  ';
  meddatade.setfocus;
  Edit2.text:='';
  dmprincipal.tblfornecedores.indexfieldnames:='';
  radiogroup1.itemindex:=-1;
  frmselpag.close;

end;

procedure Tfrmselpag.meddataateExit(Sender: TObject);
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

   dmprincipal.tblfornecedores.indexfieldnames:='nome';

end;

procedure Tfrmselpag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =  #13 then
     begin
        key:=#0;
        Perform (CM_DialogKey, VK_TAB, 0);
     end;

end;


procedure Tfrmselpag.FormShow(Sender: TObject);
begin
  inherited;
   DmPrincipal.tblfornecedores.Open;
   Dmprincipal.QWork.RequestLive:=False;
end;

procedure Tfrmselpag.Edit2Change(Sender: TObject);
begin
  inherited;
    inherited;
    If Length(Edit2.text)=1 Then
    Begin
      PopupMenu2.Items.Clear;
      With DmPrincipal.QWork Do
        Begin
          Close;
          
          Sql.Clear;
          Sql.Add('SELECT * FROM FORNECEDORES WHERE NOME LIKE '''+Edit2.Text +'%''');
          Open;
          Dmprincipal.QWork.First;
          While Not DmPrincipal.QWork.Eof Do
            Begin
              menuItem:= TMenuItem.Create(frmselPag);
              MenuItem.Visible:=True;
              MenuItem.Hint := DmPrincipal.QWork.FieldByName('Nome').AsString;
              MenuItem.Caption :=DmPrincipal.QWork.FieldByName('Nome').AsString;
              MenuItem.OnClick    := MenuItemClic;
              PopupMenu2.Items.Insert(DmPrincipal.QWork.RecNo-1,menuItem );
              DmPrincipal.QWork.Next;
            End;
        End;
        PopupMenu2.Popup(FrmSelPag.Left+Edit2.Left,FrmSelPag.Top+ Edit2.Top+(2*Edit2.Height));
    End;
end;
procedure Tfrmselpag.MenuItemClic(Sender:TOBject);
Var Menu:TMenuItem ;
begin
   Menu:=TMenuItem(Sender);
   EDit2.Text:=Menu.Hint;
end;

procedure Tfrmselpag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
      Dmprincipal.QWork.RequestLive:=True;
end;

procedure Tfrmselpag.BtClientesClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Showmodal;
  Edit2.Text:=FrmConsFornecedor.Query1.FieldByName('NOME').AsString ;
  FrmConsFornecedor.Free;
end;

end.




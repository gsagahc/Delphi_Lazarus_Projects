unit ufrmmovpro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, BASICA, StdCtrls, Buttons, ExtCtrls, Relato, Mask, DBCtrls;

type
  Tfrmmovpro = class(TFrmbasica)
    btntela: TBitBtn;
    btnimpr: TBitBtn;
    Label1: TLabel;
    meddatade: TMaskEdit;
    Label2: TLabel;
    meddataate: TMaskEdit;
    Label3: TLabel;
    cliente: TDBLookupComboBox;
    Label4: TLabel;
    prod: TDBLookupComboBox;
    procedure btntelaClick(Sender: TObject);
    procedure btnimprClick(Sender: TObject);
    procedure limitarelatorio;
    procedure btnfechaClick(Sender: TObject);
    procedure meddataateExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmovpro: Tfrmmovpro;
  _dat1,_dat2 : tdatetime;

implementation

uses rotinas, DataMod, relpag, Selpag;

{$R *.DFM}

procedure Tfrmmovpro.btntelaClick(Sender: TObject);
begin
  limitarelatorio;
  frmrelpag.preview;
end;

procedure Tfrmmovpro.btnimprClick(Sender: TObject);
begin
  limitarelatorio;
  frmrelpag.print;
end;

procedure Tfrmmovpro.limitarelatorio;
var
 strliga,_v,_pago : string;
 data   : tdatetime;
begin
{  _v:=#39;
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

   if forn.keyvalue <> null then begin
      frmrelpag.query1.Sql.Add(strliga+'fornecedor='+_v+forn.keyvalue+_v);
      strliga := 'and ';
   end;

   if frmselpag.radiogroup1.itemindex=0 then
      begin
        _pago:='NAO';
        frmrelpag.query1.Sql.Add(strliga+'pago='+_v+_pago+_v)
      end
   else
      begin
        _pago:='SIM';
        frmrelpag.query1.Sql.Add(strliga+'pago='+_v+_pago+_v);
      end;

   frmrelpag.Query1.open;
   meddatade.text:='  /  /  ';
   meddataate.text:='  /  /  ';
   forn.keyvalue:=null;
   radiogroup1.itemindex:=-1;
   meddatade.setfocus;          }

end;


procedure Tfrmmovpro.btnfechaClick(Sender: TObject);
begin
{  frmrelpag.query1.close;
  meddatade.text:='  /  /  ';
  meddataate.text:='  /  /  ';
  meddatade.setfocus;
  forn.keyvalue:=null;
  dmprincipal.tblfornecedores.indexfieldnames:='';
  radiogroup1.itemindex:=-1;
  frmselpag.close;   }

end;

procedure Tfrmmovpro.meddataateExit(Sender: TObject);
begin
{
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

   dmprincipal.tblfornecedores.indexfieldnames:='nome'; }

end;

procedure Tfrmmovpro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =  #13 then
     begin
        key:=#0;
        Perform (CM_DialogKey, VK_TAB, 0);
     end;

end;


end.




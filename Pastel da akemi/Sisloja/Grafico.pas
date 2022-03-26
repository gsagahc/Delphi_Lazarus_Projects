unit Grafico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BASICA, TeeProcs, TeEngine, Chart, DBChart, StdCtrls, Buttons, ExtCtrls,
  Mask, Db, DBTables, Series;

type
  Tfrmgrafevol = class(TFrmbasica)
    DBChart1: TDBChart;
    meddatade: TMaskEdit;
    Label1: TLabel;
    bbtncalcula: TBitBtn;
    bbtnimprime: TBitBtn;
    qryvendas: TQuery;
    Label2: TLabel;
    meddataate: TMaskEdit;
    Series1: THorizBarSeries;
    qryvendasVENDEDOR: TIntegerField;
    qryvendasTOTVENDA: TFloatField;
    procedure bbtncalculaClick(Sender: TObject);
    procedure bbtnimprimeClick(Sender: TObject);
    procedure meddataateExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgrafevol: Tfrmgrafevol;

implementation

uses Rotinas;

{$R *.DFM}

procedure Tfrmgrafevol.bbtncalculaClick(Sender: TObject);
begin
  inherited;
  if (meddatade.text<> '  /  /  ') and (meddataate.text<> '  /  /  ') then
      with qryvendas do begin
           close;
           try
             ParamByName('dat1').Asdatetime := strtodate(meddatade.text);
           except
             on EconvertError do begin
                messagedlg('Data de Início Inválida !!!',mterror,[mbok],0);
                meddatade.setfocus;
                exit;
           end;
      end;

      try
        ParamByName('dat2').Asdatetime := strtodate(meddataate.text);
      except
        on EconvertError do begin
           messagedlg('Data Final Inválida !!!',mterror,[mbok],0);
           meddataate.setfocus;
           exit;
      end;
     end;
     open;
     meddatade.SetFocus;
   end
 else
    begin
      mensagem('Informe o período para visualizar o gráfico !!!');
      meddatade.setfocus;
    end;
end;

procedure Tfrmgrafevol.bbtnimprimeClick(Sender: TObject);
begin
  inherited;
  if (meddatade.text<> '  /  /  ') and (meddataate.text<> '  /  /  ') then
     begin
       if not PrinterOnLine then begin // Verifica Impressora
          mensagem('Impressora não está respondendo !!!');
          meddatade.SetFocus;
          end
       else
          dbchart1.PrintLandscape;
     end
  else
     begin
       mensagem('Informe o período para imprimir o Gráfico !!!');
       meddatade.setfocus;
     end;

end;

procedure Tfrmgrafevol.meddataateExit(Sender: TObject);
begin
  inherited;

   if (meddatade.text<> '  /  /  ') and (meddataate.text<> '  /  /  ') then
      begin
        if trunc(strtodate(meddataate.text)) < trunc(strtodate(meddatade.text)) then
           begin
            mensagem('Data Inicial é maior que Data Final !!!');
            meddataate.setfocus;
           end;
      end
   else
      begin
        mensagem('Existe Irregularidade nas Datas Informadas !!!');
        meddatade.setfocus;
      end;
end;

procedure Tfrmgrafevol.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key =  #13 then
     begin
        key:=#0;
        Perform (CM_DialogKey, VK_TAB, 0);
     end;

end;

procedure Tfrmgrafevol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryvendas.close;
  meddatade.text:='  /  /  ';
  meddataate.text:='  /  /  ';
end;

end.

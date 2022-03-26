unit Gerrec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gerpag, Grids, DBGrids, Buttons, ExtCtrls, DB, DBTables;

type
  Tfrmgerrec = class(Tfrmgerpag)
    QWork: TQuery;
    DataSource1: TDataSource;
    QWorkCODIGO: TIntegerField;
    QWorkVENCIMENTO: TDateTimeField;
    QWorkVALOR: TFloatField;
    QWorkDATA: TDateTimeField;
    QWorkPAGO: TStringField;
    QWorkPAGAMENTO: TDateTimeField;
    QWorkCLIENTE: TStringField;
    DBGrid2: TDBGrid;
    SpeedButton5: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnanteriorClick(Sender: TObject);
    procedure btnproximoClick(Sender: TObject);
    procedure btnultimoClick(Sender: TObject);
    procedure btnlocalizarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnretornarClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgerrec: Tfrmgerrec;

implementation

uses DataMod,rotinas,locadoc1, ConContaRec, Baixa_titulos, ConContaPag;

{$R *.DFM}

procedure Tfrmgerrec.FormShow(Sender: TObject);
begin
  // QWork.Open;
  
End;

procedure Tfrmgerrec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmprincipal.tblcontarec.close;
end;

procedure Tfrmgerrec.btnPrimeiroClick(Sender: TObject);
begin
   Qwork.first;
end;

procedure Tfrmgerrec.btnanteriorClick(Sender: TObject);
begin
   dmprincipal.tblcontarec.prior;
   if (dmprincipal.tblcontarec.bof) then
      begin
        iniciotabela;
        dmprincipal.tblcontarec.first;
      end;
end;

procedure Tfrmgerrec.btnproximoClick(Sender: TObject);
begin
   dmprincipal.tblcontarec.next;
   if (dmprincipal.tblcontarec.eof) then
      begin
        fimtabela;
        dmprincipal.tblcontarec.last;
      end;
end;

procedure Tfrmgerrec.btnultimoClick(Sender: TObject);
begin
  QWork.last;
end;

procedure Tfrmgerrec.btnlocalizarClick(Sender: TObject);
begin
 Application.CreateForm(TFrmLocaliza1,FrmLocaliza1);
 frmlocaliza1.showmodal;
 FrmLocaliza1.Free;
end;

procedure Tfrmgerrec.btnexcluirClick(Sender: TObject);
begin

  QWork.Edit; 
end;

procedure Tfrmgerrec.btnretornarClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmgerrec.DBGrid1ColExit(Sender: TObject);
begin
  {inherited;
   if (dbgrid1.selectedfield = dmprincipal.tblcontarecpago) then
      begin
        if (dmprincipal.tblcontarec.state in [dsinsert,dsedit]) then
           begin
             if dmprincipal.tblcontarecpago.asstring='NAO' then
                begin
                 dmprincipal.tblcontarecpagto.clear;
                 dmprincipal.tblcontarec.Post;
                end;
          end;
      end; }

end;

procedure Tfrmgerrec.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   dmPrincipal.tblcontarec.Cancel;
//   dmPrincipal.Database1.Rollback;
end;

procedure Tfrmgerrec.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmPrincipal.tblcontarec.Post;
 // dmPrincipal.Database1.Commit;
end;

procedure Tfrmgerrec.SpeedButton4Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsContaRec,FrmConsContaRec);
   FrmConsContaRec.ShowModal;
   FrmConsContaRec.Free;

end;

procedure Tfrmgerrec.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  dmPrincipal.tblcontarec.Open;
  dmPrincipal.tblcontarec.FindKey ([QWorkCODIGO.AsInteger]);
  dmPrincipal.tblcontarec.Edit;
  Application.CreateForm(TFrmBaixaTitulos, FrmBaixaTitulos);
  FrmBaixaTitulos.Codigo := QWorkCODIGO.AsInteger;
  FrmBaixaTitulos.ShowModal;
  FrmBaixaTitulos.free;
end;

end.

unit SelRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, BASICA, StdCtrls, Buttons, ExtCtrls, Relato;

type
  Tfrmselrel = class(TFrmbasica)
    btntela: TBitBtn;
    btnimpr: TBitBtn;
    procedure btntelaClick(Sender: TObject);
    procedure btnimprClick(Sender: TObject);
  private
    { Private declarations }
  protected
    FQuickrep : Tquickrep;
    Frelato   : Tfrmrelato;
  public
    { Public declarations }
  end;

var
  frmselrel: Tfrmselrel;

implementation

uses Selpro;

{$R *.DFM}

procedure Tfrmselrel.btntelaClick(Sender: TObject);
begin
  inherited;
  frmselpro.LimitaRelatorio;
  FquickRep.Preview;
end;

procedure Tfrmselrel.btnimprClick(Sender: TObject);
begin
  inherited;
//  Limitarelatorio;
  FQuickRep.Print;
end;

end.

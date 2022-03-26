unit locadoc1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  locadoc, StdCtrls, Buttons, Mask, DBGrids, DB, DBTables;

type
  Tfrmlocaliza1 = class(Tfrmlocaliza)
    procedure btnokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlocaliza1: Tfrmlocaliza1;

implementation

uses datamod,rotinas, Gerrec;

{$R *.DFM}

procedure Tfrmlocaliza1.btnokClick(Sender: TObject);
begin
   if (not frmgerrec.QWork.Locate('CODIGO',Trim(msklocaliza.Text),[LoPartialkey])) then
      begin
         mensagem('Registro não encontrado !');
         dmprincipal.tblcontarec.first;
      end;
end;

procedure Tfrmlocaliza1.FormShow(Sender: TObject);
begin
   msklocaliza.text:= '';
   msklocaliza.setfocus;
end;

end.

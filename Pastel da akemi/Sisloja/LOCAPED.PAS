unit locaped;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  locadoc1, StdCtrls, Buttons, Mask;

type
  Tfrmlocaped = class(Tfrmlocaliza1)
    procedure FormShow(Sender: TObject);
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlocaped: Tfrmlocaped;

implementation

uses DataMod, rotinas, manvendas;

{$R *.DFM}

procedure Tfrmlocaped.FormShow(Sender: TObject);
begin
   msklocaliza.text:= '';
   msklocaliza.setfocus;
   dmprincipal.tblvendas.open;
end;

procedure Tfrmlocaped.btnokClick(Sender: TObject);
begin
   if (not dmprincipal.tblvendas.findkey([msklocaliza.text])) then
      mensagem('Pedido não encontrado !')
   else
      imprimerelacao;

end;

end.

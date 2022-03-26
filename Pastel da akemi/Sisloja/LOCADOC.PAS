unit locadoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  Tfrmlocaliza = class(TForm)
    lblmensagem: TLabel;
    btnok: TBitBtn;
    btncancela: TBitBtn;
    msklocaliza: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlocaliza: Tfrmlocaliza;

implementation

uses dataMod, rotinas;

{$R *.DFM}

procedure Tfrmlocaliza.FormShow(Sender: TObject);
begin
   msklocaliza.text:= '';
   msklocaliza.setfocus;
end;

procedure Tfrmlocaliza.btnokClick(Sender: TObject);
begin
   if (not dmprincipal.tblcontapag.findkey([StrToInt(TRim(msklocaliza.text))])) then
      begin
         mensagem('Registro não encontrado !');
         dmprincipal.tblcontapag.first;
      end;
end;

end.

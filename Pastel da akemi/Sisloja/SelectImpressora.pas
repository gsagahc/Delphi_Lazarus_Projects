unit SelectImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, pngimage;

type
  TFrmSelecionaPrint = class(TForm)
    RadioGroup1: TRadioGroup;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionaPrint: TFrmSelecionaPrint;

implementation

uses ManVendas, Principal;

{$R *.dfm}

procedure TFrmSelecionaPrint.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
     Begin
      If RadioGroup1.ItemIndex = 0 Then
         frmprincipal.impressora :=0
      Else
         frmprincipal.impressora :=1;
      Close;
    End;  
end;

end.

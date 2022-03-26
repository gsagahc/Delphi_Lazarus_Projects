unit SenhaSupervisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls;

type
  TFrmSenhaSupervisor = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenhaSupervisor: TFrmSenhaSupervisor;

implementation

uses ManVendas;

{$R *.dfm}

procedure TFrmSenhaSupervisor.FormCreate(Sender: TObject);
begin
      FrmManvendas.Senha:='';
end;

procedure TFrmSenhaSupervisor.BitBtn1Click(Sender: TObject);
begin
   FrmManvendas.Senha:=Trim(Edit1.Text);
   Close;
end;

end.

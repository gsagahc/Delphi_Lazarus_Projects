unit Sobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TFormSobre = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label17: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    copyright: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.DFM}

procedure TFormSobre.BitBtn1Click(Sender: TObject);
begin
Close;
end;

end.

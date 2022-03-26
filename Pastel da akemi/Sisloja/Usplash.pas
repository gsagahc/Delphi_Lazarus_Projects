unit Usplash;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Gauges, jpeg, pngimage;

type
  TSplash = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Image2: TImage;
    Label6: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation




{$R *.DFM}

procedure TSplash.FormActivate(Sender: TObject);
  var Edit:Tedit;
begin
    Edit:= TEdit.Create(Splash);
    Edit.Text:='SISLOJA';

end;

end.
 

unit UAbout;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QExtCtrls, QButtons, QStdCtrls;

type
  TFrmAboutBox = class(TForm)
    AboutPanel: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    pbn: TShape;
    Label1: TLabel;
    Label2: TLabel;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAboutBox: TFrmAboutBox;

implementation

{$R *.xfm}

procedure TFrmAboutBox.OKButtonClick(Sender: TObject);
begin
  Close;
end;

end.

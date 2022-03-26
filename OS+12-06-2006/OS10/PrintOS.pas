unit PrintOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_E_RTF, FR_Class, FR_DSet, FR_DBSet, ExtCtrls, FR_View,
  FR_Ctrls, FR_Dock, Buttons, FR_E_HTM, FR_E_TXT, WinSkinData;

type
  TFprintOS = class(TForm)
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frPreview1: TfrPreview;
    frTBPanel1: TfrTBPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    frRTFExport1: TfrRTFExport;
    frTextExport1: TfrTextExport;
    SpeedButton4: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Cod_cli: String;
    { Public declarations }
  end;

var
  FprintOS: TFprintOS;

implementation

uses Principal, CadOS;


{$R *.dfm}

procedure TFprintOS.FormShow(Sender: TObject);
begin
  FprintOS.frReport1.LoadFromFile('C:\OS10\Rel\PrintOS.frf');  
  frReport1.Preview:=frPreview1;
  frReport1.ShowReport; 
end;

procedure TFprintOS.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFprintOS.SpeedButton3Click(Sender: TObject);
begin
  frPreview1.Print;
end;

procedure TFprintOS.SpeedButton2Click(Sender: TObject);
begin
    frReport1.PrepareReport;
    frReport1.ExportTo  (TfrTextExportFilter , 'C:\OS10\OS\OS'+IntToStr(FOS.Os) +'.txt');
end;

procedure TFprintOS.SpeedButton4Click(Sender: TObject);
begin
    frReport1.PrepareReport;
    frReport1.ExportTo  (TfrRTFExportFilter , 'C:\OS10\OS\OS'+IntToStr(FOS.Os) +'.rtf');
end;

end.

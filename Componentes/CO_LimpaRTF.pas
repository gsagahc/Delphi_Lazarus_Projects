unit CO_LimpaRTF;
{------------------------------------------------------------
Componente para limpar codificação RTF de texto string
Exemplo:\rtf1\ansi\ansicpg1252\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;
Criado por :Guilherme Chagas para a AGFA  HealthCare
Modo de usar: String:=Componente.ExcluirCod(String, Parente (Pode ser o Form)) ; (Ou WideString)  só isso!

--------------------------------------------------------------}

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TLimpaRTF = class(TComponent)
  private
  Visible : Boolean;
    { Private declarations }
  protected
    { Protected declarations }
  public
   constructor Create(AOwner: TComponent);override;
   Function ExcluirCod(RTF:WideString; Parente: TwinControl):WideString;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sagahc', [TLimpaRTF]);
end;

{ TComponent1 }

constructor TLimpaRTF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
       Visible:=False;

end;

function TLimpaRTF.ExcluirCod(RTF: WideString; Parente: TWinControl): WideString;
var strStream: TStringStream;
    RtfTemp:TRichEdit;
begin
    RtfTemp:=TRichEdit.Create(Self);
     with RtfTemp  do
      begin
              Name:= 'richedit';
              Parent:=Parente;
              Align:=alClient;
              Visible:=False;
      end;
   strStream := TStringStream.Create(RTF);
   RtfTemp.Lines.LoadFromStream(strStream);
   Result:= RtfTemp.Lines.Text;
   strStream.Free;
   RtfTemp.Free;
end;

end.

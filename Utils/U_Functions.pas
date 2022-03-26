unit U_Functions;
{Unit de Funções criada por Guilherme Chagas

}
interface
uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls, Forms;

 function  removerRTFdeTexto(TextoInicial:WideString; Parente:TWinControl):WideString;


implementation
{------------------------------------------------------------
Função para limpar codificação RTF de texto string
Exemplo:\rtf1\ansi\ansicpg1252\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;
Criado por :Guilherme Chagas para a AGFA  HealthCare
Modo de usar: String:=removerRTFdeTexto(String, Parente (Pode ser o Form)) ; (Ou WideString)  só isso!

--------------------------------------------------------------}

function  removerRTFdeTexto(TextoInicial:WideString; Parente:TWinControl):WideString;
 var strStream: TStringStream;
Var RtfTemp: TRichEdit;
begin

   strStream := TStringStream.Create( TextoInicial );
   RtfTemp:=TRichEdit.Create(Application);
     with RtfTemp  do
      begin
              Name:= 'richedit';
              Parent:=Parente;
              Align:=alClient;
              Visible:=False;
      end;



   RtfTemp.Lines.LoadFromStream(strStream);
   Result:= RtfTemp.Lines.Text;
   strStream.Free;
   RtfTemp.Free;
end;
end.

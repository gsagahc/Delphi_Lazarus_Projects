unit CPF_Edit;
{Componente Edit para aceitar apenas n�meros e realizar valida��o de CPF
----------------Guilherme Chagas----------------------------------------}
interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Dialogs;

type
  TCPFEdit = class(TEdit)
  private
  EditHint : String;
  procedure CMExit(var Message: TCMExit); message CM_EXIT;
    { Private declarations }
  protected
  procedure KeyPress(var Key : Char);override;

  function  validaCPF(CPF:String):Boolean;
    { Protected declarations }
  public
  constructor Create(AOwner: TComponent);override;
    { Public declarations }
  published
  //property EditHint : String read FEditHint write FEditHint;

    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sagahc', [TCPFEdit]);
end;

{ TNumEdit }



constructor TCPFEdit.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
     EditHint:='Favor digitar apenas CPF v�lido';
     Text := '0';
end;



procedure TCPFEdit.KeyPress(var Key: Char);
begin
  // Restringir Apenas n�meros no edit
   if (not (key in ['0'..'9','-','+',#8]))or((key in ['+','-']) and (Pos(key,Text)>0)) then key := #0;

inherited KeyPress(Key);

end;

function TCPFEdit.validaCPF(CPF: String): Boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              validaCPF := false;
              exit;
            end;

// try - protege o c�digo para eventuais erros de convers�o de tipo na fun��o StrToInt
  try
{ *-- C�lculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-�simo caractere do CPF em um n�mero
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um n�mero no respectivo caractere num�rico

{ *-- C�lculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then validaCPF := true
    else validaCPF := false;
  except
    validaCPF := false
  end;

end;

procedure TCPFEdit.CMExit(var Message: TCMExit);
begin
  if Not validaCPF(Text) then
     ShowMessage('Favor digitar um CPF v�lido');

 inherited DoExit;
end;

end.

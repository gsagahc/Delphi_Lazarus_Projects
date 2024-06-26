unit Rotinas;

interface

uses Forms, Windows, SysUtils, BDE;

// Declara��o dos procedimentos
procedure InicioTabela;
procedure FimTabela;
procedure Mensagem(strtexto: string);
procedure Reindexa;

// Declara��o das fun��es
function Excluir: integer;
function Confirma(strtexto: string): integer;
function Mostradata(dtData: TdateTime): string;
function PrinterOnLine : Boolean;

implementation

// Rotina para apresentar uma caixa de mensagem
procedure Mensagem(strtexto: string);
begin
   Application.MessageBox(Pchar(strtexto),'Mensagem',mb_OK+mb_IconInformation);
end;

// Rotina para apresentar mensagem de inicio dos registros.
procedure InicioTabela;
begin
    Mensagem('In�cio do Arquivo');
end;

// Rotina para apresentar mensagem de fim dos registros.
procedure FimTabela;
begin
   Mensagem('Fim do Arquivo');
end;

// Fun��o para pedir confirma��o confirma��o da exclus�o de um registro.
function excluir: integer;
begin
   Result := Application.Messagebox('Deseja excluir esse registro?','Exclus�o',
   mb_YesNo+mb_DefButton1+mb_IconQuestion);
end;

// Fun��o para pedir confirma��o de uma opera��o.
function Confirma(strtexto: string): integer;
begin
   Result:= Application.Messagebox(Pchar(strtexto),'Confirma��o',mb_YesNo+
   mb_DefButton1+mb_IconQuestion);
end;

// Fun��o para apresenta��o de uma data no formato
// 'Dia da semana - dia/m�s/Ano'.
function Mostradata(dtData: TDateTime): string;
var
  intdiasemana : integer;
  strdiasemana : string;
begin
  intdiasemana := DayofWeek(dtData);
  case intdiasemana of
       1: strdiasemana := 'Domingo - ';
       2: strdiasemana := 'Segunda-feira - ';
       3: strdiasemana := 'Ter�a-feira - ';
       4: strdiasemana := 'Quarta-feira - ';
       5: strdiasemana := 'Quinta-feira - ';
       6: strdiasemana := 'Sexta-feira - ';
       7: strdiasemana := 'S�bado - ';
  end;
  Result := strdiasemana+datetostr(dtData);
end;

function PrinterOnLine : boolean;
Const
prnstint: byte = $17;
strq : byte = $02;
prnnum : word = 0; {0 para LPT1, 1 para LPT2,etc.}
var
 nresult : byte;
begin  (*PrinterOnLine*)
 Asm
   mov ah,strq;
   mov dx,prnnum;
   int $17;
   mov nresult,ah;
 end;
 PrinterOnLine:=(nresult and $80) = $80;
end;

procedure reindexa;
begin
end;
end.

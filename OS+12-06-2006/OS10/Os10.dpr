program Os10;

uses
  Forms,
  Principal in 'Principal.pas' {FPrincipal},
  CadClientes in 'CadClientes.pas' {FCliente},
  LocalizaCli in 'LocalizaCli.pas' {FLocCli},
  CadOS in 'CadOS.pas' {FOS},
  LocalizaOS in 'LocalizaOS.pas' {FLocOS},
  PrintOS in 'PrintOS.pas' {FprintOS},
  Sobre in 'Sobre.pas' {FormSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ordem de Serviço 1.0';
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.

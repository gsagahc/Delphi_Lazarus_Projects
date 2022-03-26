program siscob;

uses
  QForms,
  Importacao in 'Importacao.pas' {Frmimportacao},
  Thread_import in 'Thread_import.pas',
  Tela_Principal in 'Tela_Principal.pas' {FrmPrincipal},
  UCad_Cli in 'UCad_Cli.pas' {FrmCadCli},
  UAbout in 'UAbout.pas' {FrmAboutBox},
  Localizacao_cli in 'Localizacao_cli.pas' {FrmLocaCli};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SisCob 2004';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

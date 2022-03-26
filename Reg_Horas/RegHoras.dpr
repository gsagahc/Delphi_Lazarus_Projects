program RegHoras;

uses
  Forms,
  UMain in 'UMain.pas' {FrmPrincipal},
  UJornada in 'UJornada.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

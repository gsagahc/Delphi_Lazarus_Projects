program Cadastro;

uses
  Forms,
  uMain in 'uMain.pas' {FrmMain},
  Unit1 in 'Unit1.pas' {FormCadClientes},
  USobre in 'USobre.pas' {FormSobre},
  USplash in 'USplash.pas' {Splash},
  UListagem in 'UListagem.pas' {FrmEtiquetas},
  UListagemDeAniversariantes in 'UListagemDeAniversariantes.pas' {FrmListagem},
  UConsultas in 'UConsultas.pas' {FormConsultas},
  UCategoria in 'UCategoria.pas' {FrmCategoria},
  UConfig in 'UConfig.pas' {FrmConfig};

{$R *.RES}

begin
  Splash:=TSplash.Create(Application);
  Splash.Show;
  Splash.Refresh;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Splash.Free;
  Application.Run;
end.

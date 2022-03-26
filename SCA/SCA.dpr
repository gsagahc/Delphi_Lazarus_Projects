program SCA;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UServicos in 'UServicos.pas' {FrmServicos},
  UInserirServicos in 'UInserirServicos.pas' {FrmInserirServicos},
  UMensagens in 'UMensagens.pas' {FrmMensagens},
  UCadProntuario in 'UCadProntuario.pas' {FrmCadProntuario},
  UAtendimento in 'UAtendimento.pas' {FrmAtendimento},
  UConsultarBairro in 'UConsultarBairro.pas' {FrmConsultarBairro},
  UImpressaoPBairro in 'UImpressaoPBairro.pas' {FrmImpressaoPBairro},
  UCADColab in 'UCADColab.pas' {FrmCadColab},
  UConsultarAtendColaborador in 'UConsultarAtendColaborador.pas' {FrmConsultaAtendColab},
  URelatoAtendColab in 'URelatoAtendColab.pas' {FrmImpressaoAtendColab},
  UAniversariantes in 'UAniversariantes.pas' {FrmAniversariantes},
  UImpressaoAniv in 'UImpressaoAniv.pas' {FrmImpressaoAniv},
  UConsultarPZumba in 'UConsultarPZumba.pas' {FrmConsultarZumba},
  UImpressaoPZumba in 'UImpressaoPZumba.pas' {FrmImpressaoPZumba};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

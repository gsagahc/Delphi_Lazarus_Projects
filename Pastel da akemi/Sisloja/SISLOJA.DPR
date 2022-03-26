program Sisloja;

uses
  Forms,
  Principal in 'PRINCIPAL.PAS' {frmprincipal},
  Basica in 'BASICA.PAS' {Frmbasica},
  Entrada in 'ENTRADA.PAS' {Frmentrada},
  Produtos in 'PRODUTOS.PAS' {frmprodutos},
  Consulta in 'CONSULTA.PAS' {frmconsulta},
  ConsProd in 'CONSPROD.PAS' {frmconsprod},
  Vendedor in 'VENDEDOR.PAS' {frmvendedor},
  Fornecedor in 'FORNECEDOR.PAS' {frmFornecedor},
  ManVendas in 'MANVENDAS.PAS' {frmManVendas},
  relato in 'RELATO.PAS' {frmrelato: TQuickRep},
  SelRel in 'SELREL.PAS' {frmselrel},
  Relpro in 'RELPRO.PAS' {frmrelpro: TQuickRep},
  Selpro in 'Selpro.pas' {frmselpro},
  Reltab in 'RELTAB.PAS' {frmreltab: TQuickRep},
  Relven in 'RELVEN.PAS' {frmrelven: TQuickRep},
  relcli in 'RELCLI.PAS' {frmrelcli1: TQuickRep},
  Gerpag in 'GERPAG.PAS' {frmgerpag},
  Rotinas in 'Rotinas.pas',
  Gerrec in 'GERREC.PAS' {frmgerrec},
  locadoc in 'LOCADOC.PAS' {frmlocaliza},
  locadoc1 in 'LOCADOC1.PAS' {frmlocaliza1},
  relfor in 'RELFOR.PAS' {frmrelfor: TQuickRep},
  Selpag in 'Selpag.pas' {frmselpag},
  relpag in 'RELPAG.PAS' {frmrelpag: TQuickRep},
  relrec in 'RELREC.PAS' {frmrelrec: TQuickRep},
  selrec in 'selrec.pas' {frmselrec},
  relrem in 'RELREM.PAS' {frmrelrem: TQuickRep},
  ubobususenha in 'ubobususenha.PAS' {bobususenha},
  ubobusu in 'UBOBUSU.PAS' {bobusu},
  ubobusuc in 'ubobusuc.pas' {bobusuc},
  Grafico in 'Grafico.pas' {frmgrafven},
  conscli in 'CONSCLI.PAS' {frmconscli},
  ufrmmovpro in 'ufrmmovpro.pas' {frmmovpro},
  DataMod in 'DATAMOD.PAS' {dmPrincipal: TDataModule},
  ConsCliVend in 'ConsCliVend.pas' {FrmConsCliVend},
  CONSPED in 'CONSPED.pas' {FrmConsPed},
  Usplash in 'Usplash.pas' {Splash},
  RelVendasporVendedor in 'RelVendasporVendedor.pas' {FormRelVende},
  SelVendasporVendedor in 'SelVendasporVendedor.pas' {frmselVendedor},
  Orcamentos in 'Orcamentos.pas' {frmOrvcamento},
  ConsultaProdutos in 'ConsultaProdutos.pas' {FrmConsProdutos},
  CONSVENDEDOR in 'CONSVENDEDOR.PAS' {FrmConsVendedor},
  ConContaPag in 'ConContaPag.pas' {FrmConsContaPag},
  ConContaRec in 'ConContaRec.pas' {FrmConsContaRec},
  FrmAlertaSenha in 'FrmAlertaSenha.pas' {FrmAlertaSen},
  ConsFornecedor in 'ConsFornecedor.pas' {FrmConsFornecedor},
  Quantidade in 'Quantidade.pas' {FrmQuantidade},
  RELREM_Matricial in 'RELREM_Matricial.pas' {frmrelrem1: TQuickRep},
  SelectImpressora in 'SelectImpressora.pas' {FrmSelecionaPrint},
  SenhaSupervisor in 'SenhaSupervisor.pas' {FrmSenhaSupervisor},
  Baixa_titulos in 'Baixa_titulos.pas' {FrmBaixaTitulos},
  Sobre in 'Sobre.pas' {FormSobre},
  ConsultaCli_Orca in 'ConsultaCli_Orca.pas' {FrmConsCliOrca},
  RELREM_Matricial2 in 'RELREM_Matricial2.pas' {frmrelrem2: TQuickRep},
  RelOrcamento in 'RelOrcamento.pas' {FrmRelOrca: TQuickRep},
  ShowContaPag in 'ShowContaPag.pas' {FrmShowContaPag},
  ShowCheques in 'ShowCheques.pas' {FrmShowCheques},
  Permissoes in 'Permissoes.pas' {FrmPermissoes},
  clientes in 'CLIENTES.PAS' {frmclientes},
  CadChequesRec in 'CadChequesRec.pas' {FrmCadChequesRec},
  ConsBancos in 'ConsBancos.pas' {FrmConsBanco},
  ConsultaCli in 'ConsultaCli.pas' {FrmConsCliVend2},
  Vendas_SC in 'Vendas_SC.pas' {frmVendas_SC},
  ImprimePedSCMatricial in 'ImprimePedSCMatricial.pas' {FrmPrinPedSCMatric: TQuickRep},
  ImprimePedSCInkJet in 'ImprimePedSCInkJet.pas' {FrmPrinPedSCInkJet: TQuickRep},
  RelVendasSCadastro in 'RelVendasSCadastro.pas' {FrmRelVendasSCadastro},
  RelatorioVendasSC in 'RelatorioVendasSC.pas' {FrmPrinPedSCMatric1: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  Splash := TSplash.Create(Application);
  Splash.Show;
  Splash.Refresh;
  Application.Title := 'Sisloja';
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Splash.free;
  dmPrincipal.Database1.Connected:=True;
  Application.Run;
end.

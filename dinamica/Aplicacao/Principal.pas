{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit Principal;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QMenus, QTypes, QExtCtrls, QComCtrls, DB, IBDatabase, IBQuery,
  IBCustomDataSet, IBTable, Provider, DBClient, DBLocal, DBLocalI,
  IBUpdateSQL;

type
  TFrmData = class(TForm)
    IBTb_Cad_cli: TIBTable;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTb_Cad_cliCPF_CLI: TIBStringField;
    IBTb_Cad_cliNOME_CLI: TIBStringField;
    IBTb_Cad_cliENDERECO_CLI: TIBStringField;
    IBTb_Cad_cliBAIRRO_CLI: TIBStringField;
    IBTb_Cad_cliCIDADE_CLI: TIBStringField;
    IBTb_Cad_cliCEP_CLI: TIBStringField;
    IBTb_Cad_cliUF_CLI: TIBStringField;
    IBTb_Cad_cliFONE1_CLI: TIBStringField;
    IBTb_Cad_cliFONE2_CLI: TIBStringField;
    IBTb_Cad_cliCELULAR_CLI: TIBStringField;
    IBTb_Cad_cliCONTATO_CLI: TIBStringField;
    IBTb_Cad_cliEMPRESA_CLI: TIBStringField;
    IBTb_Cad_cliEND_COM_CLI: TIBStringField;
    IBTb_Cad_cliBAIRRO_COM_CLI: TIBStringField;
    IBTb_Cad_cliCIDADE_COM_CLI: TIBStringField;
    IBTb_Cad_cliUF_COM_CLI: TIBStringField;
    IBTb_Cad_cliFONE_COM_CLI: TIBStringField;
    DataSource1: TDataSource;
    IBUpdateSQL1: TIBUpdateSQL;
    IBTb_clientes: TIBTable;
    IBTb_clientesCPF_CLIENTE: TIBStringField;
    IBTb_clientesNOME_CLIENTE: TIBStringField;
    IBTb_clientesENDERECO_CLIENTE: TIBStringField;
    IBTb_clientesBAIRRO_CLIENTE: TIBStringField;
    IBTb_clientesCIDADE_CLIENTE: TIBStringField;
    IBTb_clientesCEP_CLIENTE: TIBStringField;
    IBTb_clientesUF_CLIENTE: TIBStringField;
    IBTb_clientesCARNET_CLIENTE: TIBStringField;
    IBTb_clientesPARCELA_CLIENTE: TIntegerField;
    IBTb_clientesDATA_COMPRA_CLIENTE: TDateTimeField;
    IBTb_clientesVENCIMENTO: TDateTimeField;
    IBTb_clientesVALOR_PARCELA: TIBStringField;
    IBTb_clientesTIPO_PAG: TIBStringField;
    IBTb_clientesEND_COMERC: TIBStringField;
    IBTb_clientesBAIRRO_COMER: TIBStringField;
    IBTb_clientesNUM_PARCELAS: TIntegerField;
    IBTb_clientesUF_COMERCIAL: TIBStringField;
    IBTb_clientesTELEFONE__1: TIBStringField;
    IBTb_clientesTELEFONE_2: TIBStringField;
    IBTb_clientesCONTATO: TIBStringField;
    IBTb_clientesEMPRESA: TIBStringField;
    IBTb_clientesFUNCAO_CLIENTE: TIBStringField;
    IBTb_clientesPG: TSmallintField;
    IBQGeral: TIBQuery;
    procedure sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    
    Caminho:String;
    { Public declarations }
  end;

var
  FrmData: TFrmData;

implementation
Uses importacao;

{$R *.xfm}

procedure TFrmData.sair1Click(Sender: TObject);
begin
 Close;
end;

end.

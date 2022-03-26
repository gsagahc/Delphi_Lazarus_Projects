unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBTable, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    IBDatabase1: TIBDatabase;
    IBTable1: TIBTable;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    IBTable1TBPRT_NOME: TIBStringField;
    IBTable1TBPRT_RG: TIBStringField;
    IBTable1TBPRT_CPF: TIBStringField;
    IBTable1TBPRT_ENDERECO: TIBStringField;
    IBTable1TBPRT_NUMERO: TSmallintField;
    IBTable1TBPRT_COMPLEMENTO: TIBStringField;
    IBTable1TBPRT_EMAIL: TIBStringField;
    IBTable1TBPRT_BAIRRO: TIBStringField;
    IBTable1TBPRT_CIDADE: TIBStringField;
    IBTable1TBPRT_CELULAR: TIBStringField;
    IBTable1TBPRT_TELEFONE: TIBStringField;
    IBTable1TBPRT_CEP: TIBStringField;
    IBTable1TBPRT_ESTADOCIVIL: TIBStringField;
    IBTable1TBPRT_SEXO: TIBStringField;
    IBTable1TBPRT_NASCIMENTO: TDateField;
    IBTable1TBPRT_ZAP: TIBStringField;
    IBTable1TBPRT_ANIVERSARIO: TIBStringField;
    IBTable1TBPRT_OBS: TIBStringField;
    IBTable1TBPRT_PROFISSAO: TIBStringField;
    FDTable1Nome: TWideStringField;
    FDTable1Cognome: TWideStringField;
    FDTable1Sexo: TWideStringField;
    FDTable1Nasc: TWideStringField;
    FDTable1Profissao: TWideStringField;
    FDTable1Endereco: TWideStringField;
    FDTable1Bairro: TWideStringField;
    FDTable1Cidade: TWideStringField;
    FDTable1CEP: TWideStringField;
    FDTable1Estado: TWideStringField;
    FDTable1Telefone: TWideStringField;
    FDTable1EMail: TWideStringField;
    FDTable1Empresa: TWideStringField;
    FDTable1Tratamento: TWideStringField;
    FDTable1Função: TWideStringField;
    FDTable1EndereçoCom: TWideStringField;
    FDTable1BairroCom: TWideStringField;
    FDTable1CidadeCom: TWideStringField;
    FDTable1EstadoCom: TWideStringField;
    FDTable1CEPCom: TWideStringField;
    FDTable1TelefoneCom: TWideStringField;
    FDTable1HomePage: TWideStringField;
    FDTable1Nota: TWideStringField;
    FDTable1OBS: TWideStringField;
    FDTable1FAXCom: TWideStringField;
    FDTable1FAXRes: TWideStringField;
    FDTable1CelularCom: TWideStringField;
    FDTable1Celular: TWideStringField;
    FDTable1Conjuge: TWideStringField;
    FDTable1NascConjuge: TWideStringField;
    FDTable1Atributos: TWideStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var cont:Integer;
begin
  FDTable1.Open;
  FDTable1.First;
  IBTable1.Open;
  Cont:=0;
  while not FDTable1.eof do
  begin
    if Trim(FDTable1Nome.AsString)<> EmptyStr then
    Begin
      IBTable1.Insert;
      cont:=Cont+1;
      Label2.Caption := IntTostr(Cont);
      IBTable1TBPRT_NOME.AsString:=FDTable1Nome.AsString;
      IBTable1TBPRT_SEXO.AsString:=FDTable1Sexo.AsString ;
      IBTable1TBPRT_ENDERECO.AsString:=FDTable1Endereco.AsString;
      IBTable1TBPRT_BAIRRO.AsString:=FDTable1Bairro.AsString;
      IBTable1TBPRT_ANIVERSARIO.AsString:=FDTable1Nasc.AsString;
      IBTable1TBPRT_EMAIL.AsString:=FDTable1EMail.AsString;
      IBTable1TBPRT_PROFISSAO.AsString   :=FDTable1Profissao.AsString;
      IBTable1TBPRT_CELULAR.AsString:= FDTable1Celular.AsString;
      IBTable1TBPRT_ESTADOCIVIL.AsString :=FDTable1Conjuge.AsString;
      IBTable1TBPRT_OBS.AsString :=FDTable1Obs.AsString;
      IBTable1TBPRT_TELEFONE.AsString:=FDTable1Telefone.AsString;
      IBTable1.Post;
    End;
    FDTable1.Next;

  end;

end;

end.

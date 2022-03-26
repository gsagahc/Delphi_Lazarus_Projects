unit Importacao;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QComCtrls,IBDatabase, IBQuery,DB   ,
  IBCustomDataSet, IBTable, Provider, DBClient, DBLocal, DBLocalI,
  IBUpdateSQL;

type
  TFrmimportacao = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    Procedure ImportarparaBanco;
    Function Verifica_arquivo(caminho:String):boolean;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    Arquivo:TextFile;
    Texto:String;
    Result:Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmimportacao: TFrmimportacao;

implementation

uses Principal, Thread_import;

{$R *.xfm}

procedure TFrmimportacao.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmimportacao.ImportarparaBanco;
begin
  //

end;

function TFrmimportacao.Verifica_arquivo(caminho: String): boolean;
begin
//
end;

procedure TFrmimportacao.SpeedButton1Click(Sender: TObject);
begin
//
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=1000;
// Chama thread que raliza a importação do TXT.
  Importacaotxt.Create(False);
  
 
end;

procedure TFrmimportacao.SpeedButton2Click(Sender: TObject);
begin
   Close;
end;

end.


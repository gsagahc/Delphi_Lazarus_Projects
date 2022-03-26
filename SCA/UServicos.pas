unit UServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  IBX.IBUpdateSQL;

type
  TFrmServicos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    IBQServicos: TIBQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBQServicosTBSERV_NOME: TIBStringField;
    IBQServicosTBSERV_PRAZO: TIBStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    IBUServicos: TIBUpdateSQL;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmServicos: TFrmServicos;

implementation
Uses UPrincipal, UInserirServicos, UMensagens;

{$R *.dfm}

procedure TFrmServicos.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmInserirServicos,FrmInserirServicos);
  FrmInserirServicos.ShowModal;
  FrmInserirServicos.Free;
  IBQServicos.Close;
  IBQServicos.OPen;


end;

procedure TFrmServicos.BitBtn2Click(Sender: TObject);
begin

  if tFrmMensagens.Mensagem('Deseja excluir o registro selecionado?','Q',[mbSIM, MBNao]) then
    Begin
      IBQServicos.Delete;
    End;


end;

procedure TFrmServicos.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.

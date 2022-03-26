unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,
  IBX.IBSQL, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;
type
  TAniversariante = class
     Nome:String;
     Celular:String;
     Endereco:String;
     Bairro:String;
     Complemento:String;
     Aniversario:String;
end;

type
  TForm4 = class(TForm)
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBQUtil: TIBQuery;
    IBSQL1: TIBSQL;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    TViewAniversariante: TTreeView;
    Panel2: TPanel;
    ImageListAniver: TImageList;
    MemoDados: TMemo;
    TimerHideMemo: TTimer;
    procedure FormShow(Sender: TObject);
    procedure TViewAniversarianteDblClick(Sender: TObject);
    procedure TimerHideMemoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
Var Aniver:TAniversariante;
begin
  IBQUtil.Close;
  IBQUtil.SQL.Clear;
  IBQUtil.SQL.Add('SELECT TBPRT_NOME, '+
                       '  TBPRT_ENDERECO, '+
                       '  TBPRT_NUMERO, '+
                       '  TBPRT_COMPLEMENTO, '+
                       '  TBPRT_EMAIL, '+
                       '  TBPRT_BAIRRO, '+
                       '  TBPRT_CIDADE, '+
                       '  TBPRT_CELULAR, '+
                       '  TBPRT_NASCIMENTO, '+
                       '  TBPRT_ANIVERSARIO '+
                 '   FROM TB_PRT '+
                '  WHERE TBPRT_ANIVERSARIO=:pData');
  IBQUtil.ParamByName('pData').AsString:=FormatDateTime('dd/mm',now);
  IBQUtil.Open;
  if Not IBQUtil.IsEmpty  then
  Begin
    IBQUtil.First;
    While not IBQUtil.Eof do
    Begin
      Aniver:=TAniversariante.Create;
      Aniver.Nome         :=IBQUtil.FieldByName('TBPRT_NOME').AsString;
      Aniver.Celular      :=IBQUtil.FieldByName('TBPRT_CELULAR').AsString;
      Aniver.Endereco     :=IBQUtil.FieldByName('TBPRT_ENDERECO').AsString;
      Aniver.Complemento  :=IBQUtil.FieldByName('TBPRT_COMPLEMENTO').AsString;
      Aniver.Bairro       :=IBQUtil.FieldByName('TBPRT_BAIRRO').AsString;
      TViewAniversariante.Items.AddObject(Nil,Aniver.Nome,Aniver);
      IBQUtil.Next;
    End;
   Panel1.Visible:=True;
  End;
  MemoDados.Left:=Panel2.Left + 625;

end;

procedure TForm4.TimerHideMemoTimer(Sender: TObject);
begin
   MemoDados.Visible:=False;
  TimerHideMemo.Enabled :=False;
end;

procedure TForm4.TViewAniversarianteDblClick(Sender: TObject);
begin
     if TViewAniversariante.Selected.Data <> Nil   then
     Begin
        MemoDados .Lines.Clear;
        MemoDados.Visible:=True;
        MemoDados.Lines.Add ('Nome: '       +TAniversariante(TViewAniversariante.Selected.Data).Nome);
        MemoDados.Lines.Add ('Celular: '    +TAniversariante(TViewAniversariante.Selected.Data).Celular );
        MemoDados.Lines.Add ('Endereço: '   +TAniversariante(TViewAniversariante.Selected.Data).Endereco );
        MemoDados.Lines.Add ('Complemento: '+TAniversariante(TViewAniversariante.Selected.Data).Complemento);
        MemoDados.Lines.Add ('Bairro: '     +    TAniversariante(TViewAniversariante.Selected.Data).Bairro);
        TimerHideMemo.Enabled :=True;
     End;
end;

end.

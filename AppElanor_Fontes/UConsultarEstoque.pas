unit UConsultarEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, pngextra, ExtCtrls,
  StdCtrls, IBSQL;

type
  TFrmConsultarEstoque = class(TForm)
    Panel2: TPanel;
    PNGButton2: TPNGButton;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    DsEstoque: TDataSource;
    PnlTotal: TPanel;
    EdtTotal: TEdit;
    Label1: TLabel;
    IBQUTIL: TIBQuery;
    IBQEstoque: TIBQuery;
    IBQEstoqueTBPRD_NOME: TIBStringField;
    IBQEstoqueTBPRD_PRECOVENDA: TIBBCDField;
    IBQEstoqueTBPRD_DESCRICAO: TIBStringField;
    IBQEstoqueTBPRD_UNIDADE: TIBStringField;
    IBQEstoqueTBPRD_CODIGO: TIBStringField;
    IBQEstoqueTBES_FORMATO: TIBStringField;
    IBQEstoqueTBES_TAMANHO: TIBBCDField;
    IBQEstoqueTBES_QUANTI: TIBBCDField;
    PNGButton1: TPNGButton;
    EditProduto: TEdit;
    tmr1: TTimer;
    Label2: TLabel;
    procedure PNGButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function SomarQuantidade:Integer;
    procedure PNGButton1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure EditProdutoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultarEstoque: TFrmConsultarEstoque;

implementation
Uses Uprincipal, uMensagens, Math;

{$R *.dfm}

procedure TFrmConsultarEstoque.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultarEstoque.FormShow(Sender: TObject);
begin
  EdtTotal.Clear;
  EdtTotal.Text:=FormatFloat('#,,0.00',SomarQuantidade) + ' METROS';
  IBQEstoque.Open;
  
end;

Function TFrmConsultarEstoque.SomarQuantidade:Integer;
Var Total:Integer;
begin
  If Not IBQEstoque.IsEmpty Then
    Begin
    Total:=0;
    IBQUTIL.Close;
    IBQUTIL.Sql.Clear;
    IBQUTIL.SQL.Add(IBQEstoque.SQL.GetText);
    If IBQUTIL.Params.Count<> 0 Then
      IBQUTIL.ParamByName('pNomeProd').AsString:= EditProduto.Text;
    IBQUTIL.Open;
    IBQUTIL.First; 
    While Not IBQUTIL.Eof Do
    Begin
      Total:=Total+ IBQUTIL.FieldByName('TBES_QUANTI').AsInteger;
      IBQUTIL.Next;
    End;
    Result:= Total;
  End
  Else
     Result:=0;
end;

procedure TFrmConsultarEstoque.PNGButton1Click(Sender: TObject);
begin
  FrmPrincipal.ExibirEstoqueAtual ;
end;

procedure TFrmConsultarEstoque.tmr1Timer(Sender: TObject);
begin
 IF EditProduto.Text='TODOS' Then
   Begin
     IBQEstoque.Close;
     IBQEstoque.SQL.Clear;
     IBQEstoque.SQL.Add('SELECT TBPRD_NOME, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_DESCRICAO, '+
                        'TBPRD_UNIDADE, '+
                        'TBPRD_CODIGO, '+
                        'TBES_QUANTI, '+
                        'TBES_FORMATO, '+
                        'TBES_TAMANHO '+
                        'FROM TB_ESTOQUE '+
                        'INNER JOIN TB_PRODUTOS '+
                        'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO ');
     IBQEstoque.Open;
   End
   Else
   If (EditProduto.Text<>EmptyStr)  Then
   Begin
     IBQEstoque.Close;
     IBQEstoque.SQL.Clear;
     IBQEstoque.SQL.Add('SELECT TBPRD_NOME, '+
                        'TBPRD_PRECOVENDA, '+
                        'TBPRD_DESCRICAO, '+
                        'TBPRD_UNIDADE, '+
                        'TBPRD_CODIGO, '+
                        'TBES_QUANTI, '+
                        'TBES_FORMATO, '+
                        'TBES_TAMANHO '+
                        'FROM TB_ESTOQUE '+
                        'INNER JOIN TB_PRODUTOS '+
                        'ON TB_PRODUTOS.ID_PRODUTO=TB_ESTOQUE.ID_PRODUTO '+
                        'WHERE TBPRD_NOME LIKE ''%'+ EditProduto.Text +'%''');

     //IBQEstoque.ParamByName('pNomeProd').AsString :=CbBoxProduto.Text;
     IBQEstoque.Open;
  End;
  EdtTotal.Clear;
  EdtTotal.Text:= FormatFloat('#,,0.00',SomarQuantidade) + ' METROS';
  tmr1.Enabled:=False;  
end;

procedure TFrmConsultarEstoque.EditProdutoChange(Sender: TObject);
begin
  tmr1.Enabled:=True;  
end;

procedure TFrmConsultarEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If IBQEstoqueTBES_QUANTI.AsInteger <   0  then // condição
  Begin
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
  End;
    Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

end.

unit URomaneioEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, pngextra, ComCtrls, IBCustomDataSet, IBQuery, DBClient,
  Grids, DBGrids, ExtCtrls, IBDatabase, StdCtrls, DBCtrls, ImgList,
  QRCtrls, jpeg, QuickRpt, pngimage;

type
  TFrmRomaneioEntrega = class(TForm)
    Panel1: TPanel;
    CDSPedidos: TClientDataSet;
    DSPedidos: TDataSource;
    DSRomaneio: TDataSource;
    IBQPedidos: TIBQuery;
    DTPickerIni: TDateTimePicker;
    DTPickerFin: TDateTimePicker;
    PNGBCarregar: TPNGButton;
    PNGBProximo: TPNGButton;
    PNGBImprimir: TPNGButton;
    PNGBVoltar: TPNGButton;
    CDSPedidosPedido: TStringField;
    CDSPedidosData: TDateField;
    CDSPedidosCliente: TStringField;
    CDSPedidosValor: TCurrencyField;
    CDSPedidosSelecao: TBooleanField;
    PNGBOrdenar: TPNGButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    Panel3: TPanel;
    Image1: TImage;
    DBGrid2: TDBGrid;
    CDSRomaneio: TClientDataSet;
    CDSRomaneioOrdem: TIntegerField;
    CDSRomaneioPedido: TStringField;
    CDSRomaneioData: TDateField;
    CDSRomaneioCliente: TStringField;
    intgrfldCDSRomaneioQuant: TIntegerField;
    CDSRomaneioValor: TCurrencyField;
    CDSRomaneioImagem: TGraphicField;
    CDSRomaneioNum: TStringField;
    procedure PNGBVoltarClick(Sender: TObject);
    procedure PNGBCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PNGBProximoClick(Sender: TObject);
    procedure PNGBOrdenarClick(Sender: TObject);
    procedure PNGBImprimirClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DTPickerFinExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRomaneioEntrega: TFrmRomaneioEntrega;

implementation

uses Math, UPrincipal, uMensagens, UPrintRomaneio;

{$R *.dfm}

procedure TFrmRomaneioEntrega.PNGBVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRomaneioEntrega.PNGBCarregarClick(Sender: TObject);
begin
  if DTPickerIni.Date > DTPickerFin.Date then
  begin
    tFrmMensagens.Mensagem('A data final não pode ser menor de que a inicial','E',[mbOK]);
    DTPickerIni.SetFocus;
    Exit;
  end
  Else
  Begin
    IBQPedidos.Close;
    IBQPedidos.SQL.Clear;
    IBQPedidos.Sql.Add(' SELECT   TB_PEDIDOS.ID_PEDIDO, '+
                                ' TBPED_DATA,           '+
                                ' TBPED_NOME,'+
                                ' TBPED_VALTOTAL,       '+
                                ' TBPED_NUMPED         '+
                      ' FROM TB_PEDIDOS                 '+
                      ' WHERE TBPED_DATA BETWEEN       '+
                                ' :pDataIni AND :pDataFin '+
                     ' AND (TBPED_CANCELADO IS NULL or TBPED_CANCELADO<>''S'')'+
                     '  ORDER BY TBPED_NUMPED DESC       ');

    IBQPedidos.ParamByName('pDataIni').AsDate:=DTPickerIni.Date ;
    IBQPedidos.ParamByName('pDataFin').AsDate:=DTPickerFin.Date ;
    IBQPedidos.Open;
    If not IBQPedidos.IsEmpty Then
    Begin
      IBQPedidos.First;
      CDSPedidos.Close;
      CDSPedidos.CreateDataSet;
      CDSPedidos.DisableControls;
      CDSPedidos.Open;

      While not IBQPedidos.Eof Do
      begin
        CDSPedidos.Insert;
        CDSPedidosPedido.AsString := IBQPedidos.FieldByName('TBPED_NUMPED').AsString;
        CDSPedidosData.AsDateTime := IBQPedidos.FieldByName('TBPED_DATA').AsDateTime;
        CDSPedidosCliente.AsString:= IBQPedidos.FieldByName('TBPED_NOME').AsString;
        CDSPedidosValor.AsCurrency:= IBQPedidos.FieldByName('TBPED_VALTOTAL').AsCurrency;
        CDSPedidosSelecao.AsBoolean:=False;
        CDSPedidos.Post;
        IBQPedidos.Next;
      end;
      CDSPedidos.EnableControls;

    End;
    IBQPedidos.Close;
  end;
end;

procedure TFrmRomaneioEntrega.FormCreate(Sender: TObject);
begin
  DBCheckBox1.DataSource := DSPedidos;
  DBCheckBox1.DataField :='Selecao';
  DBCheckBox1.Visible := False;
  DBCheckBox1.Color := DBGrid1.Color;
  DBCheckBox1.Caption := '';
  DBCheckBox1.AllowGrayed  :=  False ;
  DBCheckBox1.State   :=  cbUnchecked;
  DTPickerFin.Date :=Now();
  DTPickerIni.Date :=Now()-1;

  
end;

procedure TFrmRomaneioEntrega.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
       (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
 var
   DrawState: Integer;
   DrawRect: TRect;
begin
   if (gdFocused in State) then
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
      DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
      DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
      DBCheckBox1.Width := Rect.Right - Rect.Left;
      DBCheckBox1.Height := Rect.Bottom - Rect.Top;
      DBCheckBox1.Visible := True;
     end
   end
   else
   begin
     if (Column.Field.FieldName = DBCheckBox1.DataField) then
     begin
       DrawRect:=Rect;
       InflateRect(DrawRect,-1,-1);
       DrawState := ISChecked[Column.Field.AsBoolean];
       DBGrid1.Canvas.FillRect(Rect);
       DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
         DFC_BUTTON, DrawState);
     end;
   end;
end;

procedure TFrmRomaneioEntrega.PNGBProximoClick(Sender: TObject);
Var Contar:Integer;
    ImagemMemory: TMemoryStream;
begin
  If CDSPedidos.State in [dsEdit, dsInsert] Then
    CDSPedidos.Post;
  CDSPedidos.DisableControls;
  CDSPedidos.First;
  Contar :=0;
  ImagemMemory:= TMemoryStream.Create;
  Image1.Picture.Graphic.SaveToStream(ImagemMemory);
  While not CDSPedidos.Eof do
  begin
    If CDSPedidosSelecao.AsBoolean =True Then
    begin
      Contar :=Contar +1;
      If Contar =1 then
      begin
        CDSRomaneio.Close;
        CDSRomaneio.CreateDataSet;
        CDSRomaneio.DisableControls;
        CDSRomaneio.Open;
      end;

      CDSRomaneio.Insert;
      CDSRomaneioPedido.AsString  := CDSPedidosPedido.AsString;
      CDSRomaneioData.AsDateTime  := CDSPedidosData.AsDateTime;
      CDSRomaneioCliente.AsString := CDSPedidosCliente.AsString;
      CDSRomaneioImagem.LoadFromStream(ImagemMemory);   
      CDSRomaneioValor.AsCurrency :=CDSPedidosValor.AsCurrency;
      CDSRomaneio.Post

    end;
    CDSPedidos.Next;
  End;

  CDSPedidos.First;
  CDSPedidos.EnableControls;
  CDSRomaneio.EnableControls;
  Panel2.Visible :=False;
  Panel3.Visible :=True;
  PNGBCarregar.Enabled :=False;
  PNGBProximo.Enabled  :=False;
  PNGBOrdenar.Enabled  :=True;
end;

procedure TFrmRomaneioEntrega.PNGBOrdenarClick(Sender: TObject);
var Repetido: string;
begin

 if DSRomaneio.State in [dsEdit, dsInsert] then
   CDSRomaneio.Post;
 CDSRomaneio.DisableControls;
 CDSRomaneio.First;
 While not CDSRomaneio.Eof do
 begin
    if CDSRomaneioOrdem.AsString='' then
    begin
        if (tFrmMensagens.Mensagem('Favor colocar um número diferente para cada cliente','I',[mbOK])) then
        Exit;
    end;
    CDSRomaneio.Next;
 end;
 CDSRomaneio.IndexFieldNames:='Ordem';
 CDSRomaneio.EnableControls;
 PNGBOrdenar.Enabled :=False;
 PNGBImprimir.Enabled:=True;
 
end;

procedure TFrmRomaneioEntrega.PNGBImprimirClick(Sender: TObject);
Var Branco:Boolean;
    Caixas:Integer;
    Indice:Integer;
    Numero: Integer;
    StringNumeros:string;
begin
  if DSRomaneio.State in [dsEdit, dsInsert] then
   CDSRomaneio.Post;
  // Verificar se colocou quantidade de caixas.
  CDSRomaneio.DisableControls;
  CDSRomaneio.First;
  Branco:=False;
  while Not CDSRomaneio.Eof do
  begin
    If  CDSRomaneio.FieldByName('Quant').AsInteger=0  Then
      Branco :=True;
    CDSRomaneio.Next;
  End;
  if Branco=True then
  Begin
    tFrmMensagens.Mensagem('Favor informar a quantidade de caixa','I',[mbOK]);
    CDSRomaneio.EnableControls;
    CDSRomaneio.Edit;
    Exit;
  End
  else
  begin
     Numero:=0;
     Caixas:=0;
     CDSRomaneio.First;
     while Not CDSRomaneio.EOf do
     begin
       Caixas := CDSRomaneio.FieldByName('Quant').AsInteger;
       for Indice :=0 To Caixas -1 do
       Begin
         Numero:= Numero+1;
         StringNumeros:= StringNumeros+IntToStr(Numero) + ' ';

       end;
       CDSRomaneio.Edit;
       CDSRomaneioNum.AsString :=StringNumeros;
       StringNumeros:='';
       CDSRomaneio.Post;
       CDSRomaneio.Next;
     End;
  end;
  Application.CreateForm(TFrmPrintRomaneio,FrmPrintRomaneio);
  FrmPrintRomaneio.QuickRep1.Preview;
  FrmPrintRomaneio.Free;
  Close;
end;

procedure TFrmRomaneioEntrega.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Column.Field = CDSRomaneioImagem Then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     ImageList1.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 0);
     
   end;
end;

procedure TFrmRomaneioEntrega.DTPickerFinExit(Sender: TObject);
begin
  if DTPickerFin.Date < DTPickerIni.Date then
  begin
    tFrmMensagens.Mensagem('A data final não pode ser menor de que a inicial','E',[mbOK]);
    DTPickerIni.SetFocus;
  end;
end;

end.

unit UListagemDeAniversariantes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBTable, Db, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ExtCtrls, Buttons, Qrctrls, QuickRpt, DBTables, QRPrntr;

type
  TFrmListagem = class(TForm)
    DataSource1: TDataSource;
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRBand1: TQRBand;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    ComboMes: TComboBox;
    EdtFuncao: TEdit;
    Label1: TLabel;
    ComboCategoria: TComboBox;
    EdtEstado: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    QRDBImage1: TQRDBImage;
    IBQCategoria: TIBQuery;
    IBQCategoriaID_CATEGORIA: TIntegerField;
    IBQCategoriaDESCRICAO: TIBStringField;
    RadioGroup1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    Procedure ExecutaSql;
    procedure ComboCategoriaChange(Sender: TObject);
    Function campovazio:Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Sql:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListagem: TFrmListagem;

implementation
uses UMain,UListagem;

{$R *.DFM}

Function TFrmListagem.campovazio:Boolean;
var Component:TComponent;
    Edite:TEdit;
    index:integer;
Begin
  For Index:=0 to FrmListagem.ComponentCount -1 Do
     Begin
         Component:=FrmListagem.Components[Index];
         if (Component is Tedit) then
           Begin
              Edite:=TEdit(Component);
             if Edite.text=' ' then
                begin
                  Result:=TRue;
                  showmessage('Você digitou espaço em branco em: ' + copy(Edite.name,4,length(Edite.name)-3));
                  Edite.setfocus;
                end;  
           end;
     end;
end;
Procedure TFrmListagem.ExecutaSql;
  
begin
  if campovazio<> True Then
    Begin
        Sql:='';
    Sql:= 'Select * From Tb_Clientes ';
    If RadioGroup1.ItemIndex =1 Then
       Begin
           if ComboMes.ItemIndex=0 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%01'''
           else if ComboMes.ItemIndex=1 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%02'''
           else if ComboMes.ItemIndex=2 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%03'''
           else if ComboMes.ItemIndex=3 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%04'''
           else if ComboMes.ItemIndex=4 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%05'''
           else if ComboMes.ItemIndex=5 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%06'''
           else if ComboMes.ItemIndex=6 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%07'''
           else if ComboMes.ItemIndex=7 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%08'''
           else if ComboMes.ItemIndex=8 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%09'''
           else if ComboMes.ItemIndex=9 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%10'''
           else if ComboMes.ItemIndex=10 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%11'''
           else if ComboMes.ItemIndex=11 Then
             Sql:= 'Select * From Tb_Clientes Where Data_Nasc like ''%12''';
     End
        else if RadioGroup1.ItemIndex =2 Then
          Begin
            if  (comboCategoria.Text<>'TODAS')  Then
               sql:=Sql+' Where id_Categoria='+ IBQCategoriaID_CATEGORIA.AsString;

          End
        //Função
        Else If RadioGroup1.ItemIndex =3 Then
            Begin
               if  edtFuncao.text<>'' Then
                  sql:=Sql+ ' Where  Funcao='''+ EdtFuncao.Text + ''''

               Else
                  Begin
                    ShowMessage('Digite o nome da função desejada!');
                    EdtFuncao.SetFocus;
                  End;
            End
      //Estado
       Else If RadioGroup1.ItemIndex =4 Then
          Begin
           if EdtEStado.Text<>'' Then
              Sql:=Sql+' Where  Estado='''+ EdtEstado.text+''''
           Else
              Begin
                ShowMessage('Digite o estado desejado!');
                EdtEstado.SetFocus;
              End;

          End;



         Sql:=Sql+' Order by Tb_Clientes.Nome';


    end;
  // Executando a consulta
   FrmMain.IBtbClientes.Close;
   FrmMain.IBtbClientes.Sql.Clear;
   FrmMain.IBtbClientes.Sql.Add(Sql);
   FrmMain.IBtbClientes.Open;

end;
procedure TFrmListagem.FormShow(Sender: TObject);
begin
  IBQCategoria.Open;
  IBQCategoria.First;
  CombocATEGORIA.Clear;
  Combocategoria.Items.Add ('TODAS');
   While Not IBQCategoria.Eof do
     begin
        CombocATEGORIA.Items.Add (IBQCategoriaDESCRICAO.AsString );
        IBQCategoria.Next;
     end;
   ComboCategoria.ItemIndex:=0;
   ComboMes.ItemIndex:=0;
end;

procedure TFrmListagem.SpeedButton1Click(Sender: TObject);
begin
  If campovazio<>True Then
    Begin
     ExecutaSql;
     If FrmMain.IBTbClientes.RecordCount >0 Then
        Begin
          QuickRep1.ReportTitle:='Listagem de Aniversariantes';
          QuickRep1.Prepare;
          QuickRep1.Preview;
        end;
    end;
end;

procedure TFrmListagem.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmListagem.ComboBox1Change(Sender: TObject);
begin

  IBQCategoria .Close;
  IBQCategoria .Sql.Clear;
  IBQCategoria .Sql.Add('Select * From Tb_Categoria Where Descricao=''' + ComboCategoria.Text+'''');
  IBQCategoria .Open;
 
end;

procedure TFrmListagem.SpeedButton2Click(Sender: TObject);
begin
  if campovazio<>True then
    begin
     ExecutaSql;
     If FrmMain.IBTbClientes.RecordCount >0 Then
        Begin
           Application.CreateForm(TFrmEtiquetas,FrmEtiquetas);
           FrmEtiquetas.QuickRep1.Prepare;
           FrmEtiquetas.QuickRep1.Preview;
        end;
      end;  

end;

procedure TFrmListagem.ComboCategoriaChange(Sender: TObject);
begin
  IBQCategoria .Close;
  IBQCategoria .Sql.Clear;
  IBQCategoria .Sql.Add('Select * From Tb_Categoria Where Descricao='''+ ComboCategoria.text+'''');
  IBQCategoria .Open;
  
end;

procedure TFrmListagem.FormCreate(Sender: TObject);
begin
  FrmMain.IbTbConfig.Open;
end;

procedure TFrmListagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FrmMain.IbTbConfig.Close;
end;

end.

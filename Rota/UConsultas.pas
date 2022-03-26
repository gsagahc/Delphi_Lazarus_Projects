unit UConsultas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IBTable, Db, IBCustomDataSet, IBQuery, Grids, DBGrids,
  ExtCtrls, Buttons, DBTables;

type
  TFormConsultas = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboCategoria: TComboBox;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label2: TLabel;
    LbINstrucao: TLabel;
    Timer1: TTimer;
    ComboMes: TComboBox;
    EdtFuncao: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    EdtEstado: TEdit;
    IBQClientes: TIBQuery;
    IBQCategoria: TIBQuery;
    IBQuery3: TIBQuery;
    IBQClientesID_CLIENTE: TIntegerField;
    IBQClientesID_CATEGORIA: TIntegerField;
    IBQClientesNOME: TIBStringField;
    IBQClientesFUNCAO: TIBStringField;
    IBQClientesEMPRESA: TIBStringField;
    IBQClientesENDERECO: TIBStringField;
    IBQClientesBAIRRO: TIBStringField;
    IBQClientesCIDADE: TIBStringField;
    IBQClientesCEP: TIBStringField;
    IBQClientesFONE: TIBStringField;
    IBQClientesFAX: TIBStringField;
    IBQClientesCELULAR: TIBStringField;
    IBQClientesEMAIL: TIBStringField;
    IBQClientesDATA_NASC: TIBStringField;
    IBQClientesESTADO: TIBStringField;
    IBQCategoriaID_CATEGORIA: TIntegerField;
    IBQCategoriaDESCRICAO: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboCategoriaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function campovazio:Boolean;
  private
    visivel:Boolean;
    IdCategoria:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultas: TFormConsultas;

implementation
uses UMain,Unit1;

{$R *.DFM}
function TformConsultas.campovazio:Boolean;
var Component:TComponent;
    Edite:TEdit;
    index:integer;
Begin
  For Index:=0 to formConsultas.ComponentCount -1 Do
     Begin
         Component:=formConsultas.Components[Index];
         if (Component is Tedit) then
           Begin
              Edite:=TEdit(Component);
             if Edite.text=' ' then
                begin
                  Result:=true;
                  showmessage('Você digitou espaço em branco em: ' + copy(Edite.name,4,length(Edite.name)-3));
                  Edite.setfocus;
                end;  
           end;
     end;
end;

procedure TFormConsultas.FormShow(Sender: TObject);
begin
 IdCategoria :=0;
 if LbINstrucao.Visible Then
    Visivel:=True;

  IBQCategoria.Open;
  IBQCategoria.First;
  ComboCategoria.Clear;
  Combocategoria.Items.Add ('TODAS');
   While Not IBQCategoria.Eof do
     begin
        ComboCategoria.Items.Add (IBQCategoriaDESCRICAO.AsString );
        IBQCategoria.Next;
     end;
  ComboCategoria.ItemIndex :=0;
end;

procedure TFormConsultas.SpeedButton1Click(Sender: TObject);
Var Sql:String;
   
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

        // Executando a consulta
         IBQClientes.Close;
         IBQClientes.Sql.Clear;
         IBQClientes.Sql.Add(Sql);
         IBQClientes.Open;
    end;
end;

procedure TFormConsultas.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFormConsultas.RadioGroup1Click(Sender: TObject);
begin
{ if (RadioGroup1.ItemIndex= 0) Then
    Begin
       Label2.Visible:= True;
       ComboMes.Visible:= True;

    end
 else  If (RadioGroup1.ItemIndex= 1) Then
     Begin
       Label2.Visible:=False;
       ComboMes.Visible:=False;

   end;}

end;

procedure TFormConsultas.ComboCategoriaChange(Sender: TObject);
begin

  IBQCategoria .Close;
  IBQCategoria .Sql.Clear;
  IBQCategoria .Sql.Add('Select * From Tb_Categoria Where Descricao='''+ ComboCategoria.text+'''');
  IBQCategoria .Open;
  IdCategoria:=IBQCategoriaID_CATEGORIA.AsInteger;
end;

procedure TFormConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LbINstrucao.Visible:=False;
end;

procedure TFormConsultas.Timer1Timer(Sender: TObject);
begin
 If FormCadClientes.MostrarLabel =True Then
  if Visivel=True then
     LbINstrucao.Visible:= Not LbINstrucao.Visible;
end;

procedure TFormConsultas.DBGrid1DblClick(Sender: TObject);
begin
  FormCadClientes.CodCli:= IBQClientesID_CLIENTE.AsInteger;
  FormConsultas.Close;
end;

procedure TFormConsultas.FormCreate(Sender: TObject);
begin
  FormCadClientes.CodCli:=0;
  ComboMes.ItemIndex :=0;
end;

end.

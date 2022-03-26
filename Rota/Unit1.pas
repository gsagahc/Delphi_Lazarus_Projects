unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, Mask,Shellapi, DB, DBTables;

type
  TFormCadClientes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ComboBox1: TComboBox;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    Procedure Restaura;
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure CarregarEdits;

  private
    Opcao:String;
    JaCadastrado:Boolean;
    { Private declarations }
  public
    CodCli:Integer;
    MostrarLabel:Boolean;
    { Public declarations }
  end;

var
  FormCadClientes: TFormCadClientes;

implementation
Uses uMain, UConsultas;

{$R *.DFM}


Procedure TFormCadClientes.Restaura;
var Component:TComponent;
    Botao:TSpeedButton;
    Index:Integer;
    Edite:TEdit;
    Combo: TComboBox;
Begin
  For Index:=0 to FormCadClientes.ComponentCount -1 Do
     Begin
         Component:=FormCadClientes.Components[Index];
         if (Component is TSpeedButton ) then
            Begin
              Botao:=TSpeedButton(Component);
              Botao.Enabled := Not botao.Enabled ;
            end
         else if (Component is TEDit) then
           Begin
              Edite:=TEdit(Component);
              Edite.Clear;
              Edite.Enabled := Not Edite.Enabled;

           end
         else if (Component is  TComboBox) Then
           Begin
               Combo:= TComboBox(Component);
               Combo.Clear;
               Combo.Enabled := Not Combo.Enabled;
           end;

     end;
end;

procedure TFormCadClientes.SpeedButton7Click(Sender: TObject);
begin
 Close;
end;

procedure TFormCadClientes.SpeedButton1Click(Sender: TObject);
begin
  Restaura;
  With FrmMain do
    begin
     //Database.StartTransaction;
   //  IBTbClientes.Insert;
     IBTbCategoria.Open;
     IBTbCategoria.First;
     While Not IBTbCategoria.Eof Do
       Begin
          ComboBox1.Items.Add(IBTbCategoriaDESCRICAO.AsString);
          IBTbCategoria.Next;
       End;
     Opcao:='I';
    end;
end;

procedure TFormCadClientes.SpeedButton5Click(Sender: TObject);
begin
  If  JaCadastrado=False Then
    Begin
      With FrmMain do
        Begin
           if (Opcao='I')  Then
              Begin
                FrmMain.IBTbClientes.Close;
                FrmMain.IBTbClientes.SQL.Clear;
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARNOME',PtInputOutPut);//0
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFUNC',PtInputOutPut);//1
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VAREMPRESA',PtInputOutPut);//2
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARENDE',PtInputOutPut);//3
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARBAIRRO',PtInputOutPut);//4
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCIDADE',PtInputOutPut);//5
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCEP',PtInputOutPut);//6
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFONE',PtInputOutPut);//7
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFAX',PtInputOutPut);//8
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCEL',PtInputOutPut);//9
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VAREMAIL',PtInputOutPut);//10
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARDATA',PtInputOutPut);//11
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARESTADO',PtInputOutPut);//12
                FrmMain.IBTbClientes.Params.CreateParam(FtInteger,'VARCATEG',PtInputOutPut);//13

                FrmMain.IBTbClientes.SQL.Add('INSERT INTO TB_CLIENTES (NOME ,FUNCAO,EMPRESA,ENDERECO,BAIRRO,CIDADE,CEP,FONE,FAX,CELULAR,EMAIL,DATA_NASC,ESTADO,ID_CATEGORIA)'+
                                             ' VALUES (:VARNOME,:VARFUNC,:VAREMPRESA,:VARENDE,:VARBAIRRO,:VARCIDADE,:VARCEP,:VARFONE,:VARFAX,:VARCEL,:VAREMAIL,:VARDATA,:VARESTADO,:VARCATEG);');
                FrmMain.IBTbClientes.Params.Items[0].AsString:=Edit1.Text;//nome
                FrmMain.IBTbClientes.Params.Items[1].AsString:=Edit2.Text;//funcao
                FrmMain.IBTbClientes.Params.Items[2].AsString:=Edit3.Text;//empresa
                FrmMain.IBTbClientes.Params.Items[3].AsString:=Edit4.Text;//Endereco
                FrmMain.IBTbClientes.Params.Items[4].AsString:=Edit6.Text;//bairro
                FrmMain.IBTbClientes.Params.Items[5].AsString:=Edit7.Text;//cidade
                FrmMain.IBTbClientes.Params.Items[6].AsString:=Edit8.Text;//cep
                FrmMain.IBTbClientes.Params.Items[7].AsString:=Edit10.Text;//fone
                FrmMain.IBTbClientes.Params.Items[8].AsString:=Edit11.Text;//fax
                FrmMain.IBTbClientes.Params.Items[9].AsString:=Edit12.Text; //celular
                FrmMain.IBTbClientes.Params.Items[10].AsString:=Edit13.Text;//e-mail
                FrmMain.IBTbClientes.Params.Items[11].AsString:=Edit5.Text;//aniversario
                FrmMain.IBTbClientes.Params.Items[12].AsString:=Edit9.Text;//Estado
                FrmMain.IBTbClientes.Params.Items[13].AsInteger:=ComboBox1.ItemIndex+1;//Categoria
                FrmMain.IBTbClientes.ExecSQL;
              end
           Else If (Opcao='A') Then
             Begin
                 FrmMain.IBTbClientes.Close;
                FrmMain.IBTbClientes.SQL.Clear;
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARNOME',PtInputOutPut);//0
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFUNC',PtInputOutPut);//1
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VAREMPRESA',PtInputOutPut);//2
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARENDE',PtInputOutPut);//3
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARBAIRRO',PtInputOutPut);//4
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCIDADE',PtInputOutPut);//5
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCEP',PtInputOutPut);//6
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFONE',PtInputOutPut);//7
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARFAX',PtInputOutPut);//8
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARCEL',PtInputOutPut);//9
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VAREMAIL',PtInputOutPut);//10
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARDATA',PtInputOutPut);//11
                FrmMain.IBTbClientes.Params.CreateParam(FtSTring,'VARESTADO',PtInputOutPut);//12
                FrmMain.IBTbClientes.Params.CreateParam(FtInteger,'VARCATEG',PtInputOutPut);//13

                FrmMain.IBTbClientes.SQL.Add('UPDATE TB_CLIENTES SET NOME=:VARNOME,FUNCAO=:VARFUNC,EMPRESA=:VAREMPRESA,ENDERECO=:VARENDE, '+
                                             ' BAIRRO=:VARBAIRRO,CIDADE=:VARCIDADE,CEP=:VARCEP,FONE=:VARFONE,FAX=:VARFAX,CELULAR=:VARCEL,EMAIL=:VAREMAIL,'+
                                             '  DATA_NASC=:VARDATA,ESTADO=:VARESTADO,ID_CATEGORIA=:VARCATEG '+
                                             ' WHERE ID_CLIENTE='+IntToStr(CodCli));
                FrmMain.IBTbClientes.Params.Items[0].AsString:=Edit1.Text;//nome
                FrmMain.IBTbClientes.Params.Items[1].AsString:=Edit2.Text;//funcao
                FrmMain.IBTbClientes.Params.Items[2].AsString:=Edit3.Text;//empresa
                FrmMain.IBTbClientes.Params.Items[3].AsString:=Edit4.Text;//Endereco
                FrmMain.IBTbClientes.Params.Items[4].AsString:=Edit6.Text;//bairro
                FrmMain.IBTbClientes.Params.Items[5].AsString:=Edit7.Text;//cidade
                FrmMain.IBTbClientes.Params.Items[6].AsString:=Edit8.Text;//cep
                FrmMain.IBTbClientes.Params.Items[7].AsString:=Edit10.Text;//fone
                FrmMain.IBTbClientes.Params.Items[8].AsString:=Edit11.Text;//fax
                FrmMain.IBTbClientes.Params.Items[9].AsString:=Edit12.Text; //celular
                FrmMain.IBTbClientes.Params.Items[10].AsString:=Edit13.Text;//e-mail
                FrmMain.IBTbClientes.Params.Items[11].AsString:=Edit5.Text;//aniversario
                FrmMain.IBTbClientes.Params.Items[12].AsString:=Edit9.Text;//Estado
                FrmMain.IBTbClientes.Params.Items[13].AsInteger:=ComboBox1.ItemIndex+1;//Categoria
                FrmMain.IBTbClientes.ExecSQL;


             End
           else If Opcao='D' Then
               Begin
                  if Application.MessageBox('Deseja Realmente Excluir Este Cliente  ','Exclusão de Cliente',MB_YESNO+MB_ICONQUESTION)=ID_YES then
                     Begin
                       FrmMain.IBTbClientes.Close;
                       FrmMain.IBTbClientes.SQL.Clear;
                       FrmMain.IBTbClientes.SQL.Add('DELETE FROM TB_CLIENTES WHERE ID_CLIENTE='+IntToStr(CodCli));
                       FrmMain.IBTbClientes.ExecSQL;
                     End;
                  end;
        end;
        Restaura;
    End
  Else
    Begin
      ShowMessage('Cliente já cadastrado!');
      Edit1.SetFocus;
    End;  
end;

procedure TFormCadClientes.FormShow(Sender: TObject);
begin
     JaCadastrado:=False;
     With FrmMain do
       Begin
           IBTbClientes.Open;
           IBTbCategoria.Open;
       end;
end;

procedure TFormCadClientes.SpeedButton3Click(Sender: TObject);
begin
   MostrarLabel:=True;
   Application.CreateForm(TFormConsultas,FormConsultas);
   FormConsultas.LbINstrucao.Visible:=True;
   FormConsultas.ShowModal;
   FormConsultas.Free;
   If CodCli <> 0 Then
      Begin
        Restaura;
        FrmMain.IBTbClientes.Close;
        FrmMain.IBTbClientes.Sql.Clear;
        FrmMain.IBTbClientes.SQL.Add('SELECT * FROM TB_CLIENTES WHERE ID_CLIENTE='+IntToStr(CodCli));
        FrmMain.IBTbClientes.Open;
        CarregarEdits;
        Opcao:='D';

       end;

end;

procedure TFormCadClientes.SpeedButton9Click(Sender: TObject);
 var Mail : String;
Begin
 If Edit11.Text<>'' Then
    Begin
      Mail := 'mailto:'+FrmMain.IBTbClientesEMAIL.AsString;
      ShellExecute(GetDesktopWindow,'open',pchar(Mail),nil,nil,sw_ShowNormal);
    end;
end;

procedure TFormCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FrmMain.IBTbClientes.Close;
end;

procedure TFormCadClientes.SpeedButton8Click(Sender: TObject);
begin
 With FrmMain do
     begin
        IBTbClientes.Cancel;
      //  Database.Rollback;
        IBTbClientes.Open;
        IBTbCategoria.Open;
    end;
    Restaura;
end;

procedure TFormCadClientes.SpeedButton4Click(Sender: TObject);
begin
  MostrarLabel:=False;
  Application.CreateForm(TFormConsultas,FormConsultas);
  FormConsultas.LbINstrucao.Visible:=True;
  FormConsultas.LbINstrucao.Caption:='Clique duas vezes no cliente escolhido';
  FormConsultas.ShowModal;
  FormConsultas.Free;
  If CodCli <> 0 Then
      Begin
        FrmMain.IBTbClientes.Close;
        FrmMain.IBTbClientes.Sql.Clear;
        FrmMain.IBTbClientes.SQL.Add('SELECT * FROM TB_CLIENTES WHERE ID_CLIENTE='+IntToStr(CodCli));
        FrmMain.IBTbClientes.Open;
        CarregarEdits;
      end;

end;

procedure TFormCadClientes.SpeedButton2Click(Sender: TObject);
begin
   MostrarLabel:=True;
   Application.CreateForm(TFormConsultas,FormConsultas);
   FormConsultas.LbINstrucao.Visible:=True;
   FormConsultas.LbINstrucao.Caption:='Clique duas vezes no cliente escolhido para alterar ou excluir';
   FormConsultas.ShowModal;
   FormConsultas.Free;
   If CodCli <> 0 Then
      Begin
        Restaura;
        FrmMain.IBTbClientes.Close;
        FrmMain.IBTbClientes.Sql.Clear;
        FrmMain.IBTbClientes.SQL.Add('SELECT * FROM TB_CLIENTES WHERE ID_CLIENTE='+IntToStr(CodCli));
        FrmMain.IBTbClientes.Open;
        CarregarEdits;
        Opcao:='A';

      end;

end;

procedure TFormCadClientes.DBEdit1Exit(Sender: TObject);
begin
  With FrmMain.QryWork  Do
  Begin
    Close;
    SQL.Clear;
    Sql.Add('Select * From Tb_Clientes where Nome='''+Edit1.Text+'''');
    OPen;
    If FrmMain.QryWork.RecordCount>0 Then
      Begin
        ShowMessage('Cliente já cadastrado!');
        Edit1.SetFocus;
        JaCadastrado:=True;
      end
    Else
      JaCadastrado:=False;
  End;
end;

procedure TFormCadClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if SpeedButton5.enabled then
  begin
     Canclose:=false;
     ShowMessage('Finalize a Operação Clicando em "Confirmar" ou "Cancelar"!');
  end;
end;

procedure TFormCadClientes.CarregarEdits;
begin
  Edit1.Text:=FrmMain.IBTbClientesNOME.AsString;
  EDit2.Text:=FrmMain.IBTbClientesFUNCAO.AsString;
  EDit3.Text:=FrmMain.IBTbClientesEMPRESA.AsString;
  EDit4.Text:=FrmMain.IBTbClientesENDERECO.AsString;
  EDit5.Text:=FrmMain.IBTbClientesDATA_NASC.AsString;
  EDit6.Text:=FrmMain.IBTbClientesBAIRRO.AsString;
  EDit7.Text:=FrmMain.IBTbClientesCIDADE.AsString;
  EDit8.Text:=FrmMain.IBTbClientesCEP.AsString;
  EDit9.Text:=FrmMain.IBTbClientesESTADO.AsString;
  EDit10.Text:=FrmMain.IBTbClientesFONE.AsString;
  EDit11.Text:=FrmMain.IBTbClientesFAX.AsString;
  EDit12.Text:=FrmMain.IBTbClientesCELULAR .AsString;
  EDit13.Text:=FrmMain.IBTbClientesEMAIL.AsString;
  FrmMain.IBTbCategoria.Open;
  FrmMain.IBTbCategoria.First;
  While Not FrmMain.IBTbCategoria.Eof Do
   Begin
      ComboBox1.Items.Add(FrmMain.IBTbCategoriaDESCRICAO.AsString);
      FrmMain.IBTbCategoria.Next;
   End;
  ComboBox1.ItemIndex:= FrmMain.IBTbClientesID_CATEGORIA.AsInteger-1;

end;

end.

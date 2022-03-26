unit ubobusu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids,
  Calendar, Buttons, ComCtrls, CheckLst, Provider, DBClient, DBLocal,
  DBLocalB, IBCustomDataSet, IBQuery;
  

type
  Tbobusu = class(TForm)
    Codigo: TLabel;
    Nome: TLabel;
    Panel1: TPanel;
    Label15: TLabel;
    Label1: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    QryTemp: TQuery;
    Table1CODIGO: TIntegerField;
    Table1NOME: TStringField;
    Table1SENHA: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure tcodigoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure vazio_usu;
    procedure InserePerm(Tabela,usuario, Menu,Caption, Permicao:String);
    procedure LimparPermitemp;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Restaura;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
 private
    { Private declarations }
    CodigoUltimo:Integer;
  public
     { Public declarations }
  end;

var
  bobusu: Tbobusu;
  _Result : Boolean;

implementation

uses principal,ubobusuc, DataMod, ubobususenha, clientes;

{$R *.DFM}


procedure Tbobusu.tcodigoExit(Sender: TObject);
var
_var: string[3];
 I:Integer;
 StrSql:String;
begin
   _var:='000';
   Table1.Open;


   if _Result then
      begin







      end
    else
       begin
         vazio_usu;
         
       end;

    Table1.Close;

end;


procedure Tbobusu.Button1Click(Sender: TObject);
Var      //Salvando alterações  e incluindo novos usuários
    StrSql,permissao:String;
    Var I,J,L:Integer;

begin
  Table1.Open;

end;


procedure Tbobusu.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key =  #13 then
         begin
              key:=#0;
              Perform (CM_DialogKey, VK_TAB, 0);
         end;
end;

procedure Tbobusu.vazio_usu;
Var I:Integer;
begin

end;

procedure Tbobusu.InserePerm(Tabela,Usuario,Menu, Caption, permicao: String);
begin
  With QryTemp  Do
     Begin
          Close;
          SQL.Clear;
          SQL.Add ('INSERT INTO '+Tabela +' (USUARIO,MENU,CAPTION, PERMICAO ) VALUES ('''+Usuario+''','''+Menu+''','''+Caption+''','''+Permicao +''')');
          Prepared:=true;
          ExecSQL;
     End;

end;

procedure Tbobusu.LimparPermitemp;
begin
 With QryTemp  Do
     Begin
          Close;
          SQL.Clear;
          SQL.Add ('DELETE FROM PERMITEMP');
          Prepared:=true;
          ExecSQL;
     End;
end;

procedure Tbobusu.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(Tbobusuc,bobusuc);
  bobusuc.ShowModal;
  bobusuc.Free;
  Table1.Locate('CODIGO', frmprincipal.CodUser , [LoPartialKey]  );
end;

procedure Tbobusu.BitBtn1Click(Sender: TObject);
begin
   Table1.Insert;
   Table1CODIGO.AsInteger:=CodigoUltimo+1;  
   Restaura;
end;
procedure Tbobusu.restaura;
Var i:Integer;
    Botao:TBitBtn;
    dbEdt:TdbEdit;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Radio:TDBRadioGroup;
    Componente:TComponent;
    DbCheck:TDBCheckBox ;
begin
   For i:=0 To bobusu.ComponentCount-1 Do
    Begin
     Componente:=(bobusu.Components[i] as TComponent);
     If Componente is TBitBtn Then
       Begin
        Botao:=TBitBtn (Componente);
        Botao.Enabled:= Not Botao.Enabled;
       End;
     If Componente is Tdbedit Then
       Begin
        DbEdt:=Tdbedit (Componente);
        DbEdt.Enabled:= Not DbEdt.Enabled;
        If (DbEdt.Name = 'DBEdit11') And (frmPrincipal.GblPermicao<>'S') Then
            DbEdt.Enabled:= Not DbEdt.Enabled;
       End;
     If Componente is TDBComboBox  Then
       Begin
        DbCombo:=TDBComboBox (Componente);
        DbCombo.Enabled:= Not DbCombo.Enabled;
       End;
     If Componente is TDBNavigator   Then
       Begin
        Nav:=TDBNavigator  (Componente);
        Nav.Enabled:= Not Nav.Enabled;
       End;
     If Componente is TDBRadioGroup  Then
       Begin
        radio:=TDBRadioGroup   (Componente);
        Radio.Enabled:= Not Radio.Enabled;
       End;
     If Componente is TDBCheckBox   Then
       Begin
        DbCheck := TDBCheckBox    (Componente);
        DbCheck.ReadOnly := Not DbCheck.ReadOnly ;
       End;



    End;
 
end;


procedure Tbobusu.BitBtn5Click(Sender: TObject);
begin
  Table1.Cancel;
  Restaura;
end;

procedure Tbobusu.BitBtn4Click(Sender: TObject);
begin
   Table1.Post;
   Restaura;
end;

procedure Tbobusu.BitBtn2Click(Sender: TObject);
begin
    {*****Deletar permissões******}
    {******Usuário supervisor não pode ser deletado*****}
    If   DBEdit2.Text ='SUPERVISOR' Then
         ShowMessage('O usuário SUPERVISOR não pode ser deletado!')
    Else
    Begin
        With QryTemp Do
            Begin
                Close;
                Sql.Clear;
                Sql.Add('DELETE FROM PERMICOES WHERE USUARIO='''+Table1CODIGO.AsString +'''' );
                Prepare;
                ExecSQL;

            End;
        Table1.Edit;
        Table1.Delete;
    End;

end;

procedure Tbobusu.BitBtn3Click(Sender: TObject);
begin
   Table1.Edit;
   Restaura;
end;

procedure Tbobusu.FormShow(Sender: TObject);
begin
   {******Verifica Ultimo usuário cadastrado******}
  Table1.Last;
  CodigoUltimo:=Table1CODIGO.AsInteger;
end;

end.


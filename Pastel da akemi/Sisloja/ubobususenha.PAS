unit ubobususenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Db, DBTables, ExtCtrls, ImgList, ComCtrls, Menus,Registry,
  pngimage, IBCustomDataSet, IBQuery;

type
  Tbobususenha = class(TForm)
    senha: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Nome: TComboBoxEx;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Image1: TImage;
    Panel1: TPanel;
    Shape1: TShape;
    Label3: TLabel;
    IBQuery1: TIBQuery;
    IBQuery1CODIGO: TIntegerField;
    IBQuery1NOME: TIBStringField;
    IBQuery1SENHA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Permissoes;
    Procedure VerificaUser;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NomeChange(Sender: TObject);
    Procedure HabilitandoMenu (Nome:String; Opcao:Boolean);
    Procedure HabilitandoBotao (Nome:String; Opcao:Boolean);
    procedure senhaKeyPress(Sender: TObject; var Key: Char);
  private
    StrSql:String;
    UsrCod:String;
    usuario:TRegistry;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  bobususenha: Tbobususenha;
  _quantas : Integer;
  _v : String;
  Acesso:Boolean;

implementation

uses principal, rotinas, DataMod;

{$R *.DFM}

procedure Tbobususenha.FormCreate(Sender: TObject);
begin
     _quantas:=0;
     _v:=#39;
     Acesso:=False;
 

end;

procedure Tbobususenha.Permissoes;
begin
       With dmPrincipal.QPermissoes  Do
         Begin
           Close;
           Sql.Clear;

           Sql.Add('SELECT * FROM  PERMICOES WHERE USUARIO='+UsrCod);
           Open;
           //dmPrincipal.QPermissoes.First;
{  *********** Habilitando menus e Botões******************}
       If  Nome.ItemsEx.ComboItems[Nome.ItemIndex].Caption = 'SUPERVISOR' Then
            frmprincipal.GblPermicao:='S'
        Else
            FrmPrincipal.GblPermicao:='N';
            
             While  Not dmPrincipal.QPermissoes.Eof Do
                Begin

                   If Copy(dmPrincipal.QPermissoesMenu.AsString,1,2)<> 'Bt' Then
                      If   dmPrincipal.QPermissoesPermicao.AsString ='S' Then
                           HabilitandoMenu(dmPrincipal.QPermissoesMenu.AsString,True)
                      Else
                         HabilitandoMenu(dmPrincipal.QPermissoesMenu.AsString,False)
                   Else
                      If   dmPrincipal.QPermissoesPermicao.AsString ='S' Then
                          HabilitandoBotao(dmPrincipal.QPermissoesMenu.AsString,True)
                      Else
                          HabilitandoBotao(dmPrincipal.QPermissoesMenu.AsString,False);

                  dmPrincipal.QPermissoes.Next;
                End;
         End;



  USUARIO:=TRegistry.Create;
  If Not USUARIO.KeyExists('Software\Microsoft\ApplicationData\Registro\Data') Then
      USUARIO.CreateKey('Software\Microsoft\ApplicationData\USUARIO');

  USUARIO.OpenKey('Software\Microsoft\ApplicationData\USUARIO',False);
  USUARIO.WriteExpandString ('NOME',Nome.ItemsEx.ComboItems[Nome.ItemIndex].Caption );

end;

procedure Tbobususenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key =  #13 then
         begin
              key:=#0;
              Perform (CM_DialogKey, VK_TAB, 0);
         end;
end;

procedure Tbobususenha.FormActivate(Sender: TObject);
begin
        _quantas:=0;
        nome.SetFocus;
end;

procedure Tbobususenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmPrincipal.QPermissoes.Close;
end;

procedure Tbobususenha.VerificaUser;
Var Login:String;
begin

     Login:=  TRIM(Nome.ItemsEx.ComboItems[Nome.ItemIndex].Caption);
     _quantas:=_quantas+1;
     IBQuery1.Close;
     IBQuery1.Sql.Clear;
     IBQuery1.Sql.Add  ('SELECT * FROM USUARIO  WHERE NOME= '''+Login+''' AND SENHA='''+TRIM(senha.Text)+'''');

 //    dmPrincipal.QPermissoes.Sql.Add(StrSql + ' USUARIO.NOME='+_v+Login+_v+' AND USUARIO.SENHA='+_v+TRIM(senha.Text)+_v );
   IBQuery1.Open;

       if (IBQuery1.RecordCount =0) And (Login<>'SUPERVISOR') Then
        begin
          mensagem('Senha Inválida ou usuário sem permissões, favor contatar supervisor!!!');
          nome.SetFocus;
          if _quantas>3 then
            begin
             mensagem('Você não possui Autorização !!!');
             _primeira:='#';
             bobususenha.Close;
             frmprincipal.close;
            end;
        end
       else
           Begin
              UsrCod:= IBQuery1CODIGO.AsString;
              Permissoes;
              //dmPrincipal.QPermissoes.Close;
              _primeira:='X';
              Acesso:=True;
              frmprincipal.StatusBar1.Panels.Items[2].Text := 'USUÁRIO: ' +  Nome.ItemsEx.ComboItems[Nome.ItemIndex].Caption;
              bobususenha.Close;
            End;
          
end;

procedure Tbobususenha.BitBtn1Click(Sender: TObject);
begin
    VerificaUser;
end;

procedure Tbobususenha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=Acesso;
end;

procedure Tbobususenha.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tbobususenha.FormShow(Sender: TObject);
Var QueryUsr:TQuery;
begin
   QueryUsr:=TQuery.Create(bobususenha) ; 
   QueryUsr.DatabaseName:='BancoDados';
   QueryUsr.SessionName:='Session1_3';

   With QueryUsr Do
    Begin
      Close;
      Sql.Clear;
      QueryUsr.SQL.Add('SELECT * FROM USUARIO ORDER BY CODIGO');
      Open;
      First;

      While Not QueryUsr.Eof do
        Begin
         Nome.ItemsEx.AddItem(QueryUsr.FieldByName('NOme').AsString,0,0,0,0,0);
         QueryUsr.Next;
        End;
    End;
  QueryUsr.Free;  
end;

procedure Tbobususenha.NomeChange(Sender: TObject);
begin
  senha.SetFocus;
end;



procedure Tbobususenha.HabilitandoMenu(Nome: String; Opcao: Boolean);
var I,J,L:Integer;
begin
          If  frmprincipal.GblPermicao='S' Then
              Opcao:=True;
          For I:=0 To frmprincipal.MainMenu1.Items.Count-1 Do
            Begin
             IF frmprincipal.MainMenu1.Items.Items[I].Name= Nome Then
                frmprincipal.MainMenu1.Items.Items[I].Enabled := Opcao;
              For J:=0 To frmprincipal.MainMenu1.Items.Items[I].Count-1 Do
                begin
                   If Copy(frmprincipal.MainMenu1.Items.Items[I].Items[J].Name,1,1)<>'N' Then
                     Begin
                        If frmprincipal.MainMenu1.Items.Items[I].Items[J].Name = Nome Then
                           frmprincipal.MainMenu1.Items.Items[I].Items[J].Enabled :=Opcao;
                     End;
                     For L:=0 To  frmprincipal.MainMenu1.Items.Items[I].Items[J].Count-1 Do
                        Begin
                          If frmprincipal.MainMenu1.Items.Items[I].Items[J].Items[L].Name = Nome Then
                            frmprincipal.MainMenu1.Items.Items[I].Items[J].Items[L].Enabled :=Opcao;
                          Next;    
                        End;
                  Next;
                End;
               Next;
            End;

end;

procedure Tbobususenha.HabilitandoBotao(Nome: String; Opcao: Boolean);
Var I:Integer;
begin
   If  frmprincipal.GblPermicao='S' Then
              Opcao:=True;
   For I:=0 To frmprincipal.ToolBar1.ButtonCount-1 Do
     Begin
       If frmprincipal.ToolBar1.Buttons[I].Name = Nome Then
         frmprincipal.ToolBar1.Buttons[I].Enabled :=Opcao;

     End;
end;



procedure Tbobususenha.senhaKeyPress(Sender: TObject; var Key: Char);
begin
    If Odd (GetKeyState(VK_CAPITAL)) Then
       Panel1.Visible:=True
    Else
       Panel1.Visible:=False;   
end;

end.

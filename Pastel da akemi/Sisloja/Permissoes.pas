unit Permissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, DBCtrls, Grids,
  DBGrids;

type
  TFrmPermissoes = class(TForm)
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Edit1: TEdit;
    DSUser: TDataSource;
    TbUser: TTable;
    TbUserCODIGO: TIntegerField;
    TbUserNOME: TStringField;
    TbUserSENHA: TStringField;
    QryTemp: TQuery;
    DBGrid1: TDBGrid;
    DsPermiTemp: TDataSource;
    TbPermissoes: TTable;
    DSPermissoes: TDataSource;
    TbPermissoesINDICE: TIntegerField;
    TbPermissoesUSUARIO: TStringField;
    TbPermissoesMENU: TStringField;
    TbPermissoesPERMICAO: TStringField;
    TbPermissoesCAPTION: TStringField;
    QryTempNOME: TStringField;
    QryTempMENU: TStringField;
    QryTempPERMICAO: TStringField;
    QryTempCAPTION: TStringField;
    QryTempUSUARIO: TStringField;
    Query1: TQuery;
    Label1: TLabel;
    procedure BitBtn7Click(Sender: TObject);
    procedure InserePerm(Tabela,Usuario,Menu, Caption, permicao: String);
    procedure BitBtn5Click(Sender: TObject);
    Function  VerificaUserExiste(Codigo:String):Boolean;
    Procedure InicializaPermissoes;
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    
    { Public declarations }
  end;

var
  FrmPermissoes: TFrmPermissoes;

implementation

uses Principal, Ubobusuc;

{$R *.dfm}

procedure TFrmPermissoes.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(Tbobusuc,bobusuc);
  bobusuc.ShowModal;
  bobusuc.Free;
  TbUser.FindKey ([frmprincipal.CodUser]);
  Edit1.Text:=TbUserNOME.AsString;

  {*****Verificar se user já existe na tabela de permissoes****}
  If Edit1.Text = 'SUPERVISOR' Then
     ShowMessage ('O usuário principal do sistema possuiu todas as permissões!')
  Else
   Begin
       TbPermissoes.Open;
       If VerificaUserExiste(frmprincipal.CodUser) Then
           {****Caso já exista apenas abro a tebela de permissões do usuário******}
           Begin
              TbPermissoes.Filtered:=True;
              TbPermissoes.Filter:= 'USUARIO='+frmprincipal.CodUser;
           End
         Else   {******Caso não exista alimento primeiro a tabela de permissões a partir da permitemp e todas as permissoes iniciais serão N******}
             InicializaPermissoes;
   End;



end;

procedure TFrmPermissoes.InserePerm(Tabela,Usuario,Menu, Caption, permicao: String);
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


procedure TFrmPermissoes.BitBtn5Click(Sender: TObject);
begin
   Close;
end;

function TFrmPermissoes.VerificaUserExiste(Codigo: String): Boolean;
begin
   With Query1 Do
      Begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM PERMICOES WHERE USUARIO='''+Codigo+'''');
          Open;
      End;
    If Query1.RecordCount> 0 Then
       Result:=True
    Else
       Result:=False;

end;

procedure TFrmPermissoes.InicializaPermissoes;
begin
{********Procedure que inicializa a tabela de permissoes a partir da permitemp******}
    With QryTemp  do
         Begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT * FROM PERMITEMP');
             OPen;
          End;
          QryTemp.First;
          While Not QryTemp.Eof do
               Begin
                   TbPermissoes.Insert;
                   TbPermissoesUSUARIO.AsString :=frmprincipal.CodUser;
                   TbPermissoesCAPTION.AsString :=QryTempNome.AsString;
                   TbPermissoesMENU.AsString:=QryTempMENU.AsString;
                   TbPermissoesPERMICAO.AsString :='N';
                   TbPermissoes.Post;
                   QryTemp.Next;
               End;
  TbPermissoes.Close;
  TbPermissoes.Filtered:=True;
  TbPermissoes.Filter:= 'USUARIO='+frmprincipal.CodUser;
  TbPermissoes.Open; 

end;

procedure TFrmPermissoes.BitBtn4Click(Sender: TObject);
begin
   If TbPermissoes.State in [dsEdit, DsInsert] Then
       TbPermissoes.Post;
end;

end.

unit Produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ENTRADA, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  Tfrmprodutos = class(TFrmentrada)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Restaura;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn7Click(Sender: TObject);
  private
     Status:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprodutos: Tfrmprodutos;

implementation

uses DataMod, ConsultaProdutos;

{$R *.DFM}

procedure Tfrmprodutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key =  #13 then
     begin
        key:=#0;
        Perform (WM_NEXTDLGCTL,0,0);
     end;

end;

procedure Tfrmprodutos.DBNavigator1Exit(Sender: TObject);
begin
  dmprincipal.tblProdutosCodigo.Value:=dmprincipal.tblNumProProduto.Value;

end;

procedure Tfrmprodutos.FormShow(Sender: TObject);
begin
  inherited;
      dmPrincipal.tblprodutos.Open;
end;

procedure Tfrmprodutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
          dmPrincipal.tblprodutos.Close;
end;

procedure Tfrmprodutos.DBEdit1Exit(Sender: TObject);
begin
  inherited;
    With DmPrincipal.QWork dO
    Begin

    End;
end;

procedure Tfrmprodutos.BitBtn1Click(Sender: TObject);
var numpro:integer;
begin
  inherited;



    dmPrincipal.tblProdutos.Insert;
    Status:='I';
    With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM NUMPRO');
        Open;
      End;
    numpro:=dmPrincipal.QWork.FieldByName('Produto').AsInteger+1;
    DmPrincipal.tblprodutosCodigo.AsInteger:=numpro;
     With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE NUMPRO SET PRODUTO='+IntToStr(numpro));
        ExecSQL;
       End;

   
    restaura;
end;

procedure TfrmProdutos.restaura;
Var i:Integer;
    Botao:TBitBtn;
    dbEdt:TdbEdit;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Componente:TComponent;
begin
   For i:=0 To frmProdutos.ComponentCount-1 Do
    Begin
     Componente:=(frmProdutos.Components[i] as TComponent);
     If Componente is TBitBtn Then
       Begin
        Botao:=TBitBtn (Componente);
        Botao.Enabled:= Not Botao.Enabled;
       End;
     If Componente is Tdbedit Then
       Begin
        DbEdt:=Tdbedit (Componente);
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
     End;
End;


procedure Tfrmprodutos.BitBtn2Click(Sender: TObject);
begin
  inherited;

    With DmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ITENS WHERE PRODUTO='+ DmPrincipal.tblprodutosCodigo.AsString);
      Open;
      If DmPrincipal.QWork.RecordCount>0 Then
         Begin
           ShowMessage('Já foi efetuada uma venda com este produto! Não vai ser possível removê-lo.');
         End
      Else
        Begin

           dmPrincipal.tblProdutos.Delete;
           Status:='D';
           restaura;
        End;
    End;




end;

procedure Tfrmprodutos.BitBtn5Click(Sender: TObject);
var numpro:integer;

begin
  inherited;

   If (Status='I') Or (Status='D') Then
     begin
         With DmPrincipal.QWork Do
          Begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM NUMPRO');
            Open;
          End;
     numpro:=dmPrincipal.QWork.FieldByName('Produto').AsInteger-1;
     With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE NUMPRO SET PRODUTO='+IntToStr(numpro));
        Prepared :=True;
        ExecSQL;
       End;
    End;
    DmPrincipal.tblprodutos.Cancel;
  //  dmPrincipal.Database1.Commit;
    restaura;
end;

procedure Tfrmprodutos.BitBtn4Click(Sender: TObject);
begin
  inherited;
 If Status<>'D' then
   DmPrincipal.tblprodutos.Post;
  // dmPrincipal.Database1.Commit;
   restaura;
end;

procedure Tfrmprodutos.BitBtn3Click(Sender: TObject);
begin
  inherited;
   DmPrincipal.tblProdutos.Edit;
   Status:='A';
   restaura;
end;

procedure Tfrmprodutos.BitBtn6Click(Sender: TObject);
begin
  inherited;
    dmPrincipal.tblprodutos.Refresh;
end;

procedure Tfrmprodutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   IF BitBtn4.Enabled=True then
     Begin
         ShowMessage('Clique em gravar ou cancelar primeiro');
         CanClose:=False;
     End;
end;

procedure Tfrmprodutos.BitBtn7Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsProdutos,FrmConsProdutos);
   FrmConsProdutos.ShowModal;
   FrmConsProdutos.free;
end;

end.

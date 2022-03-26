unit Vendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ENTRADA, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  Tfrmvendedor = class(TFrmentrada)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBComboBox1: TDBComboBox;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    Procedure Restaura;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
  private
    Status:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvendedor: Tfrmvendedor;

implementation

uses DataMod, Produtos, CONSVENDEDOR;

{$R *.DFM}

procedure Tfrmvendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key =  #13 then
     begin
        key:=#0;
        Perform (WM_NEXTDLGCTL,0,0);
     end;
end;

procedure Tfrmvendedor.FormShow(Sender: TObject);
begin
  inherited;
  dmPrincipal.tblvendedores.Open;
  dMPrincipal.tblnumven.Open;

end;

procedure Tfrmvendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmPrincipal.tblvendedores.Close;
     DmPrincipal.tblnumven.Close;
end;

procedure Tfrmvendedor.SpeedButton7Click(Sender: TObject);
VAR numven:integer;
begin
  inherited;

    dmPrincipal.tblvendedores.Insert;
    Status:='I';
   With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM NUMVEN');
        Open;
      End;
    numven:=dmPrincipal.QWork.FieldByName('VENDEDOR').AsInteger+1;
    DmPrincipal.tblvendedoresCodigo.AsInteger:=numven;
    With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE NUMVEN SET VENDEDOR='+IntToStr(numven));
        Prepared :=True;
        ExecSQL;
       End;   


    restaura;

  
end;

procedure Tfrmvendedor.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  DmPrincipal.tblvendedores.Post;
//  dmPrincipal.Database1.Commit;
  restaura;
end;

procedure Tfrmvendedor.Restaura;
Var i:Integer;
    Botao:TBitBtn;
    SBotao:TSpeedButton;
    dbEdt:TdbEdit;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Componente:TComponent;
begin
   For i:=0 To frmvendedor.ComponentCount-1 Do
    Begin
     Componente:=(frmvendedor.Components[i] as TComponent);
     If Componente is TBitBtn Then
       Begin
        Botao:=TBitBtn (Componente);
        Botao.Enabled:= Not Botao.Enabled;
       End;
     If Componente is TSpeedButton  Then
       Begin
        SBotao:=TSpeedButton(Componente);
        SBotao.Enabled:= Not SBotao.Enabled;
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
        Nav:=TDBNavigator (Componente);
        Nav.Enabled:= Not Nav.Enabled;
       End;
     End;
end;

procedure Tfrmvendedor.SpeedButton8Click(Sender: TObject);
begin
  inherited;

    With DmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM VENDAS WHERE CODVEN='+ DmPrincipal.tblvendedoresCodigo.AsString);
      Open;
      If DmPrincipal.QWork.RecordCount>0 Then
         Begin
           ShowMessage('Já foi efetuada uma venda com este vendedor! Não vai ser possível removê-lo.');
         End
      Else
        Begin
          if MessageDlg('Tem certeza que quer deletar este registro?',mtConfirmation ,[mbYes, mbNo], 0)=mrYes Then
             dmPrincipal.tblvendedores.Delete;

        End;
    End;
end;

procedure Tfrmvendedor.SpeedButton9Click(Sender: TObject);
begin
  inherited;

   DmPrincipal.tblvendedores.Edit;
   Status:='A';
   restaura;
end;

procedure Tfrmvendedor.SpeedButton11Click(Sender: TObject);
var numven:integer;
begin
  inherited;
    If (Status='I') Or (Status='D') Then
     begin
         With DmPrincipal.QWork Do
          Begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM NUMVEN');
            Open;
          End;
       numven:=dmPrincipal.QWork.FieldByName('VENDEDOR').AsInteger-1;
      With DmPrincipal.QWork Do
        Begin
          Close;
          Sql.Clear;
          Sql.Add('UPDATE NUMVEN SET VENDEDOR='+IntToStr(numven));
          Prepared :=True;
          ExecSQL;
         End;
    End;
    DmPrincipal.tblvendedores.Cancel;
 //   dmPrincipal.Database1.Rollback ;
    restaura;

end;

procedure Tfrmvendedor.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  dmPrincipal.tblvendedores.Refresh;
end;

procedure Tfrmvendedor.SpeedButton13Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsVendedor,FrmConsVendedor);
   FrmConsVendedor.ShowModal;
   FrmConsVendedor.free;
end;

end.

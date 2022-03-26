unit Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Vendedor, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmFornecedor = class(Tfrmvendedor)
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    procedure btnfechaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Procedure Restaura;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton14Click(Sender: TObject);
  private

    Status:String;
    Nome:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

uses DataMod, ConsFornecedor;

{$R *.DFM}

procedure TfrmFornecedor.btnfechaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFornecedor.FormShow(Sender: TObject);
begin
  inherited;
   dmPrincipal.tblnumfor.Open;
   DmPrincipal.tblfornecedores.Open;
end;

procedure TfrmFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     DmPrincipal.tblfornecedores.Close;
     dmPrincipal.tblnumfor.Close;
end;

procedure TfrmFornecedor.SpeedButton1Click(Sender: TObject);
VAR numfor:integer;
begin
  inherited;


   dmPrincipal.tblfornecedores.Insert;
   Status:='I';
   With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM NUMFOR');
        Open;
      End;
    numFOR:=dmPrincipal.QWork.FieldByName('FORNEC').AsInteger+1;
    DmPrincipal.tblfornecedoresCodigo.AsInteger:=numfor;
    With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE NUMFOR SET FORNEC='+IntToStr(numFOR));
        ExecSQL;
       End;   


    restaura;
  { dmPrincipal.tblnumfor.Edit;
   dmPrincipal.tblnumforFornec.AsInteger:= dmPrincipal.tblnumforFornec.AsInteger+1;
   dmPrincipal.TblNumFor.Post;
   dmPrincipal.tblfornecedoresCodigo.AsInteger:=dmPrincipal.tblnumforFornec.AsInteger;  }

end;

procedure TfrmFornecedor.Restaura;
Var i:Integer;
    Botao:TBitBtn;
    dbEdt:TdbEdit;
    sBotao:TSpeedButton;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Componente:TComponent;
begin
   For i:=0 To frmFornecedor.ComponentCount-1 Do
    Begin
     Componente:=(frmFornecedor.Components[i] as TComponent);
     If Componente is TBitBtn Then
       Begin
        Botao:=TBitBtn (Componente);
        Botao.Enabled:= Not Botao.Enabled;
       End;
     If Componente is TSpeedButton  Then
       Begin
        SBotao:=TSpeedButton  (Componente);
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
        Nav:=TDBNavigator  (Componente);
        Nav.Enabled:= Not Nav.Enabled;
       End;



    End;
end;

procedure TfrmFornecedor.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  //   restaura;
   With DmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('Select fornecedor from contapag where Fornecedor='''+DmPrincipal.tblfornecedoresNome.AsString+'''');
      Open;
    End;
   If DmPrincipal.Qwork.recordCount>0 Then
     Begin
      ShowMessage('Impossível deletar este Fornecedor, pois o mesmo já esta em contas a pagar');
      DmPrincipal.tblFornecedores.Cancel;
     End
   Else
    DmPrincipal.tblFornecedores.Delete ;
 //   dmPrincipal.Database1.Commit;

end;

procedure TfrmFornecedor.SpeedButton5Click(Sender: TObject);
begin
  inherited;

   DmPrincipal.tblFornecedores.Edit;
   Status:='A';
   Nome:=DBEdit2.text;
   restaura;
end;

procedure TfrmFornecedor.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   If Status='A' Then
      Begin
       With DmPrincipal.QWork Do
         Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT * FROM CONTAPAG WHERE FORNECEDOR='''+ Nome+'''');
          OPen;
          First;
          While Not DmPrincipal.QWork.Eof do
            begin
             DmPrincipal.QWork.Edit;
             DmPrincipal.QWork.FieldByName('Fornecedor').AsString :=DmPrincipal.tblfornecedoresNome.AsString;
             Dmprincipal.QWork.Post;
             DmPrincipal.QWork.Next;
            End;
         End ;
     End;

   DmPrincipal.tblFornecedores.Post;
 //  dmPrincipal.Database1.Commit;
   restaura;
end;

procedure TfrmFornecedor.SpeedButton4Click(Sender: TObject);
var numfor:integer;
begin
  inherited;
    If (Status='I') Or (Status='D') Then
     begin
         With DmPrincipal.QWork Do
          Begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM NUMFOR');
            Open;
          End;
       numfor:=dmPrincipal.QWork.FieldByName('FORNEC').AsInteger-1;
      With DmPrincipal.QWork Do
        Begin
          Close;
          Sql.Clear;
          Sql.Add('UPDATE NUMFOR SET FORNEC='+IntToStr(numfor));
          Prepared :=True;
          ExecSQL;
         End;
    End;
    DmPrincipal.tblfornecedores.Cancel;
//    dmPrincipal.Database1.Rollback ;
    restaura;
   { dmPrincipal.tblFornecedores.Cancel;
     dmPrincipal.tblnumfor.Edit;
     dmPrincipal.tblnumforFornec.AsInteger:= dmPrincipal.tblnumforFornec.AsInteger-1;
     dmPrincipal.TblNumFor.Post;
//     dmPrincipal.Database1.Rollback;
     restaura; }
end;

procedure TfrmFornecedor.SpeedButton6Click(Sender: TObject);
begin
  inherited;
    dmPrincipal.tblFornecedores.Refresh; 
end;

procedure TfrmFornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   iF  SpeedButton3.Enabled=TRue Then
      Begin
        ShowMessage('Clique em gravar ou cancelar primeiro');
        CanClose:=False;
      End;
end;

procedure TfrmFornecedor.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor );
   FrmConsFornecedor.ShowModal;
   FrmConsFornecedor.Free;
end;

end.

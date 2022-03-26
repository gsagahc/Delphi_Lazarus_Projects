unit clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Fornecedor, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ImgList, ComCtrls;

type
  Tfrmclientes = class(TfrmFornecedor)
    DBEdit10: TDBEdit;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    BitBtn7: TBitBtn;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    Procedure restaura;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn7Click(Sender: TObject);
  private
    Status:String;
    Nome:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmclientes: Tfrmclientes;

implementation

uses DataMod, ConsultaCli, Principal, Vendedor;

{$R *.DFM}


procedure Tfrmclientes.FormShow(Sender: TObject);
begin
  inherited;
    dmPrincipal.tblclientes.Open;
    dmPrincipal.tblNumCli.Open;

end;

procedure Tfrmclientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
        dmPrincipal.tblclientes.Close;
        dmPrincipal.tblNumCli.Close;
end;

procedure Tfrmclientes.BitBtn1Click(Sender: TObject);
VAR NumCli:Integer;
begin
 inherited;
  Status:='I';
                      
  dmPrincipal.tblclientes.Open;
  dmPrincipal.tblnumcli.Open ; 
  dmPrincipal.tblclientes.Insert ;
  dmPrincipal.tblclientesDATACAD.Value:=Date;
  dmPrincipal.tblclientesSTATUS.AsString:='N';
  DBCheckBox1.Checked:=False;
  With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM NUMCLI');
        Open;
      End;
    numCli:=dmPrincipal.QWork.FieldByName('CLIENTE').AsInteger;
    dmPrincipal.tblclientesCODIGO.AsInteger:=NumCli;
    With DmPrincipal.QWork Do
      Begin
        Close;
        Sql.Clear;
        Sql.Add('UPDATE NUMCLI SET CLIENTE='+IntToStr(numCli));
        ExecSQL;
       End;


    restaura;
end;

procedure Tfrmclientes.BitBtn2Click(Sender: TObject);
begin
  inherited;
  // restaura;

   With DmPrincipal.QWork Do
    Begin
      Close;
      Sql.Clear;
      Sql.Add('Select Cliente from contarec where Cliente='''+DmPrincipal.tblclientesCODIGO.AsString+'''');
      Open;
    End;
   If DmPrincipal.Qwork.recordCount>0 Then
     Begin
      ShowMessage('Impossível deletar este cliente, pois o mesmo já esta em contas a receber');
      DmPrincipal.tblclientes.Cancel;
     End
   Else
    DmPrincipal.tblclientes.Delete ;
//    dmPrincipal.Database1.Commit;

end;

procedure Tfrmclientes.BitBtn3Click(Sender: TObject);
begin
  inherited;

   DmPrincipal.tblclientes.Edit;
   Status:='A';
   Nome:=DBEdit2.text;
   restaura;
end;

procedure Tfrmclientes.BitBtn4Click(Sender: TObject);
begin
  inherited;
   If Status='A' Then
      Begin
       If dbEdit2.text<>Nome Then
          Begin
             With DmPrincipal.QWork Do
               Begin
                Close;
                Sql.Clear;
                Sql.Add('SELECT CLIENTE FROM VENDAS WHERE CLIENTE='''+ Nome+'''');
                OPen;
                First;
                While Not DmPrincipal.QWork.Eof do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('UPDATE VENDAS SET CLIENTE='''+DmPrincipal.tblclientesNome.AsString+''' WHERE CLIENTE='''+Nome+'''');
                    Prepared :=True;
                    ExecSQL;
                 //DmPrincipal.QWork.Edit;
                 //  DmPrincipal.QWork.FieldByName('Cliente').AsString :=DmPrincipal.tblclientesNome.AsString;
                 //  Dmprincipal.QWork.Post;
                  End;
               End ;

               With DmPrincipal.QWork Do
               Begin
                Close;
                Sql.Clear;
                Sql.Add('SELECT CLIENTE FROM contarec WHERE CLIENTE='''+ Nome+'''');
                OPen;
                First;
                While Not DmPrincipal.QWork.Eof do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('UPDATE contarec SET CLIENTE='''+DmPrincipal.tblclientesNome.AsString+''' WHERE CLIENTE='''+Nome+'''');
                    Prepared :=True;
                    ExecSQL;
                  // DmPrincipal.QWork.Edit;
                  // DmPrincipal.QWork.FieldByName('Cliente').AsString :=DmPrincipal.tblclientesNome.AsString;
                  // Dmprincipal.QWork.Post;
                  End;
               End ;
           End;
    End;
    //if DBCheckBox1.Checked Then
    //   DmPrincipal.tblclientesStatus.AsBoolean:=True
    //Else
    //   DmPrincipal.tblclientesStatus.AsBoolean:=False;
   
   DmPrincipal.tblclientes.post;
 //  dmPrincipal.Database1.Commit;
   restaura;
end;

procedure Tfrmclientes.BitBtn5Click(Sender: TObject);
begin
  inherited;

  dmPrincipal.tblclientes.Cancel;
//  dmPrincipal.Database1.Rollback;
  restaura; 
end;

procedure Tfrmclientes.BitBtn6Click(Sender: TObject);
begin
  inherited;
   dmPrincipal.tblclientes.Refresh;
end;

procedure Tfrmclientes.restaura;
Var i:Integer;
    Botao:TBitBtn;
    dbEdt:TdbEdit;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Radio:TDBRadioGroup;
    Componente:TComponent;
    DbCheck:TDBCheckBox ;
begin
   For i:=0 To frmclientes.ComponentCount-1 Do
    Begin
     Componente:=(frmclientes.Components[i] as TComponent);
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

procedure Tfrmclientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
    iF BitBtn4.Enabled=True Then
      Begin
        ShowMessage('Clique em gravar ou cancelar primeiro');
        CanClose:=False;
      End;
end;

procedure Tfrmclientes.BitBtn7Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCliVend2,FrmConsCliVend2);
  FrmConsCliVend2.ShowModal;
  FrmConsCliVend2.Free;
end;



End.

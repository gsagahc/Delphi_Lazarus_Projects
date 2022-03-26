unit CadChequesRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons,
  IBCustomDataSet, IBTable, IBDatabase;

type
  TFrmCadChequesRec = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    BitBtn4: TBitBtn;
    DBEdit6: TDBEdit;
    BitBtn2: TBitBtn;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit5: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBMemo2: TDBMemo;
    BitBtn1: TBitBtn;
    DBEdit19: TDBEdit;
    BitBtn3: TBitBtn;
    DBEdit20: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    DBCheckBox2: TDBCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure BitBtn1Click1(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure habilita;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    CodBanco:String;
    Status:String;
    { Private declarations }
  public
    Banco:String;
    { Public declarations }
  end;

var
  FrmCadChequesRec: TFrmCadChequesRec;

implementation

uses ConsCliVend, ConsFornecedor, ConsBancos, DataMod, Baixa_titulos,
  ConsultaCli;

{$R *.dfm}

procedure TFrmCadChequesRec.SpeedButton1Click(Sender: TObject);
begin
 Status:='I';
 DBCheckBox1.Checked:=False;
 dmPrincipal.IBTbCheques.Insert;
 habilita;
 dmPrincipal.IBTbChequesCONTAREC.AsInteger :=FrmBaixaTitulos.Codigo;
 dmPrincipal.IBTbChequesPEDIDO.AsInteger:=dmPrincipal.tblcontarecPEDIDO.AsInteger;
 dmPrincipal.IBTbChequesCHQ_TERCEIRO.AsString:='N';
 dmPrincipal.IBTbChequesSTATUS.AsString :='N';
 dmPrincipal.IBTbChequesTIPO.AsString:='R';
End;

procedure TFrmCadChequesRec.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadChequesRec.SpeedButton2Click(Sender: TObject);
Var Cheque:String;
begin
Status:='A';

 if InputQuery('Digite o número do cheque a ser localizado','Número',Cheque) Then
    Begin
    If dmPrincipal.IBTbCheques.Locate('NUMCHEQUE',Cheque,[loPartialKey]) Then
       begin

         Habilita;
         dmPrincipal.IBTransaction1.StartTransaction;
         dmPrincipal.IBTbCheques.Edit;
       End
     Else
       ShowMessage('Cheque não encontrado');

    End;



end;

procedure TFrmCadChequesRec.SpeedButton3Click(Sender: TObject);
Var Cheque:String;
begin
  Status:='D';
  If dmPrincipal.IBTbCheques.RecordCount>0 Then
     Begin
       habilita;
       dmPrincipal.IBTransaction1.StartTransaction;
     End
  Else
     ShowMessage('Não existe cheque para excluir');

End;

procedure TFrmCadChequesRec.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCliVend2,FrmConsCliVend2);
  FrmConsCliVend2.ShowModal;
  FrmConsCliVend2.Free;
  dmPrincipal.IBTbChequesEMITENTE.AsString:=dmPrincipal.tblclientesNOME.AsString;
end;

procedure TFrmCadChequesRec.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCliVend,FrmConsCliVend);

end;

procedure TFrmCadChequesRec.BitBtn1Click1(Sender: TObject);
begin
   Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
   FrmConsFornecedor.Showmodal;
   FrmConsFornecedor.Free;
end;

procedure TFrmCadChequesRec.FormShow(Sender: TObject);
begin
   Banco :='';
end;

procedure TFrmCadChequesRec.BitBtn2Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsBanco, FrmConsBanco);
   FrmConsBanco.Showmodal;
   FrmConsBanco.Free;
   dmPrincipal.IBTbChequesBANCO.AsString:=Banco;  

end;

procedure TFrmCadChequesRec.habilita;
Var Componente:TComponent;
    Indice:Integer;
    SpeedBtn:TSpeedButton;

begin
     For Indice:=0 To FrmCadChequesRec.ComponentCount-1 Do
       Begin
        Componente:=FrmCadChequesRec.Components[Indice] as TComponent;
        If Componente Is TSpeedButton Then
           Begin
             SpeedBtn:=(Componente As TSpeedButton);
             SpeedBtn.Enabled:= Not SpeedBtn.Enabled;
           End;

       End;
   Panel3.Enabled := NOT  Panel3.Enabled;
end;

procedure TFrmCadChequesRec.SpeedButton4Click(Sender: TObject);
begin

  If  (Status='I') Or (Status='A')  Then
    Begin
     If Status='I' Then
        Begin
           dmPrincipal.IBTbChequesMES_EMISSAO.AsString:= FormatdateTime('mm',dmPrincipal.IBTbChequesDt_Emissao.AsDateTime);

        End;

      dmPrincipal.IBTbCheques.Post ;
      dmPrincipal.IBTransaction1.Commit;

    End
  Else
     Begin
      If MessageDlg('Tem certeza que quer deletar este registro?',mtConfirmation,[mbYes,mBNO],0)= mrYES Then
         Begin
           dmPrincipal.IBTbCheques.Delete;
           dmPrincipal.IBTransaction1.Commit;
         End
         Else
           begin
             dmPrincipal.IBTbCheques.Cancel;
             dmPrincipal.IBTransaction1.Rollback;
           End

     End;
   habilita;
end;

procedure TFrmCadChequesRec.SpeedButton5Click(Sender: TObject);
begin
   dmPrincipal.IBTbCheques.Cancel;
   dmPrincipal.IBTransaction1.Rollback;
   habilita;
end;

end.

unit CadCheqRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons;

type
  TFrmCadChequesRec = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    DBEdit5: TDBEdit;
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
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    DBEdit6: TDBEdit;
    BitBtn2: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure BitBtn1Click1(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

uses FrmPrincipal, FrmCadChequesEmitidos, ConsCliVend, ConsFornecedor,
  FrmConsultaBanco;

{$R *.dfm}

procedure TFrmCadChequesRec.SpeedButton1Click(Sender: TObject);
begin
 Status:='I';
 F_Menu.HabilitaCamposEBotoes(FrmCadChequesRec);
 F_Menu.Database1.StartTransaction;
 F_Menu.QCheque.Append ;
 DBCheckBox1.Checked:=False; 
End;

procedure TFrmCadChequesRec.SpeedButton4Click(Sender: TObject);
begin
  F_Menu.HabilitaCamposEBotoes(FrmCadChequesRec);
  If  (Status='I') Or (Status='A')  Then
    Begin
     If Status='I' Then
        Begin
           F_menu.QChequeMes_Emissao.AsString:= FormatdateTime('mm',F_menu.QChequeDt_Emissao.AsDateTime);

        End;
     
      F_Menu.QCheque.Post ;
      F_Menu.Database1.Commit;

    End
  Else
     Begin
      If MessageDlg('Tem certeza que quer deletar este registro?',mtConfirmation,[mbYes,mBNO],0)= mrYES Then
         Begin
           F_Menu.QCheque.Delete;
           F_Menu.Database1.Commit;
         End
         Else
           begin
             F_Menu.QCheque.Cancel;
             F_Menu.Database1.Rollback;
           End

     End;
 F_Menu.QCheque.Close;
 F_Menu.QCheque.Open; 

end;

procedure TFrmCadChequesRec.SpeedButton5Click(Sender: TObject);
begin
   F_Menu.HabilitaCamposEBotoes(FrmCadChequesRec);
   F_Menu.QCheque.Cancel;
   F_Menu.Database1.Rollback;

end;

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
    If F_menu.QCheque.Locate('NUMCHEQUE',Cheque,[loPartialKey]) Then
       begin

         F_Menu.HabilitaCamposEBotoes(FrmCadChequesRec);
         F_Menu.Database1.StartTransaction;
         F_Menu.QCheque.Edit;
       End
     Else
       ShowMessage('Cheque não encontrado');

    End;


end;

procedure TFrmCadChequesRec.SpeedButton3Click(Sender: TObject);
Var Cheque:String;
begin
  Status:='D';
  If F_Menu.QCheque.RecordCount>0 Then
     Begin
       F_Menu.HabilitaCamposEBotoes(FrmCadChequesRec);
       F_Menu.Database1.StartTransaction;
     End
  Else
     ShowMessage('Não existe cheque para excluir');
End;

procedure TFrmCadChequesRec.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCliVend,FrmConsCliVend);
  FrmConsCliVend.Tipo :=1;
  FrmConsCliVend.ShowModal;
  FrmConsCliVend.Free;
end;

procedure TFrmCadChequesRec.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsCliVend,FrmConsCliVend);
  FrmConsCliVend.Tipo :=2;
  FrmConsCliVend.ShowModal;
  FrmConsCliVend.Free;
end;

procedure TFrmCadChequesRec.BitBtn1Click1(Sender: TObject);
begin
   Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
   FrmConsFornecedor.Showmodal;
   FrmConsFornecedor.Free;
end;

procedure TFrmCadChequesRec.DBRadioGroup1Change(Sender: TObject);
begin
  If DBRadioGroup1.ItemIndex =0 Then
     BitBtn1.OnClick:=BitBtn1Click1;
  If DBRadioGroup1.ItemIndex =1 Then
     BitBtn1.OnClick :=BitBtn1Click ;
end;

procedure TFrmCadChequesRec.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConstlaBancos,FrmConstlaBancos);
  FrmConstlaBancos.ShowModal;
  FrmConstlaBancos.Free;
  If Banco <> '' Then
     F_Menu.QChequeBANCO.AsString:=Banco
  Else
    Begin
        ShowMessage('Não existe Banco cadastrado, favor realizar o cadastro de bancos');
        SpeedButton5.Click; 
    End;
end;

procedure TFrmCadChequesRec.FormShow(Sender: TObject);
begin
   Banco :='';
end;

end.

unit Baixa_titulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFrmBaixaTitulos = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    SBCheque: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBChequeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Codigo:Integer;
  end;

var
  FrmBaixaTitulos: TFrmBaixaTitulos;

implementation
Uses DataMod, Gerrec, CadChequesRec;

{$R *.dfm}

procedure TFrmBaixaTitulos.SpeedButton2Click(Sender: TObject);
begin
 If dmPrincipal.Database1.InTransaction Then
    dmPrincipal.Database1.Rollback;

  Close;
end;

procedure TFrmBaixaTitulos.SpeedButton1Click(Sender: TObject);
begin
   
   dmPrincipal.tblcontarec.Post;
 //  dmPrincipal.Database1.Commit;
   frmgerrec.Qwork.Close;
   frmgerrec.QWork.Open;
   Close; 

end;

procedure TFrmBaixaTitulos.SpeedButton3Click(Sender: TObject);
begin
   dmPrincipal.tblcontarec.Cancel;
//   dmPrincipal.Database1.Rollback;
   Close;
end;

procedure TFrmBaixaTitulos.DBCheckBox1Click(Sender: TObject);
begin
   If DBCheckBox1.Checked Then
      SBCheque.Visible:=True
   Else
      SBCheque.Visible:=False;

end;

procedure TFrmBaixaTitulos.FormShow(Sender: TObject);
begin
   If DBCheckBox1.Checked Then
      SBCheque.Visible:=True
   Else
      SBCheque.Visible:=False;
end;

procedure TFrmBaixaTitulos.SBChequeClick(Sender: TObject);
begin
   Application.CreateForm(TFrmCadChequesRec,FrmCadChequesRec);
   dmPrincipal.IBTbCheques.Open;
   dmPrincipal.IBTbCheques.Filter:='TIPO=''R'' AND CONTAREC='+IntToStr(Codigo);
   FrmCadChequesRec.ShowModal;
   FrmCadChequesRec.Free;
end;

end.

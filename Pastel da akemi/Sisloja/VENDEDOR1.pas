unit VENDEDOR1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tfrmvendedor1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBComboBox1: TDBComboBox;
    Panel2: TPanel;
    btnfecha: TBitBtn;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure restaura;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
     Status:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvendedor1: Tfrmvendedor1;

implementation

uses DataMod, CONSVENDEDOR;

{$R *.DFM}

procedure Tfrmvendedor1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key =  #13 then
     begin
        key:=#0;
        Perform (WM_NEXTDLGCTL,0,0);
     end;
end;

procedure Tfrmvendedor1.FormShow(Sender: TObject);
begin
  inherited;
    dmPrincipal.tblvendedores.Open;
    dMPrincipal.tblnumven.Open;

end;

procedure Tfrmvendedor1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmPrincipal.tblvendedores.Close;
     DmPrincipal.tblnumven.Close;
end;


procedure Tfrmvendedor1.BitBtn1Click(Sender: TObject);
begin
   inherited;

    dmPrincipal.tblvendedores.Insert;
    restaura;
end;

procedure Tfrmvendedor1.restaura;
Var i:Integer;
    Botao:TBitBtn;
    dbEdt:TdbEdit;
    DbCombo:TDBComboBox;
    Nav:TDBNavigator;
    Radio:TDBRadioGroup;
    Componente:TComponent;
begin
   For i:=0 To frmvendedor1.ComponentCount-1 Do
    Begin
     Componente:=(frmvendedor1.Components[i] as TComponent);
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
     If Componente is TDBRadioGroup  Then
       Begin
        radio:=TDBRadioGroup   (Componente);
        Radio.Enabled:= Not Radio.Enabled;
       End;



    End;

end;

procedure Tfrmvendedor1.BitBtn2Click(Sender: TObject);
begin
   inherited;
   restaura;
   DmPrincipal.tblvendedores.Delete ;
end;

procedure Tfrmvendedor1.BitBtn3Click(Sender: TObject);
begin
   dmPrincipal.Database1.StartTransaction;
   DmPrincipal.tblvendedores.Edit;
   Status:='A';
   restaura;
end;

procedure Tfrmvendedor1.BitBtn4Click(Sender: TObject);
begin
   inherited;
   DmPrincipal.tblvendedores.Post;
   restaura;
end;

procedure Tfrmvendedor1.BitBtn5Click(Sender: TObject);
begin
   dmPrincipal.tblclientes.Cancel;
   restaura; 
end;

procedure Tfrmvendedor1.BitBtn7Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsVendedor,FrmConsVendedor);
   FrmConsVendedor.ShowModal;
   FrmConsVendedor.free;
end;

end.

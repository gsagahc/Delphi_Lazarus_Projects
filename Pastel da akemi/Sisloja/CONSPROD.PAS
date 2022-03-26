unit ConsProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CONSULTA, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,Db;

type
  Tfrmconsprod = class(Tfrmconsulta)
    cbxOrdem: TComboBox;
    edtConsulta: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnfechaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsprod: Tfrmconsprod;

implementation

uses DataMod, Principal;

{$R *.DFM}

procedure Tfrmconsprod.FormCreate(Sender: TObject);
begin
  inherited;
  cbxOrdem.ItemIndex := 0;
end;

procedure Tfrmconsprod.edtConsultaChange(Sender: TObject);
begin
  inherited;
  if edtConsulta.Text <> '' then
    if  cbxOrdem.Text ='Código' Then
        try
          strtoint(edtConsulta.Text);
          dmPrincipal.tblProdutos.Locate('CODIGO',edtConsulta.Text,[LoPartialKey]);
       Except
          On Econverterror do
           messagedlg('Favor digitar apenas números!',mterror,[mbok],0);
      End     
    Else
      dmPrincipal.tblProdutos.Locate('DESCRICAO',edtConsulta.Text,[LoPartialkey]);
   // Descrição
end;

procedure Tfrmconsprod.FormShow(Sender: TObject);
begin
  inherited;
   dmPrincipal.tblprodutos.Open;
end;

procedure Tfrmconsprod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      frmprincipal.produto:= dmPrincipal.tblprodutosCODIGO.AsInteger;
      dmPrincipal.tblprodutos.Close;
end;

procedure Tfrmconsprod.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  frmprincipal.produto:= dmPrincipal.tblprodutosCODIGO.AsInteger;
end;

procedure Tfrmconsprod.btnfechaClick(Sender: TObject);
begin
  inherited;
   frmprincipal.produto:= dmPrincipal.tblprodutosCODIGO.AsInteger;
end;

end.

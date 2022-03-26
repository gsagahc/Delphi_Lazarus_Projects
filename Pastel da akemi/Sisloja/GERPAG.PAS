unit Gerpag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Buttons, Menus;

type
  Tfrmgerpag = class(TForm)
    PainelTitulo: TPanel;
    PainelControle: TPanel;
    PainelDados: TPanel;
    DBGrid1: TDBGrid;
    btnPrimeiro: TSpeedButton;
    btnultimo: TSpeedButton;
    btnexcluir: TSpeedButton;
    btnlocalizar: TSpeedButton;
    btnretornar: TSpeedButton;
    btnadicionar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton10: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnanteriorClick(Sender: TObject);
    procedure btnproximoClick(Sender: TObject);
    procedure btnultimoClick(Sender: TObject);
    procedure btnlocalizarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnadicionarClick(Sender: TObject);
    procedure btnretornarClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColExit(Sender: TObject);
    Procedure HabilitaBotoes;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    CodVend:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgerpag: Tfrmgerpag;

implementation

uses datamod,rotinas,locadoc,db, ConContaPag, ConsFornecedor;

{$R *.DFM}

procedure Tfrmgerpag.FormShow(Sender: TObject);
begin
  DmPrincipal.TblNumContapag.open;
  dmprincipal.tblcontapag.Open;
  dmprincipal.tblfornecedores.Open;
 
end;

procedure Tfrmgerpag.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   dmprincipal.tblcontapag.close;
   DmPrincipal.TblNumContapag.Close;
end;

procedure Tfrmgerpag.btnPrimeiroClick(Sender: TObject);
begin
   dmprincipal.tblcontapag.first;
end;

procedure Tfrmgerpag.btnanteriorClick(Sender: TObject);
begin
   dmprincipal.tblcontapag.prior;
   if (dmprincipal.tblcontapag.bof) then
      begin
        iniciotabela;
        dmprincipal.tblcontapag.first;
      end;
end;

procedure Tfrmgerpag.btnproximoClick(Sender: TObject);
begin
   dmprincipal.tblcontapag.next;
   if (dmprincipal.tblcontapag.eof) then
      begin
        fimtabela;
        dmprincipal.tblcontapag.last;
      end;
end;

procedure Tfrmgerpag.btnultimoClick(Sender: TObject);
begin
  dmprincipal.tblcontapag.last;
end;

procedure Tfrmgerpag.btnlocalizarClick(Sender: TObject);
begin
 Application.CreateForm(TFrmLocaliza,FrmLocaliza);
 frmlocaliza.showmodal;
 FrmLocaliza.Free;
end;

procedure Tfrmgerpag.btnexcluirClick(Sender: TObject);
begin

  dmprincipal.tblcontapag.delete;
  
end;

procedure Tfrmgerpag.btnadicionarClick(Sender: TObject);
begin

  dmprincipal.tblcontapag.append;
  HabilitaBotoes;
  Application.CreateForm(TFrmConsFornecedor,FrmConsFornecedor);
  FrmConsFornecedor.Showmodal;
  CodVend:= FrmConsFornecedor.Query1.FieldByName('CODIGO').AsInteger ;
  dmPrincipal.tblcontapagFORNECEDOR.AsString:=FrmConsFornecedor.Query1.FieldByName('NOME').AsString ;
  FrmConsFornecedor.Free;

end;

procedure Tfrmgerpag.btnretornarClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmgerpag.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
{  if Key =  #13 then
     DBGRID1.PERFORM(WM_KEYDOWN,VK_TAB,0);}
end;

procedure Tfrmgerpag.DBGrid1ColExit(Sender: TObject);
begin
   if (dbgrid1.selectedfield = dmprincipal.tblcontapagpago) then
      begin
        if (dmprincipal.tblcontapag.state in [dsinsert,dsedit]) then
           begin
             if dmprincipal.tblcontapagpago.asstring='NAO' then
                begin
                 dmprincipal.tblcontapagpagto.clear;
                 dmprincipal.tblcontapag.Post;
                end;
          end;
      end;

end;



procedure Tfrmgerpag.HabilitaBotoes;
Var i:Integer;
    Componente:TComponent;
    Botao:TSpeedButton ;

begin
   For i:=0 To frmgerpag.ComponentCount-1 Do
    Begin
     Componente:=(frmgerpag.Components[i] as TComponent);



    If Componente is TSpeedButton   Then
       Begin
         Botao:=  TSpeedButton (Componente);
         Botao.Enabled := Not Botao.Enabled;
       End;


    End;


end;


procedure Tfrmgerpag.SpeedButton2Click(Sender: TObject);
begin
 dmPrincipal.tblcontapag.Cancel;
 //dmPrincipal.Database1.Rollback;
 HabilitaBotoes;
end;

procedure Tfrmgerpag.SpeedButton3Click(Sender: TObject);
begin
  Try
     dmPrincipal.tblcontapag.Post;
 //    dmPrincipal.Database1.Commit;
     HabilitaBotoes;
  Except
     Begin
       ShowMessage('Verifique se os campos estão preenchidos corretamente');
       dmPrincipal.tblcontapag.Cancel;
//       dmPrincipal.Database1.Rollback;
       HabilitaBotoes;
     End;
  End;
end;

procedure Tfrmgerpag.SpeedButton4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsContaPag ,FrmConsContaPag);
  FrmConsContaPag.ShowModal;
  FrmConsContaPag.Free;
end;

procedure Tfrmgerpag.SpeedButton10Click(Sender: TObject);
begin

  dmPrincipal.tblcontapag.Edit;
  HabilitaBotoes;
end;

end.

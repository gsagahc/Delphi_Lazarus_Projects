unit UInserirServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmInserirServicos = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    EdtNome: TEdit;
    Label1: TLabel;
    RGPrazo: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInserirServicos: TFrmInserirServicos;

implementation
Uses UPrincipal, UServicos;

{$R *.dfm}

procedure TFrmInserirServicos.BitBtn1Click(Sender: TObject);
begin
  if EdtNome.Text<> EmptyStr  then
  Begin
    FrmPrincipal.IBQUtil2.Close;
    FrmPrincipal.IBQUtil2.Sql.Clear;
    FrmPrincipal.IBQUtil2.Sql.Add('SELECT TBSERV_NOME '+
                                  '       FROM TB_SERV  '+
                                  '       WHERE  TBSERV_NOME=:PNOME');
    FrmPrincipal.IBQUtil2.ParamByname('PNOME').asString:=EdtNome.Text;
    FrmPrincipal.IBQUtil2.Open;
    if  FrmPrincipal.IBQUtil2.IsEmpty  then
    Begin
      FrmPrincipal.IBQUtil2.Close;
      FrmPrincipal.IBQUtil2.Sql.Clear;
      FrmPrincipal.IBQUtil2.Sql.Add('insert into TB_SERV  '+
                                   '           (TBSERV_NOME, TBSERV_PRAZO)'+
                                   ' values '+
                                  '            (:TBSERV_NOME, :TBSERV_PRAZO)');
      FrmPrincipal.IBQUtil2.ParamByName('TBSERV_NOME').AsString:=EdtNome.Text;
      if RGPrazo.ItemIndex =0 then
        FrmPrincipal.IBQUtil2.ParamByName('TBSERV_PRAZO').AsString:='N'
      Else
        FrmPrincipal.IBQUtil2.ParamByName('TBSERV_PRAZO').AsString:='S';
      FrmPrincipal.IBQUtil2.ExecSQL;


      Close;
    End
    Else
      ShowMessage('Já existe um item cadastrado com este nome');
  End
  Else
      ShowMessage('Digite o nome do serviço');



end;

procedure TFrmInserirServicos.BitBtn2Click(Sender: TObject);
begin
  EdtNome.Clear;
  RGPrazo.ItemIndex:=0;
end;

procedure TFrmInserirServicos.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.

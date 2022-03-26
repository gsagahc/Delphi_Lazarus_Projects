unit LocalizaCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TFLocCli = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocCli: TFLocCli;

implementation

uses CadClientes, Principal ;


{$R *.dfm}

procedure TFLocCli.DBGrid1DblClick(Sender: TObject);
begin

   FPrincipal.CODCLI := DBGrid1.Columns[0].Field.Text;
   Close;
end;

procedure TFLocCli.Edit1Exit(Sender: TObject);
begin
   Edit1.Clear; 
end;

procedure TFLocCli.Edit2Exit(Sender: TObject);
begin
     Edit2.Clear;
end;

procedure TFLocCli.SpeedButton7Click(Sender: TObject);
Var Sql : String;
begin
     If RadioButton1.Checked Then
        Sql:= 'SELECT COD_CLI,CLIENTE, TELEFONE FROM CLIENTES WHERE CLIENTE LIKE '''+Edit1.Text+ '%''ORDER BY COD_CLI ;'
      Else
        Sql:=  'SELECT COD_CLI,CLIENTE, TELEFONE FROM CLIENTES WHERE TELEFONE LIKE ''%'+Edit2.Text+ '%''ORDER BY COD_CLI ;';


      FPrincipal.ExecuteSqlQCli(Sql);

end;

procedure TFLocCli.FormShow(Sender: TObject);
begin
  FPrincipal.QrClientes.Close;
end;

procedure TFLocCli.RadioButton1Click(Sender: TObject);
begin
   Edit2.Enabled:= Not Edit2.Enabled;
   Edit1.Enabled:= Not Edit1.Enabled;
   Edit1.SetFocus;
end;

procedure TFLocCli.RadioButton2Click(Sender: TObject);
begin
   Edit2.Enabled:= Not Edit2.Enabled;
   Edit1.Enabled:= Not Edit1.Enabled;
   Edit2.SetFocus;
end;

procedure TFLocCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
        Key:= #0;
        DBGrid1DblClick(sender);

      End;
end;

end.

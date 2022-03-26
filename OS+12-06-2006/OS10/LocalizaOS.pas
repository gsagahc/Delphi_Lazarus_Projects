unit LocalizaOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls;

type
  TFLocOS = class(TForm)
    Edit1: TEdit;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    Edit3: TEdit;
    Label3: TLabel;
    RadioButton3: TRadioButton;
    Edit4: TEdit;
    RadioButton4: TRadioButton;
    Label4: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    Function RetornaCodCli:String;
    Function MontaSql:String;
    procedure RadioButton4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocOS: TFLocOS;

implementation

uses CadClientes, Principal ;


{$R *.dfm}

procedure TFLocOS.DBGrid1DblClick(Sender: TObject);
begin

   FPrincipal.CODOS := DBGrid1.Columns[0].Field.Text;
   Close;
end;

procedure TFLocOS.Edit1Exit(Sender: TObject);
begin
   Edit1.Clear; 
end;

procedure TFLocOS.SpeedButton7Click(Sender: TObject);
Begin
 With FPrincipal.QrOS Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add(Montasql);
      Open;
   End;

end;

procedure TFLocOS.FormShow(Sender: TObject);
begin
  FPrincipal.QrClientes.Close;
end;

procedure TFLocOS.RadioButton1Click(Sender: TObject);
begin
   Edit3.Enabled:= False;
   Edit1.Enabled:= True ;
   Edit4.Enabled:= False;
   Edit1.SetFocus;
end;

procedure TFLocOS.RadioButton2Click(Sender: TObject);
begin
   Edit3.Enabled:= True;
   Edit1.Enabled:= False;
   Edit4.Enabled:=False;
   Edit3.SetFocus;
end;

function TFLocOS.RetornaCodCli: String;
Var TextSql:String;
begin
  TextSql:='SELECT COD_CLI,CLIENTE FROM CLIENTES WHERE CLIENTE LIKE '''+Edit1.Text+ '%''ORDER BY COD_CLI ;';
     With FPrincipal.QrClientes Do
        Begin
          Close;
          Sql.Clear;
          Sql.add(TextSql);
          Open;
        End;
   Result:= FPrincipal.QrClientes.FieldByName('Cod_cli').AsString;

end;

Function TFLocOS.MontaSql: String;
Var TextSql, TextSql1, Status , CodCli: String;
begin
   Case RadioGroup1.ItemIndex Of
     0 :Status:='PENDENTE';
     1 :Status:='CONCLUIDO';
    End;
 If RadioButton1.Checked Then
    Begin
      CodCli:=RetornaCodCli;
      TextSql:='SELECT * FROM OS WHERE COD_CLI='''+ CODCLI+''' AND STATUS='''+Status+'''';
    End;
 If RadioButton3.Checked Then
    TextSql:='SELECT * FROM OS WHERE OS='''+ Edit3.Text+''' AND STATUS='''+Status+'''';
 If RadioButton4.Checked Then
    TextSql:='SELECT * FROM OS WHERE  SERIE='''+Edit4.Text+''' AND STATUS='''+Status+'''';

 Result:=TextSql;

end;

procedure TFLocOS.RadioButton4Click(Sender: TObject);
begin
   Edit3.Enabled:= False;
   Edit1.Enabled:= False;
   Edit4.Enabled:=True;
   Edit4.SetFocus;
end;

procedure TFLocOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
      Begin
        Key:= #0;
        DBGrid1DblClick(sender);

      End;
end;

end.

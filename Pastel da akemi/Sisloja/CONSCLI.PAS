unit conscli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ConsProd, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB,
  DBTables;

type
  Tfrmconscli = class(Tfrmconsprod)
    Qwork: TQuery;
    DsQwork: TDataSource;
    QworkCodigo: TIntegerField;
    QworkNome: TStringField;
    QworkCgc: TStringField;
    ChkBoxInativo: TCheckBox;
    Button1: TButton;
    QworkNomeFantasia: TStringField;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    Function TestaNumero(Key:String):Boolean;
    procedure btnfechaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    Tecla:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconscli: Tfrmconscli;

implementation

uses DataMod;

{$R *.DFM}

procedure Tfrmconscli.FormCreate(Sender: TObject);
begin
  inherited;
//  cbxOrdem.ItemIndex := 0;
end;

procedure Tfrmconscli.edtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If Tecla<>'Tab' Then
     If TestaNumero(Key)=False Then
        kEY:='0';


end;

function Tfrmconscli.TestaNumero(Key: String): Boolean;
begin
  //
  IF ComboBox1.Text = 'CODIGO' Then
     Try
       StrToInt(Key);
       Result:=True;
     Except
        On EConvertError Do
          Result:=False;
     End;
 
end;

procedure Tfrmconscli.btnfechaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrmconscli.Button1Click(Sender: TObject);
begin
  inherited;
If edtConsulta.Text <> '' Then
   Begin
     If ComboBox1.Text = 'NOME' Then
        Begin
          With QWork Do
            Begin
             Close;
             Sql.Clear;
             Params.CreateParam(ftInteger,'VARNOME', ptInputOutput);
             If ChkBoxInativo.Checked=True Then
                Sql.Add('select * from clientes WHERE STATUS=''S'' AND UPPER(NOME) LIKE UPPER(:VARNOME) ORDER BY NOME')
             Else
               Sql.Add('select * from clientes WHERE STATUS=''N'' AND UPPER(NOME) LIKE UPPER(:VARNOME) ORDER BY NOME');
             Params.Items[0].AsString:=edtConsulta.Text+'%';
             Open;
            End;
        End;
      If ComboBox1.Text = 'CODIGO' Then
        Begin
           With QWork Do
            Begin
             Close;
             Sql.Clear;
            IF ChkBoxInativo.Checked=True Then
                Sql.Add('select * from clientes WHERE STATUS=''S'' AND CODIGO='''+edtConsulta.Text +''' ORDER BY CODIGO')
             Else
               Sql.Add('select * from clientes WHERE STATUS=''N'' AND CODIGO='''+edtConsulta.Text +'''ORDER BY CODIGO');
               Open;
            End;

        End;
   End;
end;



procedure Tfrmconscli.ComboBox1Change(Sender: TObject);
begin
  inherited;
    With QWork Do
    Begin
     Close;
     Sql.Clear;
     iF ChkBoxInativo.Checked=True Then
        Sql.Add('select * from clientes WHERE STATUS=''S'' ORDER BY '+ ComboBox1.Text  )
     Else
       Sql.Add('select * from clientes WHERE STATUS=''N'' ORDER BY '+ ComboBox1.Text);

     Open;
    End;
end;

END.

unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, DBTables, ExtCtrls;

type
  TForm1 = class(TForm)
    Origem: TDatabase;
    BatchMove1: TBatchMove;
    Destino: TDatabase;
    TbOrigem: TTable;
    TbDestino: TTable;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Shape1: TShape;
    Shape2: TShape;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  TbOrigem.TableName:=ComboBox1.Text;
  TbDestino.TableName:=ComboBox1.Text;
 Try
  BatchMove1.Execute;
 Finally
   ShowMessage('Dados transferidos com sucesso!');
 End;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TbOrigem.OPen;
  TbOrigem.Close;
end;

end.

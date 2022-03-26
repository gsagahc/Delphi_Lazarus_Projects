unit URobo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables,  StdCtrls;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    Database1: TDatabase;
    Query1DATA_NASC: TStringField;
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure Trataerros(Sender: TObject; E: Exception);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
     Pesquiza:Boolean;
     Quantidade:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
begin
  Pesquiza:=True;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Image1.Hint:='Total de Aniversariantes de Hoje: '+INtToStr(Quantidade);

end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TForm1.Trataerros(Sender: TObject; E: Exception);
 var mensagem: string;
    Pos1, Pos2: integer;
begin
   If Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
           showmessage('Data inválida, proceda a correção.')
   else
      if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then
           begin
              Pos1:=Pos('''', E.Message);
              mensagem:=E.Message;
              Delete(mensagem, Pos1, 1);
              Pos2:=Pos('''', mensagem);
              mensagem:=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
              showmessage('É obrigatório o preenchimento do campo '+ mensagem + '.');
           end
   else
      If Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then
           showmessage('Houve violação de Chave.  Registro já incluido.')
   else
      If Pos(UpperCase('Input value'), UpperCase(E.Message)) <> 0 then
           showmessage('Campo preenchido com valor não válido. Proceda a correção.')
   else
      If Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
           showmessage('Hora inválida, proceda a correção.')
   else
      If Pos(UpperCase('master has detail records'), UpperCase(E.Message)) <> 0 then
          ShowMessage('Proibida a Exclusão e Modificação deste Registro, pois ele faz Referência a Outro(s) Registro(s)!')
   else
      If Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then
        Begin
          Pos1:=Pos(':',E.Message);
          Delete(Mensagem,Pos1,1);
          Mensagem:=copy(E.Message,Pos1+2,30);
          showmessage('É obrigatório o preenchimento do campo "'+ mensagem + '".');
        End;
      If Pos(UpperCase('RECORD LOCKED BY ANOTHER USER.'), UpperCase(E.Message)) <> 0 then
         ShowMessage('O Registro está sendo Utilizado por Outro Usuário da Rede. Cancele a Operação e Aguarde a Liberação do Mesmo!')
   else
      showmessage('Ocorreu o seguinte erro: '+UpperCase(E.Message));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnException:=TrataErros;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
Var Data:string;
begin
 Data:=FormatDateTime('dd/mm',Date);
   if pesquiza<>TRue Then
      Begin
         Query1.Close;
         Query1.Sql.Clear;
         Query1.Sql.Add('Select * From Tb_Clientes Where DATA_NASC='''+Data+'''') ;
         Query1.Open;
         Pesquiza:=True;
        If Query1.RecordCount>0 Then
          Begin
            Form1.Visible:=True;
            Quantidade:=Query1.RecordCount;
            Query1.Close;
            Database1.Close;
            Form1.Show;
          end
        Else
          Application.Terminate;
      End;
end;

end.

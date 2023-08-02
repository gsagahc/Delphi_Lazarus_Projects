unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
Var
  TextoIni, TextoFinal:String;
  PosI,PosF,I, Count:Integer;
  Tag:String;
  ListadeTags:TStringList;
Begin
   TextoIni:=Memo1.Text;
   TextoFinal:=Memo1.Text;
   Try
    ListadeTags:= TStringList.Create;
   while Length (TextoFinal)>0 do
    Begin
       if Pos('[',TextoFinal)>0then
          PosI:= Pos('[',TextoFinal);
       if Pos(']', TextoFinal)>0 then
          PosF:=Pos(']',TextoFinal);
       Tag:=Copy(TextoFinal,PosI, (PosF-PosI)+1);
       ListadeTags.Add(Tag);
       TextoIni:=StringReplace(TextoIni,Tag, '* ',[rfReplaceAll, rfIgnoreCase] );
       Delete(TextoFinal, 1, PosF);
    End;
   Memo1.Lines.Add(TextoIni);
   For I:=0 To ListadeTags.Count-1 Do
     Begin
       Memo1.Lines.Add(ListadeTags[I]);
     End
   Finally
    FreeAndNil(ListadeTags);
   End;
end;

end.

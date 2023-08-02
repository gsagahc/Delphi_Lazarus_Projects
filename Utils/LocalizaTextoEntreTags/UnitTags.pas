unit UnitTags;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function LocalizaTextoEntreTags(LeftDelimiter,RightDelimiter, OriginalText:string):TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var ListaTags:TStringList;
    indice:Integer;
begin
  ListaTags:=TStringList.Create;
  ListaTags:= LocalizaTextoEntreTags('[',']',Memo1.Text);
  for indice:=0 to ListaTags.Count-1 do
  begin
    Memo2.Lines.Add(ListaTags[indice]);

  end;
  ListaTags.Free;
end;

function TForm1.LocalizaTextoEntreTags(LeftDelimiter,RightDelimiter, OriginalText:string):TStringList;
Var
  TextoIni, TextoFinal:String;
  PosI,PosF:Integer;
  Tag:String;
  ListadeTags:TStringList;
Begin
   TextoIni:=OriginalText;
   TextoFinal:=OriginalText;
   Try
    ListadeTags:= TStringList.Create;
   while Length (TextoFinal)>0 do
    Begin
       if Pos(LeftDelimiter,TextoFinal)>0then
          PosI:= Pos(LeftDelimiter,TextoFinal);
       if Pos(RightDelimiter, TextoFinal)>0 then
          PosF:=Pos(RightDelimiter,TextoFinal);
       Tag:=Copy(TextoFinal,PosI+1, (PosF-PosI)-1);
       ListadeTags.Add(Tag);

       Delete(TextoFinal, 1, PosF);
    End;
    Result:=ListadeTags;
   Finally

   End;
end;


end.

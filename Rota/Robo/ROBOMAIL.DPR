program RoboMail;

uses
  Forms {$R *.RES},
  URobo in 'URobo.pas'{Form1} ;

begin
 // Application.Initialize;
  Application.ShowMainForm :=False;
  Application.CreateForm(TForm1, Form1);
  Form1.Visible:=False;
  Application.Run;
end.

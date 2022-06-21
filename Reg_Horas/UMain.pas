unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Buttons, UJornada;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DateTimePickerIni: TDateTimePicker;
    DateTimePickerFim: TDateTimePicker;
    DBGrid1: TDBGrid;
    DsConsulta: TDataSource;
    ZConnection1: TZConnection;
    SPBIniciar: TSpeedButton;
    SPBFinalizar: TSpeedButton;
    Timer1: TTimer;
    LbContador: TLabel;
    SPBConsultar: TSpeedButton;
    LblTotHoras: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LabelTempo: TLabel;
    Label3: TLabel;
    TimerBloqueio: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SPBIniciarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SPBFinalizarClick(Sender: TObject);
    procedure persistenciaDeDados;
    procedure SPBConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function IsWorkstationLocked: Boolean;
    procedure TimerBloqueioTimer(Sender: TObject);
  private
    Jornada : TJornada;
    Tempo:TTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
Uses uMensagens;
{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin

end;

{ TJornada }

procedure TFrmPrincipal.SPBIniciarClick(Sender: TObject);

begin
   try
    Jornada:=TJornada.Create;
    Jornada.SetData (FormatDateTime('yyyy-mm-dd', now));
    Jornada.SetHoraIni(FormatDateTime('hh:nn:ss', now));
    LbContador.Caption:='Hora inicial: '+FormatDateTime('hh:nn:ss', Now );
    Tempo:=Time;
    Timer1.Enabled:=True;
    TimerBloqueio.Enabled :=True;
   except

   end;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin

  LabelTempo.Caption:=FormatDateTime('hh:nn:ss', Time-Tempo );
  LabelTempo.Refresh;
end;

procedure TFrmPrincipal.SPBFinalizarClick(Sender: TObject);
begin
  If Timer1.Enabled = True Then
  Begin
    Timer1.Enabled:=False;
    Jornada.SetHoraFim(FormatDateTime('hh:nn:ss', now));
    persistenciaDeDados;
    TimerBloqueio.Enabled :=False;
  end
  Else
    tFrmMensagens.Mensagem('Não existe jornada inicializada','E',[mbOK]) ;
end;

procedure TFrmPrincipal.persistenciaDeDados;
begin
  Jornada.SetTotalHoras(StrToTime(LabelTempo.Caption));
  Jornada.putToDatabase;
  FreeAndNil(Jornada);

end;

procedure TFrmPrincipal.SPBConsultarClick(Sender: TObject);
Var SomaHoras: TTime;
begin

  if (DateTimePickerFim.Date>DateTimePickerIni.Date) then
  begin
    try
      DsConsulta.DataSet:=Jornada.getFromDatabase(FormatDateTime('yyyy-mm-dd',DateTimePickerIni.Date)
                                          ,FormatDateTime('yyyy-mm-dd',DateTimePickerFim.date));
      LblTotHoras.Caption :=' Total horas no período : ' +Jornada.getTotalHorasPeriodo(DateTimePickerIni.Date,
                                                           DateTimePickerFim.Date);
    except on E: Exception do
             tFrmMensagens.Mensagem('Erro ao buscar informações no banco de dados.' +
                              'Mensagem de erro:'+E.Message,'E',[mbOK]) ;

    end;
  end
  else
    tFrmMensagens.Mensagem('A data final precisa ser maior ou igual inicial','E',[mbOK]) ;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  DateTimePickerIni.Date :=Now;
  DateTimePickerFim.Date :=Now+1;
end;

function TFrmPrincipal.IsWorkstationLocked: Boolean;
var
 hDesktop: HDESK;
begin
  {Verifica a cada 10 min se a tela está bloqueada}
  Result := False;
  hDesktop := OpenDesktop('default',0, False,
  DESKTOP_SWITCHDESKTOP);
  if hDesktop <> 0 then
  begin
    Result := not SwitchDesktop(hDesktop);
    CloseDesktop(hDesktop);
  end;
end;
procedure TFrmPrincipal.TimerBloqueioTimer(Sender: TObject);
begin
  {Se a tela estiver bloqueada finaliza o tempo}
 if IsWorkstationLocked  then
   SPBFinalizarClick(self);

end;

end.

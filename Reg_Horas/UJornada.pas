unit UJornada;

interface
Uses
  SysUtils, Variants, Classes, Controls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection,
  Windows, Messages, Graphics,  Forms,
  Dialogs,  DB, StdCtrls;


type
  TJornada= class

  private
    FData    :String;
    FHoraIni :String;
    FHoraFim :String;
    FTotalHoras: TTime;

    public
    procedure SetData(const Value: String);
    procedure SetHoraIni(const Value: String);
    procedure SetHoraFim(const Value: String);
    procedure SetTotalHoras(const Value: TTime);
    function  getHoraIni: TTime;
    function  getHoraFim:TTime;
    function  getTotalHoras: TTime;
    function  getData:String;
    property data :String read FData write FData;
    property horaini :String read FHoraIni write FHoraIni;
    property horafim :String read FHoraFim write FHoraFim;
    property totalhoras :TTime read FTotalHoras write FTotalHoras;
    procedure putToDatabase;
    function getFromDatabase(DataIni, DataFim:String):TZQuery;
    function getTotalHorasPeriodo(DataIni, DataFim:TDate):String;
    function SomaHoras(Hora, HoraSoma :String):String;


end;


implementation
Uses UMain, uMensagens;


{ TJornada }

function TJornada.getData: String;
begin
  Result:= FData; 
end;



function TJornada.getFromDatabase(DataIni, DataFim:String): TZQuery;
Var QueryConsulta:TZQuery;
begin
  try
    QueryConsulta :=TZQuery.Create(FrmPrincipal);
    QueryConsulta.Connection :=FrmPrincipal.ZConnection1;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('SELECT  DATA AS "    DATA   " , '+
                          'HORA_INI AS "   HORA INICIAL   ", '+
                          'HORA_FIM AS "   HORA FINAL   ", '+
                          'TOTAL_TURNO AS "    TOTAL    " '+
                          'FROM HORAS_TRAB '+
                          ' WHERE DATA >=:pDatai AND DATA <= :pDataf '+
                          ' ORDER BY DATA ');
    QueryConsulta.ParamByName('pDatai').AsString:=DataIni;
    QueryConsulta.ParamByName('pDataf').AsString:=DataFim;
    QueryConsulta.Open;
    Result:= QueryConsulta;
   
  except on E: EZDatabaseError do
     tFrmMensagens.Mensagem('Erro ao tentar salvar no banco de dados.' +
                            'Mensagem de erro:'+E.Message,'E',[mbOK]) ;
  end;
end;

function TJornada.getHoraFim: TTime;
begin
  result:=StrToTime(FHoraFim);
end;

function TJornada.getHoraIni: TTime;
begin
  result:= StrToTime(FHoraIni);
end;

function TJornada.getTotalHoras: TTime;
begin
  result:=getHoraFim - getHoraIni;
end;

function TJornada.getTotalHorasPeriodo(DataIni, DataFim:TDate): String ;
Var ZqryTotal:TZQuery;
    Horas:String;

begin
  try
    ZqryTotal :=TZQuery.Create(FrmPrincipal);
    ZqryTotal.Connection :=FrmPrincipal.ZConnection1;
    ZqryTotal.Close;
    ZqryTotal.sql.Add(' SELECT  TOTAL_TURNO  '+
                      ' FROM Horas_trab '+
                      ' WHERE DATA >=:pDatai AND DATA <= :pDataf '+
                      ' ORDER BY DATA ');

    ZqryTotal.ParamByName('pDatai').AsString:=FormatDateTime('yyyy-mm-dd',DataIni);
    ZqryTotal.ParamByName('pDataf').AsString:=FormatDateTime('yyyy-mm-dd',DataFim);
    ZqryTotal.Open;
    ZqryTotal.First;
    Horas:='00:00';
    While not ZqryTotal.Eof do
    begin
      Horas:= SomaHoras(Horas, ZqryTotal.FieldByname('TOTAL_TURNO').AsString);
      ZqryTotal.Next;
    end;
    result:= Horas;
    FreeAndNil(ZqryTotal);
  except on E: Exception do
           tFrmMensagens.Mensagem('Erro ao buscar informações no banco de dados.' +
                              'Mensagem de erro:'+E.Message,'E',[mbOK]) ;
  end;
end;

procedure TJornada.putToDatabase;
var ZQryRegistro:TZQuery;
begin
  try
    ZQryRegistro :=TZQuery.Create(FrmPrincipal);
    ZQryRegistro.Connection :=FrmPrincipal.ZConnection1;
    ZQryRegistro.SQL.Clear;
    ZQryRegistro.SQL.Add('INSERT INTO Horas_trab '+
                         '(DATA, HORA_INI, HORA_FIM, '+
                         ' TOTAL_TURNO)  '+
                         ' VALUES (:pData, :pHoraIni, '+
                         ' :pHorafim, :pTotalHoras)');

    ZQryRegistro.ParamByName('pData').asString:=getData;
    ZQryRegistro.ParamByName('pHoraIni').AsString:=TimeToStr(getHoraini);
    ZQryRegistro.ParamByName('pHorafim').AsString:=TimeToStr(getHorafim);
    ZQryRegistro.ParamByName('pTotalHoras').AsString:=TimeToStr(getTotalhoras) ;
    ZQryRegistro.ExecSQL;
    FreeAndNil(ZQryRegistro);
  except
       on E: Exception do
         tFrmMensagens.Mensagem('Erro ao tentar salvar no banco de dados.' +
                                'Mensagem de erro:'+E.Message,'E',[mbOK]) ;
  end;
end;

procedure TJornada.SetData(const Value: String);
begin
  FData := Value;
end;

procedure TJornada.SetHoraFim(const Value: String);
begin
  FHoraFim := Value;
end;

procedure TJornada.SetHoraIni(const Value: String);
begin
  FHoraIni := Value;
end;

procedure TJornada.SetTotalHoras(const Value: TTime);
begin

end;
function TJornada.SomaHoras(Hora, HoraSoma :String):String;
var hh, mm :integer;
    vHora, vMinuto :integer;
begin
  hh:= StrToInt(Copy(Hora, 1, 2)) + StrToInt(Copy(HoraSoma, 1, 2));
  mm:= StrToInt(Copy(Hora, 4, 2)) + StrToInt(Copy(HoraSoma, 4, 2));

  vMinuto:= mm mod 60;
  vHora:=   hh + (mm div 60);

  Result:= FormatFloat('00:', vHora) + FormatFloat('00', vMinuto);
end;

end.

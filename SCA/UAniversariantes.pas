unit UAniversariantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  IBX.IBSQL, Vcl.ComCtrls;

type
  TFrmAniversariantes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BtnFechar: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    DsAniversariantes: TDataSource;
    IBQueryAniversariantes: TIBQuery;
    IBQueryAniversariantesTBPRT_NOME: TIBStringField;
    IBQueryAniversariantesTBPRT_ENDERECO: TIBStringField;
    IBQueryAniversariantesTBPRT_NUMERO: TSmallintField;
    IBQueryAniversariantesTBPRT_COMPLEMENTO: TIBStringField;
    IBQueryAniversariantesTBPRT_EMAIL: TIBStringField;
    IBQueryAniversariantesTBPRT_BAIRRO: TIBStringField;
    IBQueryAniversariantesTBPRT_CIDADE: TIBStringField;
    IBQueryAniversariantesTBPRT_CELULAR: TIBStringField;
    IBQueryAniversariantesTBPRT_NASCIMENTO: TDateField;
    IBQueryAniversariantesTBPRT_ANIVERSARIO: TIBStringField;
    StatusBar1: TStatusBar;
    IBSQL1: TIBSQL;
    procedure FormShow(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure queryaniversario(tipo:string);
    procedure contarregistros;
    procedure BitBtn1Click(Sender: TObject);
  private
     StrData:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAniversariantes: TFrmAniversariantes;

implementation
Uses UPrincipal,UImpressaoAniv;

{$R *.dfm}

procedure TFrmAniversariantes.BitBtn1Click(Sender: TObject);
begin
  IBQueryAniversariantes.DisableControls;
  Application.CreateForm(TFrmImpressaoAniv, FrmImpressaoAniv);
  FrmImpressaoAniv.RLReport1.PreviewModal;
  FrmImpressaoAniv.Free;
  IBQueryAniversariantes.EnableControls;
end;

procedure TFrmAniversariantes.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAniversariantes.contarregistros;
begin
  IBSQL1.Close;
  IBSQL1.SQL.CLEAR;
  IBSQL1.SQL.Add('SELECT COUNT(*)'+
                 ' FROM TB_PRT '+
                 ' WHERE TBPRT_ANIVERSARIO LIKE '+StrData);
  IBSQL1.ExecQuery;
  StatusBar1.Panels.Items[1].Text :=IBSQL1.FieldByName('COUNT').AsString;


end;

procedure TFrmAniversariantes.FormShow(Sender: TObject);
begin
  queryaniversario('MES');
  contarregistros;
end;

procedure TFrmAniversariantes.queryaniversario(tipo: string);
begin
  if tipo='MES' then
    StrData:='''%/'+FormatDateTime('MM', now)+'%''';
  if Tipo='DIA' then
    StrData:=''''+FormatDateTime('dd/MM', now)+'%''';

  IBQueryAniversariantes.Close;
  IBQueryAniversariantes.Sql.Clear;
  IBQueryAniversariantes.Sql.Add('SELECT TBPRT_NOME,'+
                                       ' TBPRT_ENDERECO,'+
                                       ' TBPRT_NUMERO,'+
                                       ' TBPRT_COMPLEMENTO,'+
                                       ' TBPRT_EMAIL,'+
                                     	 ' TBPRT_BAIRRO,'+
                                       ' TBPRT_CIDADE,'+
                                       ' TBPRT_CELULAR,'+
                                       ' TBPRT_NASCIMENTO,'+
                                       ' TBPRT_ANIVERSARIO'+
                                       ' FROM TB_PRT '+
                                       ' WHERE TBPRT_ANIVERSARIO LIKE '+StrData);

 IBQueryAniversariantes.Open;
end;

procedure TFrmAniversariantes.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex =0  then
  begin
    queryaniversario('MES');
    contarregistros;
  end;
  if RadioGroup1.ItemIndex =1  then
  begin
      queryaniversario('DIA');
      contarregistros;
  end;

end;

end.

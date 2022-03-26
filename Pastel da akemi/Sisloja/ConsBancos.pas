unit ConsBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables;

type
  TFrmConsBanco = class(TForm)
    DBGrid1: TDBGrid;
    QryBancos: TQuery;
    DSBancos: TDataSource;
    QryBancosNOME: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsBanco: TFrmConsBanco;

implementation
Uses Principal, DataMod, CadChequesRec;

{$R *.dfm}

procedure TFrmConsBanco.DBGrid1DblClick(Sender: TObject);
begin
   FrmCadChequesRec.Banco:= TRim(QryBancosNOME.AsString);
   Close;
end;

end.

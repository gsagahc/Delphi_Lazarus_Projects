program Project1;

uses
  Forms,
  UPedido in 'UPedido.pas' {FrmImprePedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Impress�o manual de pedidos';
  Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
  Application.Run;
end.

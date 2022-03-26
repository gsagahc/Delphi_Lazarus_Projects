unit frmclientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Fornecedor, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tfrmcliente = class(TfrmFornecedor)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcliente: Tfrmcliente;

implementation

uses DataMod;

{$R *.DFM}

end.

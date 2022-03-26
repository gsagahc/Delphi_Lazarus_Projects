unit Selpro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SELREL, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Quickrpt;

type
  Tfrmselpro = class(Tfrmselrel)
    edtcodigode: TEdit;
    edtcodigoate: TEdit;
    Edtnomede: TEdit;
    Edtnomeate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    Query: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure LimitaRelatorio;
    procedure btntelaClick(Sender: TObject);
    procedure btnimprClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmselpro: Tfrmselpro;

implementation

uses Relpro;

//uses Relpro;

{$R *.DFM}

procedure Tfrmselpro.FormCreate(Sender: TObject);
begin
  inherited;
  Frelato := frmrelpro;
end;

procedure Tfrmselpro.LimitaRelatorio;
var
  strliga: string;
begin
  inherited;
  strliga := 'where ';
  with frelato do begin
//       FQuickRep := Quickrep;
       Query.Close;
       with Query.Sql do begin
       clear;
       add('select p.*,f.nome from produtos p');
       add('left outer join fornecedores f');
       add('on p.fornecedor=f.codigo');
       if edtcodigode.text <> '' then
       try
         strtoint(edtcodigode.text);
         add(strliga+'p.codigo >= '+edtcodigode.text);
         strliga := 'and ';
       except
         on EconvertError do;
       end;
       if edtcodigoate.text <> '' then
       try
         strtoint(edtcodigoate.text);
         add(strliga+'p.codigo <= '+edtcodigoate.text);
         strliga := 'and ';
       except
         on EconvertError do;
       end;
       if edtnomede.text <> '' then begin
          add(strliga+'p.descricao >= '''+edtnomede.text+'"');
          strliga := 'and ';
       end;
       if edtnomeate.text <> '' then
          add(strliga+'p.descricao <= '''+
          edtnomeate.text+'zzz"');
       case radiogroup1.ItemIndex of
          0 : add('order by p.codigo');
          1 : add('order by p.descricao,p.codigo');
          2 : add('order by p.fornecedor,p.codigo');
       end;
  end;
  Query.Open;
 end;
end;

procedure Tfrmselpro.btntelaClick(Sender: TObject);
begin
//  inherited;
  LimitaRelatorio;
//  Fquickrep.Preview;
end;

procedure Tfrmselpro.btnimprClick(Sender: TObject);
begin
  inherited;
  LimitaRelatorio;
  FQuickrep.print;
end;

end.


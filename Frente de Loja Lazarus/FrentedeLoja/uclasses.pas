unit uClasses;

{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil,  Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, ZConnection, ZDataset, db,
  uMensagens, ZClasses, ZMessages;

type

  { TProdutos }

  TProdutos=class
    Nome:String;
    Descricao:String;
    CodBarras:String;
    Aliquota:String;
    PrecoCompra:String;
    PrecoVendas:String;
    Fornecedor:String;
    procedure Insert(zQuery:TZQuery; Produto:TProdutos);
    function  consulta(zQuery:TZQuery; lcodBarras:String):TProdutos;

  end;
type

    { TVendedores }

    TVendedores=class
    Nome:String;
    Login:String;
    Senha:TBlobData;
    procedure Insert(zQuery:TZQuery; Vendedor:TVendedores );
    function  consulta(zQuery:TZQuery; lLogin:String):TVendedores;

  end;
    function cript(Acao, Valor: String): String;

implementation


function cript(Acao, Valor: String): String;
Label Fim;
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Valor = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  //  KEY = Esta será a sua chave de criptografia
  Key := 'IHNG91LNCN2EXSKPCA6OE0GDLE4UNAOL0737S0JDMD0DV2IA4X';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Acao = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Valor) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Valor[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
      begin
        KeyPos := KeyPos + 1
      end
      else
      begin
        KeyPos := 1;
      end;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else
  begin
    if (Acao = UpperCase('D')) then
    begin
      OffSet := StrToInt('$' + copy(Valor,1,2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$' + copy(Valor,SrcPos,2));
        if (KeyPos < KeyLen) Then
        begin
          KeyPos := KeyPos + 1;
        end
        else
        begin
          KeyPos := 1;
        end;
        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= OffSet then
        begin
          TmpSrcAsc := 255 + TmpSrcAsc - OffSet;
        end
        else
        begin
          TmpSrcAsc := TmpSrcAsc - OffSet;
        end;
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Valor));
    end;
  end;
  Result:= Dest;
  Fim:
end;

{ TVendedores }

procedure TVendedores.Insert(zQuery: TZQuery; Vendedor:TVendedores );
Var
    Msg:String;
begin

  zQuery.Close;
  zQuery.SQL.Clear;
  zQuery.sql.add('INSERT INTO TB_USUARIO (TB_UsuarioNome,'+
                                         'TB_UsuarioLogin,'+
                                         'TB_UsuarioSenha)'+
                 'VALUES                 (:pNome,'+
                                         ':pLogin,'+
                                         ':pSenha)');
  zQuery.ParamByName('pNome').AsString:=Vendedor.Nome ;
  zQuery.ParamByName('pLogin').AsString:=Vendedor.Login;
  zQuery.ParamByName('pSenha').AsString := cript('C',Vendedor.Senha);
  try
    zQuery.ExecSQL;
  except
  on
     E: Exception do
      begin
        Msg:=E.Message;
        TFormMensagens.Mensagem('Erro no cadastro de vendedores. Erro:'+ #13#10 + Msg,'Erro' ,'E',[mbOK]);
      end;

  end;

end;

function TVendedores.consulta(zQuery: TZQuery;lLogin:String):TVendedores;
var lVendedor:TVendedores;
    Msg:String;
begin
  zQuery.Close  ;
  zQuery.sql.Clear;
  zQuery.sql.add('SELECT * FROM TB_USUARIO WHERE TB_UsuarioLogin=:pLogin');
  zQuery.ParamByName('pLogin').AsString:=lLogin ;
  try
    zQuery.open ;
    if not zQuery.IsEmpty then
    begin
      lVendedor:=TVendedores.Create ;
      lVendedor.Nome:=zQuery.FieldByName('TB_UsuarioNome').AsString;
      lVendedor.login:=zQuery.FieldByName('TB_UsuarioLogin').AsString;
      if lVendedor.login='MASTER' then
        lVendedor.Senha:=zQuery.FieldByName('TB_UsuarioSenha').AsString
      Else
        lVendedor.senha:=cript('D',zQuery.FieldByName('TB_UsuarioSenha').AsString);
      Result:=lVendedor;
    end
    else
      Result:=nil;
   except
   on
     E: Exception do
      begin
        Msg:=E.Message;
        TFormMensagens.Mensagem('Erro ao localizar vendedor. Erro:'+ #13#10 + Msg,'Erro' ,'E',[mbOK]);
      end;
  end;

end;


{ TProdutos }

procedure TProdutos.Insert(zQuery: TZQuery; Produto: TProdutos);
var
  Msg:String;
begin
  zQuery.Close;
  zQuery.SQL.Clear;
  zQuery.sql.add('INSERT INTO TB_USUARIO (TB_ProdutosNome,'+
                                         'TB_ProdutosDescricao,'+
                                         'TB_ProdutosCodBarras,'+
                                         'TB_ProdutosAliquota,'+
                                         'TB_ProdutosPrecoCompra,'+
                                         'TB_ProdutosPrecoVendas,'+
                                         'TB_Fornecedores_idTB_Fornecedores)'+
                 'VALUES                 (:pNome,'+
                                         ':pDescricao,'+
                                         ':pCodBarras,'+
                                         ':pAliquota,'+
                                         ':pPrecoCompra,'+
                                         ':pPrecoVenda,'+
                                         ':pidFornecedor)');
  zQuery.ParamByName('pNome').AsString:=Produto.Nome ;
  zQuery.ParamByName('pDescricao').AsString:=Produto.Descricao  ;
  zQuery.ParamByName('pCodBarras').AsString:=Produto.CodBarras   ;
  zQuery.ParamByName('pAliquota').AsString:=Produto.Aliquota   ;
  zQuery.ParamByName('pPrecoCompra').AsString:=Produto.PrecoCompra   ;
  zQuery.ParamByName('pPrecoVenda').AsString:=Produto.PrecoVendas   ;
  zQuery.ParamByName('pidFornecedor').AsString:=Produto.Fornecedor;

  try
    zQuery.ExecSQL;
  except
  on
     E: Exception do
      begin
        Msg:=E.Message;
        TFormMensagens.Mensagem('Erro no cadastro de vendedores. Erro:'+ #13#10 + Msg,'Erro' ,'E',[mbOK]);
      end;

  end;

end;

function TProdutos.consulta(zQuery: TZQuery; lcodBarras: String): TProdutos;
begin
  //
end;

end.


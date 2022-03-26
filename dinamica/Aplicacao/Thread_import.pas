unit Thread_import;

interface

uses
  Classes,SysUtils, Types,  QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QButtons, QComCtrls,IBDatabase, IBQuery,DB   ,
  IBCustomDataSet, IBTable, Provider, DBClient, DBLocal, DBLocalI,
  IBUpdateSQL;

type
  Importacaotxt = class(TThread)
  private
    Arquivo:TextFile;
    Texto:String;
    Result:Boolean;
    { Private declarations }
  protected
    procedure Execute; override;
    Function Verifica_arquivo(Caminho:String):Boolean;
  end;

implementation
uses Tela_Principal, Importacao;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Importacaotxt.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Importacaotxt }
{===============================================
Função para importação da dados no aqruivo Txt
 Esta função lê o arquivo Txt salvando todos os itens na
tabela de importação Clientes.
================================================}
procedure Importacaotxt.Execute;
var I,J:integer;   // Contadores
    inserir:Boolean; // Variável para ligar/desligar inserir.
    Data:String;      // Variável para receber data de importação do arquivo
    CPF:String; //variável String para verificar se um mesmo cliente já foi importado.
    NewCli:Boolean;   // variável para compara se cliente já cadasrtrado
begin
  CPF:='0'; //inicializando variável CPF

  Frmimportacao.SpeedButton1.Enabled :=False;
  Frmimportacao.Label1.Visible :=True;
  Frmimportacao.Caption:=FrmPrincipal.Caminho;

  AssignFile( Arquivo, FrmPrincipal.Caminho);
  Reset(arquivo);
  Texto:='';
  FrmPrincipal.IBTb_clientes.Open;
  FrmPrincipal.IBTb_Cad_Parc.Open;
  Data:=FormatDateTime('mm/dd/yyyy',(Date));
  I:=0;
  J:=0;

 If  Verifica_arquivo(FrmPrincipal.caminho) Then
   Begin
    NewCli:=False;
    While not EOF(Arquivo) do
      Begin
          J:=J+1;
          Frmimportacao.ProgressBar1.Position:=j;
          If J>1000 then J:=0;

          ReadLn(Arquivo, Texto);
          Texto:=Trim(texto);

          If Length(Trim(Texto))=11 then     // Testa se linha contem CPF para inserir novo registro.
             Begin
                 Try
                   Begin
                    StrToFloat(Trim(Texto));
                    Result:=true;

                    if CPF <>  Trim(texto) then   //Verificar se CPF já carregado.
                      begin
                        CPF:=Trim(Texto);
                        NewCli:=True;
                      End
                    Else
                       NewCli:=False;

                   End;
                 except
                   On EConvertError Do
                     Begin
                      result:=False ;
                    
                     End;

                  end;

             End;

      //cadastro
        If result=True Then
        begin
          FrmPrincipal.IBTb_clientes.Insert;
          FrmPrincipal.IBTb_Cad_Parc.Insert;
          result:=False;
          I:=1;
        end;

        If I<=23 then
         Begin

           IF NewCli=True then
             Begin
               If I=1 Then  FrmPrincipal.IBTb_clientesCPF_CLI.AsString :=Trim(Texto);
               If I=2 then  FrmPrincipal.IBTb_clientesNOME_CLI.AsString:=Texto;
               If I=3 Then  FrmPrincipal.IBTb_clientesENDERECO_CLI.AsString:=Texto;
               If I=4 Then  FrmPrincipal.IBTb_clientesBAIRRO_CLI.AsString:=texto;
               If I=5 then  FrmPrincipal.IBTb_clientesCIDADE_CLI.AsString:=Texto ;
               If i=6 Then  FrmPrincipal.IBTb_clientesCEP_CLI.AsString :=texto;
               If i=7 then  FrmPrincipal.IBTb_clientesUF_CLI.AsString:=Texto;
               if I=15 Then FrmPrincipal.IBTb_clientesEND_COM_CLI.AsString :=Texto;
               If i=16 Then FrmPrincipal.IBTb_clientesBAIRRO_COM_CLI.AsString :=texto;
               If i=17 then FrmPrincipal.IBTb_clientesCIDADE_COM_CLI.AsString:=texto;
               If i=19 Then FrmPrincipal.IBTb_clientesUF_COM_CLI.AsString := texto;
               If i=20 Then FrmPrincipal.IBTb_clientesFONE1_CLI.AsString:=texto;
               If i=21 Then FrmPrincipal.IBTb_clientesFONE2_CLI.AsString :=texto;
               If i=22 then FrmPrincipal.IBTb_clientesCONTATO_CLI.AsString :=Texto;
             End;
           If I=8 Then  FrmPrincipal.IBTb_Cad_ParcNUM_CARNET.AsString :=Texto;   //Importar para  CAD_COMPRAS
           If i=9 Then  FrmPrincipal.IBTb_Cad_ParcPARCELA_DE_PARCELAS.AsInteger :=StrToInt(Texto);  //IMportar para CAD_COMPRAS
           if i=10 Then FrmPrincipal.IBTb_Cad_ParcDATA_COMPRA.AsDateTime :=StrToDate(trim(Texto));   //IMPORTAR PARA CAD_COMPRAS
           If I=11 Then FrmPrincipal.IBTb_Cad_ParcVENC_PARCE.AsDateTime :=StrToDatetime(trim(texto));   //IMPORTAR PARA CAD_COMPRAS
           If I=12 then FrmPrincipal.IBTb_Cad_ParcVALOR_PARCE.AsString :=(trim(texto)); //IMPORTAR PARA CAD_COMPRAS
           If I=13 Then FrmPrincipal.IBTb_Cad_ParcTIPO_PAG.AsString:=texto;    //IMPORTAR PARA CAD_COMPRAS

           if i=18 then FrmPrincipal.IBTb_Cad_ParcNUM_PARCELAS.AsInteger := StrToint(texto);  //IMPORTAR PARA CAD_COMPRAS

                        FrmPrincipal.IBTb_Cad_ParcESTATUS_PARCE.AsInteger:=0;    //IMPORTAR PARA CAD_COMPRAS
                        FrmPrincipal.IBTb_Cad_ParcCPF_CLI.AsString:= CPF;    //IMPORTAR PARA CAD_COMPRAS
                        FrmPrincipal.IBTb_Cad_ParcCOD_LOJA.AsInteger:=1;  // 1 Significa EXOTICA
           I:=I+1;                          
         end
         Else
           begin
              I:=0;
              FrmPrincipal.IBTb_clientes.append;
              FrmPrincipal.IBTb_Cad_Parc.Append;
              NewCli:=False;
            end;











        End;

           FrmPrincipal.IBQGeral.close;
           FrmPrincipal.IBQGeral.SQL.Clear;
           FrmPrincipal.IBQGeral.SQL.Add('insert into importacoes (nome_arquivo,data) values ('''+FrmPrincipal.Caminho+''','''+Data+''');')  ;

           FrmPrincipal.IBQGeral.Open;
           FrmPrincipal.IBTransaction1.Commit;

           Frmimportacao.ProgressBar1.Position:=0;
           Frmimportacao.Label1.Caption :='IMPORTAÇÃO CONCLUÍDA';
           Frmimportacao.SpeedButton1.Visible :=False;
           Frmimportacao.SpeedButton2.Visible :=True;


      
     End
    Else
     Begin
       Frmimportacao.SpeedButton1.Visible :=False;
       Frmimportacao.SpeedButton2.Visible :=True;

     End;
     
  { Place thread code here }
end;
   {
   Função que verifica se um mesma arquivo já foi importado
   para a tabela Clientes
   }
function Importacaotxt.Verifica_arquivo(Caminho: String): Boolean;
begin
  FrmPrincipal.IBQGeral.Close;
  FrmPrincipal.IBQGeral.SQL.Clear;
  FrmPrincipal.IBQGeral.Sql.add ('select * from importacoes where nome_arquivo='''+FrmPrincipal.Caminho+''';');
  FrmPrincipal.IBQGeral.Open;

  If FrmPrincipal.IBQGeral.RecordCount > 0 Then
    Begin
       Frmimportacao.Label1.Caption :='ARQUIVO JÁ IMPORTADO';
       Result:=False
    End
  else
      Result:=True;


end;

end.
 
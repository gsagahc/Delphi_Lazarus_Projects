object FPrincipal: TFPrincipal
  Left = -4
  Top = -4
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ordem de servi'#231'o 1.0'
  ClientHeight = 534
  ClientWidth = 800
  Color = clSilver
  Constraints.MinHeight = 580
  Constraints.MinWidth = 808
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 184
    Top = 200
    Width = 475
    Height = 56
    Caption = 'Conex'#227'o Inform'#225'tica'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -48
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 184
    Top = 197
    Width = 475
    Height = 56
    Caption = 'Conex'#227'o Inform'#225'tica'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -48
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 515
    Width = 800
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 56
    object OS1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes - '
        ShortCut = 119
        OnClick = Clientes1Click
      end
      object NovaOS1: TMenuItem
        Caption = 'Nova OS -'
        ShortCut = 118
        OnClick = NovaOS1Click
      end
    end
    object Backup1: TMenuItem
      Caption = 'Backup'
      OnClick = Backup1Click
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
      OnClick = Sobre1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      ShortCut = 16467
      OnClick = Sair1Click
    end
  end
  object TbClientes: TTable
    DatabaseName = 'Dbase'
    SessionName = 'Default'
    TableName = 'Clientes.db'
    Left = 192
    Top = 72
    object TbClientesCod_cli: TAutoIncField
      FieldName = 'Cod_cli'
      ReadOnly = True
    end
    object TbClientesCliente: TStringField
      FieldName = 'Cliente'
      Size = 100
    end
    object TbClientesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 120
    end
    object TbClientesBairro: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object TbClientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 60
    end
    object TbClientesTelefone: TStringField
      FieldName = 'Telefone'
    end
    object TbClientesCep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object TbClientesContato: TStringField
      FieldName = 'Contato'
    end
    object TbClientesEmail: TStringField
      FieldName = 'Email'
      Size = 60
    end
    object TbClientesRoteiro: TMemoField
      FieldName = 'Roteiro'
      BlobType = ftMemo
      Size = 60
    end
    object TbClientesObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 60
    end
    object TbClientesFatura: TStringField
      FieldName = 'Fatura'
      Size = 10
    end
    object TbClientesCnpj: TStringField
      FieldName = 'Cnpj'
      Size = 25
    end
    object TbClientesIe: TStringField
      FieldName = 'Ie'
      Size = 25
    end
    object TbClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object QrClientes: TQuery
    Active = True
    DatabaseName = 'Dbase'
    SessionName = 'Default'
    SQL.Strings = (
      'Select * from clientes')
    Left = 224
    Top = 72
  end
  object Database1: TDatabase
    AliasName = 'OS10'
    Connected = True
    DatabaseName = 'Dbase'
    LoginPrompt = False
    SessionName = 'Default'
    TransIsolation = tiDirtyRead
    Left = 192
    Top = 40
  end
  object DSLocCli: TDataSource
    DataSet = QrClientes
    Left = 224
    Top = 104
  end
  object DSClientes: TDataSource
    DataSet = TbClientes
    Left = 188
    Top = 104
  end
  object TBOS: TTable
    DatabaseName = 'Dbase'
    SessionName = 'Default'
    TableName = 'Os.db'
    Left = 280
    Top = 72
    object TBOSCod_cli: TIntegerField
      FieldName = 'Cod_cli'
    end
    object TBOSEquipamento: TStringField
      FieldName = 'Equipamento'
      Size = 30
    end
    object TBOSFabricante: TStringField
      FieldName = 'Fabricante'
    end
    object TBOSModelo: TStringField
      FieldName = 'Modelo'
    end
    object TBOSSerie: TStringField
      FieldName = 'Serie'
      Size = 30
    end
    object TBOSAtivo: TStringField
      FieldName = 'Ativo'
    end
    object TBOSData: TDateField
      FieldName = 'Data'
    end
    object TBOSDefeito_Cliente: TStringField
      FieldName = 'Defeito_Cliente'
      Size = 200
    end
    object TBOSDiagnostico: TMemoField
      FieldName = 'Diagnostico'
      BlobType = ftMemo
      Size = 1
    end
    object TBOSOrcamento: TCurrencyField
      FieldName = 'Orcamento'
    end
    object TBOSSaida: TDateField
      FieldName = 'Saida'
    end
    object TBOSObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object TBOSSolucao: TMemoField
      FieldName = 'Solucao'
      BlobType = ftMemo
      Size = 1
    end
    object TBOSOs: TIntegerField
      FieldName = 'Os'
    end
    object TBOSCod_Os: TAutoIncField
      FieldName = 'Cod_Os'
      ReadOnly = True
    end
    object TBOSStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
  end
  object QrOS: TQuery
    DatabaseName = 'Dbase'
    SessionName = 'Default'
    SQL.Strings = (
      'Select * from Os')
    Left = 312
    Top = 72
    object QrOSOs: TIntegerField
      FieldName = 'Os'
      Origin = 'DBASE."Os.DB".Os'
    end
    object QrOSCod_cli: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'Cod_cli'
      Origin = 'DBASE."Os.DB".Cod_cli'
    end
    object QrOSEquipamento: TStringField
      FieldName = 'Equipamento'
      Origin = 'DBASE."Os.DB".Equipamento'
      Size = 30
    end
    object QrOSFabricante: TStringField
      FieldName = 'Fabricante'
      Origin = 'DBASE."Os.DB".Fabricante'
    end
    object QrOSModelo: TStringField
      FieldName = 'Modelo'
      Origin = 'DBASE."Os.DB".Modelo'
    end
    object QrOSSerie: TStringField
      FieldName = 'Serie'
      Origin = 'DBASE."Os.DB".Serie'
      Size = 30
    end
    object QrOSAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'DBASE."Os.DB".Ativo'
    end
    object QrOSData: TDateField
      FieldName = 'Data'
      Origin = 'DBASE."Os.DB".Data'
    end
    object QrOSDefeito_Cliente: TStringField
      DisplayLabel = 'Defeito Informado'
      FieldName = 'Defeito_Cliente'
      Origin = 'DBASE."Os.DB".Defeito_Cliente'
      Size = 200
    end
    object QrOSDiagnostico: TMemoField
      FieldName = 'Diagnostico'
      Origin = 'DBASE."Os.DB".Diagnostico'
      BlobType = ftMemo
      Size = 1
    end
    object QrOSStatus: TStringField
      FieldName = 'Status'
      Origin = 'DBASE."Os.DB".Status'
      Size = 10
    end
    object QrOSOrcamento: TCurrencyField
      FieldName = 'Orcamento'
      Origin = 'DBASE."Os.DB".Orcamento'
    end
    object QrOSSaida: TDateField
      FieldName = 'Saida'
      Origin = 'DBASE."Os.DB".Saida'
    end
    object QrOSObs: TMemoField
      FieldName = 'Obs'
      Origin = 'DBASE."Os.DB".Obs'
      BlobType = ftMemo
      Size = 1
    end
    object QrOSSolucao: TMemoField
      FieldName = 'Solucao'
      Origin = 'DBASE."Os.DB".Solucao'
      BlobType = ftMemo
      Size = 1
    end
  end
  object DSOs: TDataSource
    DataSet = TBOS
    Left = 280
    Top = 104
  end
  object DSLOcOS: TDataSource
    DataSet = QrOS
    Left = 312
    Top = 104
  end
  object QrPrintOS: TQuery
    DatabaseName = 'Dbase'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT DISTINCT OS.Cod_Os, OS.OS, OS.Cod_cli, OS.Equipamento, OS' +
        '.Fabricante, OS.Modelo, OS.Serie, OS.Ativo, OS.Data, OS.Defeito_' +
        'Cliente, OS.Diagnostico, OS.Status, OS.Orcamento, OS.Saida, OS.O' +
        'bs, OS.Solucao, Clientes.Cod_cli, Clientes.Cliente, Clientes.End' +
        'ereco, Clientes.Bairro, Clientes.Cidade, Clientes.Telefone, Clie' +
        'ntes.Cep, Clientes.Cnpj, Clientes.Ie, Clientes.Contato, Clientes' +
        '.Email, Clientes.Roteiro'
      'FROM OS'
      '   INNER JOIN "Clientes.db" Clientes'
      '   ON  (Clientes.Cod_cli = OS.Cod_cli)  '
      'ORDER BY OS.Cod_Os')
    Left = 280
    Top = 144
    object QrPrintOSCod_Os: TIntegerField
      FieldName = 'Cod_Os'
      Origin = 'DBASE."OS.DB".Cod_Os'
    end
    object QrPrintOSEquipamento: TStringField
      FieldName = 'Equipamento'
      Origin = 'DBASE."OS.DB".Equipamento'
      Size = 30
    end
    object QrPrintOSFabricante: TStringField
      FieldName = 'Fabricante'
      Origin = 'DBASE."OS.DB".Fabricante'
    end
    object QrPrintOSModelo: TStringField
      FieldName = 'Modelo'
      Origin = 'DBASE."OS.DB".Modelo'
    end
    object QrPrintOSSerie: TStringField
      FieldName = 'Serie'
      Origin = 'DBASE."OS.DB".Serie'
      Size = 30
    end
    object QrPrintOSAtivo: TStringField
      FieldName = 'Ativo'
      Origin = 'DBASE."OS.DB".Ativo'
    end
    object QrPrintOSData: TDateField
      FieldName = 'Data'
      Origin = 'DBASE."OS.DB".Data'
    end
    object QrPrintOSDefeito_Cliente: TStringField
      FieldName = 'Defeito_Cliente'
      Origin = 'DBASE."OS.DB".Defeito_Cliente'
      Size = 200
    end
    object QrPrintOSDiagnostico: TMemoField
      FieldName = 'Diagnostico'
      Origin = 'DBASE."OS.DB".Diagnostico'
      BlobType = ftMemo
      Size = 1
    end
    object QrPrintOSStatus: TStringField
      FieldName = 'Status'
      Origin = 'DBASE."OS.DB".Status'
      Size = 7
    end
    object QrPrintOSOrcamento: TCurrencyField
      FieldName = 'Orcamento'
      Origin = 'DBASE."OS.DB".Orcamento'
    end
    object QrPrintOSSaida: TDateField
      FieldName = 'Saida'
      Origin = 'DBASE."OS.DB".Saida'
    end
    object QrPrintOSObs: TMemoField
      FieldName = 'Obs'
      Origin = 'DBASE."OS.DB".Obs'
      BlobType = ftMemo
      Size = 1
    end
    object QrPrintOSSolucao: TMemoField
      FieldName = 'Solucao'
      Origin = 'DBASE."OS.DB".Solucao'
      BlobType = ftMemo
      Size = 1
    end
    object QrPrintOSCliente: TStringField
      FieldName = 'Cliente'
      Origin = 'DBASE."Clientes.DB".Cliente'
      Size = 100
    end
    object QrPrintOSEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DBASE."Clientes.DB".Endereco'
      Size = 120
    end
    object QrPrintOSBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'DBASE."Clientes.DB".Bairro'
      Size = 60
    end
    object QrPrintOSCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'DBASE."Clientes.DB".Cidade'
      Size = 60
    end
    object QrPrintOSTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DBASE."Clientes.DB".Telefone'
    end
    object QrPrintOSCep: TStringField
      FieldName = 'Cep'
      Origin = 'DBASE."Clientes.DB".Cep'
      Size = 9
    end
    object QrPrintOSCnpj: TStringField
      FieldName = 'Cnpj'
      Origin = 'DBASE."Clientes.DB".Cnpj'
      Size = 15
    end
    object QrPrintOSIe: TStringField
      FieldName = 'Ie'
      Origin = 'DBASE."Clientes.DB".Ie'
      Size = 15
    end
    object QrPrintOSContato: TStringField
      FieldName = 'Contato'
      Origin = 'DBASE."Clientes.DB".Contato'
    end
    object QrPrintOSEmail: TStringField
      FieldName = 'Email'
      Origin = 'DBASE."Clientes.DB".Email'
      Size = 60
    end
    object QrPrintOSRoteiro: TMemoField
      FieldName = 'Roteiro'
      Origin = 'DBASE."Clientes.DB".Roteiro'
      BlobType = ftMemo
      Size = 60
    end
    object QrPrintOSOS: TIntegerField
      FieldName = 'OS'
      Origin = 'DBASE."OS.DB".Os'
    end
    object QrPrintOSCod_cli: TIntegerField
      FieldName = 'Cod_cli'
      Origin = 'DBASE."OS.DB".Cod_cli'
    end
    object QrPrintOSCod_cli_1: TIntegerField
      FieldName = 'Cod_cli_1'
      Origin = 'DBASE."Clientes.DB".Cod_cli'
    end
  end
  object SkinData1: TSkinData
    Active = True
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab, xcFastReport]
    SkinFile = 'C:\OS10\Skin\MXSKIN24.SKN'
    SkinStore = '(none)'
    SkinFormtype = sfMainform
    Left = 64
    Top = 96
    SkinStream = {00000000}
  end
end

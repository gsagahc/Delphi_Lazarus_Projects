object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 404
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 272
    Width = 130
    Height = 23
    Caption = 'REGISTRO N:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 264
    Top = 270
    Width = 7
    Height = 25
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 240
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Gui\Documents\Database2.accdb'
      'DriverID=MSAcc')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 184
    Top = 24
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'Id_TB'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'EXPORTAR'
    TableName = 'EXPORTAR'
    Left = 128
    Top = 120
    object FDTable1Nome: TWideStringField
      FieldName = 'Nome'
      Size = 255
    end
    object FDTable1Cognome: TWideStringField
      FieldName = 'Cognome'
      Size = 255
    end
    object FDTable1Sexo: TWideStringField
      FieldName = 'Sexo'
      Size = 255
    end
    object FDTable1Nasc: TWideStringField
      FieldName = 'Nasc'
      Size = 255
    end
    object FDTable1Profissao: TWideStringField
      FieldName = 'Profissao'
      Size = 255
    end
    object FDTable1Endereco: TWideStringField
      FieldName = 'Endereco'
      Size = 255
    end
    object FDTable1Bairro: TWideStringField
      FieldName = 'Bairro'
      Size = 255
    end
    object FDTable1Cidade: TWideStringField
      FieldName = 'Cidade'
      Size = 255
    end
    object FDTable1CEP: TWideStringField
      FieldName = 'CEP'
      Size = 255
    end
    object FDTable1Estado: TWideStringField
      FieldName = 'Estado'
      Size = 255
    end
    object FDTable1Telefone: TWideStringField
      FieldName = 'Telefone'
      Size = 255
    end
    object FDTable1EMail: TWideStringField
      FieldName = 'E-Mail'
      Size = 255
    end
    object FDTable1Empresa: TWideStringField
      FieldName = 'Empresa'
      Size = 255
    end
    object FDTable1Tratamento: TWideStringField
      FieldName = 'Tratamento'
      Size = 255
    end
    object FDTable1Função: TWideStringField
      FieldName = 'Fun'#231#227'o'
      Size = 255
    end
    object FDTable1EndereçoCom: TWideStringField
      FieldName = 'Endere'#231'o Com'
      Size = 255
    end
    object FDTable1BairroCom: TWideStringField
      FieldName = 'Bairro Com'
      Size = 255
    end
    object FDTable1CidadeCom: TWideStringField
      FieldName = 'Cidade Com'
      Size = 255
    end
    object FDTable1EstadoCom: TWideStringField
      FieldName = 'Estado Com'
      Size = 255
    end
    object FDTable1CEPCom: TWideStringField
      FieldName = 'CEP Com'
      Size = 255
    end
    object FDTable1TelefoneCom: TWideStringField
      FieldName = 'Telefone Com'
      Size = 255
    end
    object FDTable1HomePage: TWideStringField
      FieldName = 'Home-Page'
      Size = 255
    end
    object FDTable1Nota: TWideStringField
      FieldName = 'Nota'
      Size = 255
    end
    object FDTable1OBS: TWideStringField
      FieldName = 'OBS'
      Size = 255
    end
    object FDTable1FAXCom: TWideStringField
      FieldName = 'FAX Com'
      Size = 255
    end
    object FDTable1FAXRes: TWideStringField
      FieldName = 'FAX Res'
      Size = 255
    end
    object FDTable1CelularCom: TWideStringField
      FieldName = 'Celular Com'
      Size = 255
    end
    object FDTable1Celular: TWideStringField
      FieldName = 'Celular'
      Size = 255
    end
    object FDTable1Conjuge: TWideStringField
      FieldName = 'Conjuge'
      Size = 255
    end
    object FDTable1NascConjuge: TWideStringField
      FieldName = 'Nasc Conjuge'
      Size = 255
    end
    object FDTable1Atributos: TWideStringField
      FieldName = 'Atributos'
      Size = 255
    end
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\SCA\SISCADBD.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=P4o3l8l1@@')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 424
    Top = 24
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_TBPRT'
        DataType = ftInteger
      end
      item
        Name = 'TBPRT_NOME'
        DataType = ftWideString
        Size = 150
      end
      item
        Name = 'TBPRT_RG'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 9
      end
      item
        Name = 'TBPRT_CPF'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 16
      end
      item
        Name = 'TBPRT_ENDERECO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TBPRT_NUMERO'
        DataType = ftSmallint
      end
      item
        Name = 'TBPRT_COMPLEMENTO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TBPRT_EMAIL'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TBPRT_BAIRRO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TBPRT_CIDADE'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'TBPRT_CELULAR'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 14
      end
      item
        Name = 'TBPRT_TELEFONE'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 14
      end
      item
        Name = 'TBPRT_CEP'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 9
      end
      item
        Name = 'TBPRT_ESTADOCIVIL'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 14
      end
      item
        Name = 'TBPRT_SEXO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 2
      end
      item
        Name = 'TBPRT_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'TBPRT_ZAP'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'TBPRT_ANIVERSARIO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 8
      end
      item
        Name = 'TBPRT_OBS'
        DataType = ftWideString
        Size = 1000
      end
      item
        Name = 'TBPRT_PROFISSAO'
        DataType = ftWideString
        Size = 30
      end>
    StoreDefs = True
    TableName = 'TB_PRT'
    UniDirectional = False
    Left = 360
    Top = 128
    object IBTable1TBPRT_NOME: TIBStringField
      FieldName = 'TBPRT_NOME'
      Size = 150
    end
    object IBTable1TBPRT_RG: TIBStringField
      FieldName = 'TBPRT_RG'
      Size = 9
    end
    object IBTable1TBPRT_CPF: TIBStringField
      FieldName = 'TBPRT_CPF'
      Size = 12
    end
    object IBTable1TBPRT_ENDERECO: TIBStringField
      FieldName = 'TBPRT_ENDERECO'
      Size = 100
    end
    object IBTable1TBPRT_NUMERO: TSmallintField
      FieldName = 'TBPRT_NUMERO'
    end
    object IBTable1TBPRT_COMPLEMENTO: TIBStringField
      FieldName = 'TBPRT_COMPLEMENTO'
      Size = 100
    end
    object IBTable1TBPRT_EMAIL: TIBStringField
      FieldName = 'TBPRT_EMAIL'
      Size = 100
    end
    object IBTable1TBPRT_BAIRRO: TIBStringField
      FieldName = 'TBPRT_BAIRRO'
      Size = 100
    end
    object IBTable1TBPRT_CIDADE: TIBStringField
      FieldName = 'TBPRT_CIDADE'
      Size = 100
    end
    object IBTable1TBPRT_CELULAR: TIBStringField
      FieldName = 'TBPRT_CELULAR'
      Size = 10
    end
    object IBTable1TBPRT_TELEFONE: TIBStringField
      FieldName = 'TBPRT_TELEFONE'
      Size = 10
    end
    object IBTable1TBPRT_CEP: TIBStringField
      FieldName = 'TBPRT_CEP'
      Size = 9
    end
    object IBTable1TBPRT_ESTADOCIVIL: TIBStringField
      FieldName = 'TBPRT_ESTADOCIVIL'
      Size = 12
    end
    object IBTable1TBPRT_SEXO: TIBStringField
      FieldName = 'TBPRT_SEXO'
      Size = 2
    end
    object IBTable1TBPRT_NASCIMENTO: TDateField
      FieldName = 'TBPRT_NASCIMENTO'
    end
    object IBTable1TBPRT_ZAP: TIBStringField
      FieldName = 'TBPRT_ZAP'
      Size = 1
    end
    object IBTable1TBPRT_ANIVERSARIO: TIBStringField
      FieldName = 'TBPRT_ANIVERSARIO'
      Size = 8
    end
    object IBTable1TBPRT_OBS: TIBStringField
      FieldName = 'TBPRT_OBS'
      Size = 1000
    end
    object IBTable1TBPRT_PROFISSAO: TIBStringField
      FieldName = 'TBPRT_PROFISSAO'
      Size = 30
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Left = 296
    Top = 24
  end
end

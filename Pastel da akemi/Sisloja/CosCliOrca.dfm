object FrmConsCliVend1: TFrmConsCliVend1
  Left = 147
  Top = 213
  Width = 596
  Height = 240
  BorderIcons = []
  Caption = 'Consulta de Clientes'
  Color = clInfoBk
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 164
    Top = 11
    Width = 28
    Height = 13
    Caption = 'Nome'
    Transparent = True
  end
  object Label2: TLabel
    Left = 159
    Top = 11
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    Transparent = True
    Visible = False
  end
  object Edit1: TEdit
    Left = 200
    Top = 8
    Width = 345
    Height = 19
    TabOrder = 0
  end
  object Button1: TButton
    Left = 392
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 472
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 588
    Height = 149
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Edit2: TEdit
    Left = 200
    Top = 8
    Width = 73
    Height = 19
    TabOrder = 4
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 0
    Width = 113
    Height = 57
    Caption = 'Busca'
    ItemIndex = 0
    Items.Strings = (
      'Nome'
      'C'#243'digo')
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SQL.Strings = (
      'SELECT * FROM CLIENTES;')
    Left = 232
    Top = 32
    object Query1CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BANCODADOS.CLIENTES.CODIGO'
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'BANCODADOS.CLIENTES.NOME'
      FixedChar = True
      Size = 60
    end
    object Query1NOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Origin = 'BANCODADOS.CLIENTES.NOMEFANTASIA'
      FixedChar = True
      Size = 60
    end
    object Query1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'BANCODADOS.CLIENTES.ENDERECO'
      FixedChar = True
      Size = 60
    end
    object Query1CIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'BANCODADOS.CLIENTES.CIDADE'
      FixedChar = True
      Size = 30
    end
    object Query1ESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'BANCODADOS.CLIENTES.ESTADO'
      FixedChar = True
      Size = 2
    end
    object Query1TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'BANCODADOS.CLIENTES.TELEFONE'
      FixedChar = True
      Size = 30
    end
    object Query1FAX: TStringField
      FieldName = 'FAX'
      Origin = 'BANCODADOS.CLIENTES.FAX'
      FixedChar = True
      Size = 14
    end
    object Query1EMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'BANCODADOS.CLIENTES.EMAIL'
      FixedChar = True
      Size = 60
    end
    object Query1CGC: TStringField
      FieldName = 'CGC'
      Origin = 'BANCODADOS.CLIENTES.CGC'
      FixedChar = True
      Size = 30
    end
    object Query1PRAZO: TIntegerField
      FieldName = 'PRAZO'
      Origin = 'BANCODADOS.CLIENTES.PRAZO'
    end
    object Query1RGINSC: TStringField
      FieldName = 'RGINSC'
      Origin = 'BANCODADOS.CLIENTES.RGINSC'
      FixedChar = True
      Size = 23
    end
    object Query1STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BANCODADOS.CLIENTES.STATUS'
      FixedChar = True
      Size = 1
    end
    object Query1LIMITE: TFloatField
      FieldName = 'LIMITE'
      Origin = 'BANCODADOS.CLIENTES.LIMITE'
    end
    object Query1TIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'BANCODADOS.CLIENTES.TIPO'
    end
    object Query1CONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'BANCODADOS.CLIENTES.CONTATO'
      FixedChar = True
      Size = 50
    end
    object Query1CELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'BANCODADOS.CLIENTES.CELULAR'
      FixedChar = True
      Size = 30
    end
    object Query1CEP: TStringField
      FieldName = 'CEP'
      Origin = 'BANCODADOS.CLIENTES.CEP'
      FixedChar = True
      Size = 8
    end
    object Query1DATACAD: TDateTimeField
      FieldName = 'DATACAD'
      Origin = 'BANCODADOS.CLIENTES.DATACAD'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 204
    Top = 32
  end
end

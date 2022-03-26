object FrmConsCliVend1: TFrmConsCliVend1
  Left = 275
  Top = 159
  Width = 622
  Height = 239
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
  object Edit1: TEdit
    Left = 176
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
    Top = 63
    Width = 614
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
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFantasia'
        Title.Caption = 'Nome Fantasia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rg/INSC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cgc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataCad'
        Title.Caption = 'Cliente desde'
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 0
    Width = 145
    Height = 57
    Caption = 'Busca'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Nome'
      'C'#243'digo'
      'CPF'
      'Telefone')
    TabOrder = 4
    OnClick = RadioGroup1Click
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SQL.Strings = (
      'SELECT * FROM CLIENTES;')
    Left = 232
    Top = 32
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'SISLOJA."clientes.DB".Codigo'
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'SISLOJA."clientes.DB".Nome'
      Size = 60
    end
    object Query1Endereco: TStringField
      FieldName = 'Endereco'
      Origin = 'SISLOJA."clientes.DB".Endereco'
      Size = 60
    end
    object Query1Cidade: TStringField
      FieldName = 'Cidade'
      Origin = 'SISLOJA."clientes.DB".Cidade'
    end
    object Query1Estado: TStringField
      FieldName = 'Estado'
      Origin = 'SISLOJA."clientes.DB".Estado'
      Size = 2
    end
    object Query1Cep: TStringField
      FieldName = 'Cep'
      Origin = 'SISLOJA."clientes.DB".Cep'
      Size = 8
    end
    object Query1Telefone: TStringField
      FieldName = 'Telefone'
      Origin = 'SISLOJA."clientes.DB".Telefone'
      Size = 30
    end
    object Query1Fax: TStringField
      FieldName = 'Fax'
      Origin = 'SISLOJA."clientes.DB".Fax'
      Size = 14
    end
    object Query1EMail: TStringField
      FieldName = 'EMail'
      Origin = 'SISLOJA."clientes.DB".EMail'
      Size = 60
    end
    object Query1Cgc: TStringField
      FieldName = 'Cgc'
      Origin = 'SISLOJA."clientes.DB".Cgc'
      Size = 30
    end
    object Query1Prazo: TIntegerField
      FieldName = 'Prazo'
      Origin = 'SISLOJA."CLIENTES.DB".Prazo'
    end
    object Query1Tipo: TIntegerField
      FieldName = 'Tipo'
      Origin = 'SISLOJA."CLIENTES.DB".Tipo'
    end
    object Query1NomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Origin = 'SISLOJA."CLIENTES.DB".NomeFantasia'
      Size = 60
    end
    object Query1DataCad: TDateField
      FieldName = 'DataCad'
      Origin = 'SISLOJA."CLIENTES.DB".DataCad'
    end
    object Query1LIMITE: TCurrencyField
      FieldName = 'LIMITE'
      Origin = 'SISLOJA."clientes.DB".LIMITE'
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
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 204
    Top = 32
  end
end

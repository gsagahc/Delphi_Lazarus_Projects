object FrmConsFornecedor: TFrmConsFornecedor
  Left = 438
  Top = 248
  Width = 415
  Height = 253
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Fornecedores'
  Color = clInfoBk
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 11
    Width = 28
    Height = 13
    Caption = 'Nome'
    Transparent = True
  end
  object Edit1: TEdit
    Left = 43
    Top = 8
    Width = 345
    Height = 19
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object Button1: TButton
    Left = 227
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 307
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
    Width = 393
    Height = 149
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
        Width = 376
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFantasia'
        Title.Caption = 'Nome Fantasia'
        Visible = True
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES;')
    Left = 155
    Top = 32
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'SISLOJA."FORNECEDORES.DB".Codigo'
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'SISLOJA."FORNECEDORES.DB".Nome'
      Size = 40
    end
    object Query1Endereco: TStringField
      FieldName = 'Endereco'
      Origin = 'SISLOJA."FORNECEDORES.DB".Endereco'
      Size = 40
    end
    object Query1Cidade: TStringField
      FieldName = 'Cidade'
      Origin = 'SISLOJA."FORNECEDORES.DB".Cidade'
    end
    object Query1Estado: TStringField
      FieldName = 'Estado'
      Origin = 'SISLOJA."FORNECEDORES.DB".Estado'
      Size = 2
    end
    object Query1Telefone: TStringField
      FieldName = 'Telefone'
      Origin = 'SISLOJA."FORNECEDORES.DB".Telefone'
      Size = 14
    end
    object Query1CEP: TStringField
      FieldName = 'CEP'
      Origin = 'BANCODADOS.FORNECEDORES.CEP'
      FixedChar = True
      Size = 8
    end
    object Query1FAX: TStringField
      FieldName = 'FAX'
      Origin = 'BANCODADOS.FORNECEDORES.FAX'
      FixedChar = True
      Size = 14
    end
    object Query1EMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'BANCODADOS.FORNECEDORES.EMAIL'
      FixedChar = True
      Size = 60
    end
    object Query1CGC: TStringField
      FieldName = 'CGC'
      Origin = 'BANCODADOS.FORNECEDORES.CGC'
      FixedChar = True
      Size = 18
    end
    object Query1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BANCODADOS.FORNECEDORES.BAIRRO'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 135
    Top = 32
  end
end

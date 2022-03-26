object FrmConsProdutos: TFrmConsProdutos
  Left = 425
  Top = 247
  Width = 367
  Height = 262
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Produtos'
  Color = clInfoBk
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 11
    Width = 28
    Height = 13
    Caption = 'Nome'
    Transparent = True
  end
  object Edit1: TEdit
    Left = 59
    Top = 8
    Width = 222
    Height = 19
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object Button1: TButton
    Left = 147
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 227
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
    Width = 321
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
        FieldName = 'Descricao'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATACADASTRO'
        Title.Caption = 'Data de Cadastro'
        Visible = True
      end>
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM PRODUTOS;')
    Left = 219
    Top = 136
    object Query1Numero: TIntegerField
      FieldName = 'Numero'
      Origin = 'SISLOJA."PRODUTOS.DB".Numero'
    end
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'SISLOJA."PRODUTOS.DB".Codigo'
    end
    object Query1Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'SISLOJA."PRODUTOS.DB".Descricao'
      Size = 40
    end
    object Query1CodBarras: TStringField
      FieldName = 'CodBarras'
      Origin = 'SISLOJA."PRODUTOS.DB".CodBarras'
      Size = 13
    end
    object Query1Preco: TCurrencyField
      FieldName = 'Preco'
      Origin = 'SISLOJA."PRODUTOS.DB".Preco'
    end
    object Query1Custo: TCurrencyField
      FieldName = 'Custo'
      Origin = 'SISLOJA."PRODUTOS.DB".Custo'
    end
    object Query1Fornecedor: TIntegerField
      FieldName = 'Fornecedor'
      Origin = 'SISLOJA."PRODUTOS.DB".Fornecedor'
    end
    object Query1DATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'BANCODADOS.PRODUTOS.DATACADASTRO'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 223
    Top = 112
  end
end

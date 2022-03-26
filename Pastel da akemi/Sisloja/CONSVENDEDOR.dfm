object FrmConsVendedor: TFrmConsVendedor
  Left = 257
  Top = 189
  Width = 396
  Height = 240
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Vendedores'
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
    Width = 385
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
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 376
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end>
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM VENDEDORES;')
    Left = 163
    Top = 32
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'SISLOJA."VENDEDORES.DB".Codigo'
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'SISLOJA."VENDEDORES.DB".Nome'
      Size = 40
    end
    object Query1Endereco: TStringField
      FieldName = 'Endereco'
      Origin = 'SISLOJA."VENDEDORES.DB".Endereco'
      Size = 40
    end
    object Query1Cidade: TStringField
      FieldName = 'Cidade'
      Origin = 'SISLOJA."VENDEDORES.DB".Cidade'
    end
    object Query1Estado: TStringField
      FieldName = 'Estado'
      Origin = 'SISLOJA."VENDEDORES.DB".Estado'
      Size = 2
    end
    object Query1Cep: TStringField
      FieldName = 'Cep'
      Origin = 'SISLOJA."VENDEDORES.DB".Cep'
      Size = 8
    end
    object Query1Telefone: TStringField
      FieldName = 'Telefone'
      Origin = 'SISLOJA."VENDEDORES.DB".Telefone'
      Size = 14
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 135
    Top = 32
  end
end

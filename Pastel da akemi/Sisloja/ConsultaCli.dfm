object FrmConsCliVend2: TFrmConsCliVend2
  Left = 388
  Top = 247
  Width = 402
  Height = 240
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Clientes'
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
  object CheckBox1: TCheckBox
    Left = 43
    Top = 37
    Width = 65
    Height = 17
    Caption = 'Inativos'
    TabOrder = 4
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CLIENTES;')
    Left = 163
    Top = 32
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'SISLOJA."clientes.DB".Nome'
      Size = 60
    end
    object Query1NomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Origin = 'SISLOJA."CLIENTES.DB".NomeFantasia'
      Size = 60
    end
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'SISLOJA."CLIENTES.DB".Codigo'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 135
    Top = 32
  end
end

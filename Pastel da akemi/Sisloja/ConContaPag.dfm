object FrmConsContaPag: TFrmConsContaPag
  Left = 213
  Top = 191
  Width = 437
  Height = 262
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de contas a pagar'
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
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
    Transparent = True
  end
  object Label2: TLabel
    Left = 26
    Top = 36
    Width = 28
    Height = 13
    Caption = 'Pago:'
  end
  object Label3: TLabel
    Left = 3
    Top = 58
    Width = 59
    Height = 13
    Caption = 'Vencimento:'
  end
  object Edit1: TEdit
    Left = 67
    Top = 8
    Width = 345
    Height = 19
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object Button1: TButton
    Left = 259
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 339
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 84
    Width = 425
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
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end>
  end
  object ComboBox1: TComboBox
    Left = 67
    Top = 32
    Width = 54
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      'S'
      'N')
  end
  object MaskEdit1: TMaskEdit
    Left = 67
    Top = 55
    Width = 54
    Height = 19
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 5
    Text = '  /  /  '
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CONTAPAG;')
    Left = 296
    Top = 168
    object Query1NUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'BANCODADOS.CONTAPAG.NUMERO'
    end
    object Query1FORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'BANCODADOS.CONTAPAG.FORNECEDOR'
      FixedChar = True
      Size = 40
    end
    object Query1VALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CONTAPAG.VALOR'
    end
    object Query1PAGTO: TDateTimeField
      FieldName = 'PAGTO'
      Origin = 'BANCODADOS.CONTAPAG.PAGTO'
    end
    object Query1PAGO: TStringField
      FieldName = 'PAGO'
      Origin = 'BANCODADOS.CONTAPAG.PAGO'
      FixedChar = True
      Size = 1
    end
    object Query1VENCTO: TDateTimeField
      FieldName = 'VENCTO'
      Origin = 'BANCODADOS.CONTAPAG.VENCTO'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 255
    Top = 168
  end
end

object FrmConsContaRec: TFrmConsContaRec
  Left = 431
  Top = 260
  Width = 438
  Height = 262
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de contas a receber'
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
  object Edit1: TEdit
    Left = 91
    Top = 8
    Width = 316
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
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPED'
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
    Left = 91
    Top = 32
    Width = 54
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      'S'
      'N')
  end
  object MaskEdit1: TMaskEdit
    Left = 91
    Top = 56
    Width = 54
    Height = 19
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 5
    Text = '  /  /  '
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 8
    Width = 57
    Height = 17
    Caption = 'Cliente:'
    TabOrder = 6
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 35
    Width = 57
    Height = 17
    Caption = 'Pago:'
    Checked = True
    TabOrder = 7
    TabStop = True
  end
  object RadioButton3: TRadioButton
    Left = 8
    Top = 57
    Width = 81
    Height = 17
    Caption = 'Vencimento:'
    TabOrder = 8
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT C.CODIGO, C.VENCTO, C.VALOR, C.PAGO, C.PAGTO, C.EMISSAO,'
      'C.EMISSAO, C.PEDIDO, C.DATAPED, C.NOTA,CL.NOME'
      'FROM CONTAREC C INNER  JOIN CLIENTES CL ON c.cliente =Cl.codigo ')
    Left = 291
    Top = 168
    object Query1CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BANCODADOS.CONTAREC.CODIGO'
    end
    object Query1VENCTO: TDateTimeField
      FieldName = 'VENCTO'
      Origin = 'BANCODADOS.CONTAREC.VENCTO'
    end
    object Query1VALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CONTAREC.VALOR'
    end
    object Query1PAGO: TStringField
      FieldName = 'PAGO'
      Origin = 'BANCODADOS.CONTAREC.PAGO'
      FixedChar = True
      Size = 1
    end
    object Query1PAGTO: TDateTimeField
      FieldName = 'PAGTO'
      Origin = 'BANCODADOS.CONTAREC.PAGTO'
    end
    object Query1EMISSAO: TDateTimeField
      FieldName = 'EMISSAO'
      Origin = 'BANCODADOS.CONTAREC.EMISSAO'
    end
    object Query1EMISSAO_1: TDateTimeField
      FieldName = 'EMISSAO_1'
      Origin = 'BANCODADOS.CONTAREC.EMISSAO'
    end
    object Query1DATAPED: TDateTimeField
      FieldName = 'DATAPED'
      Origin = 'BANCODADOS.CONTAREC.DATAPED'
    end
    object Query1NOTA: TStringField
      FieldName = 'NOTA'
      Origin = 'BANCODADOS.CONTAREC.NOTA'
      FixedChar = True
      Size = 6
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'BANCODADOS.CLIENTES.NOME'
      FixedChar = True
      Size = 60
    end
    object Query1PEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'BANCODADOS.CONTAREC.PEDIDO'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 255
    Top = 168
  end
end

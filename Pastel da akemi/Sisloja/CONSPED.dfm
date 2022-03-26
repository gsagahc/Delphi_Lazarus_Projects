object FrmConsPed: TFrmConsPed
  Left = 324
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Consulta de pedidos'
  ClientHeight = 319
  ClientWidth = 582
  Color = clHighlightText
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 94
    Align = alTop
    Color = clInfoBk
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 36
      Height = 13
      Caption = 'Pedido:'
    end
    object Label2: TLabel
      Left = 17
      Top = 44
      Width = 35
      Height = 13
      Caption = 'Cliente:'
    end
    object Label3: TLabel
      Left = 7
      Top = 71
      Width = 49
      Height = 13
      Caption = 'Vendedor:'
    end
    object Label4: TLabel
      Left = 168
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object edtConsulta: TEdit
      Left = 60
      Top = 12
      Width = 67
      Height = 19
      TabOrder = 0
      OnKeyDown = edtConsultaKeyDown
      OnKeyPress = edtConsultaKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 493
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Procurar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object RadioGroup1: TRadioGroup
      Left = 400
      Top = 8
      Width = 89
      Height = 81
      Caption = 'Tipo'
      ItemIndex = 0
      Items.Strings = (
        'Pedido'
        'Data'
        'Cliente'
        'Vendedor')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object ComboBox1: TComboBox
      Left = 60
      Top = 40
      Width = 337
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
    object ComboBox2: TComboBox
      Left = 60
      Top = 68
      Width = 335
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
    object DateTimePicker1: TDateTimePicker
      Left = 197
      Top = 13
      Width = 84
      Height = 21
      Date = 40179.483736574100000000
      Time = 40179.483736574100000000
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 278
    Width = 582
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clInfoBk
    TabOrder = 1
    object btnfecha: TBitBtn
      Left = 245
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnfechaClick
      Kind = bkOK
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 94
    Width = 582
    Height = 184
    Align = alClient
    Ctl3D = False
    DataSource = dsVENDAS
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PEDIDO'
        Title.Caption = 'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAALTERACAO'
        Title.Caption = 'Altera'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'Vendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA'
        Title.Caption = 'Nota'
        Visible = True
      end>
  end
  object QryVendas: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT v.PEDIDO,V.DATA,V.VALOR,V.PRAZO,V.NOTA,V.DATAALTERACAO,'
      'CL.NOME as cliente, CL.CODIGO, VD.NOME as vendedor, VD.CODIGO'
      'FROM VENDAS V INNER JOIN clientes CL ON CL.codigo = v.cliente '
      'inner join vendedores vd on vd.codigo = v.vendedor '
      'where v.pedido=1')
    Left = 56
    Top = 136
    object QryVendasPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object QryVendasDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object QryVendasVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object QryVendasPRAZO: TIntegerField
      FieldName = 'PRAZO'
    end
    object QryVendasNOTA: TStringField
      FieldName = 'NOTA'
      FixedChar = True
      Size = 6
    end
    object QryVendasDATAALTERACAO: TDateTimeField
      FieldName = 'DATAALTERACAO'
    end
    object QryVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      FixedChar = True
      Size = 60
    end
    object QryVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryVendasVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      FixedChar = True
      Size = 60
    end
    object QryVendasCODIGO_1: TIntegerField
      FieldName = 'CODIGO_1'
    end
  end
  object dsVENDAS: TDataSource
    DataSet = QryVendas
    Left = 16
    Top = 136
  end
end

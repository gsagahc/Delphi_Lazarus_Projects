object FrmRelVendasSCadastro: TFrmRelVendasSCadastro
  Left = 677
  Top = 197
  AutoScroll = False
  BorderIcons = []
  Caption = 'Relat'#243'rio de vendas sem cadastro'
  ClientHeight = 129
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 19
    Width = 36
    Height = 13
    Caption = 'Pedido:'
  end
  object Label3: TLabel
    Left = 160
    Top = 58
    Width = 16
    Height = 13
    Caption = 'At'#233
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Visualizar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object EdtPedido: TEdit
    Left = 64
    Top = 16
    Width = 81
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 0
    Top = 16
    Width = 57
    Height = 17
    Caption = 'Pedido:'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 0
    Top = 57
    Width = 62
    Height = 17
    Caption = 'Per'#237'odo:'
    TabOrder = 4
    OnClick = CheckBox2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 64
    Top = 56
    Width = 89
    Height = 21
    Date = 42323.841037962960000000
    Time = 42323.841037962960000000
    TabOrder = 5
  end
  object DateTimePicker2: TDateTimePicker
    Left = 184
    Top = 56
    Width = 89
    Height = 21
    Date = 42323.841037962960000000
    Time = 42323.841037962960000000
    TabOrder = 6
  end
end

object FrmSelecionaPrint: TFrmSelecionaPrint
  Left = 531
  Top = 288
  Width = 322
  Height = 145
  BorderIcons = []
  Caption = 'Selecione o tipo de impressora'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 8
    Width = 89
    Height = 97
    Stretch = True
  end
  object RadioGroup1: TRadioGroup
    Left = 96
    Top = 8
    Width = 201
    Height = 73
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Matricial'
      'Jato de tinta')
    TabOrder = 0
  end
end

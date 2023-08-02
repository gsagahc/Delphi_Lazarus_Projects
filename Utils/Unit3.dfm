object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 338
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 80
    Top = 24
    Width = 425
    Height = 193
    Lines.Strings = (
      
        'Exemplo de texto [TAG0] com v'#225'rias tags {TAG1] [TAG2] com texto ' +
        'no meio e muita '
      '[TAG3]')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 256
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end

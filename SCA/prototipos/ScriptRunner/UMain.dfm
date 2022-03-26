object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualizador de banco SCA'
  ClientHeight = 328
  ClientWidth = 503
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
    Left = 32
    Top = 129
    Width = 441
    Height = 137
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 199
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Executar'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 88
    Width = 441
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\SCA\SISCADBD.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=P4o3l8l1@@')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 64
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Left = 128
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'sql'
    Filter = '*.sql'
    Title = 'Abrir script SCA'
    Left = 280
    Top = 16
  end
  object IBScript1: TIBScript
    Database = IBDatabase1
    Transaction = IBTransaction1
    Terminator = ';'
    Left = 192
    Top = 16
  end
end

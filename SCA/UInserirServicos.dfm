object FrmInserirServicos: TFrmInserirServicos
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Inserir novos servi'#231'os'
  ClientHeight = 242
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 173
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 16
      Width = 31
      Height = 13
      Caption = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNome: TEdit
      Left = 18
      Top = 32
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object RGPrazo: TRadioGroup
      Left = 18
      Top = 59
      Width = 345
      Height = 86
      Caption = 'Prazo para retorno'
      ItemIndex = 0
      Items.Strings = (
        'N'#195'O'
        'SIM')
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 173
    Width = 380
    Height = 69
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 133
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 214
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 295
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
end

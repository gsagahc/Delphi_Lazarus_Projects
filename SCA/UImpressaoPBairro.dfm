object FrmImpressaoPBairro: TFrmImpressaoPBairro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmImpressaoPBairro'
  ClientHeight = 492
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = -32
    Width = 794
    Height = 1123
    DataSource = FrmConsultarBairro.DSProntuario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.BorderIcons = []
    object RLBand1: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 165
      object RLLabel1: TRLLabel
        Left = 9
        Top = 11
        Width = 38
        Height = 16
        Caption = 'Nome'
      end
      object RLDBText1: TRLDBText
        Left = 85
        Top = 11
        Width = 91
        Height = 16
        DataField = 'TBPRT_NOME'
        DataSource = FrmConsultarBairro.DSProntuario
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 85
        Top = 33
        Width = 125
        Height = 16
        DataField = 'TBPRT_ENDERECO'
        DataSource = FrmConsultarBairro.DSProntuario
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 9
        Top = 33
        Width = 31
        Height = 16
        Caption = 'Rua:'
      end
      object RLDBText3: TRLDBText
        Left = 85
        Top = 79
        Width = 111
        Height = 16
        DataField = 'TBPRT_CELULAR'
        DataSource = FrmConsultarBairro.DSProntuario
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 9
        Top = 79
        Width = 48
        Height = 16
        Caption = 'Celular:'
      end
      object RLDBText4: TRLDBText
        Left = 85
        Top = 57
        Width = 101
        Height = 16
        DataField = 'TBPRT_BAIRRO'
        DataSource = FrmConsultarBairro.DSProntuario
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 9
        Top = 55
        Width = 38
        Height = 16
        Caption = 'Bairro'
      end
      object RLLabel6: TRLLabel
        Left = 8
        Top = 104
        Width = 70
        Height = 16
        Caption = 'Anota'#231#245'es:'
      end
      object RLDBMemo1: TRLDBMemo
        Left = 84
        Top = 104
        Width = 185
        Height = 16
        Behavior = [beSiteExpander]
        DataSource = FrmConsultarBairro.DSProntuario
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      object RLLabel5: TRLLabel
        Left = 231
        Top = 24
        Width = 255
        Height = 19
        Align = faCenterBottom
        Caption = 'Relat'#243'rio de cadastros por bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 236
        Top = 0
        Width = 246
        Height = 19
        Align = faCenterTop
        Caption = 'Centro Social Dr Manoel Kadete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end

object FrmImpressaoPZumba: TFrmImpressaoPZumba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impressao de cadastros na  Zumba'
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
    Left = 0
    Top = -24
    Width = 794
    Height = 1123
    DataSource = FrmConsultarZumba.DSProntuario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object RLBand1: TRLBand
      Left = 38
      Top = 132
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
        DataSource = FrmConsultarZumba.DSProntuario
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 85
        Top = 33
        Width = 125
        Height = 16
        DataField = 'TBPRT_ENDERECO'
        DataSource = FrmConsultarZumba.DSProntuario
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
        DataSource = FrmConsultarZumba.DSProntuario
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
        DataSource = FrmConsultarZumba.DSProntuario
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
        DataSource = FrmConsultarZumba.DSProntuario
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 94
      BandType = btTitle
      object RLLabelTitulo: TRLLabel
        Left = 15
        Top = 44
        Width = 304
        Height = 19
        Caption = 'Relat'#243'rio de cadastrados na Zumba:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 15
        Top = 19
        Width = 246
        Height = 19
        Alignment = taCenter
        Caption = 'Centro Social Dr Manoel Kadete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelBairro: TRLLabel
        Left = 73
        Top = 69
        Width = 8
        Height = 19
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabelLocal: TRLLabel
        Left = 15
        Top = 69
        Width = 52
        Height = 19
        Caption = 'Local:'
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

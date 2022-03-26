object FrmImpressaoAniv: TFrmImpressaoAniv
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Aniversariantes'
  ClientHeight = 427
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = -8
    Width = 794
    Height = 1123
    DataSource = FrmAniversariantes.DsAniversariantes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.Defaults = pdIgnoreDefaults
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      object RLLabel5: TRLLabel
        Left = 250
        Top = 24
        Width = 217
        Height = 19
        Align = faCenterBottom
        Caption = 'Relat'#243'rio de aniversariantes'
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
    object RLBand1: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 120
      object RLDBText1: TRLDBText
        Left = 67
        Top = 11
        Width = 43
        Height = 16
        DataField = 'TBPRT_NOME'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 16
        Top = 11
        Width = 45
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 16
        Top = 33
        Width = 82
        Height = 16
        Caption = 'Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 104
        Top = 33
        Width = 89
        Height = 16
        DataField = 'TBPRT_NASCIMENTO'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 272
        Top = 32
        Width = 80
        Height = 16
        Caption = 'Anivers'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 358
        Top = 32
        Width = 92
        Height = 16
        DataField = 'TBPRT_ANIVERSARIO'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 342
        Top = 73
        Width = 54
        Height = 16
        Caption = 'Celular:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 402
        Top = 73
        Width = 63
        Height = 16
        DataField = 'TBPRT_CELULAR'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 16
        Top = 55
        Width = 68
        Height = 16
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 90
        Top = 55
        Width = 77
        Height = 16
        DataField = 'TBPRT_ENDERECO'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
      object RLLabel8: TRLLabel
        Left = 14
        Top = 77
        Width = 47
        Height = 16
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText6: TRLDBText
        Left = 67
        Top = 77
        Width = 53
        Height = 16
        DataField = 'TBPRT_BAIRRO'
        DataSource = FrmAniversariantes.DsAniversariantes
        Text = ''
      end
    end
  end
end

object FrmImpressaoAtendColab: TFrmImpressaoAtendColab
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Impress'#227'o de atendimentos'
  ClientHeight = 353
  ClientWidth = 619
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
    DataSource = FrmConsultaAtendColab.DSAtendimentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btTitle
      object RLLabel1: TRLLabel
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
      object RLLabel2: TRLLabel
        Left = 220
        Top = 27
        Width = 278
        Height = 16
        Align = faCenterBottom
        Caption = 'Relat'#243'rio de atendimentos por colaborador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 128
      object RLDBText1: TRLDBText
        Left = 65
        Top = 16
        Width = 38
        Height = 16
        DataField = 'TBATENDIMENTO_DATA'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 16
        Top = 16
        Width = 37
        Height = 16
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 200
        Top = 14
        Width = 75
        Height = 16
        Caption = 'Prontuario:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 281
        Top = 14
        Width = 88
        Height = 16
        DataField = 'ID_TBPRT'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 16
        Top = 38
        Width = 87
        Height = 16
        Caption = 'Colaborador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 109
        Top = 38
        Width = 104
        Height = 16
        DataField = 'TBCOLAB_NOME'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 16
        Top = 60
        Width = 97
        Height = 16
        Caption = 'Especialidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 119
        Top = 60
        Width = 107
        Height = 16
        DataField = 'TBSERV_NOME'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel7: TRLLabel
        Left = 16
        Top = 82
        Width = 36
        Height = 16
        Caption = 'OBS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 57
        Top = 82
        Width = 70
        Height = 16
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
    end
  end
end

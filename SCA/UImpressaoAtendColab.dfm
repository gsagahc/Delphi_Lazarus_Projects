object FrmImpressaoAtendColab: TFrmImpressaoAtendColab
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de atendimentos'
  ClientHeight = 480
  ClientWidth = 741
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
  object RLReport1: TRLReport
    Left = -8
    Top = -8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 61
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 235
        Top = 9
        Width = 208
        Height = 16
        Caption = 'Centro Social Dr Manoel Cadete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 216
        Top = 31
        Width = 248
        Height = 16
        Caption = 'Relat'#243'rio de atendimentos por colaborador'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 99
      Width = 718
      Height = 96
      object Label3: TLabel
        Left = 88
        Top = 120
        Width = 39
        Height = 16
        Caption = 'NOME'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 88
        Top = 168
        Width = 103
        Height = 16
        Caption = 'ESPECIALIDADE'
        FocusControl = DBEdit4
      end
      object DBEdit3: TDBEdit
        Left = 88
        Top = 136
        Width = 1304
        Height = 24
        DataField = 'TBCOLAB_NOME'
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 88
        Top = 184
        Width = 394
        Height = 24
        DataField = 'TBSERV_NOME'
        TabOrder = 1
      end
      object RLDBText1: TRLDBText
        Left = 97
        Top = 16
        Width = 88
        Height = 16
        DataField = 'ID_TBPRT'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 24
        Top = 16
        Width = 75
        Height = 16
        Caption = 'Prontu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 347
        Top = 16
        Width = 38
        Height = 16
        DataField = 'TBATENDIMENTO_DATA'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 304
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
      object RLDBText3: TRLDBText
        Left = 75
        Top = 40
        Width = 43
        Height = 16
        DataField = 'TBCOLAB_NOME'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 24
        Top = 40
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
      object RLDBText4: TRLDBText
        Left = 124
        Top = 62
        Width = 107
        Height = 16
        DataField = 'TBSERV_NOME'
        DataSource = FrmConsultaAtendColab.DSAtendimentos
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 24
        Top = 62
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
    end
  end
end

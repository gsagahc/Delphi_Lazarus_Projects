object FrmShowContaRec: TFrmShowContaRec
  Left = 668
  Top = 180
  AlphaBlend = True
  AlphaBlendValue = 200
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a receber com vencimento para hoje'
  ClientHeight = 260
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 16
    Width = 286
    Height = 13
    Caption = 'CONTAS A RECEBER COM VENCIMENTO PARA :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 400
    Top = 224
    Width = 46
    Height = 20
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 96
    Top = 208
    Width = 68
    Height = 13
    Caption = 'Transparencia'
  end
  object TrackBar1: TTrackBar
    Left = 48
    Top = 224
    Width = 193
    Height = 33
    Max = 255
    Min = 100
    Orientation = trHorizontal
    Frequency = 20
    Position = 200
    SelEnd = 0
    SelStart = 0
    TabOrder = 0
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = TrackBar1Change
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 545
    Height = 161
    DataSource = dmPrincipal.DSShowContaRec
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VENCTO'
        Title.Caption = 'Vencimento'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 308
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDIDO'
        Title.Caption = 'Pedido'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
end

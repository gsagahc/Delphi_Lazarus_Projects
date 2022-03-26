object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 726
  Height = 151
  AutoScroll = False
  TabOrder = 0
  object Label2: TLabel
    Left = 504
    Top = 112
    Width = 43
    Height = 18
    Caption = 'Total:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 4
    Width = 717
    Height = 103
    Color = clCream
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 642
      Top = 60
      Width = 73
      Height = 38
      Caption = 'Fechar'
      Flat = True
    end
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 715
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'CONTAS A RECEBER COM VENCIMENTO PARA HOJE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 20
      Width = 639
      Height = 79
      DataSource = dmPrincipal.DSShowContaRec
      TabOrder = 0
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO'
          Title.Caption = 'Pedido'
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
end

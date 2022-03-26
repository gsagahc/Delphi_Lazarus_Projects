object FrmConsultarBairro: TFrmConsultarBairro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consultar prontu'#225'rio'
  ClientHeight = 460
  ClientWidth = 763
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
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 4
      Width = 44
      Height = 13
      Caption = 'BAIRRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtBairro: TEdit
      Left = 32
      Top = 23
      Width = 705
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EdtBairroChange
    end
    object BtnFechar: TBitBtn
      Left = 662
      Top = 81
      Width = 75
      Height = 59
      Caption = 'Voltar'
      TabOrder = 1
      OnClick = BtnFecharClick
    end
    object BtnLimpar: TBitBtn
      Left = 509
      Top = 81
      Width = 75
      Height = 59
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = BtnLimparClick
    end
    object BitBtn1: TBitBtn
      Left = 586
      Top = 81
      Width = 75
      Height = 59
      Caption = 'Impress'#227'o'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 145
    Width = 763
    Height = 315
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 761
      Height = 285
      Align = alClient
      DataSource = DSProntuario
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TBPRT_NOME'
          Title.Caption = 'NOME'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRT_BAIRRO'
          Title.Caption = 'BAIRRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRT_RG'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRT_CPF'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRT_CELULAR'
          Title.Caption = 'CELULAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRT_ENDERECO'
          Title.Caption = 'ENDERE'#199'O'
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 286
      Width = 761
      Height = 28
      Panels = <
        item
          Text = 'N'#250'mero de registros:'
          Width = 200
        end
        item
          Width = 50
        end>
    end
  end
  object DSProntuario: TDataSource
    DataSet = IBQProntuario
    Left = 184
    Top = 232
  end
  object IBQProntuario: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT TBPRT_CELULAR, '
      '             TBPRT_CPF, '
      '             TBPRT_NOME, '
      '             TBPRT_RG, '
      '             TBPRT_ENDERECO,'
      '              ID_TBPRT, '
      '              TBPRT_BAIRRO from TB_PRT'
      'ORDER BY TBPRT_NOME')
    Left = 120
    Top = 232
    object IBQProntuarioTBPRT_CELULAR: TIBStringField
      FieldName = 'TBPRT_CELULAR'
      Origin = '"TB_PRT"."TBPRT_CELULAR"'
      FixedChar = True
      Size = 14
    end
    object IBQProntuarioTBPRT_CPF: TIBStringField
      FieldName = 'TBPRT_CPF'
      Origin = '"TB_PRT"."TBPRT_CPF"'
      FixedChar = True
      Size = 16
    end
    object IBQProntuarioTBPRT_NOME: TIBStringField
      FieldName = 'TBPRT_NOME'
      Origin = '"TB_PRT"."TBPRT_NOME"'
      Size = 150
    end
    object IBQProntuarioTBPRT_ENDERECO: TIBStringField
      FieldName = 'TBPRT_ENDERECO'
      Origin = '"TB_PRT"."TBPRT_ENDERECO"'
      Size = 100
    end
    object IBQProntuarioID_TBPRT: TIntegerField
      FieldName = 'ID_TBPRT'
      Origin = '"TB_PRT"."ID_TBPRT"'
    end
    object IBQProntuarioTBPRT_BAIRRO: TIBStringField
      FieldName = 'TBPRT_BAIRRO'
      Origin = '"TB_PRT"."TBPRT_BAIRRO"'
      FixedChar = True
      Size = 100
    end
    object IBQProntuarioTBPRT_RG: TIBStringField
      FieldName = 'TBPRT_RG'
      Origin = '"TB_PRT"."TBPRT_RG"'
      FixedChar = True
      Size = 12
    end
  end
  object TimerBusca: TTimer
    OnTimer = TimerBuscaTimer
    Left = 176
    Top = 200
  end
  object IBSQLCadastros: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 168
    Top = 296
  end
end

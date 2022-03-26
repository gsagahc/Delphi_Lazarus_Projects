object FrmConsultarpRua: TFrmConsultarpRua
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta '
  ClientHeight = 480
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
    Height = 161
    Align = alTop
    TabOrder = 0
    DesignSize = (
      763
      161)
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 24
      Height = 13
      Caption = 'RUA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 80
      Top = 112
      Width = 173
      Height = 13
      Caption = 'Dica: Digite o nome da rua desejada'
    end
    object Shape1: TShape
      Left = 52
      Top = 98
      Width = 233
      Height = 40
      Pen.Mode = pmMask
      Shape = stRoundRect
    end
    object EdtRua: TEdit
      Left = 16
      Top = 51
      Width = 721
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EdtRuaChange
    end
    object BtnFechar: TBitBtn
      Left = 666
      Top = 98
      Width = 75
      Height = 59
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Voltar'
      TabOrder = 1
      OnClick = BtnFecharClick
    end
    object BtnLimpar: TBitBtn
      Left = 512
      Top = 98
      Width = 75
      Height = 59
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = BtnLimparClick
    end
    object BitBtn1: TBitBtn
      Left = 589
      Top = 98
      Width = 75
      Height = 59
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 161
    Width = 763
    Height = 319
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 761
      Height = 289
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
      Top = 290
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
    Left = 216
    Top = 232
  end
  object IBQProntuario: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT TBPRT_CELULAR, TBPRT_ANOTACOES, TBPRT_BAIRRO, TBPRT_CPF, ' +
        'TBPRT_NOME, TBPRT_RG, TBPRT_ENDERECO, ID_TBPRT  from TB_PRT')
    Left = 128
    Top = 216
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
    object IBQProntuarioTBPRT_ANOTACOES: TIBStringField
      FieldName = 'TBPRT_ANOTACOES'
      Origin = '"TB_PRT"."TBPRT_ANOTACOES"'
      Size = 2000
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
    Left = 216
    Top = 192
  end
  object IBSQLCadastros: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 168
    Top = 296
  end
end

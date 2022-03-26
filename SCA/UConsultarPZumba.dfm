object FrmConsultarZumba: TFrmConsultarZumba
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 97
    Align = alTop
    TabOrder = 0
    DesignSize = (
      763
      97)
    object Label3: TLabel
      Left = 12
      Top = 8
      Width = 169
      Height = 13
      Caption = 'SELECIONE O LOCAL DA ZUMBA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnFechar: TBitBtn
      Left = 666
      Top = 6
      Width = 80
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Voltar'
      TabOrder = 0
      OnClick = BtnFecharClick
    end
    object BitBtn1: TBitBtn
      Left = 580
      Top = 6
      Width = 80
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object CbBoxSelecao: TComboBox
      Left = 12
      Top = 27
      Width = 541
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 2
      Text = 'TODOS'
      OnChange = CbBoxSelecaoChange
      Items.Strings = (
        'TODOS'
        'LORETO'
        'CAJUEIRO SECO')
    end
    object CheckBoxSalao: TCheckBox
      Left = 12
      Top = 62
      Width = 133
      Height = 17
      Caption = 'SAL'#195'O DE FESTAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = CheckBoxSalaoClick
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 97
    Width = 763
    Height = 383
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 761
      Height = 353
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
        end
        item
          Expanded = False
          FieldName = 'TBPRT_LZUMBA'
          Title.Caption = 'LOCAL DA ZUMBA'
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 354
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
    AutoEdit = False
    DataSet = IBQProntuario
    Left = 264
    Top = 192
  end
  object IBQProntuario: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT TBPRT_CELULAR,'
      '             TBPRT_ANOTACOES, '
      '             TBPRT_BAIRRO, '
      '             TBPRT_CPF,'
      '             TBPRT_NOME,'
      '             TBPRT_RG, '
      '             TBPRT_ENDERECO, '
      '             ID_TBPRT, '
      '             TBPRT_LZUMBA '
      'FROM TB_PRT'
      'ORDER BY TBPRT_NOME')
    Left = 176
    Top = 192
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
    object IBQProntuarioTBPRT_LZUMBA: TIBStringField
      FieldName = 'TBPRT_LZUMBA'
      Origin = '"TB_PRT"."TBPRT_LZUMBA"'
    end
    object IBQProntuarioTBPRT_RG: TIBStringField
      FieldName = 'TBPRT_RG'
      Origin = '"TB_PRT"."TBPRT_RG"'
      FixedChar = True
      Size = 12
    end
  end
  object TimerBusca: TTimer
    Enabled = False
    OnTimer = TimerBuscaTimer
    Left = 216
    Top = 192
  end
  object IBSQLCadastros: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 304
    Top = 192
  end
end

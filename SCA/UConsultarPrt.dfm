object FrmConsultarPrt: TFrmConsultarPrt
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consultar prontu'#225'rio'
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
    Height = 209
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 4
      Width = 31
      Height = 13
      Caption = 'NOME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 407
      Top = 4
      Width = 20
      Height = 13
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 48
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
    object Label4: TLabel
      Left = 407
      Top = 48
      Width = 16
      Height = 13
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 92
      Width = 49
      Height = 13
      Caption = 'CELULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 407
      Top = 92
      Width = 104
      Height = 13
      Caption = 'N. DE PRONTU'#193'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNome: TEdit
      Left = 32
      Top = 23
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EdtNomeChange
    end
    object EdtRua: TEdit
      Left = 32
      Top = 65
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = EdtRuaChange
    end
    object EdtRG: TEdit
      Left = 407
      Top = 65
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = EdtRGChange
    end
    object EdtCelular: TEdit
      Left = 32
      Top = 111
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = EdtCelularChange
    end
    object EdtCPF: TEdit
      Left = 407
      Top = 21
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = EdtCPFChange
    end
    object BtnFechar: TBitBtn
      Left = 662
      Top = 145
      Width = 75
      Height = 59
      Caption = 'Voltar'
      TabOrder = 5
      OnClick = BtnFecharClick
    end
    object BtnLimpar: TBitBtn
      Left = 581
      Top = 145
      Width = 75
      Height = 59
      Caption = 'Limpar'
      TabOrder = 6
      OnClick = BtnLimparClick
    end
    object EditProntuario: TEdit
      Left = 407
      Top = 111
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      OnChange = EditProntuarioChange
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 209
    Width = 763
    Height = 271
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 761
      Height = 241
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
      Top = 242
      Width = 761
      Height = 28
      Panels = <
        item
          Text = 'N'#250'mero de registros:'
          Width = 120
        end
        item
          Width = 50
        end>
    end
  end
  object DSProntuario: TDataSource
    DataSet = IBQProntuario
    Left = 280
    Top = 272
  end
  object IBQProntuario: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT TBPRT_CELULAR, TBPRT_CPF, TBPRT_NOME, TBPRT_RG, TBPRT_END' +
        'ERECO, ID_TBPRT  from TB_PRT')
    Left = 216
    Top = 208
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
  object IBSQL1: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 248
    Top = 305
  end
end

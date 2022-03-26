object FrmShowCheques: TFrmShowCheques
  Left = 709
  Top = 122
  AlphaBlend = True
  AlphaBlendValue = 200
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cheques com vencimento para hoje'
  ClientHeight = 372
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
    Left = 128
    Top = 16
    Width = 281
    Height = 13
    Caption = 'CHEQUES EMITIDOS COM VENCIMENTO PARA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 392
    Top = 152
    Width = 46
    Height = 20
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 109
    Top = 313
    Width = 68
    Height = 13
    Caption = 'Transparencia'
  end
  object Label4: TLabel
    Left = 400
    Top = 309
    Width = 46
    Height = 20
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 128
    Top = 178
    Width = 292
    Height = 13
    Caption = 'CHEQUES RECEBIDOS COM VENCIMENTO PARA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TrackBar1: TTrackBar
    Left = 48
    Top = 333
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
    Height = 107
    DataSource = DSEmitidos
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
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Fornecedor'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 136
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 198
    Width = 545
    Height = 107
    DataSource = DSRecebidos
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_VENCIMENTO'
        Title.Caption = 'Vencimento'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMITENTE'
        Title.Caption = 'Cliente'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 136
        Visible = True
      end>
  end
  object DSEmitidos: TDataSource
    DataSet = QryChequesEmitidos
    Left = 328
    Top = 317
  end
  object DSRecebidos: TDataSource
    DataSet = QryChequesRecebids
    Left = 512
    Top = 309
  end
  object QryChequesRecebids: TQuery
    Active = True
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CHEQUES WHERE TIPO ='#39'R'#39)
    Left = 480
    Top = 309
    object QryChequesRecebidsINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'BANCODADOS.CHEQUES.INDICE'
    end
    object QryChequesRecebidsTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BANCODADOS.CHEQUES.TIPO'
      FixedChar = True
      Size = 1
    end
    object QryChequesRecebidsDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'BANCODADOS.CHEQUES.DT_EMISSAO'
    end
    object QryChequesRecebidsDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'BANCODADOS.CHEQUES.DT_VENCIMENTO'
    end
    object QryChequesRecebidsDT_COMPENSACAO: TDateTimeField
      FieldName = 'DT_COMPENSACAO'
      Origin = 'BANCODADOS.CHEQUES.DT_COMPENSACAO'
    end
    object QryChequesRecebidsEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'BANCODADOS.CHEQUES.EMITENTE'
      FixedChar = True
      Size = 60
    end
    object QryChequesRecebidsCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'BANCODADOS.CHEQUES.CLIENTE'
      FixedChar = True
      Size = 60
    end
    object QryChequesRecebidsBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCODADOS.CHEQUES.BANCO'
      FixedChar = True
      Size = 50
    end
    object QryChequesRecebidsAG: TStringField
      FieldName = 'AG'
      Origin = 'BANCODADOS.CHEQUES.AG'
      FixedChar = True
      Size = 6
    end
    object QryChequesRecebidsCC: TStringField
      FieldName = 'CC'
      Origin = 'BANCODADOS.CHEQUES.CC'
      FixedChar = True
      Size = 15
    end
    object QryChequesRecebidsNUMCHEQUE: TStringField
      FieldName = 'NUMCHEQUE'
      Origin = 'BANCODADOS.CHEQUES.NUMCHEQUE'
      FixedChar = True
      Size = 6
    end
    object QryChequesRecebidsVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CHEQUES.VALOR'
      currency = True
    end
    object QryChequesRecebidsCPF: TStringField
      FieldName = 'CPF'
      Origin = 'BANCODADOS.CHEQUES.CPF'
      FixedChar = True
      Size = 14
    end
    object QryChequesRecebidsOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BANCODADOS.CHEQUES.OBS'
      FixedChar = True
      Size = 100
    end
    object QryChequesRecebidsCHQ_TERCEIRO: TStringField
      FieldName = 'CHQ_TERCEIRO'
      Origin = 'BANCODADOS.CHEQUES.CHQ_TERCEIRO'
      FixedChar = True
      Size = 1
    end
    object QryChequesRecebidsMES_EMISSAO: TStringField
      FieldName = 'MES_EMISSAO'
      Origin = 'BANCODADOS.CHEQUES.MES_EMISSAO'
      FixedChar = True
      Size = 2
    end
    object QryChequesRecebidsSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BANCODADOS.CHEQUES.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object QryChequesEmitidos: TQuery
    Active = True
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CHEQUES WHERE TIPO ='#39'E'#39)
    Left = 288
    Top = 317
    object QryChequesEmitidosINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'BANCODADOS.CHEQUES.INDICE'
    end
    object QryChequesEmitidosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BANCODADOS.CHEQUES.TIPO'
      FixedChar = True
      Size = 1
    end
    object QryChequesEmitidosDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'BANCODADOS.CHEQUES.DT_EMISSAO'
    end
    object QryChequesEmitidosDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'BANCODADOS.CHEQUES.DT_VENCIMENTO'
    end
    object QryChequesEmitidosDT_COMPENSACAO: TDateTimeField
      FieldName = 'DT_COMPENSACAO'
      Origin = 'BANCODADOS.CHEQUES.DT_COMPENSACAO'
    end
    object QryChequesEmitidosEMITENTE: TStringField
      FieldName = 'EMITENTE'
      Origin = 'BANCODADOS.CHEQUES.EMITENTE'
      FixedChar = True
      Size = 60
    end
    object QryChequesEmitidosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'BANCODADOS.CHEQUES.CLIENTE'
      FixedChar = True
      Size = 60
    end
    object QryChequesEmitidosBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCODADOS.CHEQUES.BANCO'
      FixedChar = True
      Size = 50
    end
    object QryChequesEmitidosAG: TStringField
      FieldName = 'AG'
      Origin = 'BANCODADOS.CHEQUES.AG'
      FixedChar = True
      Size = 6
    end
    object QryChequesEmitidosCC: TStringField
      FieldName = 'CC'
      Origin = 'BANCODADOS.CHEQUES.CC'
      FixedChar = True
      Size = 15
    end
    object QryChequesEmitidosNUMCHEQUE: TStringField
      FieldName = 'NUMCHEQUE'
      Origin = 'BANCODADOS.CHEQUES.NUMCHEQUE'
      FixedChar = True
      Size = 6
    end
    object QryChequesEmitidosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CHEQUES.VALOR'
      currency = True
    end
    object QryChequesEmitidosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'BANCODADOS.CHEQUES.CPF'
      FixedChar = True
      Size = 14
    end
    object QryChequesEmitidosOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BANCODADOS.CHEQUES.OBS'
      FixedChar = True
      Size = 100
    end
    object QryChequesEmitidosCHQ_TERCEIRO: TStringField
      FieldName = 'CHQ_TERCEIRO'
      Origin = 'BANCODADOS.CHEQUES.CHQ_TERCEIRO'
      FixedChar = True
      Size = 1
    end
    object QryChequesEmitidosMES_EMISSAO: TStringField
      FieldName = 'MES_EMISSAO'
      Origin = 'BANCODADOS.CHEQUES.MES_EMISSAO'
      FixedChar = True
      Size = 2
    end
    object QryChequesEmitidosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BANCODADOS.CHEQUES.STATUS'
      FixedChar = True
      Size = 1
    end
  end
end

object FrmShowContaPag: TFrmShowContaPag
  Left = 137
  Top = 122
  AlphaBlend = True
  AlphaBlendValue = 200
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Contas a pagar e receber:'
  ClientHeight = 373
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
    Width = 270
    Height = 13
    Caption = 'CONTAS A PAGAR COM VENCIMENTO PARA :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 400
    Top = 150
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
    Left = 108
    Top = 314
    Width = 68
    Height = 13
    Caption = 'Transparencia'
  end
  object Label4: TLabel
    Left = 400
    Top = 310
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
    Left = 120
    Top = 183
    Width = 282
    Height = 13
    Caption = 'CONTAS A RECEBER COM VENCIMENTO PARA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TrackBar1: TTrackBar
    Left = 48
    Top = 334
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
    DataSource = DSShowContaPag
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
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
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
    Top = 199
    Width = 545
    Height = 105
    DataSource = DSShowContaRec
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
        FieldName = 'VENCTO'
        Title.Caption = 'Vencimento'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
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
  object QryShowContaPag: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CONTAPAG')
    Left = 360
    Top = 336
    object QryShowContaPagFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'BANCODADOS.CONTAPAG.FORNECEDOR'
      FixedChar = True
      Size = 40
    end
    object QryShowContaPagVENCTO: TDateTimeField
      FieldName = 'VENCTO'
      Origin = 'BANCODADOS.CONTAPAG.VENCTO'
    end
    object QryShowContaPagVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CONTAPAG.VALOR'
      currency = True
    end
    object QryShowContaPagPAGTO: TDateTimeField
      FieldName = 'PAGTO'
      Origin = 'BANCODADOS.CONTAPAG.PAGTO'
    end
    object QryShowContaPagPAGO: TStringField
      FieldName = 'PAGO'
      Origin = 'BANCODADOS.CONTAPAG.PAGO'
      FixedChar = True
      Size = 1
    end
  end
  object QryShowContaRec: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      
        'SELECT CREC.VENCTO,CREC.VALOR,CREC.EMISSAO, CREC.PEDIDO, CREC.da' +
        'taped, CREC.cliente,'
      'CREC.nota, CL.codigo,CL.nome FROM CONTAREC CREC'
      'INNER JOIN CLIENTES CL ON CREC.CLIENTE=CL.CODIGO')
    Left = 464
    Top = 336
    object QryShowContaRecVENCTO: TDateTimeField
      FieldName = 'VENCTO'
      Origin = 'BANCODADOS.CONTAREC.VENCTO'
    end
    object QryShowContaRecVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BANCODADOS.CONTAREC.VALOR'
      currency = True
    end
    object QryShowContaRecEMISSAO: TDateTimeField
      FieldName = 'EMISSAO'
      Origin = 'BANCODADOS.CONTAREC.EMISSAO'
    end
    object QryShowContaRecDATAPED: TDateTimeField
      FieldName = 'DATAPED'
      Origin = 'BANCODADOS.CONTAREC.DATAPED'
    end
    object QryShowContaRecCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'BANCODADOS.CONTAREC.CLIENTE'
    end
    object QryShowContaRecNOTA: TStringField
      FieldName = 'NOTA'
      Origin = 'BANCODADOS.CONTAREC.NOTA'
      FixedChar = True
      Size = 6
    end
    object QryShowContaRecCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryShowContaRecNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object QryShowContaRecPEDIDO: TStringField
      FieldName = 'PEDIDO'
      FixedChar = True
      Size = 10
    end
  end
  object DSShowContaPag: TDataSource
    DataSet = QryShowContaPag
    Left = 328
    Top = 336
  end
  object DSShowContaRec: TDataSource
    DataSet = QryShowContaRec
    Left = 496
    Top = 336
  end
end

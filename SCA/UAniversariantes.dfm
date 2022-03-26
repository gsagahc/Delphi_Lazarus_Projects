object FrmAniversariantes: TFrmAniversariantes
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aniversariantes'
  ClientHeight = 359
  ClientWidth = 644
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 83
    Align = alTop
    TabOrder = 0
    DesignSize = (
      644
      83)
    object BtnFechar: TBitBtn
      Left = 552
      Top = 24
      Width = 81
      Height = 53
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Voltar'
      TabOrder = 0
      OnClick = BtnFecharClick
    end
    object BitBtn1: TBitBtn
      Left = 465
      Top = 24
      Width = 81
      Height = 53
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object RadioGroup1: TRadioGroup
      Left = 24
      Top = 18
      Width = 337
      Height = 55
      Caption = 'Selecione uma op'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Aniversariantes do m'#234's'
        'Aniversariantes do dia')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 83
    Width = 644
    Height = 257
    Align = alClient
    DataSource = DsAniversariantes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 340
    Width = 644
    Height = 19
    Panels = <
      item
        Text = 'N'#250'mero de aniversariantes:'
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Timer1: TTimer
    Left = 224
    Top = 144
  end
  object DsAniversariantes: TDataSource
    DataSet = IBQueryAniversariantes
    Left = 264
    Top = 152
  end
  object IBQueryAniversariantes: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT TBPRT_NOME,'
      '       TBPRT_ENDERECO,'
      '       TBPRT_NUMERO,'
      '       TBPRT_COMPLEMENTO,'
      '       TBPRT_EMAIL,'
      '       TBPRT_BAIRRO,'
      '       TBPRT_CIDADE,'
      '       TBPRT_CELULAR,'
      '       TBPRT_NASCIMENTO,'
      '       TBPRT_ANIVERSARIO'
      'FROM TB_PRT'
      'WHERE TBPRT_ANIVERSARIO LIKE '#39'%/07%'#39)
    Left = 328
    Top = 152
    object IBQueryAniversariantesTBPRT_NOME: TIBStringField
      DisplayLabel = 'NOME'
      DisplayWidth = 50
      FieldName = 'TBPRT_NOME'
      Origin = '"TB_PRT"."TBPRT_NOME"'
      Size = 150
    end
    object IBQueryAniversariantesTBPRT_ANIVERSARIO: TIBStringField
      DisplayLabel = 'ANIVERSARIO'
      FieldName = 'TBPRT_ANIVERSARIO'
      Origin = '"TB_PRT"."TBPRT_ANIVERSARIO"'
      FixedChar = True
      Size = 8
    end
    object IBQueryAniversariantesTBPRT_NASCIMENTO: TDateField
      DisplayLabel = 'NASCIMENTO'
      FieldName = 'TBPRT_NASCIMENTO'
      Origin = '"TB_PRT"."TBPRT_NASCIMENTO"'
    end
    object IBQueryAniversariantesTBPRT_CELULAR: TIBStringField
      DisplayLabel = 'CELULAR'
      FieldName = 'TBPRT_CELULAR'
      Origin = '"TB_PRT"."TBPRT_CELULAR"'
      FixedChar = True
      Size = 14
    end
    object IBQueryAniversariantesTBPRT_ENDERECO: TIBStringField
      DisplayLabel = 'ENDERE'#199'O'
      FieldName = 'TBPRT_ENDERECO'
      Origin = '"TB_PRT"."TBPRT_ENDERECO"'
      Size = 100
    end
    object IBQueryAniversariantesTBPRT_NUMERO: TSmallintField
      DisplayLabel = 'N'#218'MERO'
      FieldName = 'TBPRT_NUMERO'
      Origin = '"TB_PRT"."TBPRT_NUMERO"'
    end
    object IBQueryAniversariantesTBPRT_COMPLEMENTO: TIBStringField
      DisplayLabel = 'COMPLEMENTO'
      FieldName = 'TBPRT_COMPLEMENTO'
      Origin = '"TB_PRT"."TBPRT_COMPLEMENTO"'
      FixedChar = True
      Size = 100
    end
    object IBQueryAniversariantesTBPRT_EMAIL: TIBStringField
      DisplayLabel = 'EMAIL'
      FieldName = 'TBPRT_EMAIL'
      Origin = '"TB_PRT"."TBPRT_EMAIL"'
      FixedChar = True
      Size = 100
    end
    object IBQueryAniversariantesTBPRT_BAIRRO: TIBStringField
      DisplayLabel = 'BAIRRO'
      FieldName = 'TBPRT_BAIRRO'
      Origin = '"TB_PRT"."TBPRT_BAIRRO"'
      FixedChar = True
      Size = 100
    end
    object IBQueryAniversariantesTBPRT_CIDADE: TIBStringField
      DisplayLabel = 'CIDADE'
      FieldName = 'TBPRT_CIDADE'
      Origin = '"TB_PRT"."TBPRT_CIDADE"'
      FixedChar = True
      Size = 100
    end
  end
  object IBSQL1: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 160
    Top = 144
  end
end

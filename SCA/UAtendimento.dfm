object FrmAtendimento: TFrmAtendimento
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atendimento'
  ClientHeight = 417
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBotoes: TPanel
    Left = 0
    Top = 346
    Width = 635
    Height = 71
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = -35
      Top = 6
      Width = 642
      Height = 59
      Align = alCustom
      TabOrder = 0
      object BtnFechar: TBitBtn
        Left = 547
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = BtnFecharClick
      end
      object BtnSalvar: TBitBtn
        Left = 381
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 1
        OnClick = BtnSalvarClick
      end
      object BtnInserir: TBitBtn
        Left = 300
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Novo'
        TabOrder = 2
        OnClick = BtnInserirClick
      end
      object BtnCancelar: TBitBtn
        Left = 463
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 3
        OnClick = BtnCancelarClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 346
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Atendimento'
      object Label1: TLabel
        Left = 7
        Top = 18
        Width = 74
        Height = 13
        Caption = 'PRONTU'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 159
        Top = 18
        Width = 31
        Height = 13
        Caption = 'DATA'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 343
        Top = 18
        Width = 48
        Height = 13
        Caption = 'SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 106
        Width = 31
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 148
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
      object Label6: TLabel
        Left = 192
        Top = 146
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 375
        Top = 146
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
      object Label8: TLabel
        Left = 3
        Top = 197
        Width = 79
        Height = 13
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 534
        Top = 146
        Width = 77
        Height = 13
        Caption = 'PRAZO VOLTA'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 64
        Width = 84
        Height = 13
        Caption = 'COLABORADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 7
        Top = 37
        Width = 134
        Height = 21
        DataField = 'ID_TBPRT'
        DataSource = DSAtendimento
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 159
        Top = 37
        Width = 161
        Height = 21
        DataField = 'TBATENDIMENTO_DATA'
        DataSource = DSAtendimento
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 7
        Top = 121
        Width = 609
        Height = 21
        DataField = 'TBPRT_NOME'
        DataSource = DsProntuario
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 6
        Top = 164
        Width = 161
        Height = 21
        DataField = 'TBPRT_RG'
        DataSource = DsProntuario
        ReadOnly = True
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 216
        Width = 607
        Height = 99
        DataField = 'TBATENDIMENTO_OBS'
        DataSource = DSAtendimento
        MaxLength = 1000
        ScrollBars = ssHorizontal
        TabOrder = 9
        OnKeyPress = DBMemo1KeyPress
      end
      object DBEdit5: TDBEdit
        Left = 192
        Top = 164
        Width = 160
        Height = 21
        DataField = 'TBPRT_CPF'
        DataSource = DsProntuario
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 375
        Top = 165
        Width = 134
        Height = 21
        DataField = 'TBPRT_CELULAR'
        DataSource = DsProntuario
        ReadOnly = True
        TabOrder = 7
      end
      object DBLookupCbxSERVICO: TDBLookupComboBox
        Left = 342
        Top = 37
        Width = 275
        Height = 21
        DataField = 'ID_TBSERV'
        DataSource = DSAtendimento
        DropDownRows = 10
        KeyField = 'ID_TBSERV'
        ListField = 'TBSERV_NOME'
        ListSource = DSServico
        TabOrder = 2
        OnExit = DBLookupCbxSERVICOExit
      end
      object DBEdit8: TDBEdit
        Left = 534
        Top = 165
        Width = 82
        Height = 21
        DataField = 'TBATENDIMENTO_PRAZOVOLTA'
        DataSource = DSAtendimento
        TabOrder = 8
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 6
        Top = 79
        Width = 609
        Height = 21
        DataField = 'ID_TBCOLABORADOR'
        DataSource = DSAtendimento
        KeyField = 'ID_COLAB'
        ListField = 'TBCOLAB_NOME'
        ListSource = DSCOLABORADOR
        TabOrder = 3
      end
      object DBLookupListBox1: TDBLookupListBox
        Left = 91
        Top = 221
        Width = 121
        Height = 95
        KeyField = 'ID_TBSERV'
        ListField = 'TBSERV_NOME'
        ListSource = DSServico
        TabOrder = 10
        Visible = False
      end
      object DBLookupListBox2: TDBLookupListBox
        Left = 296
        Top = 224
        Width = 121
        Height = 95
        KeyField = 'ID_COLAB'
        ListField = 'TBCOLAB_NOME'
        ListSource = DSCOLABORADOR
        TabOrder = 11
        Visible = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 1
      object DBMemo2: TDBMemo
        Left = 16
        Top = 48
        Width = 577
        Height = 209
        DataField = 'TBATENDIMENTO_OBS'
        DataSource = DSHistorico
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 3
        Width = 121
        Height = 21
        DataField = 'TBATENDIMENTO_DATA'
        DataSource = DSHistorico
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 176
        Top = 267
        Width = 224
        Height = 48
        DataSource = DSHistorico
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 2
      end
    end
  end
  object IBTbAtendimento: TIBTable
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TB_ATENDIMENTO'
    UniDirectional = False
    Left = 40
    Top = 344
    object IBTbAtendimentoID_TBPRT: TIntegerField
      FieldName = 'ID_TBPRT'
    end
    object IBTbAtendimentoID_TBSERV: TIntegerField
      FieldName = 'ID_TBSERV'
    end
    object IBTbAtendimentoTBATENDIMENTO_DATA: TDateField
      FieldName = 'TBATENDIMENTO_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object IBTbAtendimentoTBATENDIMENTO_OBS: TIBStringField
      FieldName = 'TBATENDIMENTO_OBS'
      Size = 250
    end
    object IBTbAtendimentoTBATENDIMENTO_PRAZOVOLTA: TIntegerField
      FieldName = 'TBATENDIMENTO_PRAZOVOLTA'
    end
    object IBTbAtendimentoID_TBCOLABORADOR: TIntegerField
      FieldName = 'ID_TBCOLABORADOR'
    end
  end
  object DSAtendimento: TDataSource
    DataSet = IBTbAtendimento
    Left = 200
    Top = 256
  end
  object DsProntuario: TDataSource
    DataSet = IBTbProntuario
    Left = 152
    Top = 264
  end
  object IBTbProntuario: TIBTable
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    ObjectView = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_TBPRT'
        DataType = ftInteger
      end
      item
        Name = 'TBPRT_NOME'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'TBPRT_RG'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TBPRT_CPF'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'TBPRT_ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBPRT_NUMERO'
        DataType = ftSmallint
      end
      item
        Name = 'TBPRT_COMPLEMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBPRT_EMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBPRT_BAIRRO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBPRT_CIDADE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBPRT_CELULAR'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TBPRT_TELEFONE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TBPRT_CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'TBPRT_ESTADOCIVIL'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TBPRT_SEXO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TBPRT_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'TBPRT_ZAP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TBPRT_ANIVERSARIO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'TBPRT_OBS'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TBPRT_PROFISSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TBPRT_ANOTACOES'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'TBPRT_NOMEMAE'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'TBPRT_ORGEMISSOR'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'TB_PRT'
    UniDirectional = False
    Left = 80
    Top = 352
    object IBTbProntuarioID_TBPRT: TIntegerField
      FieldName = 'ID_TBPRT'
    end
    object IBTbProntuarioTBPRT_NOME: TIBStringField
      FieldName = 'TBPRT_NOME'
      Size = 150
    end
    object IBTbProntuarioTBPRT_CPF: TIBStringField
      FieldName = 'TBPRT_CPF'
      Size = 16
    end
    object IBTbProntuarioTBPRT_ENDERECO: TIBStringField
      FieldName = 'TBPRT_ENDERECO'
      Size = 100
    end
    object IBTbProntuarioTBPRT_NUMERO: TSmallintField
      FieldName = 'TBPRT_NUMERO'
    end
    object IBTbProntuarioTBPRT_COMPLEMENTO: TIBStringField
      FieldName = 'TBPRT_COMPLEMENTO'
      Size = 100
    end
    object IBTbProntuarioTBPRT_EMAIL: TIBStringField
      FieldName = 'TBPRT_EMAIL'
      Size = 100
    end
    object IBTbProntuarioTBPRT_BAIRRO: TIBStringField
      FieldName = 'TBPRT_BAIRRO'
      Size = 100
    end
    object IBTbProntuarioTBPRT_CIDADE: TIBStringField
      FieldName = 'TBPRT_CIDADE'
      Size = 100
    end
    object IBTbProntuarioTBPRT_CELULAR: TIBStringField
      FieldName = 'TBPRT_CELULAR'
      Size = 14
    end
    object IBTbProntuarioTBPRT_TELEFONE: TIBStringField
      FieldName = 'TBPRT_TELEFONE'
      Size = 14
    end
    object IBTbProntuarioTBPRT_CEP: TIBStringField
      FieldName = 'TBPRT_CEP'
      Size = 9
    end
    object IBTbProntuarioTBPRT_ESTADOCIVIL: TIBStringField
      FieldName = 'TBPRT_ESTADOCIVIL'
      Size = 14
    end
    object IBTbProntuarioTBPRT_SEXO: TIBStringField
      FieldName = 'TBPRT_SEXO'
      Size = 2
    end
    object IBTbProntuarioTBPRT_NASCIMENTO: TDateField
      FieldName = 'TBPRT_NASCIMENTO'
    end
    object IBTbProntuarioTBPRT_ZAP: TIBStringField
      FieldName = 'TBPRT_ZAP'
      Size = 1
    end
    object IBTbProntuarioTBPRT_ANIVERSARIO: TIBStringField
      FieldName = 'TBPRT_ANIVERSARIO'
      Size = 8
    end
    object IBTbProntuarioTBPRT_OBS: TIBStringField
      FieldName = 'TBPRT_OBS'
      Size = 1000
    end
    object IBTbProntuarioTBPRT_PROFISSAO: TIBStringField
      FieldName = 'TBPRT_PROFISSAO'
      Size = 30
    end
    object IBTbProntuarioTBPRT_RG: TIBStringField
      FieldName = 'TBPRT_RG'
      Size = 12
    end
  end
  object IBTBServicos: TIBTable
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_TBSERV'
        DataType = ftInteger
      end
      item
        Name = 'TBSERV_NOME'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'TBSERV_PRAZO'
        Attributes = [faFixed]
        DataType = ftWideString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'TB_SERV'
    UniDirectional = False
    Left = 100
    Top = 272
  end
  object DSServico: TDataSource
    DataSet = IBTBServicos
    Left = 52
    Top = 280
  end
  object IBQHistorico: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select TBATENDIMENTO_DATA, TBATENDIMENTO_OBS from TB_ATENDIMENTO')
    Left = 173
    Top = 369
  end
  object DSHistorico: TDataSource
    DataSet = IBQHistorico
    Left = 216
    Top = 360
  end
  object IBSQLPrazo15dias: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 164
    Top = 320
  end
  object IBQueryColab: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ID_COLAB, TBCOLAB_NOME from TB_COLABORADOR')
    Left = 260
    Top = 256
    object IBQueryColabID_COLAB: TIntegerField
      FieldName = 'ID_COLAB'
      Origin = '"TB_COLABORADOR"."ID_COLAB"'
    end
    object IBQueryColabTBCOLAB_NOME: TIBStringField
      FieldName = 'TBCOLAB_NOME'
      Origin = '"TB_COLABORADOR"."TBCOLAB_NOME"'
      Size = 100
    end
  end
  object DSCOLABORADOR: TDataSource
    DataSet = IBQueryColab
    Left = 340
    Top = 256
  end
end

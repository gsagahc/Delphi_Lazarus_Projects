object FrmCadColab: TFrmCadColab
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de colaboradores'
  ClientHeight = 412
  ClientWidth = 557
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 343
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 47
      Width = 27
      Height = 13
      Caption = 'FONE'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 5
      Width = 31
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEditNOME
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 86
      Width = 44
      Height = 13
      Caption = 'FUN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 123
      Width = 16
      Height = 13
      Caption = 'RG'
      FocusControl = DBEditRG
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 239
      Top = 51
      Width = 20
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEditCPF
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 318
      Top = 123
      Width = 57
      Height = 13
      Caption = 'REGISTRO'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 165
      Width = 20
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 204
      Width = 56
      Height = 13
      Caption = 'ENDERECO'
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 239
      Top = 167
      Width = 44
      Height = 13
      Caption = 'BAIRRO'
      FocusControl = DBEdit8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 240
      Width = 42
      Height = 13
      Caption = 'CIDADE'
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 239
      Top = 123
      Width = 45
      Height = 13
      Caption = 'ORIGEM'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 64
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_FONE'
      DataSource = DSColab
      TabOrder = 1
    end
    object DBEditNOME: TDBEdit
      Left = 16
      Top = 24
      Width = 529
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_NOME'
      DataSource = DSColab
      TabOrder = 0
    end
    object DBEditRG: TDBEdit
      Left = 16
      Top = 138
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_RG'
      DataSource = DSColab
      TabOrder = 4
    end
    object DBEditCPF: TDBEdit
      Left = 239
      Top = 64
      Width = 306
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_CPF'
      DataSource = DSColab
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 318
      Top = 138
      Width = 227
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_REGISTRO'
      DataSource = DSColab
      TabOrder = 6
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 99
      Width = 529
      Height = 21
      DataField = 'TBCOLAB_IDSERV'
      DataSource = DSColab
      KeyField = 'ID_TBSERV'
      ListField = 'TBSERV_NOME'
      ListSource = DSServicos
      TabOrder = 3
    end
    object DBNavigator1: TDBNavigator
      Left = 160
      Top = 286
      Width = 224
      Height = 48
      DataSource = DSColab
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 11
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 179
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_CEP'
      DataSource = DSColab
      TabOrder = 7
      OnExit = DBEdit3Exit
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 216
      Width = 529
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_ENDERECO'
      DataSource = DSColab
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 239
      Top = 179
      Width = 306
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_BAIRRO'
      DataSource = DSColab
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 255
      Width = 529
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_CIDADE'
      DataSource = DSColab
      TabOrder = 10
    end
    object DBLookupListBox1: TDBLookupListBox
      Left = 400
      Top = 296
      Width = 121
      Height = 95
      KeyField = 'ID_TBSERV'
      ListField = 'TBSERV_NOME'
      ListSource = DSServicos
      TabOrder = 12
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 239
      Top = 138
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TBCOLAB_ORGEMISSOR'
      DataSource = DSColab
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 343
    Width = 557
    Height = 69
    Align = alBottom
    TabOrder = 1
    object PnlBotoes: TPanel
      Left = 0
      Top = 6
      Width = 642
      Height = 59
      Align = alCustom
      TabOrder = 0
      object BtnFechar: TBitBtn
        Left = 438
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = BtnFecharClick
      end
      object BtnSalvar: TBitBtn
        Left = 276
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 1
        OnClick = BtnSalvarClick
      end
      object BtnAlterar: TBitBtn
        Left = 195
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Alterar'
        TabOrder = 2
        OnClick = BtnAlterarClick
      end
      object BtnExcluir: TBitBtn
        Left = 114
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = BtnExcluirClick
      end
      object BtnInserir: TBitBtn
        Left = 33
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Inserir'
        TabOrder = 4
        OnClick = BtnInserirClick
      end
      object BtnCancelar: TBitBtn
        Left = 357
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 5
        OnClick = BtnCancelarClick
      end
    end
  end
  object IBSQLUTIL: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    SQL.Strings = (
      'SELECT ID_TBSERV, TBSERV_NOME FROM TB_SERV')
    Transaction = FrmPrincipal.IBTransaction1
    Left = 8
    Top = 336
  end
  object IBTableColab: TIBTable
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_COLAB'
        DataType = ftInteger
      end
      item
        Name = 'TBCOLAB_FONE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TBCOLAB_NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBCOLAB_TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TBCOLAB_RG'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TBCOLAB_CPF'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'TBCOLAB_REGISTRO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TBCOLAB_ENDERECO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TBCOLAB_BAIRRO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TBCOLAB_CIDADE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TBCOLAB_CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TBCOLAB_IDSERV'
        DataType = ftInteger
      end
      item
        Name = 'TBCOLAB_ORGEMISSOR'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'TB_COLABORADOR'
    UniDirectional = False
    Left = 120
    Top = 296
    object IBTableColabTBCOLAB_FONE: TIBStringField
      FieldName = 'TBCOLAB_FONE'
      Size = 10
    end
    object IBTableColabTBCOLAB_NOME: TIBStringField
      FieldName = 'TBCOLAB_NOME'
      Size = 100
    end
    object IBTableColabTBCOLAB_TIPO: TIBStringField
      FieldName = 'TBCOLAB_TIPO'
    end
    object IBTableColabTBCOLAB_RG: TIBStringField
      FieldName = 'TBCOLAB_RG'
      Size = 10
    end
    object IBTableColabTBCOLAB_REGISTRO: TIBStringField
      FieldName = 'TBCOLAB_REGISTRO'
      Size = 10
    end
    object IBTableColabTBCOLAB_ENDERECO: TIBStringField
      FieldName = 'TBCOLAB_ENDERECO'
      Size = 100
    end
    object IBTableColabTBCOLAB_BAIRRO: TIBStringField
      FieldName = 'TBCOLAB_BAIRRO'
      Size = 50
    end
    object IBTableColabTBCOLAB_CIDADE: TIBStringField
      FieldName = 'TBCOLAB_CIDADE'
      Size = 50
    end
    object IBTableColabTBCOLAB_CEP: TIBStringField
      FieldName = 'TBCOLAB_CEP'
      Size = 10
    end
    object IBTableColabTBCOLAB_IDSERV: TIntegerField
      FieldName = 'TBCOLAB_IDSERV'
    end
    object IBTableColabTBCOLAB_ORGEMISSOR: TIBStringField
      FieldName = 'TBCOLAB_ORGEMISSOR'
    end
    object IBTableColabTBCOLAB_CPF: TIBStringField
      FieldName = 'TBCOLAB_CPF'
      EditMask = '000.000.000-00;1;_'
      Size = 16
    end
  end
  object DSColab: TDataSource
    DataSet = IBTableColab
    Left = 96
    Top = 352
  end
  object IBTableServicos: TIBTable
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
    Left = 72
    Top = 296
    object IBTableServicosID_TBSERV: TIntegerField
      FieldName = 'ID_TBSERV'
    end
    object IBTableServicosTBSERV_NOME: TIBStringField
      FieldName = 'TBSERV_NOME'
      Size = 30
    end
  end
  object DSServicos: TDataSource
    DataSet = IBTableServicos
    Left = 16
    Top = 288
  end
end

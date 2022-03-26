object FrmCadProntuario: TFrmCadProntuario
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cadastro de prontu'#225'rio'
  ClientHeight = 609
  ClientWidth = 923
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
    Top = 540
    Width = 923
    Height = 69
    Align = alBottom
    TabOrder = 0
    object PnlBotoes: TPanel
      Left = 87
      Top = 6
      Width = 642
      Height = 59
      Align = alCustom
      TabOrder = 0
      object BtnFechar: TBitBtn
        Left = 523
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Fechar'
        TabOrder = 0
        OnClick = BtnFecharClick
      end
      object BtnSalvar: TBitBtn
        Left = 357
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Salvar'
        Enabled = False
        TabOrder = 1
        OnClick = BtnSalvarClick
      end
      object BtnAlterar: TBitBtn
        Left = 276
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Alterar'
        Enabled = False
        TabOrder = 2
        OnClick = BtnAlterarClick
      end
      object BtnExcluir: TBitBtn
        Left = 195
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Excluir'
        Enabled = False
        TabOrder = 3
        OnClick = BtnExcluirClick
      end
      object BtnConsultar: TBitBtn
        Left = 114
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Localizar'
        TabOrder = 4
        OnClick = BtnConsultarClick
      end
      object BtnInserir: TBitBtn
        Left = 33
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Inserir'
        TabOrder = 5
        OnClick = BtnInserirClick
      end
      object BtnCancelar: TBitBtn
        Left = 439
        Top = 0
        Width = 75
        Height = 59
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 6
        OnClick = BtnCancelarClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 923
    Height = 540
    ActivePage = TabSheetPrincipal
    Align = alClient
    TabOrder = 1
    object TabSheetPrincipal: TTabSheet
      Caption = 'Dados principais'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 512
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = -40
        object Label1: TLabel
          Left = 13
          Top = 236
          Width = 44
          Height = 13
          Caption = 'BAIRRO'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 542
          Top = 51
          Width = 49
          Height = 13
          Caption = 'CELULAR'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 717
          Top = 96
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
        object Label4: TLabel
          Left = 13
          Top = 281
          Width = 42
          Height = 13
          Caption = 'CIDADE'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 13
          Top = 189
          Width = 82
          Height = 13
          Caption = 'COMPLEMENTO'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 13
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
        object Label7: TLabel
          Left = 13
          Top = 325
          Width = 35
          Height = 13
          Caption = 'EMAIL'
          FocusControl = DBEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 101
          Top = 6
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
        object Label9: TLabel
          Left = 157
          Top = 51
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
        object Label10: TLabel
          Left = 13
          Top = 141
          Width = 56
          Height = 13
          Caption = 'ENDERE'#199'O'
          FocusControl = DBEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 538
          Top = 96
          Width = 74
          Height = 13
          Caption = 'ESTADOCIVIL'
          FocusControl = DBEdit11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 475
          Top = 96
          Width = 28
          Height = 13
          Caption = 'SEXO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 239
          Top = 96
          Width = 72
          Height = 13
          Caption = 'NASCIMENTO'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 375
          Top = 51
          Width = 52
          Height = 13
          Caption = 'TELEFONE'
          FocusControl = DBEdit15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 701
          Top = 51
          Width = 22
          Height = 13
          Caption = 'ZAP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 13
          Top = 367
          Width = 64
          Height = 13
          Caption = 'PROFISS'#195'O'
          FocusControl = DBEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 390
          Top = 96
          Width = 77
          Height = 13
          Caption = 'ANIVERS'#193'RIO'
          FocusControl = DBEdit12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 13
          Top = 410
          Width = 77
          Height = 13
          Caption = 'NOME DA M'#195'E'
          FocusControl = DBEditNomeMAE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 296
          Top = 51
          Width = 45
          Height = 13
          Caption = 'ORIGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 13
          Top = 6
          Width = 47
          Height = 13
          Caption = 'N'#218'MERO'
          FocusControl = DBEdit9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 13
          Top = 96
          Width = 97
          Height = 13
          Caption = 'LOCAL DA ZUMBA'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 756
          Top = 51
          Width = 40
          Height = 13
          Caption = 'ZUMBA'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 127
          Top = 96
          Width = 98
          Height = 13
          Caption = 'SAL'#195'O DE FESTAS'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 13
          Top = 251
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_BAIRRO'
          DataSource = DSProntuario
          TabOrder = 14
        end
        object DBEdit2: TDBEdit
          Left = 537
          Top = 67
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_CELULAR'
          DataSource = DSProntuario
          TabOrder = 5
        end
        object DBEdit3: TDBEdit
          Left = 717
          Top = 112
          Width = 183
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_CEP'
          DataSource = DSProntuario
          TabOrder = 11
          OnExit = DBEdit3Exit
        end
        object DBEdit4: TDBEdit
          Left = 13
          Top = 298
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_CIDADE'
          DataSource = DSProntuario
          TabOrder = 15
        end
        object DBEdit5: TDBEdit
          Left = 13
          Top = 204
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_COMPLEMENTO'
          DataSource = DSProntuario
          TabOrder = 13
        end
        object DBEditCPF: TDBEdit
          Left = 13
          Top = 67
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_CPF'
          DataSource = DSProntuario
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 13
          Top = 340
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_EMAIL'
          DataSource = DSProntuario
          TabOrder = 16
        end
        object DBEditNOME: TDBEdit
          Left = 100
          Top = 22
          Width = 800
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_NOME'
          DataSource = DSProntuario
          TabOrder = 0
        end
        object DBEditRG: TDBEdit
          Left = 153
          Top = 67
          Width = 137
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_RG'
          DataSource = DSProntuario
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 13
          Top = 156
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_ENDERECO'
          DataSource = DSProntuario
          TabOrder = 12
        end
        object DBEdit11: TDBEdit
          Left = 538
          Top = 112
          Width = 173
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_ESTADOCIVIL'
          DataSource = DSProntuario
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 239
          Top = 112
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_NASCIMENTO'
          DataSource = DSProntuario
          MaxLength = 10
          TabOrder = 8
          OnExit = DBEdit14Exit
        end
        object DBEdit15: TDBEdit
          Left = 375
          Top = 67
          Width = 156
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_TELEFONE'
          DataSource = DSProntuario
          TabOrder = 4
        end
        object DBComboBox1: TDBComboBox
          Left = 701
          Top = 67
          Width = 49
          Height = 22
          Style = csOwnerDrawFixed
          AutoDropDown = True
          DataField = 'TBPRT_ZAP'
          DataSource = DSProntuario
          Items.Strings = (
            'S'
            'N')
          TabOrder = 6
        end
        object DBEdit6: TDBEdit
          Left = 13
          Top = 383
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_PROFISSAO'
          DataSource = DSProntuario
          TabOrder = 17
        end
        object DBEdit12: TDBEdit
          Left = 390
          Top = 112
          Width = 77
          Height = 21
          DataField = 'TBPRT_ANIVERSARIO'
          DataSource = DSProntuario
          TabOrder = 9
        end
        object DBEditNomeMAE: TDBEdit
          Left = 13
          Top = 424
          Width = 887
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_NOMEMAE'
          DataSource = DSProntuario
          TabOrder = 18
        end
        object DBEdit8: TDBEdit
          Left = 296
          Top = 67
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TBPRT_ORGEMISSOR'
          DataSource = DSProntuario
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 13
          Top = 22
          Width = 81
          Height = 21
          DataField = 'ID_TBPRT'
          DataSource = DSProntuario
          ReadOnly = True
          TabOrder = 19
        end
        object DBCBxLocalZumba: TDBComboBox
          Left = 13
          Top = 113
          Width = 108
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'TBPRT_LZUMBA'
          DataSource = DSProntuario
          Enabled = False
          Items.Strings = (
            'LORETO'
            'CAJUEIRO SECO')
          TabOrder = 7
        end
        object DBCBxZumba: TDBComboBox
          Left = 756
          Top = 67
          Width = 144
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'TBPRT_ZUMBA'
          DataSource = DSProntuario
          Items.Strings = (
            'N'
            'S')
          TabOrder = 20
          OnChange = DBCBxZumbaChange
        end
        object DBComboBox3: TDBComboBox
          Left = 128
          Top = 112
          Width = 105
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'TBPRT_SFESTAS'
          DataSource = DSProntuario
          Items.Strings = (
            'S'
            'N')
          TabOrder = 21
        end
        object DBComboBox2: TDBComboBox
          Left = 473
          Top = 112
          Width = 59
          Height = 21
          DataField = 'TBPRT_SEXO'
          DataSource = DSProntuario
          Items.Strings = (
            'M'
            'F')
          TabOrder = 22
        end
      end
    end
    object TabSheetOBS: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      object Label18: TLabel
        Left = 16
        Top = 21
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
      object Label19: TLabel
        Left = 16
        Top = 149
        Width = 66
        Height = 13
        Caption = 'ANOTA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 40
        Width = 721
        Height = 89
        DataField = 'TBPRT_OBS'
        DataSource = DSProntuario
        TabOrder = 0
      end
      object DBMemo2: TDBMemo
        Left = 16
        Top = 168
        Width = 721
        Height = 137
        DataField = 'TBPRT_ANOTACOES'
        DataSource = DSProntuario
        TabOrder = 1
      end
    end
  end
  object DSProntuario: TDataSource
    AutoEdit = False
    DataSet = IBTbProntuario
    Left = 352
    Top = 304
  end
  object IBTbProntuario: TIBTable
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
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
      end
      item
        Name = 'TBPRT_ZUMBA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TBPRT_LZUMBA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TBPRT_SFESTAS'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'TB_PRT'
    UniDirectional = False
    Left = 272
    Top = 168
    object IBTbProntuarioTBPRT_NOME: TIBStringField
      FieldName = 'TBPRT_NOME'
      Size = 150
    end
    object IBTbProntuarioTBPRT_CPF: TIBStringField
      FieldName = 'TBPRT_CPF'
      EditMask = '000.000.000-00;0; '
      FixedChar = True
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
      FixedChar = True
      Size = 100
    end
    object IBTbProntuarioTBPRT_EMAIL: TIBStringField
      FieldName = 'TBPRT_EMAIL'
      FixedChar = True
      Size = 100
    end
    object IBTbProntuarioTBPRT_BAIRRO: TIBStringField
      FieldName = 'TBPRT_BAIRRO'
      FixedChar = True
      Size = 100
    end
    object IBTbProntuarioTBPRT_CIDADE: TIBStringField
      FieldName = 'TBPRT_CIDADE'
      FixedChar = True
      Size = 100
    end
    object IBTbProntuarioTBPRT_CELULAR: TIBStringField
      FieldName = 'TBPRT_CELULAR'
      FixedChar = True
      Size = 14
    end
    object IBTbProntuarioTBPRT_TELEFONE: TIBStringField
      FieldName = 'TBPRT_TELEFONE'
      FixedChar = True
      Size = 14
    end
    object IBTbProntuarioTBPRT_CEP: TIBStringField
      FieldName = 'TBPRT_CEP'
      EditMask = '00000\-999;1;_'
      FixedChar = True
      Size = 9
    end
    object IBTbProntuarioTBPRT_ESTADOCIVIL: TIBStringField
      FieldName = 'TBPRT_ESTADOCIVIL'
      FixedChar = True
      Size = 14
    end
    object IBTbProntuarioTBPRT_NASCIMENTO: TDateField
      FieldName = 'TBPRT_NASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object IBTbProntuarioTBPRT_ZAP: TIBStringField
      FieldName = 'TBPRT_ZAP'
      FixedChar = True
      Size = 1
    end
    object IBTbProntuarioTBPRT_ANIVERSARIO: TIBStringField
      FieldName = 'TBPRT_ANIVERSARIO'
      FixedChar = True
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
    object IBTbProntuarioID_TBPRT: TIntegerField
      FieldName = 'ID_TBPRT'
    end
    object IBTbProntuarioTBPRT_ANOTACOES: TIBStringField
      FieldName = 'TBPRT_ANOTACOES'
      Size = 2000
    end
    object IBTbProntuarioTBPRT_NOMEMAE: TIBStringField
      FieldName = 'TBPRT_NOMEMAE'
      Size = 150
    end
    object IBTbProntuarioTBPRT_ORGEMISSOR: TIBStringField
      FieldName = 'TBPRT_ORGEMISSOR'
    end
    object IBTbProntuarioTBPRT_RG: TIBStringField
      FieldName = 'TBPRT_RG'
      Size = 12
    end
    object IBTbProntuarioTBPRT_ZUMBA: TIBStringField
      FieldName = 'TBPRT_ZUMBA'
      Size = 1
    end
    object IBTbProntuarioTBPRT_LZUMBA: TIBStringField
      FieldName = 'TBPRT_LZUMBA'
    end
    object IBTbProntuarioTBPRT_SFESTAS: TIBStringField
      FieldName = 'TBPRT_SFESTAS'
      Size = 1
    end
    object IBTbProntuarioTBPRT_SEXO: TIBStringField
      FieldName = 'TBPRT_SEXO'
      Size = 2
    end
  end
end

object FrmConsultaAtendColab: TFrmConsultaAtendColab
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consulta '
  ClientHeight = 488
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
    Height = 169
    Align = alTop
    TabOrder = 0
    DesignSize = (
      763
      169)
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 167
      Height = 13
      Caption = 'SELECIONE O TIPO DE SERVI'#199'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 91
      Width = 182
      Height = 13
      Caption = 'SELECIONE O PERIODO DESEJADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 49
      Width = 209
      Height = 13
      Caption = 'SELECIONE O NOME DO COLABORADOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 40
      Top = 115
      Width = 43
      Height = 13
      Caption = 'INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 256
      Top = 115
      Width = 32
      Height = 13
      Caption = 'FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 16
      Top = 110
      Width = 442
      Height = 54
      Brush.Style = bsClear
      Shape = stRoundRect
    end
    object BtnFechar: TBitBtn
      Left = 666
      Top = 97
      Width = 75
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Voltar'
      TabOrder = 0
      OnClick = BtnFecharClick
    end
    object BitBtn1: TBitBtn
      Left = 589
      Top = 97
      Width = 75
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object DBLookupCBxCOLABORADOR: TDBLookupComboBox
      Left = 16
      Top = 64
      Width = 720
      Height = 21
      KeyField = 'ID_COLAB'
      ListField = 'TBCOLAB_NOME'
      ListSource = DSColaborador
      TabOrder = 2
    end
    object DateTimePickerIni: TDateTimePicker
      Left = 40
      Top = 134
      Width = 186
      Height = 21
      Date = 43784.688401250000000000
      Time = 43784.688401250000000000
      TabOrder = 3
    end
    object DateTimePickerFinal: TDateTimePicker
      Left = 256
      Top = 134
      Width = 186
      Height = 21
      Date = 43784.688475763890000000
      Time = 43784.688475763890000000
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 512
      Top = 97
      Width = 75
      Height = 67
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Exibir'
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object DBLookupCbxSERVICO: TDBLookupComboBox
      Left = 15
      Top = 22
      Width = 721
      Height = 21
      KeyField = 'ID_TBSERV'
      ListField = 'TBSERV_NOME'
      ListSource = DSServicos
      PopupMenu = PopupMenu1
      TabOrder = 6
      OnExit = DBLookupCbxSERVICOExit
    end
  end
  object PnlGrid: TPanel
    Left = 0
    Top = 169
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
      DataSource = DSAtendimentos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 290
      Width = 761
      Height = 28
      Panels = <
        item
          Text = 'N'#250'mero de atendimentos:'
          Width = 200
        end
        item
          Width = 50
        end>
    end
    object DBLookupListBox1: TDBLookupListBox
      Left = 15
      Top = 160
      Width = 138
      Height = 95
      KeyField = 'ID_TBSERV'
      ListField = 'TBSERV_NOME'
      ListSource = DSServicos
      TabOrder = 2
      Visible = False
    end
    object DBLookupListBox2: TDBLookupListBox
      Left = 159
      Top = 160
      Width = 121
      Height = 95
      KeyField = 'ID_COLAB'
      ListField = 'TBCOLAB_NOME'
      ListSource = DSColaborador
      TabOrder = 3
      Visible = False
    end
  end
  object DSAtendimentos: TDataSource
    DataSet = IBQAtedimentos
    Left = 568
    Top = 296
  end
  object IBQAtedimentos: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT TB_ATENDIMENTO.ID_TBPRT,TB_ATENDIMENTO.ID_TBSERV,'
      
        'TB_ATENDIMENTO.TBATENDIMENTO_DATA,TB_ATENDIMENTO.ID_TBCOLABORADO' +
        'R, TB_COLABORADOR.tbcolab_nome,'
      'TB_SERV.tbserv_nome, TB_ATENDIMENTO.TBATENDIMENTO_OBS'
      ' FROM ((TB_ATENDIMENTO'
      'INNER JOIN TB_COLABORADOR  ON'
      'TB_COLABORADOR.id_colab =tb_atendimento.id_tbcolaborador)'
      
        'INNER JOIN TB_SERV ON tb_serv.id_tbserv=tb_atendimento.id_tbserv' +
        ')'
      'WHERE ID_TBCOLABORADOR=1'
      'AND TBATENDIMENTO_DATA'
      'BETWEEN '#39'03.11.2019'#39' AND '#39'15.11.2019'#39)
    Left = 488
    Top = 288
    object IBQAtedimentosTBATENDIMENTO_DATA: TDateField
      DisplayLabel = 'DATA'
      FieldName = 'TBATENDIMENTO_DATA'
      Origin = '"TB_ATENDIMENTO"."TBATENDIMENTO_DATA"'
    end
    object IBQAtedimentosID_TBPRT: TIntegerField
      DisplayLabel = 'PRONTUARIO'
      FieldName = 'ID_TBPRT'
      Origin = '"TB_ATENDIMENTO"."ID_TBPRT"'
    end
    object IBQAtedimentosID_TBSERV: TIntegerField
      DisplayLabel = 'COD ESPECIALIDADE'
      FieldName = 'ID_TBSERV'
      Origin = '"TB_ATENDIMENTO"."ID_TBSERV"'
    end
    object IBQAtedimentosTBSERV_NOME: TIBStringField
      DisplayLabel = 'ESPECIALIDADE'
      FieldName = 'TBSERV_NOME'
      Origin = '"TB_SERV"."TBSERV_NOME"'
      FixedChar = True
      Size = 30
    end
    object IBQAtedimentosTBCOLAB_NOME: TIBStringField
      DisplayLabel = 'COLABORADOR'
      FieldName = 'TBCOLAB_NOME'
      Origin = '"TB_COLABORADOR"."TBCOLAB_NOME"'
      Size = 100
    end
    object IBQAtedimentosTBATENDIMENTO_OBS: TIBStringField
      FieldName = 'TBATENDIMENTO_OBS'
      Origin = '"TB_ATENDIMENTO"."TBATENDIMENTO_OBS"'
      Size = 1000
    end
  end
  object IBSQLCadastros: TIBSQL
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Left = 376
    Top = 280
  end
  object IBTableServico: TIBTable
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
    Left = 88
    Top = 209
    object IBTableServicoID_TBSERV: TIntegerField
      FieldName = 'ID_TBSERV'
    end
    object IBTableServicoTBSERV_NOME: TIBStringField
      FieldName = 'TBSERV_NOME'
      Size = 30
    end
    object IBTableServicoTBSERV_PRAZO: TIBStringField
      FieldName = 'TBSERV_PRAZO'
      Size = 1
    end
  end
  object DSServicos: TDataSource
    DataSet = IBTableServico
    Left = 144
    Top = 209
  end
  object DSColaborador: TDataSource
    DataSet = IBQueryColab
    Left = 320
    Top = 225
  end
  object PopupMenu1: TPopupMenu
    Left = 504
    Top = 209
  end
  object IBQueryColab: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from TB_COLABORADOR')
    Left = 256
    Top = 209
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
end

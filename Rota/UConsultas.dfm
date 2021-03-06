object FormConsultas: TFormConsultas
  Left = 87
  Top = 97
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Consultas'
  ClientHeight = 339
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LbINstrucao: TLabel
    Left = 168
    Top = 168
    Width = 350
    Height = 13
    Alignment = taCenter
    Caption = 'Clique duas vezes no cliente escolhido para alterar ou excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 142
    Top = 116
    Width = 38
    Height = 13
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 184
    Width = 657
    Height = 153
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUNCAO'
        Title.Caption = 'FUN'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NASC'
        Title.Caption = 'DATA NASC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 1
    Width = 641
    Height = 160
    Caption = 'Aniversariantes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 221
      Top = 51
      Width = 59
      Height = 13
      Caption = 'Categoria:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 417
      Top = 109
      Width = 95
      Height = 41
      Caption = 'Procurar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000000C8FF0097FF0000007077707077
        70707770707770FFFFFF00000000000000000000000000000000000000000070
        7770707770707770FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000000000000C8FF00C8FF00C8FF0097FF0097FF0000007077
        70707770505050000000BFBFBFFFFFFFCF9790CF9790CF9790CF979090676000
        0000505050707770707770707770FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        00000000000000C8FF00C8FF00C8FF00C8FF00C8FF0097FF0097FF0097FF0000
        00000000BFBFBFFFFFFFFFFFFFFFFFFFCF9790CF9790CF9790CF979090676090
        6760505050000000707770707770707770FFFFFFFFFFFFFFFFFF000000000000
        00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF0097FF0097FF0097FF0000
        00CF9790FFFFFFBFBFBF00000000000000000000000000000000000000000090
        6760906760906760000000707770707770707770FFFFFFFFFFFF00000000C8FF
        00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF0097FF0097FF000000CF97
        90CF9790000000505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50
        5050000000906760906760000000707770707770707770FFFFFF00000000C8FF
        00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF0097FF0097FF000000CF97
        90000000FFFFFFBFBFBF505050000000000000000000000000000000505050BF
        BFBFFFFFFF000000906760000000707770707770707770FFFFFF00000000C8FF
        00C8FF00C8FF00C8FF00C8FF00C8FF00C8FF0000000000000097FF0000005050
        50FFFFFF000000505050CF9790FFFFFFCF9790CF9790CF9790CF9790CF979050
        5050000000FFFFFF000000000000707770707770707770FFFFFF00000000C8FF
        00C8FF00C8FF00C8FF00C8FF0000000000006067CF0000A0000000000000FFFF
        FF000000000000CF9790CF9790CF9790FFFFFFCF9790CF9790CF9790CF9790CF
        9790BFBFBF000000FFFFFF000000707770707770FFFFFFFFFFFF00000000C8FF
        00C8FF00C8FF0000000000006067CF6067CF6067CF0000A0000090000000FFFF
        FF000000906760000000505050CF9790CF9790FFFFFFCF9790CF979050505000
        0000000000000000FFFFFF000000707770FFFFFFFFFFFFFFFFFF00000000C8FF
        0000000000006067CF6067CF6067CF6067CF6067CF0000A0000090000000FFFF
        FF00000090676090676090676000000000000000000000000000000090676090
        6760906760000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
        6067CF6067CF6067CF6067CF6067CF6067CF0000000000000000A00000A00000
        00FFFFFF00000000000090676090676090676090676090676090676090676000
        0000000000FFFFFF000000707770707770FFFFFFFFFFFFFFFFFF0000006067CF
        6067CF6067CF6067CF6067CF000000000000FF979060302F0000000000A00000
        A0000000FFFFFFFFFFFF000000000000000000000000000000000000000000FF
        FFFFFFFFFF000000000000707770707770FFFFFFFFFFFFFFFFFF0000006067CF
        6067CF6067CF000000000000FF9790FF9790FF979060302F60302F0000000000
        A00000A0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000CF9790000000707770707770707770FFFFFFFFFFFF0000006067CF
        000000000000FF9790FF9790FF9790FF9790FF979060302F60302F60302F0000
        000000A00000A0000000000000000000000000000000000000000000000000CF
        9790FFFFFFCF9790CF9790000000707770707770707770FFFFFF000000000000
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F0000000000A0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000CF9790FFFFFF505050000000000000707770707770707770000000FF9790
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F60302F000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF505050000000000000000000000000000000707770707770000000FF9790
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF505050000000000000000000000000000000FFFFFF000000FF9790
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF505050000000000000000000000000FFFFFF000000FF9790
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF505050000000000000505050FFFFFF000000FF9790
        FF9790FF9790FF9790FF9790FF9790FF9790FF979060302F60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF9790
        FF9790FF9790FF9790FF9790FF9790FFFFFFFFFFFF60302F60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF9790
        FF9790FF9790FF9790FFFFFFFFFFFFFFC8CFFFC8CFFFC8CF60302F60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF9790
        FF9790FFFFFFFFFFFFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CF60302F6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
        FFFFFFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CF6030
        2F60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFC8CF
        FFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8
        CF60302F60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8
        CFFFC8CF60302F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8
        CF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CFFFC8CF0000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFC8CFFFC8CFFFC8CFFFC8CF000000000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFC8CF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton7: TSpeedButton
      Left = 519
      Top = 109
      Width = 95
      Height = 41
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000000000080000080000080000080000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000080000080000090000090000080000080000080000080000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000800000900000A00000A00000A0000090000090000090000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        800000800000A00000CF0000CF0000CF0000A00000A0000090000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        800000A00000CF0000DF0000DF0000CF0000DF0000A0000090000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        A00000CF0000FF0000FF0000FF0000DF0000DF0000A0000090000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        A00000CF0000FFFFFFFF0000FF0000DF0000DF0000A00000A0000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000DF0000FF0000FF0000FF0000DF0000CF0000A0000080000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000A00000DF0000DF0000DF0000A0000080000080000080000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000000000000000000000080000080000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000000080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000000000DF000080000080000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000000000DF000080000080000080000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000DF0000DF000080000080000080000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000DF0000DF0000DF000080000080000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000DF0000DF0000DF000080000080000080000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000DF0000DF0000DF000080000080000080000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000DF0000DF0000DF0000DF0000DF000080000080000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000DF0000DF0000DF0000DF0000DF000080000080000080000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000DF0000DF0000DF0000DF0000DF000080000080000080000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        DF0000DF0000DF0000DF0000DF0000DF0000DF000080000080000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        DF0000DF0000DF0000DF0000DF6067FF6067FF6067FF000080000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        DF0000DF0000DF6067FF6067FF0000DF0000DF0000DF6067FF000080000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        DF6067FF6067FF0000DF0000DF0000DF0000DF0000DF0000DF6067FF00008000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000006067FF6067
        FF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF6067FF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000DF0000
        DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF0000DF000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        000000DF0000DF0000DF0000DF0000DF0000DF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000DF0000DF0000DF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = SpeedButton7Click
    end
    object Label2: TLabel
      Left = 253
      Top = 26
      Width = 28
      Height = 13
      Caption = 'M'#234's:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 233
      Top = 74
      Width = 47
      Height = 13
      Caption = 'Fun'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 235
      Top = 99
      Width = 44
      Height = 13
      Caption = 'Estado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboCategoria: TComboBox
      Left = 286
      Top = 48
      Width = 242
      Height = 19
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      OnChange = ComboCategoriaChange
    end
    object RadioGroup1: TRadioGroup
      Left = 15
      Top = 23
      Width = 163
      Height = 122
      Cursor = crHandPoint
      Caption = 'Op'#231#245'es'
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Por M'#234's de anivers'#225'rio'
        'Por categoria'
        'Por fun'#231#227'o'
        'Por estado')
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      OnClick = RadioGroup1Click
    end
    object ComboMes: TComboBox
      Left = 286
      Top = 22
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      Items.Strings = (
        'JANEIRO'
        'FEVEREIRO'
        'MAR'#199'O'
        'ABRIL'
        'MAIO'
        'JUNHO'
        'JULHO'
        'AGOSTO'
        'SETEMBRO'
        'OUTUBRO'
        'NOVEMBRO'
        'DEZEMBRO')
    end
    object EdtFuncao: TEdit
      Left = 286
      Top = 71
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
  object EdtEstado: TEdit
    Left = 294
    Top = 97
    Width = 30
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = IBQClientes
    Left = 472
    Top = 344
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 56
    Top = 168
  end
  object IBQClientes: TIBQuery
    Database = FrmMain.IBDatabase1
    Transaction = FrmMain.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from   TB_CLIENTES')
    Left = 208
    Top = 296
    object IBQClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'TB_CLIENTES.ID_CLIENTE'
      Required = True
    end
    object IBQClientesID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'TB_CLIENTES.ID_CATEGORIA'
    end
    object IBQClientesNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_CLIENTES.NOME'
      Size = 70
    end
    object IBQClientesFUNCAO: TIBStringField
      FieldName = 'FUNCAO'
      Origin = 'TB_CLIENTES.FUNCAO'
      Size = 40
    end
    object IBQClientesEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = 'TB_CLIENTES.EMPRESA'
      Size = 50
    end
    object IBQClientesENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'TB_CLIENTES.ENDERECO'
      Size = 70
    end
    object IBQClientesBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'TB_CLIENTES.BAIRRO'
      Size = 40
    end
    object IBQClientesCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'TB_CLIENTES.CIDADE'
      Size = 40
    end
    object IBQClientesCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TB_CLIENTES.CEP'
      Size = 10
    end
    object IBQClientesFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TB_CLIENTES.FONE'
      Size = 14
    end
    object IBQClientesFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'TB_CLIENTES.FAX'
      Size = 14
    end
    object IBQClientesCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'TB_CLIENTES.CELULAR'
      Size = 14
    end
    object IBQClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TB_CLIENTES.EMAIL'
      Size = 60
    end
    object IBQClientesDATA_NASC: TIBStringField
      FieldName = 'DATA_NASC'
      Origin = 'TB_CLIENTES.DATA_NASC'
      Size = 5
    end
    object IBQClientesESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'TB_CLIENTES.ESTADO'
      Size = 2
    end
  end
  object IBQCategoria: TIBQuery
    Database = FrmMain.IBDatabase1
    Transaction = FrmMain.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TB_CATEGORIA')
    Left = 256
    Top = 288
    object IBQCategoriaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'TB_CATEGORIA.ID_CATEGORIA'
      Required = True
    end
    object IBQCategoriaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TB_CATEGORIA.DESCRICAO'
      Size = 60
    end
  end
  object IBQuery3: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 280
  end
end

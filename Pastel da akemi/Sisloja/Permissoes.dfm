object FrmPermissoes: TFrmPermissoes
  Left = 412
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#245'es de usu'#225'rio'
  ClientHeight = 509
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 64
    Width = 48
    Height = 13
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 117
    Top = 6
    Width = 131
    Height = 44
    BevelInner = bvRaised
    BorderStyle = bsSingle
    ParentColor = True
    TabOrder = 0
    object BitBtn4: TBitBtn
      Left = 3
      Top = 0
      Width = 41
      Height = 40
      Hint = 'Salvar'
      TabOrder = 0
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 43
      Top = 0
      Width = 41
      Height = 40
      Hint = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtn7: TBitBtn
      Left = 83
      Top = 0
      Width = 41
      Height = 40
      Hint = 'Localizar clientes'
      TabOrder = 2
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object Edit1: TEdit
    Left = 122
    Top = 60
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 96
    Width = 355
    Height = 393
    DataSource = DSPermissoes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CAPTION'
        Title.Caption = 'Item'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERMICAO'
        PickList.Strings = (
          'S'
          'N')
        Title.Caption = 'Permiss'#227'o'
        Visible = True
      end>
  end
  object DSUser: TDataSource
    DataSet = TbUser
    Left = 8
    Top = 88
  end
  object TbUser: TTable
    Active = True
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    TableName = 'USUARIO'
    Left = 8
    Top = 120
    object TbUserCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TbUserNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 10
    end
    object TbUserSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 6
    end
  end
  object QryTemp: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    DataSource = bobusuc.DataSource1
    SQL.Strings = (
      'Select * from Permitemp')
    Left = 8
    Top = 240
    object QryTempNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BANCODADOS.PERMITEMP.NOME'
      FixedChar = True
      Size = 30
    end
    object QryTempMENU: TStringField
      FieldName = 'MENU'
      Origin = 'BANCODADOS.PERMITEMP.MENU'
      FixedChar = True
      Size = 60
    end
    object QryTempPERMICAO: TStringField
      FieldName = 'PERMICAO'
      Origin = 'BANCODADOS.PERMITEMP.PERMICAO'
      FixedChar = True
      Size = 1
    end
    object QryTempCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'BANCODADOS.PERMITEMP.CAPTION'
      FixedChar = True
      Size = 30
    end
    object QryTempUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'BANCODADOS.PERMITEMP.USUARIO'
      FixedChar = True
      Size = 3
    end
  end
  object DsPermiTemp: TDataSource
    DataSet = QryTemp
    Left = 8
    Top = 208
  end
  object TbPermissoes: TTable
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    TableName = 'PERMICOES'
    Left = 80
    Top = 376
    object TbPermissoesINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object TbPermissoesUSUARIO: TStringField
      FieldName = 'USUARIO'
      FixedChar = True
      Size = 3
    end
    object TbPermissoesMENU: TStringField
      FieldName = 'MENU'
      FixedChar = True
      Size = 60
    end
    object TbPermissoesPERMICAO: TStringField
      FieldName = 'PERMICAO'
      KeyFields = 'PERMICAO'
      FixedChar = True
      Size = 1
    end
    object TbPermissoesCAPTION: TStringField
      FieldName = 'CAPTION'
      FixedChar = True
      Size = 30
    end
  end
  object DSPermissoes: TDataSource
    DataSet = TbPermissoes
    Left = 80
    Top = 408
  end
  object Query1: TQuery
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    Left = 176
    Top = 256
  end
end

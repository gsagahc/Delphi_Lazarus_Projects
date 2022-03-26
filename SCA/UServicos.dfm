object FrmServicos: TFrmServicos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Servi'#231'os'
  ClientHeight = 279
  ClientWidth = 394
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
  object Panel1: TPanel
    Left = 0
    Top = 210
    Width = 394
    Height = 69
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 148
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 229
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 310
      Top = 6
      Width = 75
      Height = 59
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 210
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 11
      Top = 6
      Width = 369
      Height = 193
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TBSERV_NOME'
          Title.Caption = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBSERV_PRAZO'
          Title.Caption = 'POSSUI PRAZO DE RETORNO'
          Visible = True
        end>
    end
  end
  object IBQServicos: TIBQuery
    Database = FrmPrincipal.IBDatabase1
    Transaction = FrmPrincipal.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select TBSERV_NOME, TBSERV_PRAZO from TB_SERV')
    UpdateObject = IBUServicos
    Left = 40
    Top = 64
    object IBQServicosTBSERV_NOME: TIBStringField
      FieldName = 'TBSERV_NOME'
      Origin = '"TB_SERV"."TBSERV_NOME"'
      FixedChar = True
      Size = 30
    end
    object IBQServicosTBSERV_PRAZO: TIBStringField
      FieldName = 'TBSERV_PRAZO'
      Origin = '"TB_SERV"."TBSERV_PRAZO"'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQServicos
    Left = 40
    Top = 112
  end
  object IBUServicos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_TBSERV,'
      '  TBSERV_NOME,'
      '  TBSERV_PRAZO'
      'from TB_SERV '
      'where'
      '  TBSERV_NOME = :TBSERV_NOME and'
      '  TBSERV_PRAZO = :TBSERV_PRAZO')
    ModifySQL.Strings = (
      'update TB_SERV'
      'set'
      '  TBSERV_NOME = :TBSERV_NOME,'
      '  TBSERV_PRAZO = :TBSERV_PRAZO'
      'where'
      '  TBSERV_NOME = :OLD_TBSERV_NOME and'
      '  TBSERV_PRAZO = :OLD_TBSERV_PRAZO')
    InsertSQL.Strings = (
      'insert into TB_SERV'
      '  (TBSERV_NOME, TBSERV_PRAZO)'
      'values'
      '  (:TBSERV_NOME, :TBSERV_PRAZO)')
    DeleteSQL.Strings = (
      'delete from TB_SERV'
      'where'
      '  TBSERV_NOME = :OLD_TBSERV_NOME and'
      '  TBSERV_PRAZO = :OLD_TBSERV_PRAZO')
    Left = 104
    Top = 88
  end
end

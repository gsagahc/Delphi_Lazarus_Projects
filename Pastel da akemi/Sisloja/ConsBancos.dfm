object FrmConsBanco: TFrmConsBanco
  Left = 503
  Top = 290
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Consulta de bancos'
  ClientHeight = 150
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 209
    Height = 145
    DataSource = DSBancos
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
        Visible = True
      end>
  end
  object QryBancos: TQuery
    Active = True
    DatabaseName = 'BancoDados'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'Select * From Banco')
    Left = 104
    Top = 72
    object QryBancosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BANCODADOS.BANCO.NOME'
      FixedChar = True
      Size = 30
    end
  end
  object DSBancos: TDataSource
    DataSet = QryBancos
    Left = 144
    Top = 72
  end
end

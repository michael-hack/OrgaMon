object FormAusgabeArt: TFormAusgabeArt
  Left = 76
  Top = 129
  Caption = 'Ausgabe Arten festlegen'
  ClientHeight = 506
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 0
    Width = 876
    Height = 506
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    Align = alClient
    TabOrder = 0
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'RID=NOTREQUIRED'
      'WEBSHOP=BOOLEAN=Y,N'
      'FREIERTEXT=BOOLEAN=Y,N')
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT RID'
      '     , NAME'
      '     , KUERZEL'
      '     , STATUS'
      '     , VERARBEITUNGSART'
      '     , GEWICHT'
      '     , WEBSHOP'
      '     , FREIERTEXT'
      '     , ARTIKEL_R'
      'FROM AUSGABEART'
      'FOR UPDATE')
    ColorScheme = True
    OrderingItems.Strings = (
      'RID=RID;RID DESC'
      'NAME=NAME;NAME DESC'
      'STATUS=STATUS;STATUS DESC'
      'KUERZEL=KUERZEL;KUERZEL DESC'
      'VERARBEITUNGSART=VERARBEITUNGSART;VERARBEITUNGSART DESC')
    OrderingLinks.Strings = (
      'RID=1'
      'NAME=2'
      'STATUS=3'
      'KUERZEL=4'
      'VERARBEITUNGSART=5')
    RequestLive = True
    AfterPost = IB_Query1AfterPost
    Left = 24
    Top = 24
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 56
    Top = 24
  end
end

object FormRechnungsUebersicht: TFormRechnungsUebersicht
  Left = 88
  Top = 120
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'Rechnungen'
  ClientHeight = 623
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    958
    623)
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton8: TSpeedButton
    Left = 748
    Top = 3
    Width = 23
    Height = 22
    Hint = 'Dokumentverzeichnis "Rechnungen" '#246'ffnen'
    Anchors = [akTop, akRight]
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E
      9C009E9C000000000000FFFFFFFFFFFF009E9CFFFFFF9CCFFF9CFFFF9CCFFF9C
      FFFF9CCFFF9CCFFF9CCFFF9CCFFF63CFCE009E9C000000000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CCFFF9CFFFF9CCFFF9CCFFF9CCFFF63CF
      CE000000009E9C000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF9CCFFF009E9C000000009E9C000000009E9CFFFFFF
      9CFFFF9CFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CFFFF9CCFFF9CFFFF63CFCE0000
      0063CFCE63CFCE000000009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF63CFCE00000063CFCE63CFCE000000009E9C009E9C
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C63CF
      CE9CFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF63CFCE000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFFFFFFFF009E9C009E9C009E9C009E9C009E9C009E9CFFFFFFFFFFFFFFFFFF
      009E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9C009E9C009E9C009E9C00
      9E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton8Click
    ExplicitLeft = 677
  end
  object Image4: TImage
    Left = 777
    Top = 4
    Width = 28
    Height = 20
    Cursor = crHandPoint
    Hint = 'Vorbereiten einer EC-Zahlung (ohne Karte)'
    Anchors = [akTop, akRight]
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      07544269746D6170C6060000424DC60600000000000036000000280000001C00
      000014000000010018000000000090060000C40E0000C40E0000000000000000
      0000FFFFFFFFFFFF1E00001E00001E00001E00001E00001E00001E00001E0000
      1E00001E00001E00001E00001E00001E00001E00001E00001E00001E00001E00
      001E00001E00001E00001E00001E0000FFFFFFFFFFFFFFFFFF1E0000A3A3A3CA
      CACAD0D0D0D1D1D1D0D0D0D1D1D1D0D0D0D1D1D1D0D0D0D1D1D1D1D1D1D0D0D0
      D0D0D0D1D1D1D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D1D1D1D0D0D0D0D0D0CACA
      CAA3A3A31E0000FFFFFF1E0000A6A6A6D3D2D3D3D3D3D2D3D3D3D3D3D2D2D2D3
      D3D3D3D3D3D3D3D3D3D2D3D3D3D3D3D2D3D3D3D2D3D3D3D3D3D3D3D3D2D3D2D3
      D3D2D3D3D3D3D3D3D3D3D2D3D3D3D3D3D3D3D3D3D3D2D3D3A5A5A51E00001E00
      00CFCFCFD5D5D5D5D5D5D5D5D5D5D5D5D6D5D5F5EADBD4A45DD19F56D19F56D1
      9F56CB9B56735C536B60776B80F46B80F46B80F46B80F46B80F4ACB8F9D5D5D5
      D5D5D6D5D5D5D5D5D5D5D5D5CFCFCF1E00001E0000D7D7D7D8D7D8D8D7D8D8D7
      D8D8D7D8D8D7D8DAB175BC7100BC7100BC7100BC71009555001E000021123923
      42EF2342EF2342EF2342EF2342EF8395F6D8D7D8D8D7D8D8D7D8D8D7D8D8D7D8
      D7D7D71E00001E0000DADADADADADADADADADADADADADADADADADAD9AF72BC71
      00BC7100BE7406C17C169454001E00002112382342EF3B57F12342EF2342EF23
      42EF8395F6DADADADADADADADADADADADADADADADADADA1E00001E0000DDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD9AF72BC7100BC7100D6A763E2C1919454
      001E00002110342848F0E7EBFE2341EF2342EF2342EF8395F6DDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDD1E00001E0000E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0
      E0E0E0D9AF72BC7100BC7100D6A866ECD6B6A67F5422184E2322712848F0E8EB
      FE2341EF2342EF2342EF8395F6E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0DFDFDF1E
      00001E0000E2E2E2E3E2E3E3E2E3E3E2E3E3E2E3E3E2E3D9AF72BC7100BC7100
      C58323D2A056A67D5422164B2423722848F0F7F8FEB4BEFAB4BEFAB4BEFAD4DB
      FCE3E2E3E3E2E3E3E2E3E3E2E3E3E2E3E3E3E31E00001E0000E5E5E5E6E5E6E6
      E5E6E6E5E6E6E5E6E6E5E6D9AF72BC7100BC7100BC7100BC71009454001E0000
      2112392848F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E5E6E6E5E6E6E5E6E6E5
      E6E6E5E6E5E5E51E00001E0000E8E8E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8D9
      AF72BC7100BC7100C27D17C583229454001E00002112392848F0F9FAFFC5CDFB
      C5CDFBC5CDFBDFE3FDE8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E8E81E00001E00
      00EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBD9AF72BC7100BC7100D6A866E2
      C1919454001E00002112392848F0E8EBFE2341EF2342EF2342EF8395F6EBEBEB
      EBEBEBEBEBEBEBEBEBEBEBEBEBEBEB1E00001E0000EEEEEEEEEEEEEEEEEEEEEE
      EEEEEEEEEEEEEED9AF72BC7100BC7100D5A45FE2C1919454001E000021123928
      47EFE3E7FD2341EF2342EF2342EF8395F6EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      EEEEEE1E00001E0000F0F0F0F1F1F0F1F1F0F1F1F0F1F1F0F1F1F0D9AF72BC71
      00BC7100BC7202BF760B9454001E00002112392342EF2947F02342EF2342EF23
      42EF8395F6F1F1F0F1F1F0F1F1F0F1F1F0F1F1F0F0F0F01E00001E0000F3F3F3
      F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3DAB175BC7100BC7100BC7100BC71009656
      001E00002112392342EF2342EF2342EF2342EF2342EF8395F6F3F3F3F3F3F3F3
      F3F3F3F3F3F3F3F3F3F3F31E00001E0000F8F8F8F8F9F8F8F9F8F8F9F8F8F9F8
      F8F9F8F6ECDDD6A865D5A661D5A661D5A661D3A461866E607169817489F57489
      F57489F57489F57489F5B1BDF9F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F8F81E
      00001E0000F5F5F5FBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFA
      FBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAFBFB
      FAFBFBFAFBFBFAFBFBFAFBFBFAFBFBFAF5F5F51E00001E0000D8D8D8FCFCFCFC
      FCFCFCFCFCFDFCFCFCFCFCFCFCFCFDFCFDFCFCFDFCFCFCFCFCFCFCFCFCFCFCFC
      FCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFC
      FCFDFCFCD8D8D81E0000FFFFFF1E0000DADADAF8F8F8FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFD
      FEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDF8F8F8DADADA1E0000FFFFFFFFFF
      FFFFFFFF1E00001E00001E00001E00001E00001E00001E00001E00001E00001E
      00001E00001E00001E00001E00001E00001E00001E00001E00001E00001E0000
      1E00001E00001E00001E0000FFFFFFFFFFFF}
    ShowHint = True
    OnClick = Image4Click
    ExplicitLeft = 690
  end
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 28
    Width = 958
    Height = 595
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DrawFocusSelected = True
    OnGetCellProps = IB_Grid1GetCellProps
    OnGetDisplayText = IB_Grid1GetDisplayText
    ExplicitWidth = 931
  end
  object Button1: TButton
    Left = 847
    Top = 3
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '&P'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 820
  end
  object Button2: TButton
    Left = 874
    Top = 3
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '&B'
    TabOrder = 2
    OnClick = Button2Click
    ExplicitLeft = 847
  end
  object Button3: TButton
    Left = 929
    Top = 3
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = '&Z'
    TabOrder = 3
    OnClick = Button3Click
    ExplicitLeft = 902
  end
  object IB_UpdateBar1: TIB_UpdateBar
    Left = 3
    Top = 3
    Width = 22
    Height = 22
    Flat = False
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    DataSource = IB_DataSource1
    ReceiveFocus = False
    CustomGlyphsSupplied = []
    VisibleButtons = [ubRefreshAll]
  end
  object Button4: TButton
    Left = 810
    Top = 3
    Width = 22
    Height = 22
    Hint = 'abgeschlossenen Rechnungsbeleg '#246'ffnen'
    Anchors = [akTop, akRight]
    Caption = #157
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Webdings'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button4Click
    ExplicitLeft = 783
  end
  object Button18: TButton
    Left = 901
    Top = 3
    Width = 22
    Height = 22
    Hint = 'Kontoinformation / Mahnung einsehen'
    Anchors = [akTop, akRight]
    Caption = '&M'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button18Click
    ExplicitLeft = 874
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 7
    Width = 137
    Height = 16
    Caption = 'bezahlte einblenden'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object IB_Query1: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsAlignment.Strings = (
      'BETRAG=RIGHT'
      'DAVON_BEZAHLT=RIGHT'
      'VERSAND.LIEFERBETRAG=RIGHT'
      'PERSON.RID=LEFT'
      'VERSAND.RECHNUNG=RIGHT'
      'VERSAND.BELEG_R=RIGHT'
      'VERSAND.TEILLIEFERUNG=RIGHT')
    FieldsDisplayLabel.Strings = (
      'RECHNUNG=R#'
      'BELEG_R=B#'
      'TEILLIEFERUNG=TL'
      'BETRAG=Betrag'
      'DAVON_BEZAHLT=Anzahlung'
      'VERSAND.LIEFERBETRAG=Betrag'
      'PERSON.RID=Person'
      'PERSON.SUCHBEGRIFF=Suchbegriff'
      'BELEG.MAHNSTUFE=MS')
    FieldsDisplayWidth.Strings = (
      'RECHNUNG=66'
      'BELEG_R=58'
      'TEILLIEFERUNG=30'
      'BETRAG=110'
      'DAVON_BEZAHLT=93'
      'VERSAND.LIEFERBETRAG=100'
      'PERSON.SUCHBEGRIFF=100'
      'PERSON.RID=320'
      'VERSAND.AUSGANG=142'
      'BELEG.MAHNSTUFE=25')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select '
      ' VERSAND.RECHNUNG,'
      ' VERSAND.LIEFERBETRAG,'
      ' (select '
      '   SUM(-B.BETRAG)'
      '  from '
      '   AUSGANGSRECHNUNG B '
      '  where '
      '   (VERSAND.BELEG_R=B.BELEG_R) and'
      '   (VERSAND.TEILLIEFERUNG=B.TEILLIEFERUNG) and'
      '   ((B.VORGANG<>'#39'RECHNUNG (73)'#39') or (B.VORGANG is null))'
      '  ) as DAVON_BEZAHLT,'
      ' VERSAND.BELEG_R,'
      ' VERSAND.TEILLIEFERUNG,'
      ' VERSAND.AUSGANG,'
      ' BELEG.MAHNSTUFE,'
      ' PERSON.RID,'
      ' PERSON.SUCHBEGRIFF'
      'from '
      ' VERSAND'
      'join '
      ' BELEG'
      'on'
      ' (BELEG.RID=VERSAND.BELEG_R)'
      'join '
      ' PERSON'
      'on '
      ' (PERSON.RID=BELEG.PERSON_R)'
      'where'
      ' (VERSAND.RECHNUNG is not null) and'
      ' (VERSAND.AUSGANG>CURRENT_DATE-365) and'
      ' (VERSAND.LIEFERBETRAG > coalesce( '
      '  (select '
      '     -SUM(B.BETRAG)'
      '   from '
      '    AUSGANGSRECHNUNG B '
      '   where '
      '    (VERSAND.BELEG_R=B.BELEG_R) and'
      '    (VERSAND.TEILLIEFERUNG=B.TEILLIEFERUNG) and'
      '    ((B.VORGANG<>'#39'RECHNUNG (73)'#39') or (B.VORGANG is null))'
      '  ),0.0) + 0.01) and'
      ' ((select '
      '    SUM(B.BETRAG)'
      '  from '
      '    AUSGANGSRECHNUNG B '
      '  where '
      '   (VERSAND.BELEG_R=B.BELEG_R))>0.01)'
      'order by'
      ' VERSAND.AUSGANG descending')
    ColorScheme = True
    OrderingItemNo = 6
    OrderingItems.Strings = (
      'VERSAND.RECHNUNG=VERSAND.RECHNUNG;VERSAND.RECHNUNG DESC'
      'Betrag=VERSAND.LIEFERBETRAG;VERSAND.LIEFERBETRAG DESC'
      'Anzahlung=DAVON_BEZAHLT;DAVON_BEZAHLT DESC'
      'VERSAND.BELEG_R=VERSAND.BELEG_R;VERSAND.BELEG_R DESC'
      
        'VERSAND.TEILLIEFERUNG=VERSAND.TEILLIEFERUNG;VERSAND.TEILLIEFERUN' +
        'G DESC'
      'VERSAND.AUSGANG=VERSAND.AUSGANG DESC;VERSAND.AUSGANG'
      'PERSON.SUCHBEGRIFF=PERSON.SUCHBEGRIFF;PERSON.SUCHBEGRIFF DESC')
    OrderingLinks.Strings = (
      'VERSAND.RECHNUNG=ITEM=1'
      'VERSAND.LIEFERBETRAG=ITEM=2'
      'DAVON_BEZAHLT=ITEM=3'
      'VERSAND.BELEG_R=ITEM=4'
      'VERSAND.TEILLIEFERUNG=ITEM=5'
      'VERSAND.AUSGANG=ITEM=6'
      'PERSON.SUCHBEGRIFF=ITEM=7')
    Left = 40
    Top = 80
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 88
    Top = 80
  end
end

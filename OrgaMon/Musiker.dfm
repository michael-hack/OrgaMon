object FormMusiker: TFormMusiker
  Left = 38
  Top = 47
  Caption = 
    'Autoren / Komponisten / Schriftsteller / Musiker / Wissenschaftl' +
    'er'
  ClientHeight = 630
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 930
    Height = 618
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Einzelpersonen'
      object Label1: TLabel
        Left = -1
        Top = 228
        Width = 88
        Height = 13
        Caption = 'Hintergrundinfo'
      end
      object Label2: TLabel
        Left = 3
        Top = 539
        Width = 38
        Height = 14
        Caption = '&suche'
        FocusControl = Edit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton7: TSpeedButton
        Left = 367
        Top = 7
        Width = 23
        Height = 22
        Hint = 'andere Person '#252'bernehmen'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
          FF000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF
          FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFF000000FFFFFFFFFFFF000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          FFFFFFFFFFFF000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000FFFFFF000000000000FFFFFFFFFFFF000000000000000000FFFFFF0000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FF
          FFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFF0000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton7Click
      end
      object SpeedButton1: TSpeedButton
        Left = 55
        Top = 509
        Width = 22
        Height = 22
        Hint = 'Suchindex aktualisieren'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
          7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
          FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
          99986B66FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3F5E3CBF5DFC3CFCF9F01
          8A02018A02CCC68BEECC9AEECC97F3D199986B66FF00FFFF00FFFF00FFB48176
          FFF7EBF9EBDA018A02D1D6AC018A02D0CF9ECECC98018A02CCC689EFCD99F3D1
          98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4018A02018A02D1D5ADF5
          DFC2F4DBBBCDCC98018A02F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
          FFFFFDFBF4EC018A02018A02018A02F5E3C9F5DFC2F4DBBAF2D7B1F0D4A9F5D5
          A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECFAEFE2F9EADAF8
          E7D2018A02018A02018A02F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
          FFFFFFFFFEFD018A02D6E3C9F9EFE3F8EADAD2D9B3018A02018A02F4DBB9F8DD
          B4986B66FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFD9EDD8018A02D6E3C8D5
          E0C1018A02D3D8B2018A02F7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
          FFFFFFFFFFFFFFFFFFD9EDD8018A02018A02D5DFC1FAEDDCFCEFD9E6D9C4C6BC
          A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
          F8F3FDF6ECF1E1D5B48176B48176B48176B48176FF00FFFF00FFFF00FFE3B18E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
          4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
          FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
          FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
          A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object IB_Text1: TIB_Text
        Left = 400
        Top = 11
        Width = 55
        Height = 13
        DataField = 'RID'
        DataSource = IB_DataSource1
      end
      object SpeedButton2: TSpeedButton
        Left = 471
        Top = 6
        Width = 23
        Height = 21
        Hint = 'Verkettete Musiker auftrennen'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB3926FB3926FB3926FB3926FB3926FB3926FB3926FB3
          926F000000B3926FB3926FB3926FB3926FB3926FA1662EFFFFFFB3926FE4E4E4
          E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D9D9D9E4E4E4E4E4E4E4E4
          E4D9D9D9C6C6C6A1662EB3926FE4E4E4E4E4E4E4E4E4E4E4E4000000E4E4E4E4
          E4E4000000D9D9D9E4E4E4000000D9D9D9E4E4E4B3926FA1662EB3926FE4E4E4
          E4E4E4E4E4E4000000000000E4E4E4E4E4E4E4E4E4E4E4E4E4E4E40000000000
          00D9D9D9B3926FA1662EB3926FE4E4E4E4E4E400000000000000000000000000
          0000D9D9D9000000000000000000000000000000B3926FA1662EB3926FE4E4E4
          E4E4E4D9D9D9000000000000E4E4E4E4E4E4E4E4E4C6C6C6D9D9D90000000000
          00D9D9D9B3926FA1662EB3926FE4E4E4E4E4E4E4E4E4E4E4E4000000D9D9D9E4
          E4E4000000C6C6C6C6C6C6000000D9D9D9D9D9D9B3926FA1662EB3926FE4E4E4
          E4E4E4D9D9D9E4E4E4E4E4E4E4E4E4D9D9D9E4E4E4D9D9D9E4E4E4D1D1D1D1D1
          D1D1D1D1B3926FA1662EB3926FE4E4E4E4E4E4D9D9D9E4E4E4D9D9D9D9D9D9E4
          E4E4000000E4E4E4D1D1D1D1D1D1D1D1D1D1D1D1B3926FA1662EB3926FE4E4E4
          E4E4E4D9D9D9E4E4E4D9D9D9E4E4E4D9D9D9D9D9D9D1D1D1D1D1D1C6C6C6C6C6
          C6D1D1D1B3926FA1662EB3926FC6C6C6C6C6C6C6C6C6E4E4E4E4E4E4D9D9D9D9
          D9D9000000C6C6C6C6C6C6D1D1D1C6C6C6C6C6C6B3926FA1662EB3926FC6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6D1D1D1C6C6C6D1D1D1C6C6C6C6C6C6C6C6
          C6C6C6C6B3926FA1662EB3926FA1662EA1662EA1662EA1662EA1662EA1662EA1
          662E000000A1662EA1662EA1662EA1662EA1662EA1662EA1662EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object IB_UpdateBar1: TIB_UpdateBar
        Left = -1
        Top = 6
        Width = 192
        Height = 24
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        DataSource = IB_DataSource1
        ReceiveFocus = False
        CustomGlyphsSupplied = []
        VisibleButtons = [ubEdit, ubInsert, ubDelete, ubPost, ubCancel, ubRefreshAll]
      end
      object IB_Grid1: TIB_Grid
        Left = -1
        Top = 33
        Width = 914
        Height = 197
        CustomGlyphsSupplied = []
        DataSource = IB_DataSource1
        TabOrder = 1
      end
      object IB_Memo1: TIB_Memo
        Left = -1
        Top = 245
        Width = 914
        Height = 256
        DataField = 'UEBER_INFO'
        DataSource = IB_DataSource1
        TabOrder = 2
        AutoSize = False
        ScrollBars = ssVertical
      end
      object Edit1: TEdit
        Left = 50
        Top = 534
        Width = 863
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnKeyPress = Edit1KeyPress
      end
      object Button1: TButton
        Left = 552
        Top = 7
        Width = 105
        Height = 22
        Caption = 'alle anzeigen'
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 887
        Top = 6
        Width = 25
        Height = 24
        Hint = 'Artikelliste des Musikers anzeigen'
        Caption = '&A'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Button2Click
      end
      object CheckBox1: TCheckBox
        Left = 295
        Top = 9
        Width = 62
        Height = 17
        Alignment = taLeftJustify
        Caption = '000'
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gruppierungen'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 16
        Top = 24
        Width = 153
        Height = 13
        Caption = 'berechnete Gruppierungen'
      end
      object SpeedButton3: TSpeedButton
        Left = 807
        Top = 16
        Width = 22
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
          7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
          FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
          99986B66FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3F5E3CBF5DFC3CFCF9F01
          8A02018A02CCC68BEECC9AEECC97F3D199986B66FF00FFFF00FFFF00FFB48176
          FFF7EBF9EBDA018A02D1D6AC018A02D0CF9ECECC98018A02CCC689EFCD99F3D1
          98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4018A02018A02D1D5ADF5
          DFC2F4DBBBCDCC98018A02F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
          FFFFFDFBF4EC018A02018A02018A02F5E3C9F5DFC2F4DBBAF2D7B1F0D4A9F5D5
          A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECFAEFE2F9EADAF8
          E7D2018A02018A02018A02F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
          FFFFFFFFFEFD018A02D6E3C9F9EFE3F8EADAD2D9B3018A02018A02F4DBB9F8DD
          B4986B66FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFD9EDD8018A02D6E3C8D5
          E0C1018A02D3D8B2018A02F7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
          FFFFFFFFFFFFFFFFFFD9EDD8018A02018A02D5DFC1FAEDDCFCEFD9E6D9C4C6BC
          A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
          F8F3FDF6ECF1E1D5B48176B48176B48176B48176FF00FFFF00FFFF00FFE3B18E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
          4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
          FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
          FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
          A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = SpeedButton3Click
      end
      object SpeedButton8: TSpeedButton
        Left = 865
        Top = 16
        Width = 22
        Height = 22
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C40E0000C40E00000001000000000000CCD0D000CBCF
          CF00C0C2C100B4AFAC00B2AEAC00C2C4C400CDD2D200CCD1D100B8A8A200C389
          7200E1987700EDAA8800E6A58100CF8A6900AF7A6400B4AAA500CED3D300B38A
          7900EC9C7A00FDBD9A00FDC2A000FCC8A800FAC6A500FDC3A100FCC09E00D98D
          6C00A6877B00D0D4D400CFD3D300B28D7E00F19A7900FDB08E00FEBA9800FCC0
          9F00FCF7F300F6F2EE00F9BF9E00FEBB9900FDB39100E7937100A78E8400D1D5
          D500BBB6B300D87C5B00FCA28000FEAC8B00FEB49200FCBA9800EDE1D800E4D8
          D000FABA9800FEB69500FEB08E00FDA68400CA775800BEBFBE00D2D6D600D3D6
          D600AC7F6F00EE906E00FA9D7B00FEA68400FEAE8C00FDB79600FAB79700F9BA
          9A00FDB69400FEA98800FCA07E00F3947200A7887C00D4D7D700AF6A5100E98C
          6B00F4967400FC9F7D00FAA68600EDE7E200FCFBFA00FBFCFC00F1AC8D00FEA8
          8600FEA17F00F8997700EE917000AA746000D3D7D700CACECE00B3654A00E185
          6300EB8D6C00FA9C7A00F49C7B00FAF6F300FBFDFC00F2A48500FC9E7D00F798
          7700F0927000E78A6900AF6F5800CCCFCF00AB634900D97D5C00E2846400EA8C
          6A00F1967400F9F5F200FCFDFD00ED9B7C00F2947300ED8F6D00E7896800DF83
          6200A86F5A00D4D6D6009C695600D3765500DA7C5B00E0836100E5886600E68B
          6A00F8F4F000FCFEFD00E4927400E4866400DE816000DA7C5A009A746600D7D9
          D900D7DBDB009A8B8500C76A4900D0745200D5785700DA7D5C00DA7E5C00F7F2
          ED00FCFEFC00DA866700DD805F00D5795700C26848009D979400D8DCDC00DCE0
          E000C3C7C700985F4C00C96C4B00CC704F00D0785800F1E6DD00F6F6EF00F6F8
          F200F2EBE300D3846700D1755400CE71500082574900DEE0E000DADCDC00AAA8
          A7009E5C4500C4684700C76C4C00C4735500C5745600C4745600C3735500C96F
          4F00C86B4A00824A3600B0B1B100DBDDDD00E0E2E200D9DADA00ABABAA008B61
          5300AE5B3D00C2664500C6694800C2664600A152350078584C00B0B2B200E1E4
          E400DCDFDF00C5C8C8009998980084716A0082625500805F54007F6E68009C9C
          9C00C9CBCB00DDE0E000E2E4E400DCDEDE00CFD1D100D0D2D200D5D7D700DDDF
          DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C4C4C4C4C5
          73C6C7C8C9C4C4C4C4C4B9B9B9BABBBCBDBEBFC0C1C2C3B9B9B9AEAEAFB0B1B2
          B3B4B4B5B6B7B8A0AEAE9FA0A1A2A3A4A5A6A7A8A9AAABACAD9F919293949596
          9798999A9B9C9D9E579182838485868788898A8B8C878D8E8F90737475767778
          797A7B7C637D7E7F80816566676869626A6B6C6D6E6F707172385758595A4A5B
          5C5D5E5F60616263641B1B48494A4B4C4D4E4F50515253545556393A3B3C3D3E
          3F404142344344454647292A2B2C2D2E2F3031323334353637381B1C1D1E1F20
          21222324252627281C1B1010071112131415161718191A061010060606070809
          0A0B0C0D0E0F0706060600000000010102030405010100000000}
        OnClick = SpeedButton8Click
      end
      object ListBox1: TListBox
        Left = 16
        Top = 40
        Width = 897
        Height = 521
        ItemHeight = 13
        TabOrder = 0
      end
      object Button3: TButton
        Left = 888
        Top = 16
        Width = 22
        Height = 22
        Caption = '-->'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 832
        Top = 14
        Width = 25
        Height = 25
        Hint = 'Artikelliste des Musikers anzeigen'
        Caption = '&A'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Button4Click
      end
    end
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'RID=NOTREQUIRED')
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsReadOnly.Strings = (
      'RID=NOEDIT')
    FieldsVisible.Strings = (
      'EVL_R=FALSE'
      'LAND_R=FALSE'
      'MUSIKER_R=FALSE'
      'UEBER_INFO=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select '
      '    RID          '
      '    ,VORNAME      '
      '    ,NACHNAME     '
      '    ,GEBURT       '
      '    ,TOD          '
      '    ,INT_INFO_R   '
      '    ,LAND_R       '
      '    ,PERSON_R     '
      '    ,UEBER_INFO   '
      '    ,EVL_R        '
      '    ,MUSIKER_R    '
      '    ,EVL_TRENNER '
      'from MUSIKER'
      'where MUSIKER_R IS NULL'
      '-- BEGIN'
      'FOR'
      ' UPDATE')
    ColorScheme = True
    KeyLinks.Strings = (
      'MUSIKER.RID')
    OrderingItems.Strings = (
      'VORNAME=VORNAME;VORNAME DESC'
      'NACHNAME=NACHNAME;NACHNAME DESC'
      'GEBURT=GEBURT;GEBURT DESC'
      'TOD=TOD;TOD DESC'
      'RID=RID;RID DESC')
    OrderingLinks.Strings = (
      'VORNAME=ITEM=1'
      'NACHNAME=ITEM=2'
      'GEBURT=ITEM=3'
      'TOD=ITEM=4'
      'RID=ITEM=5')
    RequestLive = True
    AfterScroll = IB_Query1AfterScroll
    BeforeInsert = IB_Query1BeforeInsert
    Left = 55
    Top = 96
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 87
    Top = 96
  end
end

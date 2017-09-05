object FormAusgangsRechnungen: TFormAusgangsRechnungen
  Left = 1
  Top = 1
  Caption = 'Konto "Ausgangs Rechnungen"'
  ClientHeight = 511
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    788
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 118
    Width = 786
    Height = 44
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 576
      Top = 19
      Width = 45
      Height = 22
      Hint = 'Kasse '#246'ffnen'
      Caption = '&S'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000F4F4F4D1D1D1
        CCCCCCCCCCCCCCCCCCD1D1D1F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB2C5D25AB0E74DABE94EABE951ACE95EB1E7B3C6D2FF
        FFFFFFFFFFF6F6F6D1D1D1CCCCCCCCCCCCCCCCCCD1D1D1F4F4F44FADEA9EE3F7
        BCFBFF95F0FF6AE8FF51CBF854AEEACCCCCCCCCCCCB5C6D15BB0E74DABE94EAB
        E951ACE95EB1E7B2C6D24EACEA8FD1F2A5D2F483C1EF66B3EC52B6EE52ADEA51
        ADEA51ACEA4EABEA9EE2F7BCFBFF95F0FF6AE8FF51CBF854AEEA4EACEA95DBF6
        AFF0FD88E6FD5FDEFF47C4F657B0EA9BF4FF6AE9FF4CADEA8FD0F2A5D2F483C1
        EF66B3EC52B6EE54AEEA4EACEA8DCEF2A5D2F483C1EF66B4EC4EB3EE4FABE987
        C3EF66B4EC4BA9E995DBF6AFF0FD88E6FD5FDEFF47C5F754AEEA4EACEA95DBF6
        AFF0FD88E6FD5FDEFF47C5F656AFEA8FEBFE5FDFFF4AACEA8DCDF2A5D2F384C1
        EF66B3EC4EB3EE54AEEA4EACEA8ECDF2A5D2F384C1EF66B3EC4EB3EE50ABE988
        C4EF67B5EC4DA9E998DAF5B4EFFC8BE4FC60DBFE47C3F654ADEA4FACEA99DAF6
        B4EFFC8BE4FC60DBFE47C2F550AAE98AE6FD60DFFF4FA8E861E1FC58DEFE5ADD
        FD5DDFFE58E0FF53ACE951ABEA62E1FC58DEFE5ADDFD5DDFFE57DFFE4FA9E888
        C3EF67B4EC50A9E973E5F778EBF878EAF879EBF869E4FA53ADEA52ADEA73E6F8
        78EBF878EAF878EBF866E2FA4BA8E889E5FC60DEFF47C4F757B2EA51ABE951AB
        E952ABE960BAEFDAEDFAD9EDFA67BBEE51ABEA51AAE94FA9E956B3EE92C9F188
        C3EF67B3EC4EB3EE54AEEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF50ACEA9BDBF6B7F0FD8CE5FC60DBFE47C3F654ADEAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51ACEA62E1FC59DEFE5A
        DDFD5DDFFE58E0FF53ACE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF52ADEA73E6F878EBF878EAF879EBF869E4FA53ADEAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9EDFA67BBEE51ABEA51
        ABE952ABE960BAEFDAEDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Label38: TLabel
      Left = 218
      Top = 3
      Width = 68
      Height = 13
      Caption = 'Zahlungsart'
    end
    object SpeedButton3: TSpeedButton
      Left = 191
      Top = 19
      Width = 21
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
    object SpeedButton2: TSpeedButton
      Left = 143
      Top = 19
      Width = 22
      Height = 22
      Hint = 'L'#246'schen mit Stornieren'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000DCEFF680CCEA
        3FB2E016A0D73FADDC7EC5E5DCEDF5FAFAFAFAFAFADCEEF65092D70951BD0442
        BC094FBC4384CEDBEBF494D7EF5FCBED8AE0F688E3F96FDAF447C1E64DB2DF3E
        AADB1495D4217DCF2665CA2177E60579EA0164DD054EBD4E8AD162C9EC8EDDF4
        9EE6FC85DEFA7BDDFA6CD3F224A9DF61D1F172DEF90851BF639DF4187FFF0076
        F80076EE0368E10C51BD16B7E9BFF1FD74D9F75BD1F644CBF58EE6FC12A2DC47
        C7F42EB6F10442BCAECDFEFFFFFFFFFFFFFFFFFF187FEF0442BC18BBECBDEFFC
        99E3FB89DFFA74D9F963DAF813A8E05BD2F944C9F70653C08DB5F64D92FF1177
        FF2186FF408AEB0851BF19C0EFAAEAFB78DAF861D4F644CDF566DBF814ADE436
        C1F22BB7F11C87DD3775D28DB5F7B8D6FE72A8F52D6BCB679CDB1BC4F1CFF5FE
        C3F0FEBDEFFEA2E7FC99E8FC15B3E75ED3F948CCF836C2F54199E00E57C30442
        BC1E59BF85A4DBFAFAFA1BC8F4DAF7FED1F4FFC3F1FFB7EEFFBFF2FE17B7EB3A
        C4F32DBBF220B0EF51C7F412A5DFFAFAFAFAFAFAFAFAFAFAFAFA83E1F891E1FA
        DFF8FFD7F7FFCCF4FFA9E9FA2AC2F064D6F94CCFF83BC6F668D6F914AAE2FAFA
        FAFAFAFAFAFAFAFAFAFAEDF7F933D0F61DCAF61BC8F520C6F41AC2F279DCF83C
        C7F430BFF323B5F06CD7F914AFE5FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA19C3F1A2E9FC69D9FA51D2F93EC9F75ACCF515B3E8FAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA1BC6F387E2FA40
        CBF534C4F325BAF15CCDF617B7EBFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA1CC9F4BAF0FDAAEAFEA2E9FE79DDFB7BDFFB17BBEDFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA1CCCF6D6F7FFBC
        EFFFABEBFF9AE6FFA7EDFD18BFF0FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFA28D1F7A2E7FBD3F6FFC7F4FFBBF1FFA2E9FB38CAF2FAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFADBF4FA34D3F720
        CEF71CCCF622CBF545D1F5B5EAF8FAFAFAFAFAFAFAFAFAFAFAFA}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object IB_UpdateBar1: TIB_UpdateBar
      Left = 3
      Top = 19
      Width = 140
      Height = 22
      Flat = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      DataSource = IB_DataSource1
      ReceiveFocus = False
      CustomGlyphsSupplied = []
      VisibleButtons = [ubEdit, ubDelete, ubPost, ubCancel, ubRefreshAll]
    end
    object Button1: TButton
      Left = 696
      Top = 19
      Width = 21
      Height = 22
      Hint = 'Person anzeigen'
      Caption = '&P'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 722
      Top = 19
      Width = 23
      Height = 22
      Hint = 'Beleg anzeigen'
      Caption = '&B'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button9: TButton
      Left = 750
      Top = 19
      Width = 23
      Height = 22
      Hint = 'Kontoinformation / Mahnung einsehen'
      Caption = '&M'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button9Click
    end
    object Button3: TButton
      Left = 626
      Top = 19
      Width = 22
      Height = 22
      Hint = 'Konto-Buchung anzeigen'
      Caption = '&K'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 653
      Top = 19
      Width = 22
      Height = 22
      Hint = 'passende Teilzahlungen in 1710 anzeigen'
      Caption = '&T'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Button5Click
    end
    object IB_ComboBox2: TIB_ComboBox
      Left = 218
      Top = 19
      Width = 143
      Height = 21
      DataField = 'ZAHLUNGTYP_R'
      DataSource = IB_DataSource1
      TabOrder = 6
      Style = csDropDownList
      Items.Strings = (
        '- Standard -')
      ItemValues.Strings = (
        '')
    end
  end
  object IB_Grid1: TIB_Grid
    Left = 0
    Top = 162
    Width = 786
    Height = 170
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    EditorBorderStyle = bsSingle
    IndicateLongCellText = True
    DrawCellTextOptions = [gdtEllipsis, gdtShowTextBlob, gdtWordWrap]
    OnCellGainFocus = IB_Grid1CellGainFocus
    OnGetDisplayText = IB_Grid1GetDisplayText
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 118
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 7
      Width = 45
      Height = 14
      Caption = 'Label1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton13: TSpeedButton
      Left = 547
      Top = 20
      Width = 22
      Height = 22
      Hint = 'Saldo neu berechnen'
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
      OnClick = SpeedButton13Click
    end
    object Label4: TLabel
      Left = 179
      Top = 62
      Width = 5
      Height = 13
      Caption = '-'
    end
    object StaticText2: TStaticText
      Left = 9
      Top = 38
      Width = 40
      Height = 17
      Caption = 'Kunde'
      FocusControl = Edit3
      TabOrder = 0
    end
    object StaticText3: TStaticText
      Left = 9
      Top = 64
      Width = 62
      Height = 17
      Caption = 'Beleg - TL'
      FocusControl = Edit4
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 111
      Top = 33
      Width = 148
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 111
      Top = 59
      Width = 65
      Height = 21
      TabOrder = 3
    end
    object Button4: TButton
      Left = 698
      Top = 79
      Width = 75
      Height = 33
      Caption = 'Sta&rt'
      TabOrder = 4
      OnClick = Button4Click
    end
    object RadioButton1: TRadioButton
      Left = 336
      Top = 63
      Width = 313
      Height = 17
      Caption = 'nur Forderungen (in der Regel positive Betr'#228'ge)'
      TabOrder = 5
    end
    object RadioButton2: TRadioButton
      Left = 336
      Top = 86
      Width = 289
      Height = 17
      Caption = 'nur Zahlungen (in der Regel negative Betr'#228'ge)'
      TabOrder = 6
    end
    object RadioButton3: TRadioButton
      Left = 336
      Top = 41
      Width = 169
      Height = 16
      Caption = 'Alle Buchungen anzeigen'
      Checked = True
      TabOrder = 7
      TabStop = True
    end
    object StaticText5: TStaticText
      Left = 587
      Top = 17
      Width = 186
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '#,## '#8364
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      Transparent = False
    end
    object Edit6: TEdit
      Left = 218
      Top = 60
      Width = 41
      Height = 21
      TabOrder = 9
    end
    object Button6: TButton
      Left = 82
      Top = 59
      Width = 22
      Height = 22
      Caption = '*'
      TabOrder = 10
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 82
      Top = 33
      Width = 22
      Height = 22
      Caption = '*'
      TabOrder = 11
      OnClick = Button7Click
    end
    object Button10: TButton
      Left = 189
      Top = 59
      Width = 22
      Height = 22
      Caption = '*'
      TabOrder = 12
      OnClick = Button10Click
    end
  end
  object IB_Memo1: TIB_Memo
    Left = 0
    Top = 332
    Width = 786
    Height = 81
    DataField = 'TEXT'
    DataSource = IB_DataSource1
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    AutoSize = False
    ExplicitTop = 459
  end
  object Panel4: TPanel
    Left = 0
    Top = 413
    Width = 786
    Height = 98
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    ExplicitTop = 504
    DesignSize = (
      786
      98)
    object Label2: TLabel
      Left = 631
      Top = 8
      Width = 11
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #8364
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 392
      Top = 15
      Width = 44
      Height = 13
      Caption = 'S&umme'
      FocusControl = Edit5
    end
    object Label5: TLabel
      Left = 416
      Top = 44
      Width = 20
      Height = 13
      Caption = 'B&ar'
      FocusControl = Edit1
    end
    object Label6: TLabel
      Left = 631
      Top = 37
      Width = 11
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #8364
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 384
      Top = 71
      Width = 52
      Height = 13
      Caption = 'R'#252'ckgeld'
    end
    object Edit5: TEdit
      Left = 443
      Top = 8
      Width = 182
      Height = 26
      Hint = 'Zahlungseingang buchen'
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = Edit5KeyPress
    end
    object CheckBox1: TCheckBox
      Left = 9
      Top = 7
      Width = 218
      Height = 18
      Anchors = [akRight, akBottom]
      Caption = 'ohne Buchung "Kasse"'
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 9
      Top = 24
      Width = 218
      Height = 18
      Caption = 'als Forderungsverlust buchen'
      TabOrder = 3
    end
    object Button8: TButton
      Left = 653
      Top = 8
      Width = 129
      Height = 84
      Caption = '*'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -56
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button8Click
    end
    object Edit1: TEdit
      Left = 443
      Top = 37
      Width = 182
      Height = 26
      Hint = 'Zahlungseingang buchen'
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = Edit1KeyPress
    end
    object StaticText1: TStaticText
      Left = 443
      Top = 66
      Width = 200
      Height = 26
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BorderStyle = sbsSunken
      Caption = '+++'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object IB_Query1: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsAlignment.Strings = (
      'BETRAG=RIGHT')
    FieldsDisplayFormat.Strings = (
      'TEILLIEFERUNG=00')
    FieldsDisplayLabel.Strings = (
      'RECHNUNG=R#'
      'TEILLIEFERUNG=TL'
      'BELEG_R=B#')
    FieldsDisplayWidth.Strings = (
      'TEXT=250'
      'RECHNUNG=60'
      'TEILLIEFERUNG=20'
      'BELEG_R=55'
      'VALUTA=82'
      'BETRAG=83')
    FieldsReadOnly.Strings = (
      'RID=NOEDIT')
    FieldsVisible.Strings = (
      'KUNDE_R=FALSE'
      'RID=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT RID'
      '     , DATUM'
      '     , BELEG_R'
      '     , TEILLIEFERUNG'
      '     , RECHNUNG'
      '     , VALUTA'
      '     , BETRAG'
      '     , TEXT'
      '     , KUNDE_R'
      '     , VORGANG'
      '     , ZAHLUNGTYP_R'
      '     , EREIGNIS_R'
      'FROM AUSGANGSRECHNUNG'
      '/* ~where begin~ */'
      '/* ~where end~ */'
      'ORDER BY DATUM,RID'
      'FOR UPDATE'
      ' ')
    ColorScheme = True
    KeyLinks.Strings = (
      'AUSGANGSRECHNUNG.RID')
    RequestLive = True
    AfterScroll = IB_Query1AfterScroll
    OnConfirmDelete = IB_Query1ConfirmDelete
    Left = 32
    Top = 232
  end
  object IB_DataSource1: TIB_DataSource
    AutoInsert = False
    Dataset = IB_Query1
    Left = 120
    Top = 232
  end
  object IB_Query2: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM PERSON'
      'WHERE RID=:CROSSREF')
    Left = 200
    Top = 176
  end
  object IB_Query3: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM ANSCHRIFT'
      'WHERE RID=:CROSSREF')
    Left = 232
    Top = 176
  end
  object IB_Query4: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM BELEG'
      'WHERE RID=:CROSSREF'
      'FOR UPDATE')
    RequestLive = True
    Left = 264
    Top = 176
  end
end

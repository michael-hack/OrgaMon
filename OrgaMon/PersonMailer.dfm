object FormPersonMailer: TFormPersonMailer
  Left = 305
  Top = 129
  Caption = 'eMail'
  ClientHeight = 586
  ClientWidth = 839
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 6
    Width = 301
    Height = 25
    Caption = 'OrgaMon'#8482' eMail-Versand'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 605
    Top = 6
    Width = 25
    Height = 25
    Hint = 'Status GESENDET invertieren'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFF6B696B6B696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B59EF3110D6422CBD636163FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A59B53110D6FFFFFFFFFFFFFFFFFF
      7B59EF310CE7310CE76361636B696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF422C
      BD4A28E75A59B5FFFFFFFFFFFFFFFFFFFFFFFF7B59EF4A28E73110D66B696BFF
      FFFFFFFFFFFFFFFFFFFFFF4A28E73110D65A59B5FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7B59EF310CE7422CBD6B696BFFFFFFFFFFFF3110D64A28E75A59
      B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B59EF4A28E742
      2CBD52515A3110D63110D65A59B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF7B59EF3110D62900D63110D66B6D8CFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A
      28E72900DE422CBD6B6D8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF3110D64A28E75A59B54A28E75A4DE76B6D8CFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A28E7310CE75A
      59B5FFFFFFFFFFFF7B59EF5A4DE76B6D8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3110D64A28E75A59B5FFFFFFFFFFFFFFFFFFFFFFFF7B59EF4A28
      E76B6D8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A28E73110D65A59B5FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF7B59EF4A28E7FFFFFFFFFFFFFFFFFFFFFFFF
      4A28E73110D64A49D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF310CE74A28E7FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton1: TSpeedButton
    Left = 522
    Top = 8
    Width = 22
    Height = 22
    Hint = 'Liste einlesen aus einer OLAP Abfrage'
    Glyph.Data = {
      46050000424D460500000000000036040000280000000F000000110000000100
      0800000000001001000000000000000000000001000000010000FFFFFF00FCFC
      FB00F5F8F500F3F7F300F2F9F000E6F3E400E5F2E300E4ECE300E5E7E500E4EC
      E200DCEED900DEE8DD00DBE6DA00D9E9D600DADED900D7DBD700D1E9CD00CAE7
      C700C8E5C400CBD5CA00C9DAC700C7D7C400CBCFC900C8D8C600C2E1BE00C1E2
      BD00C0E1BC00BBDFB600B8DDB200B6DCB100B5DCB000B7CDB400B2DAAD00B0DA
      AA00B9C0B800B5CCB200A6D49F00A4D39D00ABB3AA00A7AFA600A2BE9E00A1BD
      9C0094CD8C00A0AA9F009FA99E009EA89D0091B38C0087C67E0098A297008FB1
      8900919B8F00909A8E008F9A8E008F998D0087AC810078C66C007DA777008590
      83006AB95F00759D70007B887A007987790062B4560061BC53005EB950005CB9
      4F00699863005AB44D00679660005AB44E005AB04D005AB44E005AB34D005AB3
      4D0059B04C0059B24C005AB24C0058B04B0058AF4B0058B14B0057AE4A0056AC
      490057B04A0058B04A0054B4460052AD450052AD440050AC430051AC430053A5
      470051AC430050AB420050AD43004FAB42004FAB4200657362004EA841004EA7
      41004E9C43004DA8410055894D0053874B004A923F004B86430046963A004591
      3B0045883A0053645100487E4000418237003E7E35003F7A37003E7C35003D7C
      34003E7C34003F7A36003D7A34003C7934003D7834003C7933003D7934003B78
      33003C7733003A7632003C7833003A7732003B7632003A7432003A7431003973
      3100397231003A76310038752F003970300039703000376F2E0035722C003472
      2C0035722C00356C2D00346C2D00336F2B00346F2B00336E2A00336C2A00326C
      2A00326B290031692900316A290031692900306129002F6627002A5424003341
      31002D412A0025501F0022461D00233821001C3A180018301400192E1700162C
      1300152C1200152B1200142B1200152A1200142B1100142A110014291000142A
      100015291200142812001428110012220F00132710001326100010210E001124
      0E000F1E0D000E1F0C000E1F0C000D1D0B000D1D0B000C1C0B000B1A0A000C1F
      0D000B1A0A000A190A0009180900091508000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0513070000000000000000000000001137879D1F0000000000000000112A3841
      4187B2AD993B26000000053A5D5D4E4E4184B29EADADAD9A0E00115D4E4E4E4E
      4187ADAD9EADADAD2600115D4E4E414E4187B29EADAD9EAD260018414E4E4E4E
      4187B2AD9EADADAD2C00185D4E4E4E4E4187B29EADAD9EAD2C001B4E4E4E4E4E
      4187B2AD9EADADAD2C00204E4E4E4E4E3A87B29EADAD9EAD34001B5D4E4E4E4E
      6A6E9CA0A0ADADAD3400204E4E626E6E6E876E6E989CA0B23400246A6E6E876E
      876E6E6E6E84879E3C000E408497876E6E6E6E6E978484641300000013262F6C
      878784673626100000000000000000001F2F2600000000000000000000000000
      00000000000000000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Image2: TImage
    Left = 779
    Top = 6
    Width = 54
    Height = 22
    Cursor = crHandPoint
    AutoSize = True
    Picture.Data = {
      07544269746D61704E0E0000424D4E0E00000000000036000000280000003600
      0000160000000100180000000000180E0000C40E0000C40E0000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECEC
      ECECECECECECECECECECDFDFDFB1B1B10902040802030802030A0204BEBEBEE6
      E6E6ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
      ECECECECECECECECECECECB2B2B2050402110C06613E1A8B582D7B4C23482A11
      0D0803070503CDCDCDECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
      ECECECECECECECECECECECECAFAFAF0F0B05734A25BA7D37C5813DD09671C596
      71AF6D328A51213B210F0E0905CDCDCDECECECECECECECECECECECECECECECEC
      ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECEC000000
      ECECECECECEC000000ECECECECECEC000000ECECECECECECECECEC0000000000
      00000000ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
      FF000000ECECECECECECECECECD3D3D30605047C5C34D79451DA8C47D08C5CDA
      B6A6DAAB9BBB773DB06D329E5D263B210F070503E6E6E6ECECECECECECECECEC
      ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
      EC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000EC
      ECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000FFFFFF
      0000FFFFFF000000ECECECECECECECECEC9191911A140DD8A261DAA15CDA9652
      D08C5CD08C71D08C5CBB7732B07732B06D328A51210D0803BEBEBEECECECECEC
      ECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000EC
      ECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC
      000000ECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
      00FFFFFF0000FFFFFF000000ECECECECECECE5E5E5060402957D57E5B67CE5AB
      67DAA15CD09667DAB6B0E5B691C58147BB7732B07732AF6D32482A11090204EC
      ECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC
      000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECEC
      ECECECEC000000000000000000000000000000ECECECECECECECECECECECECEC
      ECEC000000FFFFFF0000FFFFFF000000ECECECECECECCDCDCD040302D0B17EE5
      C086E5B67CE5AB67DAA171DAC0A6EFD5D0DAA171C5813DBB7732B077327B4C23
      050102E5E5E5ECECECECECECECECECECECEC000000ECECECECECECECECECECEC
      ECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC00
      0000ECECECECECEC000000ECECECECECECECECEC000000ECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECC7C7C7040304
      D8B78CEFCB91E5C086E5B67CDAAB67DAA171E5C0B0EFCBC5DA8C67C5813DBB77
      32825825050102E2E2E2ECECECECECECECECECECECEC00000000000000000000
      0000000000000000000000ECECECECECEC000000ECECECECECEC000000ECECEC
      ECECEC000000ECECECECECEC000000ECECECECECECECECEC000000ECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECE0E0
      E0050305AE9B80EFCB9BE5B691E5B686E5B691DAAB67DAA171EFD5DADAA191D0
      8147C5813D613E1A080203ECECECECECECECECECECECECECECEC000000ECECEC
      ECECECECECECECECECECECEC000000ECECECECECEC000000ECECECECECEC0000
      00ECECEC000000000000000000ECECECECECEC000000000000000000ECECECEC
      ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
      ECECECECEC7D7D7D231E1CE9D0ACEFCB9BEFCBB0EFE0E5EFCBB0E5C0B0FAEAEF
      E5B691DA8C47BA7D37110C06ADADADECECECECECECECECECECECECECECEC0000
      00ECECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECEC
      ECEC000000ECECECECECEC000000ECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
      ECECECECECECECECECC4C4C4070405B19F85EFD5B0EFD5B0EFD5C5EFE0E5EFE0
      E5EFCBB0E5AB67D79451734A25050402DFDFDFECECECECECECECECECECECECEC
      ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECECECECEC
      ECECECECECEC000000ECECECECECEC000000ECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
      FF000000ECECECECECECECECECEBEBEB8C8C8C110E0DB7A489EBD2ADEFD5B0EF
      CB9BEFCB9BE5B686DCA463805F360F0B05B2B2B2ECECECECECECECECECECECEC
      ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
      EC000000ECECECECECEC000000ECECECECECECECECEC000000000000ECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF
      0000FFFFFF000000ECECECECECECECECECECECECE9E9E98C8C8C080505241F1D
      B4A085E2C092DDBC86977E581C150E070604AFAFAFECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
      00FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEBEBEBC4C4
      C47D7D7D050405050405050402060402919191D3D3D3ECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
      ECECECECECECECECE0E0E0C7C7C7CDCDCDE5E5E5ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
      ECECECECECECECECECEC000000FFFFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
    OnClick = Image2Click
  end
  object Label2: TLabel
    Left = 30
    Top = 539
    Width = 9
    Height = 13
    Caption = '#'
  end
  object SpeedButton2: TSpeedButton
    Left = 631
    Top = 6
    Width = 25
    Height = 25
    Hint = 'aktuell markierte Mail nochmals versenden'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000F6F6FFFFFBFF
      FFFCFCFFFFF6FFFFF56B65587B7B75686D64F8F7E9FFFFEEFFFFDCFFFFE3FFF5
      DAFFFFF7DEECF8E4FBFFFFF7FFFFFAFFFFF4EFFFFFEE926F55896A4B745C4076
      6348907F64FFFCE1FFFFE7FFFFE9FFFFEEF6F4E9F8FFFFF1FDFFFFF5FF926268
      A76A5CAA6240C27138C77430D68843E3A1609B6935A17D578872597F7262675E
      548680757D746AFFFFF2794E51835450C78D7AA6633CED9D5EF59C4CD2751ADC
      862CFFBE71BB864D704F2E99857371675D5B52498C7D6DFFFEED83725FF6E5D2
      FFF9E6FFF2D3FFF7C9FFE5A2D28C31E79A33E39530FFDA83E4B276997753FFFF
      EF84776F6E5E57FFFFF8716B4EFFFFE9FFFFF7F3F7EBFFFEE7FFFFDCFFE39ACA
      8426F5A239FEAB48FFCE83B07B49FFECD4A98F897E696CFFFBFF8A7F69FFFDEF
      F2FBFFEFFDFFB6BFC9CCC4BDFFEAC4FFDA9AE6913BF9993FD67A2BDB8A51FFEA
      CEAA7B77906F7EFFEFFF917C74FFFEFBFFFBFFF9F5FFFFFAFFFFFDFEFFECD8A1
      6A43C0773DAF5E1BD48445B86E3EFFECD2AF827E816572FFF6FFA6808CFFF8FF
      FFF6F3FFEAE0FFD5C5FFCCB8F1BFABFFD6C1FBD1BAF8CFB8FFF0D8FFF5DEFFE7
      D699897D837A77F9F4F5A97E87FFF3F199563FC2754E9A4B1ACF8758D59D80FF
      FBEBFFFCFBFFF8FB575253989793FDFCF28284786C7267FAFFF8C49D8FFFF7DB
      D68C54E99347C76D199A4C00FFF4C5FFFAE5FFFBFFEFFCFF8E9EAE9BAEB6EFFD
      FB637068728074F2FFF5D2A988FFFFD5BA742EFFAE59EF973DE69748925925FF
      FFE9F7EBE9FAFCFFECF2FFECF3FCFBFFFF818482646863FBFFFCDBAD7DE4B27D
      C78C4EEFAE6AF0AA67FFC489CE90629C6546D9A997CBA097CCA49FB89290C8A6
      A792737AFFF8FFFFF8FFFFFCD0FFFFDC8D6941FFFFE0FFFDD8BC8A66FFDDB9EC
      AE8A9F5F3C8E5032AC725C9D695CFFDEDDFFF9FFFFEDFDFFF6FFFFFFEEFFF9E8
      FFFFFBFFFFFFFFFEFEFFFFF5B89073FFE7BCFFD7A3D69B696F3E18FFFEE6FFFF
      F7FFFDFFFFFBFFFFFBFFFFFFF7FDFFFEDFECFAECFBFFEEF6FFFFFCFDFFFFEACB
      9A6CDB9F63AE7538FFFFD9FFFFE1FFFFF5FDFBFBEAEEF3F6FDFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 661
    Top = 6
    Width = 25
    Height = 25
    Hint = 'anstehende Mails nun versenden'
    Glyph.Data = {
      36010000424D3601000000000000760000002800000012000000100000000100
      040000000000C0000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0000000000
      000000000000FF0FFFFFFFFFFFFFF0000000FF0FFFFF4444444FF0000000F00F
      FFFFFFFFFFFFF0000000F00FFFFF4444444FF0000000F00FFFFFFFFFFFFFF000
      0000000FFFFFFFFFFF99F0000000000F4444FFFFFF99F0000000000FFFFFFFFF
      FFFFF000000000000000000000000000000000F4444FFFFFF99F0F00000000FF
      FFFFFFFFFFFF0F00000000000000000000000F0000000F4444FFFFFF99F0FF00
      00000FFFFFFFFFFFFFF0FF0000000000000000000000FF000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton3Click
  end
  object SpeedButton5: TSpeedButton
    Left = 491
    Top = 8
    Width = 22
    Height = 22
    Hint = 'Nach St'#246'rung: Hier war noch ok! Alles andere nun beginnen!'
    Glyph.Data = {
      66020000424D660200000000000036000000280000000D0000000E0000000100
      18000000000030020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFF21314A4A6B9C5273AD5A84C65A7BBD29427B21315AFFFFFFFFFFFFFFFF
      FFFF426BC6426BC6426BC68CB5F794B5F78CB5F78CB5F78CB5F78CB5F75273CE
      21315AFFFFFFFFFFFFFF7394CE9CBDF794BDF794B5F794B5F794B5F7426BC642
      6BC631528C31528C31528C102131FFFFFFFF7394CE9CBDF79CBDF79CBDF794B5
      F78CB5F78CB5F78CB5F784ADF74A73CE4A73CE314A84FFFFFFFF7394CE9CBDF7
      9CBDF79CBDF794B5F78CB5F784ADF7426BC631528C31528C31528C31528C0810
      21FF7394CE9CBDF79CBDF794B5F794B5F794B5F78CB5F794B5F794BDF7739CEF
      5273CE5273CE21315AFF7394CE94B5EF9CBDF794B5F794B5F78CB5F78CB5F742
      6BC6426BC631528C31528C31528C5A7BC6FF5A7BC694B5EF94B5EF94B5EF8CB5
      F794B5EF8CB5F78CB5F784ADF784ADF7638CDE5A84DE182942FF5A7BC65A7BC6
      5A7BC694B5EF94B5EF94B5EF94B5EF94B5EF5A7BC65A7BC65A7BC631528C5A7B
      C6FFFFFFFFFFFFFFFFFFFF31528C94B5EF94B5EF94B5F75A7BC65A7BC6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31528C94B5EF9CBDF794
      B5F731528CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF426BC69CBDF794B5F731528CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF4263B59CBDF79CBDF731528CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A7BC65A7BC6FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 467
    Top = 8
    Width = 22
    Height = 22
    Hint = 'Blacklist '#246'ffnen'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000C40E0000C40E000000010000000100004C4C4C008080
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202020202
      0202020202020202020202020202000000000000000002020202020202000000
      0000000000000002020202020000000000000000000000000202020000000000
      0000000000000000000201000202020002000002000200000002010002000200
      0200020002020000000201000000020002000200020202020002010000020000
      0200020002020002000201000200020002000200020200020002010002020002
      0202000200020202000202000000000000000000000000000002020200000000
      0000000000000000020202020200000000000000000000020202020202020000
      0000000000000202020202020202020101010101010202020202}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TSpeedButton
    Left = 545
    Top = 8
    Width = 23
    Height = 22
    Hint = 'ReferenzIdentitaet aus den Anlagen extrahieren'
    Glyph.Data = {
      66030000424D660300000000000036000000280000000F000000110000000100
      18000000000030030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFDCDCF7C6C5D8DDDCEDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF0323FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B5F23F39E50B
      098416133FA7A5D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0428FFFFFFFFFFFFFF
      B9B5F26A66E25E5BB71A13DD1A13DD0B09840403230404282827445B56ADA5A4
      B5FFFFFFFFFFFFA4B5FFDCDCF7332DD80F08D10F08D11913D31913D31A13DD0B
      078E0403230705440404280404280404281E1D49D4D5DD13D3FFB9B5F20F08D1
      1913D31913D31913D31913D31A13DD0B09840404280404280705440404280404
      28040428A5A4B513D3FFB9B5F20F08D11913D31913D31A13DD1913D31A13DD0B
      0984040323070544040428040428070544040428A5A4B50323FFACAAED1A13DD
      1913D31913D31913D31913D31A13DD0B09840403230404280705440404280404
      280404289796AA0428FFACAAED0F08D11913D31913D31913D31913D31A13DD0B
      09840403230705440404280404280705440404289796AA859BFFA19EED1913D3
      1913D31913D31913D31913D31A13DD0B09840403230404280705440404280404
      280404289796AA13D3FF9893EA1913D31913D31913D31913D31913D3332DD80B
      098404032307054404042804042807054404042887859B13D3FFA19EED0F08D1
      1913D31913D31913D31913D3110EA3120D990906540D0A350D0A350404280404
      2804042887859B0D99FF9893EA1913D31913D31610BC120D99120D99120D990B
      0984120D99120D990C09660906540D0A3504032387859B078EFF8682E5110EA3
      120D99120D990B0984120D990B0984120D99120D99120D99120D990B078E0B09
      8407054473718CC5D8FFD4D5DD1C16DD0B078E08047C0B0984120D99120D9912
      0D99120D99120D9908047C0B078E0B078E302C9EC6C5D8078EFFFFFFFFFFFFFF
      C6C5D8A5A4B55B56DD1F1D930B09840B09840B078E221E9E6968BAA5A4B5BEBC
      F2FFFFFFFFFFFF1D93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A5D35B
      56DDA5A4B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4B5FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton7Click
  end
  object IB_Grid1: TIB_Grid
    Left = 8
    Top = 36
    Width = 825
    Height = 194
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    TabOrder = 0
    DrawCellTextOptions = [gdtShowTextBlob]
  end
  object Button2: TButton
    Left = 696
    Top = 6
    Width = 25
    Height = 25
    Hint = 'Zur Zielperson'
    Caption = '&P'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 722
    Top = 6
    Width = 25
    Height = 25
    Hint = 'Vorlagen anzeigen AN/AUS'
    Caption = '&V'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 748
    Top = 6
    Width = 25
    Height = 25
    Hint = 'zum Beleg'
    Caption = '&B'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button4Click
  end
  object IB_UpdateBar1: TIB_UpdateBar
    Left = 327
    Top = 8
    Width = 130
    Height = 25
    Flat = False
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    DataSource = IB_DataSource1
    ReceiveFocus = False
    CustomGlyphsSupplied = []
    VisibleButtons = [ubInsert, ubDelete, ubPost, ubCancel, ubRefreshAll]
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 558
    Width = 751
    Height = 18
    TabOrder = 5
  end
  object Button8: TButton
    Left = 768
    Top = 558
    Width = 65
    Height = 18
    Caption = 'Ab&bruch'
    TabOrder = 6
    OnClick = Button8Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 521
    Width = 182
    Height = 17
    Caption = 'initialisiere ...'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object Button6: TButton
    Left = 574
    Top = 6
    Width = 25
    Height = 25
    Hint = 'Ereignisse in eMail-Anforderungen umsetzen'
    Caption = 'C'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button6Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 542
    Width = 13
    Height = 7
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    BevelEdges = []
    BevelOuter = bvNone
    Color = clRed
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 9
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 231
    Width = 827
    Height = 289
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = TabSheet1
    TabOrder = 10
    object TabSheet1: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Log'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 819
        Height = 261
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Verfassen'
      ImageIndex = 1
      object IB_Memo1: TIB_Memo
        Left = 0
        Top = 0
        Width = 819
        Height = 261
        DataField = 'NACHRICHT'
        DataSource = IB_DataSource1
        Align = alClient
        TabOrder = 0
        AutoSize = False
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Test'
      ImageIndex = 2
      object Label6: TLabel
        Left = 35
        Top = 17
        Width = 80
        Height = 13
        Caption = 'Empf'#228'nger ->'
      end
      object Button1: TButton
        Left = 637
        Top = 195
        Width = 164
        Height = 54
        Caption = 'Test-Mail senden'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 119
        Top = 14
        Width = 294
        Height = 21
        TabOrder = 1
        Text = 'Testmail.Empfaenger@domain.tld'
      end
      object CheckBox2: TCheckBox
        Left = 52
        Top = 59
        Width = 392
        Height = 17
        Caption = 'Mail an ->... anstelle der eingetragenen Person(en)'
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 52
        Top = 39
        Width = 316
        Height = 16
        Caption = 'Mail zus'#228'tzlich "bcc" an ->...'
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        Left = 35
        Top = 108
        Width = 139
        Height = 17
        Caption = 'mit Test-Anhang'
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 53
        Top = 154
        Width = 748
        Height = 21
        TabOrder = 5
        Text = 'G:\test.eml'
      end
      object CheckBox5: TCheckBox
        Left = 35
        Top = 131
        Width = 97
        Height = 17
        Caption = 'mit Anhang'
        TabOrder = 6
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Einstellungen'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 39
        Top = 43
        Width = 95
        Height = 13
        Caption = 'Ich bin Server #'
      end
      object Label4: TLabel
        Left = 172
        Top = 43
        Width = 21
        Height = 13
        Caption = 'von'
      end
      object Label5: TLabel
        Left = 13
        Top = 81
        Width = 89
        Height = 13
        Caption = 'SQL - Selektion'
      end
      object Edit4: TEdit
        Left = 140
        Top = 40
        Width = 28
        Height = 21
        TabOrder = 0
        Text = '1'
      end
      object Edit5: TEdit
        Left = 201
        Top = 40
        Width = 28
        Height = 21
        TabOrder = 1
        Text = '1'
      end
      object CheckBox6: TCheckBox
        Left = 16
        Top = 16
        Width = 313
        Height = 17
        Caption = 'Lastverteilung, Postausgang mit mehreren Servern'
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 120
        Top = 77
        Width = 295
        Height = 21
        Hint = 'SQL-Filter'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'RID=NOTREQUIRED')
    DatabaseName = '192.168.115.6:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select '
      ' * '
      'from '
      ' EMAIL'
      'order by '
      ' RID descending'
      'for '
      ' update')
    ColorScheme = True
    OrderingItems.Strings = (
      'RID=RID;RID DESC'
      'GESENDET=GESENDET;GESENDET DESC'
      'AUSGANG=AUSGANG;AUSGANG DESC'
      'PERSON_R=PERSON_R;PERSON_R DESC'
      'SENDER_R=SENDER_R;SENDER_R DESC'
      'EREIGNIS_R=EREIGNIS_R;EREIGNIS_R DESC'
      'TICKET_R=TICKET_R;TICKET_R DESC'
      'VORLAGE_R=VORLAGE_R;VORLAGE_R DESC'
      'UID=UID;UID DESC'
      'VERSUCHE=VERSUCHE;VERSUCHE DESC')
    OrderingLinks.Strings = (
      'RID=ITEM=1'
      'GESENDET=ITEM=2'
      'AUSGANG=ITEM=3'
      'PERSON_R=ITEM=4'
      'SENDER_R=ITEM=5'
      'EREIGNIS_R=ITEM=6'
      'TICKET_R=ITEM=7'
      'VORLAGE_R=ITEM=8'
      'UID=ITEM=9'
      'VERSUCHE=ITEM=10')
    RequestLive = True
    Left = 30
    Top = 61
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 118
    Top = 61
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'CSV'
    Filter = 'Semikolon seperierte Textdatei (*.csv)|*.csv'
    Left = 32
    Top = 113
  end
  object Timer1: TTimer
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 120
    Top = 113
  end
end

{
  |������___                  __  __
  |�����/ _ \ _ __ __ _  __ _|  \/  | ___  _ __
  |����| | | | '__/ _` |/ _` | |\/| |/ _ \| '_ \
  |����| |_| | | | (_| | (_| | |  | | (_) | | | |
  |�����\___/|_|  \__, |\__,_|_|  |_|\___/|_| |_|
  |���������������|___/
  |
  |    Copyright (C) 2015 - 2016  Andreas Filsinger
  |
  |    This program is free software: you can redistribute it and/or modify
  |    it under the terms of the GNU General Public License as published by
  |    the Free Software Foundation, either version 3 of the License, or
  |    (at your option) any later version.
  |
  |    This program is distributed in the hope that it will be useful,
  |    but WITHOUT ANY WARRANTY; without even the implied warranty of
  |    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  |    GNU General Public License for more details.
  |
  |    You should have received a copy of the GNU General Public License
  |    along with this program.  If not, see <http://www.gnu.org/licenses/>.
  |
  |    http://orgamon.org/
  |
}
unit FotoExec;

interface

uses
  // System
  classes, inifiles, SysUtils,
  math, jpeg, CCR.Exif,

  // Tools
  anfix32, WordIndex, binlager32,
  Foto, InfoZip,

  // OrgaMon
  globals,
  JonDaExec;

const

  // Warte Zeiten [min]
  cKikstart_delay = 10;
  cAnzahlStellen_Transaktionszaehler = 5;
  cAnzahlStellen_FotosTagwerk = 4;

  // File Names
  cFotoTransaktionenFName = 'FotoService-Transaktionen.log.txt';
  cFotoAblageFName = 'FotoService-Ablage-%s.log.txt';

  // Bild-Namenskonvention
  //
  // GeraeteID "-" RID "-" BildProtokollName[ "-" N ].jpg
  // "-" N wird nur angef�gt sobald auf dem Smartphone eine Bildnamensgleichheit
  // erkannt wird.
  //

type
  TFotoExec = class(TObject)
  public
    tBAUSTELLE: tsTable;
    JonDaExec: TJonDaExec;
    LastLogWasTimeStamp: boolean; // Protect TimeStamp Flood
    ZaehlerNummerNeuXlsCsv_Vorhanden: boolean;

    // Ini-Sachen
    // Einstiegs-Pfade
    cWorkPath: string; // 'W:\'
    cBackUpPath: string; // 'I:\KundenDaten\SEWA\'
    cWebPath: string; // 'W:\status\'

    // Unterverzeichnisse
    cLocation_MOB: string; // 'orgamon-mob\'
    cLocation_JonDaServer: string; // 'JonDaServer\'
    cLocation_Unverarbeitet: string; // 'unverarbeitet\'
    cLocation_Manuell: string; // 'manuell\'

    // Verzeichnisse
    function MyWorkingPath: string;
    function MobUploadPath: string;

    // Dateinamen
    function AblageFname: string;

    // Init, Deinit
    procedure ensureGlobals;
    procedure releaseGlobals;
    procedure readIni;

    // Work
    function GEN_ID: integer;
    procedure workEingang(sParameter: TStringList = nil);
    procedure workWartend(sParameter: TStringList = nil);
    procedure workAblage(sParameter: TStringList = nil);

    procedure workStatus;

    // muss IMMER �berladen werden
    procedure Log(s: string); virtual; abstract;

    // Implementierungen von JonDaExec - Prototypen
    function ZaehlerNummerNeu(AUFTRAG_R: integer; GeraeteNo: string): string;
    procedure invalidateZaehlerNummerNeuCache;
  end;

implementation

const
  _GeraeteNo: string = '';
  EINGABE: tsTable = nil;

procedure TFotoExec.invalidateZaehlerNummerNeuCache;
begin
  _GeraeteNo := '';
end;

function TFotoExec.ZaehlerNummerNeu(AUFTRAG_R: integer; GeraeteNo: string): string;
var
  FName: string;
  r: integer;
begin

  // Datenspeicher laden
  if (GeraeteNo <> _GeraeteNo) then
  begin
    if not(assigned(EINGABE)) then
      EINGABE := tsTable.Create
    else
      EINGABE.Clear;
    FName := MyProgramPath + cStatistikPath + 'Eingabe.' + GeraeteNo + '.txt';
    if FileExists(FName) then
      FileAlive(FName);
    EINGABE.insertfromFile(FName, cHeader_Eingabe);
    _GeraeteNo := GeraeteNo;
  end;

  // RID suchen
  r := EINGABE.locate('RID', InttoStr(AUFTRAG_R));
  if (r <> -1) then
    result := EINGABE.readCell(r, 'ZAEHLER_NUMMER_NEU')
  else
    result := '';

end;

procedure TFotoExec.ensureGlobals;
var
  r: integer;
begin
  if not(assigned(tBAUSTELLE)) then
  begin

    //
    JonDaExec := TJonDaExec.Create;
    JonDaExec.callback_ZaehlerNummerNeu := ZaehlerNummerNeu;

    // die aktuellen Daten aus dem FTP-Bereich abholen
    JonDaExec.doSync;

    // Initialer Lauf
    tBAUSTELLE := tsTable.Create;
    tBAUSTELLE.insertfromFile(MyWorkingPath + cMonDaServer_Baustelle);
    if FileExists(MyWorkingPath + cMonDaServer_Baustelle_manuell) then
    begin
      with tBAUSTELLE do
      begin
        insertfromFile(MyWorkingPath + cMonDaServer_Baustelle_manuell);
        for r := RowCount downto 1 do
          if (length(readCell(r, cE_FTPUSER)) < 3) then
            del(r);
        SaveToFile(MyWorkingPath + 'baustelle-alle.csv');
      end;
    end;

    // Datei der Wartenden sicherstellen, Header anlegen
    if not(FileExists(MyWorkingPath + cFotoUmbenennungAusstehend)) then
      AppendStringsToFile(
        { } cHeader_UmbenennungUnvollstaendig,
        { } MyWorkingPath + cFotoUmbenennungAusstehend);

    // TimeStamp in die Logdatei legen
    if not(LastLogWasTimeStamp) then
    begin
      AppendStringsToFile(
        { } 'timestamp ' + sTimeStamp,
        { } MyWorkingPath + cFotoTransaktionenFName);
      LastLogWasTimeStamp := true;
    end;
  end;

end;

procedure TFotoExec.readIni;
var
  MyIni: TIniFile;
  SectionName: string;
begin

  // Wir brauchen FTP-Zugangsdaten wegen des Sync
  MyIni := TIniFile.Create(MyProgramPath + cIniFNameConsole);
  with MyIni do
  begin
    SectionName := getParam('Id');
    if (SectionName = '') then
      SectionName := UserName;
    if (ReadString(SectionName, 'ftpuser', '') = '') then
      SectionName := 'System';

    // Ftp-Bereich f�r diesen Server
    iJonDa_FTPHost := ReadString(SectionName, 'ftphost', 'gateway');
    iJonDa_FTPUserName := ReadString(SectionName, 'ftpuser', '');
    iJonDa_FTPPassword := ReadString(SectionName, 'ftppwd', '');

    // die ganzen Pfade
    cWorkPath := ReadString(SectionName, 'WorkPath', 'W:\');
    cBackUpPath := ReadString(SectionName, 'BackUpPath', 'I:\KundenDaten\SEWA\');
    cWebPath := ReadString(SectionName, 'WebPath', 'W:\status\');

    // Unterverzeichnisse
    cLocation_MOB := ReadString(SectionName, 'Location_MOB', 'orgamon-mob\');
    cLocation_JonDaServer := ReadString(SectionName, 'Location_JonDaServer', 'JonDaServer\');
    cLocation_Unverarbeitet := ReadString(SectionName, 'Location_Unverarbeitet', 'unverarbeitet\');
    cLocation_Manuell := ReadString(SectionName, 'Location_Manuell', 'manuell\');

  end;
  MyIni.Free;

end;

procedure TFotoExec.releaseGlobals;
begin
  if assigned(tBAUSTELLE) then
  begin
    try
      FreeAndNil(tBAUSTELLE);
      FreeAndNil(JonDaExec);
    except
      ;
    end;
  end;
end;

function TFotoExec.MobUploadPath: string;
begin
  result := cWorkPath + cLocation_MOB;
end;

function TFotoExec.MyWorkingPath: string;
begin
  result := MyProgramPath + 'Fotos\';
end;

function TFotoExec.GEN_ID: integer;
var
  mIni: TIniFile;
  i: int64;
begin
  mIni := TIniFile.Create(MobUploadPath + 'Backup-Service.ini');
  with mIni do
  begin
    result := StrToInt(ReadString('System', 'Sequence', '0'));
    inc(result);
    if (result >= round(power(10, cAnzahlStellen_Transaktionszaehler))) then
      result := 1;
    WriteString('System', 'Sequence', InttoStr(result));
  end;
  mIni.Free;
end;

procedure TFotoExec.workEingang(sParameter: TStringList = nil);
var
  sFiles: TStringList;
  IgnoreIt: boolean;
  // �berspringen weil zu neu?!
  sFilesClientSorter: TStringList;
  sTemp: TStringList;
  n, m, i, f: integer;
  FileTimeStamp: TDateTime;
  d, File_Date: TANFiXDate;
  s, File_Seconds: TANFiXTime;
  FName: string;
  ID: string;
  RID: integer;
  bOrgaMon, bOrgaMonOld: TBLager;
  mderecOrgaMon: TMDERec;
  FotoMussWarten: boolean;
  FotoPrefix: string;
  FotoGeraeteNo: string;
  FotoParameter: string;
  // FA, Ausbau, FN, Anlage usw.
  FotoDateiName, FotoDateiNameVerfuegbar: string;
  // Kompletter Dateiname
  FotoZiel: string;
  FotoHost: string;

  FullSuccess: boolean;
  FoundAuftrag: boolean;
  UmbenennungAbgeschlossen: boolean;
  Image: TJPEGImage;
  sBaustelle: string;
  sZiel: string;

  BAUSTELLE_Index: integer;
  ZAEHLER_NUMMER_NEU: string;

  // alternativer Auftragspool
  fOrgaMonAuftrag: file of TMDERec;
  iEXIF: TExifData;
  AufnahmeMoment: TDateTime;

  // Foto - Umbenennung
  sFotoCall: TStringList;
  sFotoResult: TStringList;
  RenameError: boolean;

  // Parameter
  pAll: boolean;

  procedure unverarbeitet(m: integer);
  begin

    // Datei wegsperren, aber nicht l�schen!
    FileMove(
      { } MobUploadPath + sFiles[m],
      { } MobUploadPath + cLocation_Unverarbeitet + ID + '+' + sFiles[m]);

    // Datei aus der Verarbeitungskette entfernen
    sFiles.Delete(m);
  end;

begin
  if assigned(sParameter) then
  begin
    pAll := sParameter.Values['ALL'] <> cIni_Deactivate;
  end
  else
  begin
    pAll := true;
  end;

  // Init Phase
  sFiles := TStringList.Create;
  sFilesClientSorter := TStringList.Create;
  ID := '';

  // get File List
  dir(MobUploadPath + '*.jpg', sFiles, false);

  // reduce to Files-Age > 5 Seconds
  d := DateGet;
  s := SecondsGet;
  for n := pred(sFiles.count) downto 0 do
  begin
    FName := MobUploadPath + sFiles[n];
    FileAge(FName, FileTimeStamp);
    File_Date := DateTime2long(FileTimeStamp);
    File_Seconds := cIllegalSeconds;

    IgnoreIt := true;
    repeat

      if not(DateOK(File_Date)) then
      begin
        Log('Wrong Filedate ' + FName + ' ...');
        break;
      end;

      File_Seconds := dateTime2Seconds(FileTimeStamp);
      if SecondsDiff(d, s, File_Date, File_Seconds) < 4 then
      begin
        Log('Skip new ' + FName + ' ...');
      end;

      IgnoreIt := false;

    until true;
    if not(IgnoreIt) then
      sFilesClientSorter.AddObject(
        { } long2dateLog(File_Date) + '|' +
        { } secondstostr(File_Seconds) + '|' +
        { } sFiles[n], TObject(n));

  end;

  // Sort Files by "Date / Time", Oldest topmost
  sFilesClientSorter.sort;
  sTemp := TStringList.Create;
  for n := 0 to pred(sFilesClientSorter.count) do
    sTemp.add(sFiles[integer(sFilesClientSorter.Objects[n])]);
  sFiles.Assign(sTemp);
  sTemp.Free;

  // Reduce Work to Only One!
  if not(pAll) then
    for n := pred(sFiles.count) downto 1 do
      sFiles.Delete(n);

  // Generate Work-TAN
  if (sFiles.count > 0) then
    ID := inttostrN(GEN_ID, cAnzahlStellen_Transaktionszaehler);

  // make backup of all new Files
  for n := 0 to pred(sFiles.count) do
    if not(FileCopy(MobUploadPath + sFiles[n], cBackUpPath + cLocation_MOB + ID + '-' + sFiles[n])) then
    begin
      Log('ERROR: ' + 'can not write to ' + cBackUpPath + cLocation_MOB);
      Log('FATAL');
      exit;
    end;

  // reduce to valid jpg's
  for n := pred(sFiles.count) downto 0 do
  begin
    FullSuccess := false;
    FName := MobUploadPath + sFiles[n];
    Image := TJPEGImage.Create;
    iEXIF := TExifData.Create;
    try
      repeat

        // Load it
        Image.LoadFromFile(FName);

        // Delphi Bug, can not read jpeg compression!
        (*
          if (image.CompressionQuality>0) then
          begin
          Log('INFO: jpeg quality '+inttostr(image.CompressionQuality));
          end;
        *)

        if (Image.Width < 640) then
        begin
          Log('ERROR: ' + sFiles[n] + ': Breite kleiner als 640');
          break;
        end;

        if (Image.Height < 480) then
        begin
          Log('ERROR: ' + sFiles[n] + ': H�he kleiner als 480');
          break;
        end;

        // get Foto-Moment, touch File-Date-Time
        if not(iEXIF.LoadFromJPEG(FName)) then
        begin
          Log('ERROR: ' + sFiles[n] + ': EXiF konnte nicht geladen werden');
          break;
        end;

        if (iEXIF.DateTimeOriginal <> FileDateTime(FName)) then
        begin
          FileTouch(FName, iEXIF.DateTimeOriginal);
          Log('INFO: ' + sFiles[n] + ': Dateizeitstempel korrigiert');
        end;
        FullSuccess := true;

      until true;

    except
      on e: Exception do
      begin
        Log('ERROR: ' + sFiles[n] + ': ' + e.Message);
      end;
    end;
    Image.Free;
    iEXIF.Free;

    if not(FullSuccess) then
      unverarbeitet(n);
  end;

  if (sFiles.count > 0) then
  begin

    ensureGlobals;

    bOrgaMon := TBLager.Create;
    bOrgaMon.Init(MyWorkingPath + 'AUFTRAG+TS', mderecOrgaMon, sizeof(TMDERec));
    bOrgaMon.BeginTransaction(now);

    if FileExists(MyWorkingPath + '_AUFTRAG+TS' + cBL_FileExtension) then
    begin
      bOrgaMonOld := TBLager.Create;
      bOrgaMonOld.Init(MyWorkingPath + '_AUFTRAG+TS', mderecOrgaMon, sizeof(TMDERec));
      bOrgaMonOld.BeginTransaction(now);
    end
    else
    begin
      bOrgaMonOld := nil;
    end;

    sFiles.sort;

    // Umbenennen nach dem Standard der jeweiligen Baustelle
    for m := pred(sFiles.count) downto 0 do
    begin
      RenameError := false;
      FullSuccess := false;
      FoundAuftrag := false;
      UmbenennungAbgeschlossen := false;
      BAUSTELLE_Index := -1;

      // Parameter aus der Bilddatei berechnen
      FotoGeraeteNo := nextp(sFiles[m], '-', 0);
      RID := StrToIntDef(nextp(sFiles[m], '-', 1), -1);
      FotoParameter := nextp(nextp(sFiles[m], '-', 2), '.', 0);
      sBaustelle := '';
      sZiel := '';

      // passenden Auftrag suchen
      while true do
      begin

        if (RID < 1) then
        begin
          Log('ERROR: ' + sFiles[m] + ': RID konnte nicht ermittelt werden!');
          break;
        end;

        // Im OrgaMon Record-Store
        if bOrgaMon.exist(RID) then
        begin
          bOrgaMon.get;
          FoundAuftrag := true;
          break;
        end;

        Log('WARNUNG: ' + sFiles[m] + ': RID in ' + bOrgaMon.FileName + ' nicht vorhanden!');

        // In der Alternative suchen
        if (assigned(bOrgaMonOld)) then
        begin
          if bOrgaMonOld.exist(RID) then
          begin
            bOrgaMonOld.get;
            FoundAuftrag := true;
            break;
          end;

          Log('WARNUNG: ' + sFiles[m] + ': RID in ' + bOrgaMonOld.FileName + ' nicht vorhanden!');
        end;

        // Im aktuellen Auftrag des Monteurs
        assignFile(fOrgaMonAuftrag, MyProgramPath + cServerDataPath + FotoGeraeteNo + cDATExtension);
        try
          reset(fOrgaMonAuftrag);
        except
          on e: Exception do
            Log('ERROR: 519: ' + sFiles[m] + ':' + e.Message);
        end;

        for f := 1 to FileSize(fOrgaMonAuftrag) do
        begin

          read(fOrgaMonAuftrag, mderecOrgaMon);
          if (RID = mderecOrgaMon.RID) then
          begin
            FoundAuftrag := true;
            break;
          end;
        end;
        CloseFile(fOrgaMonAuftrag);
        if FoundAuftrag then
          break;
        Log('ERROR: ' + sFiles[m] + ': RID ' + InttoStr(RID) + ' konnte nicht gefunden werden!');
        break;
      end;

      if FoundAuftrag then
      begin

        sBaustelle := Oem2utf8(mderecOrgaMon.Baustelle);
        while true do
        begin

          BAUSTELLE_Index := tBAUSTELLE.locate(0, sBaustelle);
          if (BAUSTELLE_Index > -1) then
          begin

            // Modus der Fotobenennung ermitteln
            FotoMussWarten := false;

            sFotoCall := TStringList.Create;

            with mderecOrgaMon do
            begin
              // Belegung der Foto-Parameter
              sFotoCall.Values[cParameter_foto_Modus] := tBAUSTELLE.readCell(BAUSTELLE_Index, cE_FotoBenennung);
              sFotoCall.Values[cParameter_foto_parameter] := FotoParameter;
              // bisheriger Bildparameter
              sFotoCall.Values[cParameter_foto_baustelle] := sBaustelle;
              sFotoCall.Values[cParameter_foto_strasse] := Oem2asci(Zaehler_Strasse);
              sFotoCall.Values[cParameter_foto_ort] := Oem2asci(Zaehler_Ort);
              sFotoCall.Values[cParameter_foto_zaehler_info] := Zaehler_Info;
              sFotoCall.Values[cParameter_foto_RID] := InttoStr(RID);

              sFotoCall.Values[cParameter_foto_ART] := art;
              sFotoCall.Values[cParameter_foto_zaehlernummer_alt] := zaehlernummer_alt;
              sFotoCall.Values[cParameter_foto_zaehlernummer_neu] := zaehlernummer_neu;
              sFotoCall.Values[cParameter_foto_geraet] := FotoGeraeteNo;
              sFotoCall.Values[cParameter_foto_Pfad] := MyProgramPath + cDBPath;
              sFotoCall.Values[cParameter_foto_Datei] := MobUploadPath + sFiles[m];
              sFotoCall.Values[cParameter_foto_ABNummer] := ABNummer;
            end;
            sFotoResult := JonDaExec.Foto(sFotoCall);
            sFotoCall.Free;

            // Ergebnis auswerten
            FotoDateiName := sFotoResult.Values[cParameter_foto_neu];
            UmbenennungAbgeschlossen := (sFotoResult.Values[cParameter_foto_fertig] = JonDaExec.active(true));
            sZiel := sFotoResult.Values[cParameter_foto_Ziel];

            if (sFotoResult.Values[cParameter_foto_Fehler] <> '') then
            begin
              RenameError := true;
              Log('ERROR: ' + sFotoResult.Values[cParameter_foto_Fehler]);
            end;

            sFotoResult.Free;

            if (sBaustelle <> sZiel) then
              BAUSTELLE_Index := tBAUSTELLE.locate(0, sZiel);

          end;

          //
          if (BAUSTELLE_Index <= -1) then
          begin
            Log('ERROR: ' + sFiles[m] + ': Baustelle "' + sBaustelle + '" unbekannt!');
          end;

          break;
        end;

        //
        if (BAUSTELLE_Index > -1) and not(RenameError) then
        begin
          FotoZiel := tBAUSTELLE.readCell(BAUSTELLE_Index, cE_FTPUSER);
          FotoHost := tBAUSTELLE.readCell(BAUSTELLE_Index, cE_FTPHOST);
          repeat

            if (length(FotoZiel) < 3) then
            begin
              Log('ERROR: ' + sFiles[m] + ': ' + sBaustelle + ': Keine Internet-Ablage definiert');
              break;
            end;

            // Workaround, Linux User mit Ziffer am Anfang geht nicht
            if (FotoZiel[1] = 'u') and CharInSet(FotoZiel[2], ['0' .. '9']) then
              FotoZiel := copy(FotoZiel, 2, MaxInt);

            // Fotoziel ist der Name der Internet-Ablage nicht der
            // des SAP Verzeichnisses
            FotoZiel := nextp(FotoZiel, '\', 0);

            if not(DirExists(cWorkPath + FotoZiel)) then
            begin
              Log('ERROR: ' + sFiles[m] + ': ' + sBaustelle + ': Internet-Ablage "' + FotoZiel +
                '": Das Verzeichnis existiert nicht');
              break;
            end;

            // freien Ziel-Dateinamen finden:
            FotoDateiNameVerfuegbar := FotoDateiName;
            i := 1;
            repeat
              if not(FileExists(cWorkPath + FotoZiel + '\' + FotoDateiNameVerfuegbar)) then
                break;
              if (i = 1) then
                FotoDateiNameVerfuegbar := copy(FotoDateiNameVerfuegbar, 1, revpos('.', FotoDateiNameVerfuegbar) - 1) +
                  '-' + InttoStr(i) + '.jpg'
              else
                FotoDateiNameVerfuegbar := copy(FotoDateiNameVerfuegbar, 1, revpos('-', FotoDateiNameVerfuegbar) - 1) +
                  '-' + InttoStr(i) + '.jpg';
              inc(i);
            until false;

            // Ist der Dateiname schon belegt, wird ggf. Platz geschaffen.
            // Der hereinkommende Name hat Vorrang vor den bisher
            // unter diesem Namen bereitgestellten Bildern.
            // Aber nur wenn die hereinkommende Datei j�nger ist
            // als das aktuelle Bild
            if (FotoDateiName <> FotoDateiNameVerfuegbar) then
            begin
              if (
                { } FotoAufnahmeMoment(MobUploadPath + sFiles[m])
                { } >=
                { } FotoAufnahmeMoment(cWorkPath + FotoZiel + '\' + FotoDateiName)) then
              begin
                if not(FileRename(
                  { } cWorkPath + FotoZiel + '\' + FotoDateiName,
                  { } cWorkPath + FotoZiel + '\' + FotoDateiNameVerfuegbar)) then
                begin
                  Log('ERROR: ' + sFiles[m] + ': Platz schaffen nicht erfolgreich');
                  break;
                end;
              end
              else
              begin
                Log('INFO: ' + sFiles[m] + ': Veraltetes Bild, behalte Neueres');
                FotoDateiName := FotoDateiNameVerfuegbar;
              end;
            end;

            // Transaktion archivieren
            AppendStringsToFile(
              { } 'cp ' + sFiles[m] +
              { } ' ' + FotoZiel + '\' +
              { } FotoDateiName, MyWorkingPath + cFotoTransaktionenFName);
            LastLogWasTimeStamp := false;

            // Auszeichnen, wenn die Umbenennung vorl�ufig ist
            if not(UmbenennungAbgeschlossen) then
              AppendStringsToFile(
                { DATEINAME_ORIGINAL } sFiles[m] + ';' +
                { DATEINAME_AKTUELL } FotoZiel + '\' + FotoDateiName + ';' +
                { RID } InttoStr(RID) + ';' +
                { GERAETENO } FotoGeraeteNo + ';' +
                { BAUSTELLE } ';' +
                { MOMENT } DatumLog,
                { Dateiname } MyWorkingPath + cFotoUmbenennungAusstehend);

            // Foto in die richtige Ablage kopieren!
            if not(FileCopy(
              { } MobUploadPath + sFiles[m],
              { } cWorkPath + FotoZiel + '\' + FotoDateiName)) then
            begin
              Log('ERROR: {' + sFiles[m] + ': Kopieren nicht erfolgreich');
              Log('Quelle war: "' + MobUploadPath + sFiles[m] + '"');
              Log('Ziel war: "' + cWorkPath + FotoZiel + '\' + FotoDateiName + '" }');
              break;
            end;

            FullSuccess := true;

          until true;
        end;

      end;

      if not(FullSuccess) then
        unverarbeitet(m);

    end; // for m

    bOrgaMon.EndTransaction;
    bOrgaMon.Free;

    if assigned(bOrgaMonOld) then
    begin
      bOrgaMonOld.EndTransaction;
      bOrgaMonOld.Free;
    end;

    // Bilder jetzt einfach sichern
    if (sFiles.count > 0) then
    begin
      (*
        if (zip(
        { } sFiles,
        { } MobUploadPath + ID + '-Bilder.zip',
        { } infozip_RootPath + '=' + MobUploadPath) = sFiles.count) then
        begin
        Log(ID);
        for n := 0 to pred(sFiles.count) do
        if not(FileDelete(MobUploadPath + sFiles[n])) then
        begin
        Log('ERROR: ' + 'can not delete ' + sFiles[n]);
        Timer1.Enabled := false;
        exit;
        end;
        end
        else
        begin
        Log('ERROR: Fehler beim Anlegen der ZIP-Datei!');
        end;
      *)

      Log(ID);
      for n := 0 to pred(sFiles.count) do
        if not(FileDelete(MobUploadPath + sFiles[n])) then
        begin
          Log('ERROR: ' + sFiles[n] + ': Nicht l�schbar');
          Log('FATAL');
          exit;
        end;

    end;
  end;

  sFiles.Free;
  sFilesClientSorter.Free;
end;

procedure TFotoExec.workWartend(sParameter: TStringList = nil);
var
  WARTEND: tsTable;
  Stat_Anfangsbestand: integer;
  Stat_NachtragBaustelle: integer;
  MomentTimeout: TANFiXDate;
  CSV: tsTable;
  r, i, k, ro, c: integer;
  ZAEHLER_NUMMER_NEU: string;
  FNameAlt, FNameNeu, FPath: string;
  RID: integer;
  sBaustelle: string;
  BAUSTELLE_Index: integer;

  // Baustellen-Ermittlung
  bOrgaMon: TBLager;
  mderecOrgaMon: TMDERec;
  FotoBenennungsModus: integer;

  // Foto Benennungs Funktion
  sFotoCall, rFoto: TStringList;

  // senden einf�rben
  tSENDEN: tsTable;

  // Parameter
  pAll: boolean;

begin

  // Init
  ensureGlobals;
  invalidateZaehlerNummerNeuCache;

  Stat_NachtragBaustelle := 0;
  CSV := nil;
  WARTEND := tsTable.Create;
  with WARTEND do
  begin

    // load+sort
    insertfromFile(MyWorkingPath + cFotoUmbenennungAusstehend);
    Stat_Anfangsbestand := RowCount;
    SortBy('GERAETENO;MOMENT;DATEINAME_AKTUELL');
    if Changed then
      Log('INFO: Frisch sortiert');

    // sicherstellen der Spalte
    addCol('BAUSTELLE');
    addCol('MOMENT');

    // all zu alte Eintr�ge l�schen
    MomentTimeout := DatePlus(DateGet, -10);
    i := 0;
    c := colof('MOMENT');
    for r := RowCount downto 1 do
      if (StrToIntDef(readCell(r, c), 0) < MomentTimeout) then
      begin
        del(r);
        inc(i);
      end;
    if (i > 0) then
      Log('INFO: ' + 'gebe ' + InttoStr(i) + ' Dateieintr�ge frei, da sie �lter als 10 Tage sind');

  end;

  bOrgaMon := TBLager.Create;
  bOrgaMon.Init(MyWorkingPath + 'AUFTRAG+TS', mderecOrgaMon, sizeof(TMDERec));
  bOrgaMon.BeginTransaction(now);

  for r := WARTEND.RowCount downto 1 do
  begin

    RID := StrToIntDef(WARTEND.readCell(r, 'RID'), 0);
    ZAEHLER_NUMMER_NEU := '';

    // Nachtrag der Baustellen-Info
    sBaustelle := WARTEND.readCell(r, 'BAUSTELLE');
    if (sBaustelle = '') then
      if bOrgaMon.exist(RID) then
      begin
        bOrgaMon.get;
        sBaustelle := Oem2utf8(mderecOrgaMon.Baustelle);
        WARTEND.writeCell(r, 'BAUSTELLE', sBaustelle);
        inc(Stat_NachtragBaustelle);
      end;

    // Ist bei dieser Baustelle eine Umbenennung �berhaupt erw�nscht?
    if (sBaustelle <> '') then
    begin
      BAUSTELLE_Index := tBAUSTELLE.locate(0, sBaustelle);
      if (BAUSTELLE_Index > -1) then
      begin
        FotoBenennungsModus := StrToIntDef(
          { } tBAUSTELLE.readCell(
          { } BAUSTELLE_Index,
          { } cE_FotoBenennung), 0);

        // Ist �berhaupt eine Umbenennung n�tig?
        if (FotoBenennungsModus = 7) then
          ZAEHLER_NUMMER_NEU := 'Neu';

      end;
    end;

    // Umbenennungsversuch �ber die Monteurs-Eingabe
    if (ZAEHLER_NUMMER_NEU = '') then
      ZAEHLER_NUMMER_NEU :=
      { } ZaehlerNummerNeu(
        { } RID,
        { } WARTEND.readCell(r, 'GERAETENO'));

    // Zuschaltbare Alternative: den Inhalt einer CSV pr�fen
    if (ZAEHLER_NUMMER_NEU = '') then
      if ZaehlerNummerNeuXlsCsv_Vorhanden then
      begin
        if not(assigned(CSV)) then
        begin
          CSV := tsTable.Create;
          CSV.insertfromFile(MyWorkingPath + 'ZaehlerNummerNeu.xls.csv');
        end;
        ro := CSV.locate('ReferenzIdentitaet', InttoStr(RID));
        if (ro <> -1) then
          ZAEHLER_NUMMER_NEU := CSV.readCell(ro, 'ZaehlerNummerNeu');
      end;

    // kein Ergebnis -> keine Aktion
    if (ZAEHLER_NUMMER_NEU = '') then
      continue;

    // Umbenennung starten
    FNameAlt := WARTEND.readCell(r, 'DATEINAME_AKTUELL');
    FPath := nextp(FNameAlt, '\', 0) + '\';

    if not(FileExists(cWorkPath + FNameAlt)) then
    begin
      Log('INFO: ' + 'gebe Dateieintrag "' + FNameAlt + '" frei, da verschwunden, oder bereits umbenannt');
      WARTEND.del(r);
      continue;
    end;

    FNameNeu := FNameAlt;
    k := pos('-Neu', FNameNeu);
    if (k = 0) then
    begin
      Log('ERROR: ' + 'keine Ahnung wie man "' + FNameNeu + '" umbenennen soll');
      continue;
    end;

    // imp pend: Immer (nicht nur bei Modus=6) sollte die Dateinamensfindung
    // �ber die Standard-Umbenennungs-Funktion "foto" erfolgen
    // ev. mit einem "nil" Callback f�r die Z# Neu, oder einem
    // der die Monteurseingaben ber�cksichtigen kann.

    if (FotoBenennungsModus = 6) then
    begin

      // prepare
      sFotoCall := TStringList.Create;
      with sFotoCall do
      begin
        Values[cParameter_foto_RID] := InttoStr(RID);
        Values[cParameter_foto_Modus] := InttoStr(FotoBenennungsModus);
        Values[cParameter_foto_baustelle] := sBaustelle;
        Values[cParameter_foto_parameter] := 'FN';

        // D A N G E R   imp pend
        // was soll der Schei�, hier wird schlimm rumkopiert
        // Zielf�hrender w�r eine verarbeitung aus "cParameter_foto_Datei"
        // also wenn es einfach nur darum geht aus "-Neu" "-~Z#Neu~" zu machen!
        Values[cParameter_foto_zaehlernummer_alt] := copy(FNameNeu, 1, pred(k));

        Values[cParameter_foto_zaehlernummer_neu] := ZAEHLER_NUMMER_NEU;
        Values[cParameter_foto_Datei] := cWorkPath + FNameAlt;
        Values[cParameter_foto_Pfad] := MyProgramPath + cDBPath;
      end;

      // set default result (ERROR RESULT)
      FNameNeu := '';

      // execute
      rFoto := JonDaExec.Foto(sFotoCall);
      sFotoCall.Free;
      with rFoto do
      begin
        repeat

          if (Values[cParameter_foto_Fehler] <> '') then
          begin
            Log(Values[cParameter_foto_Fehler]);
            break;
          end;

          if (Values[cParameter_foto_fertig] = cINI_ACTIVATE) then
          begin
            FNameNeu := rFoto.Values[cParameter_foto_neu];
            if (pos('\', FNameNeu) = 0) then
              FNameNeu := FPath + FNameNeu;
          end;

        until true;
      end;
      rFoto.Free;

    end
    else
    begin
      FNameNeu :=
      { } copy(FNameNeu, 1, k) +
      { } TJonDaExec.FormatZaehlerNummerNeu(ZAEHLER_NUMMER_NEU) +
      { } '.jpg';
    end;

    // nichts machen in diesem Fall
    if (FNameNeu = '') then
      continue;

    // Pfad ging irgendwie verloren
    if (CharCount('\', FNameNeu) <> 1) then
    begin
      Log('ERROR: Umbenennung zu "' + FNameNeu + '" ist ung�ltig. Pfadangabe "' + FPath + '" fehlt');
      continue;
    end;

    if (FNameNeu = FNameAlt) then
    begin
      // ohne Umbenennung (also es stimmt bereits!) einfach nur den Eintrag l�schen!
      WARTEND.del(r);
    end
    else
    begin

      // freien Ziel-Dateinamen finden:
      i := 1;
      repeat
        if not(FileExists(cWorkPath + FNameNeu)) then
          break;
        if (i = 1) then
          FNameNeu := copy(FNameNeu, 1, revpos('.', FNameNeu) - 1) + '-' + InttoStr(i) + '.jpg'
        else
          FNameNeu := copy(FNameNeu, 1, revpos('-', FNameNeu) - 1) + '-' + InttoStr(i) + '.jpg';
        inc(i);
      until false;

      if FileMove(cWorkPath + FNameAlt, cWorkPath + FNameNeu) then
      begin
        AppendStringsToFile(
          { } 'mv ' + FNameAlt +
          { } ' ' + FNameNeu,
          { } MyWorkingPath + cFotoTransaktionenFName);
        LastLogWasTimeStamp := false;

        WARTEND.del(r);
      end;
    end;
  end;

  bOrgaMon.EndTransaction;
  bOrgaMon.Free;

  if WARTEND.Changed then
  begin

    // recreate senden.html
    tSENDEN := tsTable.Create;
    with tSENDEN do
    begin
      insertfromFile(MyProgramPath + cDBPath + 'SENDEN.csv');
      i := addCol('PAPERCOLOR');
      k := WARTEND.colof('GERAETENO');
      c := colof('ID');
      for r := 1 to RowCount do
        if (WARTEND.locate(k, readCell(r, c)) <> -1) then
          writeCell(r, i, '#FF9900');
      SaveToHTML(MyProgramPath + cStatistikPath + 'senden.html');
    end;
    tSENDEN.Free;

    // save WARTEND / save as html
    WARTEND.SaveToHTML(MyProgramPath + cStatistikPath + '-neu.html');
    WARTEND.SaveToFile(MyWorkingPath + cFotoUmbenennungAusstehend);

    // LOG
    if (Stat_Anfangsbestand - WARTEND.RowCount > 0) then
      Log('INFO: ' +
        { } InttoStr(Stat_Anfangsbestand - WARTEND.RowCount) +
        { } ' "-Neu" Umbenennung(en) wurde(n) durchgef�hrt, ' +
        { } InttoStr(WARTEND.RowCount) +
        { } ' verbleiben');

    if (Stat_NachtragBaustelle > 0) then
      Log('INFO: ' +
        { } InttoStr(Stat_NachtragBaustelle) +
        { } ' Baustelleninfo(s) wurde(n) nachgetragen');

  end;

  WARTEND.Free;
  if assigned(CSV) then
    CSV.Free;
end;

function TFotoExec.AblageFname: string;
begin
  result := format(cFotoAblageFName, [DatumLog]);
end;

procedure TFotoExec.workAblage(sParameter: TStringList = nil);

  procedure Log(Source, Dest: string);
  begin
    AppendStringsToFile(sTimeStamp + ';' + Source + ';' + Dest, MyWorkingPath + AblageFname);
  end;

const
  cIsAblageMarkerFile = 'ampel-horizontal.gif';
  cFileTimeOutDays = 50 + 10;
  cPicTimeOutDays = 0;
  // 0 = gestern ist schon zu alt
var
  sDirs: TStringList;
  sZips: TStringList;
  sPics: TStringList;
  sFotos: TStringList;
  n, m: integer;
  sPath, sPathShort: string;
  ZIP_OlderThan: TANFiXDate;
  PIC_OlderThan: TANFiXDate;

  sBackupRoot, sDest, sDestShort: string;
  MovedToDay: int64;
  tabelleBAUSTELLE: tsTable;
  r: integer;

  FTP_Benutzer: string;
  mIni: TIniFile;
  Col_FTP_Benutzer: integer;

  // Parameter
  FotosSequence: integer;
  FotosAbzug: boolean;

  //
  WARTEND: tsTable;
  BasisDatum: TANFiXDate;

  // Parameter
  pDatum: string;
  pEinzeln: string;

  procedure serviceJPG;
  const
    cMaxZIP_Size = 100 * 1024 * 1024;
  var
    m: integer;
    Pending: boolean;
    FotoFSize: int64;
  begin
    Pending := false;
    sPics.Clear;
    repeat
      // Jpegs
      dir(sPath + '*.jpg', sPics, false);
      if (sPics.count = 0) then
        break;

      // reduziere um "zu neue" Bilder
      for m := pred(sPics.count) downto 0 do
        if (FileDate(sPath + sPics[m]) >= PIC_OlderThan) then
          sPics.Delete(m);
      if (sPics.count = 0) then
        break;

      // reduziere um "wartende" Bilder
      for m := pred(sPics.count) downto 0 do
        if (WARTEND.locate('DATEINAME_AKTUELL', sPathShort + sPics[m]) <> -1) then
          sPics.Delete(m);
      if (sPics.count = 0) then
        break;

      // reduziere auf < 100 MByte
      FotoFSize := 0;
      for m := pred(sPics.count) downto 0 do
      begin
        if (FotoFSize >= cMaxZIP_Size) then
        begin
          sPics.Delete(m);
          Pending := true;
        end
        else
        begin
          inc(FotoFSize, FSize(sPath + sPics[m]));
        end;
      end;

      // Pr�fen, ob dies eine ordentliche Baustelle ist
      FTP_Benutzer := nextp(sPath, '\', 1);
      r := tabelleBAUSTELLE.locate(Col_FTP_Benutzer, FTP_Benutzer);
      if (r = -1) then
      begin
        // 2. Suchversuch mit prefixed "u"
        if CharInSet(FTP_Benutzer[1], ['0' .. '9']) then
        begin
          FTP_Benutzer := 'u' + FTP_Benutzer;
          r := tabelleBAUSTELLE.locate(Col_FTP_Benutzer, FTP_Benutzer);
        end;
      end;

      // (immer noch) nicht gefunden?
      if (r = -1) then
      begin
        self.Log('ERROR: FTP-Benutzer "' + FTP_Benutzer + '" unbekannt');
        Pending := false;
        break;
      end;

      // Die Nummer des zu erzeugenden ZIP suchen
      FotosAbzug := false;
      mIni := TIniFile.Create(sPath + 'Fotos-nnnn.ini');
      with mIni do
      begin
        FotosSequence := StrToInt(ReadString('System', 'Sequence', '-1'));
        FotosAbzug := (ReadString('System', 'Abzug', cIni_Deactivate) = cINI_ACTIVATE);
        if FotosSequence < 0 then
        begin
          dir(sPath + 'Fotos-????.zip', sFotos, false);
          if sFotos.count > 0 then
          begin
            sFotos.sort;
            FotosSequence := StrToIntDef(ExtractSegmentBetween(sFotos[pred(sFotos.count)], 'Fotos-', '.zip'), -1);
          end;
        end;

        if FotosSequence < 0 then
          FotosSequence := 0;

        inc(FotosSequence);
      end;
      mIni.Free;

      // Archivieren in Fotos-nnnn.zip
      Log(sPath + 'Fotos-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip', '.');
      if (zip(
        { } sPics,
        { } sPath +
        { } 'Fotos-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip',
        { } infozip_RootPath + '=' + sPath + ';' +
        { } infozip_Password + '=' +
        { } deCrypt_Hex(
        { } tabelleBAUSTELLE.readCell(r, cE_ZIPPASSWORD)) + ';' +
        { } infozip_Level + '=' + '0') <> sPics.count) then
      begin
        // Problem anzeigen
        self.Log('ERROR: ' + HugeSingleLine(zMessages, '|'));
        Pending := false;
        break;
      end;

      if FotosAbzug then
      begin
        // Archivieren auch in Abzug-nnnn.zip

        for m := 0 to pred(sPics.count) do
          FotoCompress(sPath + sPics[m], sPath + sPics[m], 94, 6);

        Log(sPath + 'Abzug-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip', '.');
        if (zip(
          { } sPics,
          { } sPath +
          { } 'Abzug-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip',
          { } infozip_RootPath + '=' + sPath + ';' +
          { } infozip_Password + '=' +
          { } deCrypt_Hex(
          { } tabelleBAUSTELLE.readCell(r, cE_ZIPPASSWORD)) + ';' +
          { } infozip_Level + '=' + '0') <> sPics.count) then
        begin
          // Problem anzeigen
          self.Log('ERROR: ' + HugeSingleLine(zMessages, '|'));
          Pending := false;
          break;
        end;

      end;

      // Fotos-nnnn.ini erh�hen
      mIni := TIniFile.Create(sPath + 'Fotos-nnnn.ini');
      mIni.WriteString('System', 'Sequence', InttoStr(FotosSequence));
      mIni.Free;

      // nun die eben archivierten JPGS schlussendlich l�schen!
      for m := 0 to pred(sPics.count) do
        FileDelete(sPath + sPics[m]);

    until true;

    if Pending then
      serviceJPG;

  end;

  procedure serviceHTML;
  var
    m: integer;
  begin
    sPics.Clear;
    repeat

      // Jpegs
      dir(sPath + '*.zip.html', sPics, false);
      if (sPics.count = 0) then
        break;

      // reduziere um "zu neue" Bilder
      for m := pred(sPics.count) downto 0 do
        if (FileDate(sPath + sPics[m]) >= PIC_OlderThan) then
          sPics.Delete(m);
      if (sPics.count = 0) then
        break;

      // reduziere um "wartende" Wechselbelege, bei denen das pdf fehlt!
      for m := pred(sPics.count) downto 0 do
        if not(FileExists(sPath + sPics[m] + '.pdf')) then
          sPics.Delete(m);
      if (sPics.count = 0) then
        break;

      // .pdf muss auch mit!
      // erweitere um die .pdf Dateien
      for m := 0 to pred(sPics.count) do
        sPics.add(sPics[m] + '.pdf');

      // Pr�fen, ob dies eine ordentliche Baustelle ist
      FTP_Benutzer := nextp(sPath, '\', 1);
      if CharInSet(FTP_Benutzer[1], ['0' .. '9']) then
        FTP_Benutzer := 'u' + FTP_Benutzer;
      r := tabelleBAUSTELLE.locate(Col_FTP_Benutzer, FTP_Benutzer);
      if (r = -1) then
        break;

      // Die Nummer des zu erzeugenden ZIP suchen
      mIni := TIniFile.Create(sPath + 'Wechselbelege-nnnn.ini');
      with mIni do
      begin
        FotosSequence := StrToInt(ReadString('System', 'Sequence', '-1'));
        if FotosSequence < 0 then
        begin
          dir(sPath + 'Wechselbelege-????.zip', sFotos, false);
          if sFotos.count > 0 then
          begin
            sFotos.sort;
            FotosSequence := StrToIntDef(ExtractSegmentBetween(sFotos[pred(sFotos.count)], 'Wechselbelege-',
              '.zip'), -1);
          end;
        end;

        if FotosSequence < 0 then
          FotosSequence := 0;

        inc(FotosSequence);
      end;
      mIni.Free;

      // Archivieren
      Log(sPath + 'Wechselbelege-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip', '.');
      if (zip(
        { } sPics,
        { } sPath +
        { } 'Wechselbelege-' + inttostrN(FotosSequence, cAnzahlStellen_FotosTagwerk) + '.zip',
        { } infozip_RootPath + '=' + sPath + ';' +
        { } infozip_Password + '=' +
        { } deCrypt_Hex(
        { } tabelleBAUSTELLE.readCell(r, cE_ZIPPASSWORD)) + ';' +
        { } infozip_Level + '=' + '0') <> sPics.count) then
      begin
        // Problem anzeigen
        self.Log('ERROR: ' + HugeSingleLine(zMessages, '|'));
        break;
      end;

      // Laufnummer erh�hen
      mIni := TIniFile.Create(sPath + 'Wechselbelege-nnnn.ini');
      mIni.WriteString('System', 'Sequence', InttoStr(FotosSequence));
      mIni.Free;

      // nun die eben archivierten l�schen!
      for m := 0 to pred(sPics.count) do
        FileDelete(sPath + sPics[m]);

    until true;
  end;

begin

  if assigned(sParameter) then
  begin
    pDatum := sParameter.Values['DATUM'];
    pEinzeln := sParameter.Values['EINZELN'];
  end
  else
  begin
    pDatum := '';
    pEinzeln := '';
  end;

  // Set "Lock"
  FileAlive(MyWorkingPath + AblageFname);

  // prepare
  sDirs := TStringList.Create;
  sZips := TStringList.Create;
  sPics := TStringList.Create;
  sFotos := TStringList.Create;

  // Infos �ber Baustellen
  tabelleBAUSTELLE := tsTable.Create;
  tabelleBAUSTELLE.insertfromFile(MyWorkingPath + cMonDaServer_Baustelle);
  Col_FTP_Benutzer := tabelleBAUSTELLE.colof(cE_FTPUSER);

  // Infos �ber noch nicht umbenannte Dateien
  WARTEND := tsTable.Create;
  WARTEND.insertfromFile(MyWorkingPath + cFotoUmbenennungAusstehend);

  //
  if (pDatum = '') then
  begin
    BasisDatum := DateGet;
  end
  else
  begin
    BasisDatum := date2long(pDatum);
  end;

  // init
  MovedToDay := 0;
  ZIP_OlderThan := DatePlus(BasisDatum, -cFileTimeOutDays);
  PIC_OlderThan := DatePlus(BasisDatum, -cPicTimeOutDays);

  // Zielbestimmung Sicherungsunterverzeichnis
  sBackupRoot := cBackUpPath + cLocation_JonDaServer;
  dir(sBackupRoot + '*.', sDirs, false);
  sDirs.sort;
  for n := pred(sDirs.count) downto 0 do
    if (pos('.', sDirs[n]) = 1) then
      sDirs.Delete(n);
  sDestShort := sDirs[pred(sDirs.count)];
  sDest := sBackupRoot + sDestShort + '\';

  // work what?
  if (pEinzeln = '') then
    dir(cWorkPath + '*.', sDirs, false)
  else
  begin
    sDirs.Clear;
    sDirs.add(pEinzeln);
  end;

  // sDirs.Clear;
  // sDirs.Add('orgamon-mob');
  for n := 0 to pred(sDirs.count) do
  begin
    if (pos('.', sDirs[n]) = 1) then
      continue;
    sPathShort := sDirs[n] + '\';
    sPath := cWorkPath + sPathShort;

    if FileExists(sPath + cIsAblageMarkerFile) then
    begin

      repeat

        // Zips ablegen
        dir(sPath + '*.zip', sZips, false);
        for m := 0 to pred(sZips.count) do
        begin
          if (FileDate(sPath + sZips[m]) < ZIP_OlderThan) then
          begin
            CheckCreateDir(sDest + sDirs[n]);
            inc(MovedToDay, FSize(sPath + sZips[m]));
            Log(sPath + sZips[m], sDestShort);
            FileMove(sPath + sZips[m], sDest + sDirs[n] + '\' + sZips[m]);
          end;
        end;

        if (sDirs[n] = 'orgamon-mob') then
          break;

        // jpgs zippen
        serviceJPG;

        // htmls zippen
        serviceHTML;

      until true;

    end;
  end;

  // unprepare
  sDirs.Free;
  sZips.Free;
  sPics.Free;
  sFotos.Free;
  tabelleBAUSTELLE.Free;
  WARTEND.Free;
  Log('ENDE', '*');
end;

procedure TFotoExec.workStatus;
var
  sDir: TStringList;
  n: integer;
  FileDateTime: TDateTime;
  sMonteure: TStringList;
  m: string;
  sTabelle: tsTable;
begin
  sDir := TStringList.Create;
  sMonteure := TStringList.Create;
  sTabelle := tsTable.Create;

  try
    dir(MobUploadPath + '*.$$$', sDir, false);
    sDir.sort;

    // Aktuelle Uploads (=Dateien im aktuellem Zugriff) entfernen
    for n := pred(sDir.count) downto 0 do
    begin
      if not(FileAge(MobUploadPath + sDir[n], FileDateTime)) then
      begin
        // Datei ist verschwunden!
        sDir.Delete(n);
        continue;
      end;
      if (SecondsDiff(now, FileDateTime) < 120) then
      begin
        // Datei wird gerade hochgeladen, bzw. ist zu frisch
        sDir.Delete(n);
        continue;
      end;
    end;

    for n := 0 to pred(sDir.count) do
    begin
      m := nextp(sDir[n], '-', 0);
      if (sMonteure.IndexOf(m) = -1) then
        sMonteure.add(m);
    end;

    sTabelle.addCol('Ger�t', sMonteure);
    sTabelle.SaveToHTML(cWebPath + 'index.html');
    sTabelle.SaveToFile(cWebPath + 'ausstehende-fotos.csv');
  except

  end;

  sDir.Free;
  sMonteure.Free;
  sTabelle.Free;

end;

end.

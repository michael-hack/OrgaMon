{
  |������___                  __  __
  |�����/ _ \ _ __ __ _  __ _|  \/  | ___  _ __
  |����| | | | '__/ _` |/ _` | |\/| |/ _ \| '_ \
  |����| |_| | | | (_| | (_| | |  | | (_) | | | |
  |�����\___/|_|  \__, |\__,_|_|  |_|\___/|_| |_|
  |���������������|___/
  |
  |    Copyright (C) 2007 - 2018  Andreas Filsinger
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
unit c7zip;

interface

uses
  Classes;

const
  unzip_Version: string = 'N/A';
  zip_Version: string = 'N/A';
  cZIPExtension = '.zip';
  cZIPTempFileMask = 'zia*';
  infozip_RootPath = 'RootPath';
  infozip_Password = 'Password';
  infozip_Level = 'Level';
  infozip_ExtraInfo = 'ExtraInfos';
  infozip_AES256 = 'AES256';

  { zip(sFiles,FName,Options)
    |
    |  sFiles :    Liste der Dateinamen oder "nil" wenn alle Dateien archiviert werden sollen
    |  FName :     Name des neuen Archives, Datei sollte nicht existieren
    |  Options :
    |    RootPath   = Einstiegsverzeichnis, ab dem rekursiv gesichert werden soll es werden
    |                 Unterverzeichnisnamen als relative Pfade zu RootPath ins Archiv mit
    |                 aufgenommen. Auf RootPath selbst finden sich keine Hinweise im enstehenden
    |                 Archiv. Wird gerne in Verbindung mit sFiles=nil benutzt.
    |
    |    Password   = das globale Passwort, mit dem alle Dateien verschl�sselt werden sollen
    |    AES256     = <leer> (default)
    |                 1 Aktiv
    |    Level      = der Grad der Komprimierung bzw. die Art des Komprimierungsverfahrens, das
    |                 eingesetzt werden soll.
    |                 0 = keine Komprimierung (Store) ...
    |                 9 = h�chste Komprimierung (default)
    |    ExtraInfos = <leer> (default>
    |                 0 Aktiv
    |                 genauer Sinn bleibt mir verschlossen: Auf alle F�lle f�hrt es zu nicht
    |                 deterministischen Zips. Deshalb wird es bei alles Tests deaktiviert, sonst
    |                 lasse ich es auf Default also incl. der Extra infos!
  }

function zip(sFiles: TStringList; FName: string; Options: TStringList = nil)
  : integer { AnzahlDateien }; overload;

// Options-Delimiter = ";"
function zip(sFiles: TStringList; FName: string; Options: string): integer
{ AnzahlDateien }; overload;

// Options-Delimiter = ";"
function zip(sFile: String; FName: string; Options: string = ''): integer
{ AnzahlDateien }; overload;

{ unzip(FName,Destination,Options)
  |
  |  FName :      Name des bestehenden Archives, das ausgepackt werden soll
  |  Destination: Verzeichnis, in das entpackt werden soll
  |  Options :
  |  Password   = das globale Passwort, welches beim Auspacken benutzt wird
}

function unzip(FName: string; Destination: string; Options: TStringList = nil)
  : integer { AnzahlDateien };


implementation

uses
 windows, SysUtils,
 anfix32, Systemd;

const
 c7zip_app : string = '"C:\Program Files\7-Zip\7z.exe"';

//     ('"' + UnzipApplication + '"' + ' ' + CommandLine, SW_HIDE);

function zip(sFiles: TStringList; FName: string; Options: TStringList = nil)
  : integer { AnzahlDateien }; overload;
var
 Switches : string;
begin
  if FileExists(FName) then
   DeleteFile(FName);
  if assigned(sFiles) then
  begin

  end;
  sFiles.SaveToFile(FName+'.txt', TEncoding.UTF8);

  Switches := '';
  if assigned(Options) then
  begin

      if (Options.Values[infozip_Password] <> '') then
      begin
       Switches := Switches + '-mem=AES256 -p'+Options.Values[infozip_Password]+' ';
      end;


  end;

  //   {} ' > "'+FName+'.log"',        get the std output do not work

  CallExternalApp(
   {} c7zip_app + ' ' +
   {} 'a -tZip -mcu=on -mm=Deflate64 ' +
   {} Switches +
   {} '"' + FName + '" ' +
   {} '@"' + FName + '.txt"',
   {} SW_HIDE);

  DeleteFile(FName+'.txt');
  if FileExists(FName) then
   result := 1
  else
   result := 0;
end;

function zip(sFiles: TStringList; FName: string; Options: string): integer
{ AnzahlDateien }; overload;
var
  sOptions: TStringList;
begin
  sOptions := split(Options);
  result := zip(sFiles, FName, sOptions);
  sOptions.free;
end;

function zip(sFile: String; FName: string; Options: string): integer
{ AnzahlDateien }; overload;
var
  sOptions: TStringList;
  sFiles: TStringList;
begin
  sFiles := split(sFile);
  sOptions := split(Options);
  result := zip(sFiles, FName, sOptions);
  sOptions.free;
  sFiles.free;
end;

function unzip(FName: string; Destination: string; Options: TStringList = nil)
  : integer { AnzahlDateien };
begin

end;

end.

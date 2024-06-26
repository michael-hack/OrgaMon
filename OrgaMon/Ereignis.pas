{
  |      ___                  __  __
  |     / _ \ _ __ __ _  __ _|  \/  | ___  _ __
  |    | | | | '__/ _` |/ _` | |\/| |/ _ \| '_ \
  |    | |_| | | | (_| | (_| | |  | | (_) | | | |
  |     \___/|_|  \__, |\__,_|_|  |_|\___/|_| |_|
  |               |___/
  |
  |    Copyright (C) 2007  Andreas Filsinger
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
unit Ereignis;

interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, Grids,
  IB_Grid, IB_Components, IB_Access, IB_UpdateBar,
  IB_NavigationBar, IB_SearchBar, StdCtrls,
  ExtCtrls, Buttons, IB_Controls;

type
  TFormEreignis = class(TForm)
    IB_Query1: TIB_Query;
    IB_DataSource1: TIB_DataSource;
    IB_Grid1: TIB_Grid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    IB_SearchBar1: TIB_SearchBar;
    IB_NavigationBar1: TIB_NavigationBar;
    IB_UpdateBar1: TIB_UpdateBar;
    Button4: TButton;
    Button11: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    IB_Memo1: TIB_Memo;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IB_Query1AfterScroll(IB_Dataset: TIB_Dataset);
    procedure Button11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
    TimerState: integer;
    LastKasse: dword;
  public
    { Public-Deklarationen }
    procedure setContext_BELEG_R(BELEG_R: integer);
    procedure setContext(EREIGNIS_R: integer);
    procedure doKasse(EREIGNIS_R: integer);
  end;

var
  FormEreignis: TFormEreignis;

implementation

uses
  Belege, Artikel, Person,
  BBelege, Datenbank,
  Funktionen_Basis,
  Funktionen_Beleg,
  DruckSpooler, globals,
  anfix, CareTakerClient, CareServer,
  dbOrgaMon, wanfix, main;
{$R *.DFM}

procedure TFormEreignis.FormActivate(Sender: TObject);
begin
  if not(IB_Query1.Active) then
    IB_Query1.Open;
end;

procedure TFormEreignis.Button11Click(Sender: TObject);
begin
  doKasse(IB_Query1.FieldByName('RID').AsInteger);
end;

procedure TFormEreignis.Button1Click(Sender: TObject);
begin
  FormArtikel.setContext(IB_Query1.FieldByName('ARTIKEL_R').AsInteger);
end;

procedure TFormEreignis.Button2Click(Sender: TObject);
begin
  FormBelege.setContext(0, IB_Query1.FieldByName('BELEG_R').AsInteger);
end;

procedure TFormEreignis.Button3Click(Sender: TObject);
begin
  FormPerson.setContext(IB_Query1.FieldByName('PERSON_R').AsInteger);
end;

procedure TFormEreignis.Button4Click(Sender: TObject);
begin
  FormBBelege.setContext(0, IB_Query1.FieldByName('BBELEG_R').AsInteger);
end;

procedure TFormEreignis.doKasse(EREIGNIS_R: integer);
var
  BELEG_R: integer;
  OutFName: string;
begin
  BeginHourglass;
  BELEG_R := e_w_BelegNeuAusKasse(EREIGNIS_R);
  OutFName := e_w_BelegBuchen(BELEG_R);

  if CheckBox1.checked and (OutFname<>'')then
    printhtmlOK(OutFName);

  // "BEENDET" Wert überschreiben, um "echten" Wert zu ermitteln
  e_x_sql(
    { } 'update EREIGNIS set' +
    { } ' BEENDET=CURRENT_TIMESTAMP ' +
    { } 'where RID=' + inttostr(EREIGNIS_R));
  EndHourGlass;
end;

procedure TFormEreignis.IB_Query1AfterScroll(IB_Dataset: TIB_Dataset);
begin
  with IB_Query1 do
  begin
    Button1.Enabled := FieldByName('ARTIKEL_R').IsNotNull;
    Button2.Enabled := FieldByName('BELEG_R').IsNotNull;
    Button3.Enabled := FieldByName('PERSON_R').IsNotNull;
    Button4.Enabled := FieldByName('BBELEG_R').IsNotNull;
  end;
end;

procedure TFormEreignis.setContext(EREIGNIS_R: integer);
begin
  with IB_Query1 do
  begin
    close;
    sql.clear;
    sql.add('SELECT');
    sql.add('       AUFTRITT');
    sql.add('     , ZUSAMMENHANG');
    sql.add('     , INFO');
    sql.add('     , ARTIKEL_R');
    sql.add('     , AUSGABEART_R');
    sql.add('     , PERSON_R');
    sql.add('     , BELEG_R');
    sql.add('     , POSTEN_R');
    sql.add('     , BBELEG_R');
    sql.add('     , BPOSTEN_R');
    sql.add('     , ART');
    sql.add('     , RID');
    sql.add('     , BEARBEITER_R');
    sql.add('FROM');
    sql.add(' EREIGNIS');
    sql.add('where');
    sql.add(' RID=' + inttostr(EREIGNIS_R));
    sql.add('ORDER');
    sql.add(' BY AUFTRITT DESC');
    sql.add('FOR UPDATE');
  end;
  show;
end;

procedure TFormEreignis.setContext_BELEG_R(BELEG_R: integer);
begin
  with IB_Query1 do
  begin
    close;
    sql.clear;
    sql.add('SELECT');
    sql.add('       AUFTRITT');
    sql.add('     , ZUSAMMENHANG');
    sql.add('     , INFO');
    sql.add('     , ARTIKEL_R');
    sql.add('     , AUSGABEART_R');
    sql.add('     , PERSON_R');
    sql.add('     , BELEG_R');
    sql.add('     , POSTEN_R');
    sql.add('     , BBELEG_R');
    sql.add('     , BPOSTEN_R');
    sql.add('     , ART');
    sql.add('     , RID');
    sql.add('     , BEARBEITER_R');
    sql.add('FROM');
    sql.add(' EREIGNIS');
    sql.add('where');
    sql.add(' BELEG_R=' + inttostr(BELEG_R));
    sql.add('ORDER');
    sql.add(' BY AUFTRITT DESC');
    sql.add('FOR UPDATE');
  end;
  show;
end;

const
  InsideKasseTimer: boolean = false;

procedure TFormEreignis.Timer1Timer(Sender: TObject);
var
  EREIGNIS_R: integer;
begin
  if InsideKasseTimer or NoTimer or not(AllSystemsRunning) then
    exit;

  InsideKasseTimer := true;

  //
  case TimerState of
    0:
      begin

        // Check if service is wanted
        Timer1.Enabled := not(pDisableKasse) and
          (AnsiUpperCase(ComputerName) = AnsiUpperCase(iKasseHost));

        if Timer1.Enabled then
        begin
          Label1.Caption := 'ich bin Server';
          FormMain.Panel7.color := cllime;
          FormMain.DisableSaveOnExit;
        end else
          Label1.Caption := iKasseHost + ' ist Server';

        //
        inc(TimerState);

      end;
    1:
      begin

        // Check if there a Print-Pieces, if not -> don't print
        inc(TimerState);

      end;
    2:
      begin

        try

          EREIGNIS_R := e_r_sql('select RID from EREIGNIS where (ART=' +
            inttostr(eT_Kasse) + ') and (BEENDET is null)');
          if (EREIGNIS_R >= cRID_FirstValid) then
            if frequently(LastKasse, 15000) then
              doKasse(EREIGNIS_R);

        except
          on E: Exception do
          begin
            Timer1.Enabled := false;
            AppendStringsToFile('Ereignis-Timer: ' + E.Message,
              {} ErrorFName('EREIGNIS'),
              {} Uhr8);
          end;
        end;

      end;

    //
  end;

  InsideKasseTimer := false;

end;

end.

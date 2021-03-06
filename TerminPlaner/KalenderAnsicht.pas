unit KalenderAnsicht;

interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls,
  StdCtrls, ImgList, ComCtrls,
  ToolWin,

  // IBObjects
  DatePick,

  // TMS-Component-Pack
  planner;

const
  Version: single = 1.012; // TerminPlaner.rev.txt
  TerminePath: string = '';
  cWeekDayNames: array[0..6] of string = ('Mon', 'Die', 'Mit', 'Don', 'Fre', 'Sam', 'Son');
  cTerminFExtension = '.Termine';

type
  TFormKalenderAnsicht = class(TForm)
    DatePick2: TDatePick;
    Planner2: TPlanner;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure Planner2PlannerRightClick(Sender: TObject; position, fromSel,
      fromSelPrecis, toSel, toSelPrecis: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Planner2PlannerNext(Sender: TObject);
    procedure Planner2PlannerPrev(Sender: TObject);
    procedure DatePick2Change(Sender: TDatePick; Value: TDatePickResult);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Planner2PlannerLeftClick(Sender: TObject; position, fromSel,
      fromSelPrecis, toSel, toSelPrecis: Integer);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Planner2ItemEndEdit(Sender: TObject; Item: TPlannerItem);
    procedure Planner2ItemInsert(Sender: TObject; position, fromSel,
      fromSelPrecis, toSel, toSelPrecis: Integer);
    procedure Planner2ItemMove(Sender: TObject; Item: TPlannerItem;
      fromBegin, fromEnd, fromPos, toBegin, toEnd, toPos: Integer);
    procedure Planner2ItemSize(Sender: TObject; Item: TPlannerItem;
      position, fromBegin, fromEnd, toBegin, toEnd: Integer);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure Planner2ItemStartEdit(Sender: TObject; Item: TPlannerItem);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private-Deklarationen }
    ActAge: integer;
    DoTheBeep: boolean;
    ActDate: TDateTime;
    ActWeek: integer;
    CopyMode: boolean;
    ItemClipBoard: TPlannerItems;
    DoAutoSave: boolean;
    InsidePlannerEdit: boolean;
    SuppressExitSave: boolean;
    LoadCount: integer;
  public
    { Public-Deklarationen }

    procedure CheckLoad;
    procedure ForceLoad;
    function ActKalendarFName: string;
    procedure ShowHelp;
    procedure SetUpDate;
    function YearAsString: string;
    function FocusedID: integer;

    procedure SetSaveIsNeeded;
    procedure SetSaveIsUseLess;
    procedure SorryNothingClicked;
    procedure MoveOldFile;
  end;

var
  FormKalenderAnsicht: TFormKalenderAnsicht;

implementation

uses
  globals, anfix32, HilfeAnzeige, inifiles, html;

{$R *.DFM}

procedure TFormKalenderAnsicht.FormCreate(Sender: TObject);
var
  MyIni: TIniFile;
  _HintTime: integer;
begin
  caption := 'Termin Planer Rev. ' + RevToStr(Version);

  TerminePath := MyProgramPath + 'Termine\';
  CheckCreateDir(TerminePath);

  MyIni := TIniFile.create(MyProgramPath + 'TerminPlaner.ini');
  with MyIni do
  begin
    _HintTime := strtoint(ReadString('System', 'HintPause', '0'));
    DoAutoSave := (ReadString('System', 'AutoSave', '') = 'JA');
    if (_HintTime > 0) then
      application.HintHidePause := _HintTime;
  end;
  Myini.free;

  ItemClipBoard := TPlannerItems.create(planner2);

end;

procedure TFormKalenderAnsicht.Planner2PlannerRightClick(Sender: TObject;
  position, fromSel, fromSelPrecis, toSel, toSelPrecis: Integer);
begin

  if Planner2.Items.HasItem(fromSel, toSel, position) then
  begin
    ShowMessage('Bitte erst einen Bereich mit der linken Maustaste markieren');
    exit;
  end;

  with (Planner2.Items.Add) do
  begin
//   Text.Add('Kunde, Aufgabe');
    Text.Add('[' + UserName + ']');
    Name := 'Test';
   // ItemStartTime:=encodetime(12,30,0,0);
   // ItemEndTime:=encodetime(13,30,0,0);

    CaptionType := ctTime;
//   if checkbox2.checked then IMageID:=0;

    ItemPos := position;
    ItemEnd := toSel - planner2.display.DisplayStart;
    ItemBegin := fromSel - planner2.display.DisplayStart;
//   TrackColor := $0A0A0A + random(20000);

  end;
  SetSaveIsNeeded;
end;

function TFormKalenderAnsicht.ActKalendarFName: string;
begin
  result := TerminePath + 'KW ' + inttostrN(ActWeek, 2) + '-' + YearAsString + cTerminFExtension;
end;

procedure TFormKalenderAnsicht.CheckLoad;
var
  NewAge: integer;
  _FName: string;
begin
  if not (InsidePlannerEdit) then
  begin
    _FName := ActKalendarFName;
    NewAge := FileAge(_FName);
    if (NewAge <> -1) then
    begin
      if (NewAge <> ActAge) then
        if (FileGetAttr(_FName) = faReadOnly) then
        begin
          planner2.LoadFromFile(_FName);
          inc(LoadCount);
          if DoTheBeep then
            beep;
          SetSaveIsUseLess;
        end;
    end;
    ActAge := NewAge;
  end;
end;

procedure TFormKalenderAnsicht.Timer1Timer(Sender: TObject);
begin
  if visible then
    CheckLoad;
end;

procedure TFormKalenderAnsicht.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) then
  begin
    Key := 0;
    ShowHelp;
  end;
  if (Key = VK_ESCAPE) then
  begin
    key := 0;
    close;
  end;
end;

procedure TFormKalenderAnsicht.ShowHelp;
begin
  FormHilfeAnzeige.show;
end;

procedure TFormKalenderAnsicht.Planner2PlannerNext(Sender: TObject);
begin
  Toolbar1.SetFocus;
  DatePick2.Date := long2datetime(DatePlus(datetime2long(DatePick2.Date), 7));
  DatePick2.ReFresh;
  SetUpDate;
end;

procedure TFormKalenderAnsicht.Planner2PlannerPrev(Sender: TObject);
begin
  Toolbar1.SetFocus;
  DatePick2.Date := long2datetime(DatePlus(datetime2long(DatePick2.Date), -7));
  DatePick2.ReFresh;
  SetUpDate;
end;

procedure TFormKalenderAnsicht.SetUpDate;
var
  _aw: integer;
  _WeekDay: integer;
  MondayDate: TANFiXDate;
  n: integer;
begin
  _Aw := ActWeek;
  ActDate := DatePick2.Date;
  ActWeek := WeekGet(ActDate);
  planner2.caption.Title := 'KW ' + inttostr(ActWeek) + '-' + YearAsString;

 // Montag bestimmen
  _WeekDay := DayOfWeek(ActDate);
  if _WeekDay = 1 then
    _WeekDay := 8;
  _WeekDay := _WeekDay - 2;

  MondayDate := DateTime2Long(ActDate);
  MondayDate := DatePlus(MondayDate, -_WeekDay);

  planner2.Header.captions.clear;
  planner2.Header.captions.add('');
  for n := 0 to 6 do
  begin
    planner2.Header.captions.add(cWeekDayNames[n] + ', ' + copy(Long2date(MondayDate), 1, 5));
    MondayDate := DatePlus(MondayDate, 1);
  end;
// label2.caption := inttostr(_WeekDay);

 // Planer neu laden?!
  if (_Aw <> ActWeek) then
  begin
    with planner2 do
    begin
      items.clear;
      SelPosition := -1;
    end;
    ForceLoad;
  end;
end;

procedure TFormKalenderAnsicht.DatePick2Change(Sender: TDatePick;
  Value: TDatePickResult);
begin
  SetUpDate;
end;

procedure TFormKalenderAnsicht.ForceLoad;
begin
  DoTheBeep := false;
  ActAge := 0;
  CheckLoad;
  DoTheBeep := true;
end;

function TFormKalenderAnsicht.YearAsString: string;
begin
  result := copy(long2date(DateTime2long(DatePick2.Date)), 7, 4)
end;

procedure TFormKalenderAnsicht.ToolButton1Click(Sender: TObject);
begin
  if FileAge(ActKalendarFName) = ActAge then
  begin
    if FileExists(ActKalendarFName) then
      FileSetAttr(ActKalendarFName, 0);
    planner2.SaveToFile(ActKalendarFName);
    FileSetAttr(ActKalendarFName, faReadOnly);
    ActAge := FileAge(ActKalendarFName);
  end else
  begin
    ShowMessage('Ihre �nderung konnte nicht gesichert werden!' + #13 +
      'Inzwischen wurden �nderungen vorgenommen!');
    ForceLoad;
  end;
  SetSaveIsUseless;
end;

procedure TFormKalenderAnsicht.ToolButton2Click(Sender: TObject);
begin
  planner2.print;
end;

procedure TFormKalenderAnsicht.ToolButton4Click(Sender: TObject);
begin
  ShowHelp;
end;

procedure TFormKalenderAnsicht.ToolBar1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  with DatePick2 do
    if (x < (toolbar1.width - (width div 2))) and (x > (toolbutton4.Left + toolbutton4.width + 10)) then
    begin
      left := x - (width div 2);
      visible := true;
    end else
    begin
      visible := false;
    end;
end;

procedure TFormKalenderAnsicht.Planner2PlannerLeftClick(Sender: TObject;
  position, fromSel, fromSelPrecis, toSel, toSelPrecis: Integer);
var
  _OldLength: integer;
  OneItem: TPlannerItem;
begin
  if DatePick2.visible then
    DatePick2.visible := false;

  if CopyMode then
  begin
    OneItem := planner2.items.add;
    OneItem.assign(ItemClipBoard.items[0]);
    with OneItem do
    begin
      ItemPos := position;
      _OldLength := ItemEnd - ItemBegin;
      ItemBegin := fromSel - planner2.display.DisplayStart;
      ItemEnd := ItemBegin + _OldLength;
    end;
    CopyMode := false;
    ToolButton10.ImageIndex := 12;
  end;

// label2.caption := inttostr(position);
end;

procedure TFormKalenderAnsicht.ToolButton6Click(Sender: TObject);
begin
  DatePick2.TodayClick;
end;

procedure TFormKalenderAnsicht.ToolButton5Click(Sender: TObject);
var
  n: integer;
  SetClock: boolean;
begin
  with Planner2.Items do
  begin
    BeginUpdate;

    if (count > 0) then
      SetClock := (items[0].CaptionType = ctNone);

    for n := 0 to pred(count) do
      with items[n] do
        if SetClock then
          CaptionType := ctTime
        else
          CaptionType := ctNone;

    EndUpdate;
  end;
  SetSaveIsNeeded;
end;

procedure TFormKalenderAnsicht.SetSaveIsNeeded;
begin
  ToolButton1.ImageIndex := 0;
  application.processmessages;
  if DoAutoSave then
    ToolButton1Click(self);
end;

procedure TFormKalenderAnsicht.SetSaveIsUseLess;
begin
  ToolButton1.ImageIndex := 1;
end;

procedure TFormKalenderAnsicht.Planner2ItemEndEdit(Sender: TObject;
  Item: TPlannerItem);
var
  n: integer;
begin
  InsidePlannerEdit := false;
  if SuppressExitSave then
    exit;
  with Item do
  begin
    color := clwhite;
    for n := 0 to pred(text.count) do
    begin

      if (pos('MFZ', text[n]) > 0) then
      begin
        color := $B0FFFF;
        break;
      end;

      if (pos('K�', text[n]) > 0) then
      begin
        color := HTMLColor2TColor($FF8080);
        break;
      end;

    end;
  end;
  SetSaveIsNeeded;
end;

procedure TFormKalenderAnsicht.Planner2ItemInsert(Sender: TObject;
  position, fromSel, fromSelPrecis, toSel, toSelPrecis: Integer);
begin
  SetSaveIsNeeded;
end;

procedure TFormKalenderAnsicht.Planner2ItemMove(Sender: TObject;
  Item: TPlannerItem; fromBegin, fromEnd, fromPos, toBegin, toEnd,
  toPos: Integer);
begin
  SetSaveIsNeeded;
end;

procedure TFormKalenderAnsicht.Planner2ItemSize(Sender: TObject;
  Item: TPlannerItem; position, fromBegin, fromEnd, toBegin,
  toEnd: Integer);
begin
  SetSaveIsNeeded;
end;

function TFormKalenderAnsicht.FocusedID: integer;
var
  n: integer;
begin
  result := -1;
  with planner2.items do
    for n := 0 to pred(count) do
    begin
      if items[n].Focus then
      begin
        result := n;
        break;
      end;
    end;
end;

procedure TFormKalenderAnsicht.ToolButton9Click(Sender: TObject);
begin
  if FocusedID <> -1 then
  begin
    if (MessageBox(0, PChar('Wollen Sie den Termin wirklich l�schen?'), 'L�schen', mb_OKCANCEL or MB_ICONQUESTION or MB_DEFBUTTON2) = IDOK) then
    begin
      SuppressExitSave := true;
      planner2.items.Delete(FocusedID);
      SuppressExitSave := false;
      SetSaveIsNeeded;
    end;
  end else
  begin
    SorryNothingClicked;
  end;
end;

procedure TFormKalenderAnsicht.ToolButton10Click(Sender: TObject);
var
  _FocusedID: integer;
  OneItem: TPlannerItem;
begin
  _FocusedID := FocusedID;
  if _FocusedID <> -1 then
  begin
    ItemClipBoard.clear;
    OneItem := ItemClipBoard.add;
    OneItem.assign(planner2.items.items[_FocusedID]);
    planner2.items.Delete(_FocusedID);
    SetSaveIsNeeded;
    CopyMode := true;
    ToolButton10.ImageIndex := 13;
  end else
  begin
    SorryNothingClicked;
  end;
end;

procedure TFormKalenderAnsicht.SorryNothingClicked;
begin
  ShowMessage('Es ist im Moment kein Termin angeklickt!');
end;

procedure TFormKalenderAnsicht.Planner2ItemStartEdit(Sender: TObject;
  Item: TPlannerItem);
begin
  InsidePlannerEdit := true;
end;

procedure TFormKalenderAnsicht.MoveOldFile;
var
  AllTermine: TStringList;
  n: integer;
begin
  AllTermine := TStringList.create;
  dir(MyProgramPath + '*' + cTerminFExtension, AllTermine, false);
  for n := 0 to pred(AllTermine.count) do
  begin
    if not (FileExists(TerminePath + AllTermine[n])) then
    begin
      FileMove(MyProgramPath + AllTermine[n], TerminePath + AllTermine[n]);
      FileSetAttr(MyProgramPath + AllTermine[n], faReadOnly);
    end else
    begin
      FileDelete(MyProgramPath + AllTermine[n]);
    end;
  end;
  AllTermine.free;
end;

procedure TFormKalenderAnsicht.FormActivate(Sender: TObject);
begin
  SetUpDate;
end;

procedure TFormKalenderAnsicht.FormDestroy(Sender: TObject);
begin
  ItemClipBoard.free;
end;

end.


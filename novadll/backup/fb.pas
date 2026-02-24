{
  TBUDF - Tecnobyte UDF for FireBird

  Author...: Daniel Pereira Guimarães
  E-mail...: tecnobyte@ulbrajp.com.br
  Home-Page: www.ulbrajp.com.br/~tecnobyte

  This library is Open-Source!
}

unit fb;

interface

uses
  SysUtils, consts;

type
  TDateRec = record
    Year: SmallInt;
    Month: SmallInt;
    Day: SmallInt;
  end;

  TTimeRec = record
    Hour: SmallInt;
    Minute: SmallInt;
    Second: SmallInt;
  end;

  TTSRec = record
    Date: TDateRec;
    Time: TTimeRec;
  end;

  TFBDate = integer;
  TFBTime = Cardinal;

  { FireBird TimeStamp record }
  TFBTS = packed record
    Date: TFBDate;
    Time: TFBTime;
  end;

  PFBTS = ^TFBTS;

function DateRec(const Year, Month, Day: SmallInt): TDateRec;
function TimeRec(const Hour, Minute, Second: SmallInt): TTimeRec;
function TSRec(const Year, Month, Day,
  Hour, Minute, Second: SmallInt): TTSRec;

function FBDecDate(T: TFBDate): TDateRec;
function FBDecTime(T: TFBTime): TTimeRec;
function FBDecTS(T: TFBTS): TTSRec;

function FBEncDate(T: TDateRec): TFBDate;
function FBEncTime(T: TTimeRec): TFBTime;
function FBEncTS(T: TTSRec): TFBTS;

function FBTimeToSec(T: TFBTime): integer;
function FBSecToTime(I: integer): TFBTime;
function FBTSToSec(T: TFBTS): int64;
function FBDifAsSec(T1, T2: TFBTS): int64;
function FBDifAsDay(T1, T2: TFBTS): double;

procedure FBIncYear(var T: TFBDate; const X: integer);
procedure FBIncMonth(var T: TFBDate; const X: integer);
procedure FBIncWeek(var T: TFBDate; const X: integer);
procedure FBIncDay(var T: TFBDate; const X: integer);
procedure FBIncSecond(var T: TFBTS; const X: integer);

implementation

function DateRec(const Year, Month, Day: SmallInt): TDateRec;
begin
  Result.Year := Year;
  Result.Month := Month;
  Result.Day := Day;
end;

function TimeRec(const Hour, Minute, Second: SmallInt): TTimeRec;
begin
  Result.Hour := Hour;
  Result.Minute := Minute;
  Result.Second := Second;
end;

function TSRec(const Year, Month, Day,
  Hour, Minute, Second: SmallInt): TTSRec;
begin
  Result.Date := DateRec(Year, Month, Day);
  Result.Time := TimeRec(Hour, Minute, Second);
end;

function FBDecDate(T: TFBDate): TDateRec;
  { The FBDecDate procedure is based in ndate() function of
    gds.cpp (FireBird API) }
var
  Century, Y, M, D: integer;
begin
  T := T - (1721119 - 2400001);
  Century := (4 * T - 1) div 146097;
  T := 4 * T - 1 - 146097 * Century;
  D := T div 4;
  T := (4 * D + 3) div 1461;
  D := 4 * D + 3 - 1461 * T;
  D := (D + 4) div 4;
  M := (5 * D - 3) div 153;
  D := 5 * D - 3 - 153 * M;
  D := (D + 5) div 5;
  Y := 100 * Century + T;

  if M < 10 then
    M := M + 3
  else begin
    M := M - 9;
    Y := Y + 1;
  end;

  Result.Year := Y;
  Result.Month := M;
  Result.Day := D;
end;

function FBDecTime(T: TFBTime): TTimeRec;
  { In FireBird: 1 second = 10000 }
var
  TotalSeconds: Cardinal;
begin
  TotalSeconds := T div ISC_TIME_SECONDS_PRECISION;

  Result.Hour := TotalSeconds div SECONDS_PER_HOUR;
  Result.Minute := (TotalSeconds div SECONDS_PER_MINUTE) mod SECONDS_PER_MINUTE;
  Result.Second := TotalSeconds mod SECONDS_PER_MINUTE;
end;

function FBDecTS(T: TFBTS): TTSRec;
begin
  Result.Date := FBDecDate(T.Date);
  Result.Time := FBDecTime(T.Time);
end;

function FBEncDate(T: TDateRec): TFBDate;
  { The FBEncDate function is based in nday() function of
    gds.cpp (FireBird API) }
var
  Century, ShortYear: integer;
begin
  if T.Month > 2 then
    T.Month := T.Month - 3
  else begin
    T.Month := T.Month + 9;
    T.Year := T.Year - 1;
  end;

  Century := T.Year div 100;
  ShortYear := T.Year - 100 * Century;

  Result :=
    (146097 * Century) div 4 +
    (1461 * ShortYear) div 4 +
    (153 * T.Month + 2) div 5 + T.Day + 1721119 - 2400001;
end;


function FBEncTime(T: TTimeRec): TFBTime;
begin
  Result :=
    (T.Hour * SECONDS_PER_HOUR +
     T.Minute * SECONDS_PER_MINUTE + T.Second)
     * ISC_TIME_SECONDS_PRECISION;
end;

function FBEncTS(T: TTSRec): TFBTS;
begin
  Result.Date := FBEncDate(T.Date);
  Result.Time := FBEncTime(T.Time);
end;

function FBTimeToSec(T: TFBTime): integer;
begin
  Result := T div ISC_TIME_SECONDS_PRECISION;
end;

function FBSecToTime(I: integer): TFBTime;
begin
  Result := I * ISC_TIME_SECONDS_PRECISION;
end;

function FBTSToSec(T: TFBTS): int64;
begin
  Result := int64(T.Date) * SECONDS_PER_DAY +
    int64(T.Time) div ISC_TIME_SECONDS_PRECISION;
end;

function FBDifAsSec(T1, T2: TFBTS): int64;
var
  Days, Seconds: integer;
begin
  if T1.Date < T2.Date then begin
    Days := T2.Date - T1.Date - 1;
    Seconds := SECONDS_PER_DAY - FBTimeToSec(T1.Time) +
      FBTimeToSec(T2.Time);
  end else if T1.Date > T2.Date then begin
    Days := T1.Date - T2.Date - 1;
    Seconds := SECONDS_PER_DAY - FBTimeToSec(T2.Time) +
      FBTimeToSec(T1.Time);
  end else begin { T1.Date = T2.Date }
    Days := 0;
    if T1.Time < T2.Time then
      Seconds := FBTimeToSec(T2.Time) - FBTimeToSec(T1.Time)
    else
      Seconds := FBTimeToSec(T1.Time) - FBTimeToSec(T2.Time);
  end;
  Result := int64(Days) * SECONDS_PER_DAY + int64(Seconds);
end;

function FBDifAsDay(T1, T2: TFBTS): double;
var
  X, Y: double;
begin
  X := T1.Date + (T1.Time div ISC_TIME_SECONDS_PRECISION) / SECONDS_PER_DAY;
  Y := T2.Date + (T2.Time div ISC_TIME_SECONDS_PRECISION) / SECONDS_PER_DAY;
  if X > Y then
    Result := X - Y
  else
    Result := Y - X;
end;

procedure FBIncYear(var T: TFBDate; const X: integer);
var
  R: TDateRec;
begin
  R := FBDecDate(T);

  Inc(R.Year, X);
  if (R.Month = 2) and (R.Day > 28) then begin
    if IsLeapYear(R.Year) then
      R.Day := 29
    else
      R.Day := 28;
  end;

  T := FBEncDate(R);
end;

procedure FBIncMonth(var T: TFBDate; const X: integer);
var
  R: TDateRec;
begin
  R := FBDecDate(T);

  Inc(R.Year, X div MONTHS_PER_YEAR);
  Inc(R.Month, X mod MONTHS_PER_YEAR);
  if R.Month > MONTHS_PER_YEAR then begin
    R.Month := R.Month - MONTHS_PER_YEAR;
    Inc(R.Year);
  end else if R.Month < 1 then begin
    R.Month := R.Month + MONTHS_PER_YEAR;
    Dec(R.Year);
  end;

  if (R.Month = 2) and (R.Day > 28) then begin
    if IsLeapYear(R.Year) then
      R.Day := 29
    else
      R.Day := 28;
  end else if (R.Day > MONTH_DAYS[R.Month]) then
    R.Day := MONTH_DAYS[R.Month];

  T := FBEncDate(R);
end;

procedure FBIncWeek(var T: TFBDate; const X: integer);
begin
  Inc(T, X * DAYS_PER_WEEK);
end;

procedure FBIncDay(var T: TFBDate; const X: integer);
begin
  Inc(T, X);
end;

procedure FBIncSecond(var T: TFBTS; const X: integer);
var
  TotalSeconds: int64;
  Seconds, Days: integer;
begin
  TotalSeconds := int64(FBTimeToSec(T.Time)) + int64(X);

  Days := integer(TotalSeconds div SECONDS_PER_DAY);
  Seconds := integer(TotalSeconds mod SECONDS_PER_DAY);

  if TotalSeconds < 0 then begin
    Dec(Days);
    Inc(Seconds, SECONDS_PER_DAY);
  end;

  FBIncDay(T.Date, Days);

  T.Time := FBSecToTime(Seconds);
end;

end.

library tbudf;

{$mode objfpc}{$H+}

uses
  SysUtils,
  Math,
  util in 'util.pas',
  fb in 'fb.pas',
  consts in 'consts.pas';

{ *** Version info *** }

function udf_Ver: double; cdecl; export;
begin
  Result := 2.2;
end;

{ *** String functions *** }

function udf_Len(Str: PChar): integer; cdecl; export;
begin
  Result := integer(StrLen(Str));
end;

function udf_Pos(Sub, Str: PChar): integer; cdecl; export;
begin
  Result := Pos(Sub, Str);
end;

function udf_Copy(Str: PChar; var Index, Count: integer): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, Copy(Str, Index, Count));
end;

function udf_Left(Str: PChar; var Count: integer): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, Copy(Str, 1, Count));
end;

function udf_Right(Str: PChar; var Count: integer): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, Copy(Str, Length(Str) - Count + 1, Count));
end;

function udf_Replace(Str, OldSub, NewSub: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, StringReplace(Str, OldSub, NewSub, [rfReplaceAll]));
end;

function udf_Stuff(Str: PChar; var Index, Count: integer; Sub: PChar): PChar; cdecl; export;
var
  S: string;
  Len: integer;
begin
  Result := Str;

  Len := StrLen(Str);

  if Index in [1..Len] then begin
    S := string(Str);
    Delete(S, Index, Count);
    Insert(Sub, S, Index);
    StrPCopy(Str, S);
  end;
end;

function udf_Strip(Str, Ch: PChar): PChar; cdecl; export;

  function FindCh(Str: PChar; const Ch: Char): boolean;
  begin
    while not (Str^ in [#0, Ch]) do
      Inc(Str);

    Result := Str^ = Ch;
  end;

var
  P: PChar;
begin
  Result := Str;
  P := Str;

  while P^ <> #0 do begin
    if not FindCh(Ch, P^) then begin
      Str^ := P^;
      Inc(Str);
    end;
    Inc(P);
  end;
  Str^ := #0;
end;

function udf_Upper(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrUpper(Str);
end;

function udf_Lower(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrLower(Str);
end;

function udf_AnsiUpper(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  AnsiStrUpper(Str);
end;

function udf_AnsiLower(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  AnsiStrLower(Str);
end;

procedure udf_StrOfChr(Ret, Ch: PChar; var Count: integer); cdecl; export;
var
  I: integer;
begin
  if (Ch^ = #0) or (Count <= 0) then
    Ret^ := #0
  else begin
    for I := 1 to Count do begin
      Ret^ := Ch^;
      Inc(Ret);
    end;
    Ret^ := #0;
  end;
end;

procedure udf_Space(Ret: PChar; var Count: integer); cdecl; export;
begin
  udf_StrOfChr(Ret, #32, Count);
end;

procedure udf_Repeat(Ret, Str: PChar; var Count: integer); cdecl; export;
var
  Len, I, J: integer;
begin
  if (Count <= 0) or (Str^ = #0) then
    Ret^ := #0
  else begin
    Len := StrLen(Str);
    for I := 1 to Count do
      for J := 1 to Len do begin
        Ret^ := Str[J-1];
        Inc(Ret);
      end;
  end;
end;

function udf_Digits(Str: PChar): PChar; cdecl; export;
var
  P: PChar;
begin
  Result := Str;
  P := Str;
  while P^ <> #0 do begin
    if P^ in ['0'..'9'] then begin
      Str^ := P^;
      Inc(Str);
    end;
    Inc(P);
  end;
  Str^ := #0;
end;

function udf_LTrim(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, TrimLeft(Str));
end;

function udf_RTrim(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, TrimRight(Str));
end;

function udf_Trim(Str: PChar): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, Trim(Str));
end;

function udf_PadL(Str, Pad: PChar; var Len: integer): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, PadL(Str, Pad, Len));
end;

function udf_PadR(Str, Pad: PChar; var Len: integer): PChar; cdecl; export;
begin
  Result := Str;
  StrPCopy(Str, PadR(Str, Pad, Len));
end;

procedure udf_StrZero(Ret: PChar; var X, Len: integer); cdecl; export;
begin
  StrPCopy(Ret, PadL(IntToStr(X), '0', Len));
end;

procedure udf_Chr(Ret: PChar; var Value: SmallInt); cdecl; export;
begin
  Ret[0] := Char(Value);
  Ret[1] := #0;
end;

function udf_Ord(Ch: PChar): SmallInt; cdecl; export;
begin
  Result := SmallInt(Ch^);
end;

function udf_IsLower(Ch: PChar): SmallInt; cdecl; export;
begin
  Result := SmallInt(Ch^ in ['a'..'z']);
end;

function udf_IsUpper(Ch: PChar): SmallInt; cdecl; export;
begin
  Result := SmallInt(Ch^ in ['A'..'Z']);
end;

function udf_IsDigit(Ch: PChar): SmallInt; cdecl; export;
begin
  Result := SmallInt(Ch^ in ['0'..'9']);
end;

function udf_IsAlpha(Ch: PChar): SmallInt; cdecl; export;
begin
  Result := SmallInt(Ch^ in ['A'..'Z', 'a'..'z']);
end;


procedure udf_IntToHex(Ret: PChar; var Value, Digits: integer); cdecl; export;
begin
  StrPCopy(Ret, IntToHex(Value, Digits));
end;

function udf_HexToInt(Str: PChar): integer; cdecl; export;
begin
  if Str^ = '$' then
    Result := StrToIntDef(Str, 0)
  else
    Result := StrToIntDef('$' + Str, 0);
end;

{ *** Date/time functions *** }

function udf_Year(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecDate(T^.Date).Year;
end;

function udf_Month(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecDate(T^.Date).Month;
end;

function udf_Day(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecDate(T^.Date).Day;
end;

function udf_Hour(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecTime(T^.Time).Hour;
end;

function udf_Minute(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecTime(T^.Time).Minute;
end;

function udf_Second(T: PFBTS): SmallInt; cdecl; export;
begin
  Result := FBDecTime(T^.Time).Second;
end;

procedure udf_EncDate(Ret: PFBTS; var Year, Month, Day: SmallInt); cdecl; export;
begin
  Ret^.Date := FBEncDate(DateRec(Year, Month, Day));
  Ret^.Time := 0;
end;

procedure udf_EncTime(Ret: PFBTS; var H, M, S: SmallInt); cdecl; export;
begin
  Ret^.Date := 0;
  Ret^.Time := FBEncTime(TimeRec(H, M, S));
end;

procedure udf_EncTS(Ret: PFBTS;
  var Year, Month, Day, Hour, Min, Sec: SmallInt); cdecl; export;
begin
  Ret^ := FBEncTS(TSRec(Year, Month, Day, Hour, Min, Sec));
end;

function udf_YearSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsDay(T1^, T2^) / APPROX_DAYS_PER_YEAR;
end;

function udf_MonthSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsDay(T1^, T2^) / APPROX_DAYS_PER_MONTH;
end;

function udf_WeekSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsDay(T1^, T2^) / DAYS_PER_WEEK;
end;

function udf_DaySpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsDay(T1^, T2^);
end;

function udf_HourSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^) / SECONDS_PER_HOUR;
end;

function udf_MinuteSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^) / SECONDS_PER_MINUTE;
end;

function udf_SecondSpan(T1, T2: PFBTS): double; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^);
end;

function udf_YearsBetween(T1, T2: PFBTS): integer; cdecl; export;
begin
  Result := Trunc32(udf_YearSpan(T1, T2));
end;

function udf_MonthsBetween(T1, T2: PFBTS): integer; cdecl; export;
begin
  Result := Trunc32(udf_MonthSpan(T1, T2));
end;

function udf_WeeksBetween(T1, T2: PFBTS): integer; cdecl; export;
begin
  Result := Trunc32(udf_WeekSpan(T1, T2));
end;

function udf_DaysBetween(T1, T2: PFBTS): integer; cdecl; export;
begin
  Result := Trunc32(udf_DaySpan(T1, T2));
end;

function udf_HoursBetween(T1, T2: PFBTS): int64; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^) div SECONDS_PER_HOUR;
end;

function udf_MinutesBetween(T1, T2: PFBTS): int64; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^) div SECONDS_PER_MINUTE;
end;

function udf_SecondsBetween(T1, T2: PFBTS): int64; cdecl; export;
begin
  Result := FBDifAsSec(T1^, T2^);
end;

function udf_Age(T: PFBTS): integer; cdecl; export;
var
  Y, M, D: Word;
  Birth, Today: TDateRec;
begin
  DecodeDate(Date, Y, M, D);

  Today.Year := Y;
  Today.Month := M;
  Today.Day := D;

  Birth := FBDecDate(T^.Date);

  Result := Age(Birth, Today);
end;

function udf_Age2(T1, T2: PFBTS): integer; cdecl; export;
var
  Birth, Today: TDateRec;
begin
  Birth := FBDecDate(T1^.Date);
  Today := FBDecDate(T2^.Date);

  Result := Age(Birth, Today);
end;

function udf_IncYear(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncYear(T^.Date, X);
end;

function udf_IncMonth(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncMonth(T^.Date, X);
end;

function udf_IncWeek(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncWeek(T^.Date, X);
end;

function udf_IncDay(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncDay(T^.Date, X);
end;

function udf_IncHour(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncSecond(T^, X * SECONDS_PER_HOUR);
end;

function udf_IncMinute(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncSecond(T^, X * SECONDS_PER_MINUTE);
end;

function udf_IncSecond(T: PFBTS; var X: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncSecond(T^, X);
end;

function udf_IncDate(T: PFBTS; var Y, M, D: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncYear(T^.Date, Y);
  FBIncMonth(T^.Date, M);
  FBIncDay(T^.Date, D);
end;

function udf_IncTime(T: PFBTS; var H, M, S: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncSecond(T^, H * SECONDS_PER_HOUR + M * SECONDS_PER_MINUTE + S);
end;

function udf_IncTS(T: PFBTS; var Y, M, D, H, Min, S: integer): PFBTS; cdecl; export;
begin
  Result := T;
  FBIncYear(T^.Date, Y);
  FBIncMonth(T^.Date, M);
  FBIncDay(T^.Date, D);
  FBIncSecond(T^, H * SECONDS_PER_HOUR); { IncHour }
  FBIncSecond(T^, Min * SECONDS_PER_MINUTE); { IncMinute }
  FBIncSecond(T^, S); { IncSecond }
end;

function udf_MaxDate(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Date > T2^.Date then
    Result := T1
  else
    Result := T2;
end;

function udf_MaxTime(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Time > T2^.Time then
    Result := T1
  else
    Result := T2;
end;

function udf_MaxTS(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Date > T2^.Date then
    Result := T1
  else if T1^.Date < T2^.Date then
    Result := T2
  else
    if T1^.Time > T2^.Time then
      Result := T1
    else
      Result := T2;
end;

function udf_MinDate(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Date < T2^.Date then
    Result := T1
  else
    Result := T2;
end;

function udf_MinTime(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Time < T2^.Time then
    Result := T1
  else
    Result := T2;
end;

function udf_MinTS(T1, T2: PFBTS): PFBTS; cdecl; export;
begin
  if T1^.Date < T2^.Date then
    Result := T1
  else if T1^.Date > T2^.Date then
    Result := T2
  else
    if T1^.Time < T2^.Time then
      Result := T1
    else
      Result := T2;
end;

procedure udf_MonthStart(Ret: PFBTS; var Year, Month: SmallInt); cdecl; export;
begin
  Ret^.Date := FBEncDate(DateRec(Year, Month, 1));
  Ret^.Time := 0;
end;

procedure udf_MonthEnd(Ret: PFBTS; var Year, Month: SmallInt); cdecl; export;
begin
  Ret^.Date := FBEncDate(
    DateRec(Year, Month, LastDay(Year, Month)));
  Ret^.Time := FBEncTime(TimeRec(23, 59, 59));
end;

function udf_LastDay(var Year, Month: SmallInt): SmallInt; cdecl; export;
begin
  Result := LastDay(Year, Month);
end;

function udf_DayFrac(T: PFBTS): double; cdecl; export;
var
  R: TTimeRec;
begin
  R := FBDecTime(T^.Time);
  Result := (R.Hour * SECONDS_PER_HOUR + R.Minute *
    SECONDS_PER_MINUTE + R.Second) / SECONDS_PER_DAY;
end;

function udf_YearDay(T: PFBTS): SmallInt; cdecl; export;
var
  R: TDateRec;
  I: SmallInt;
begin
  { The first day of the year is zero. }
  R := FBDecDate(T^.Date);

  Result := R.Day - 1;

  for I := 1 to (R.Month - 1) do
    Inc(Result, MONTH_DAYS[I]);

  if (R.Month > 2) and IsLeapYear(R.Year) then
    Inc(Result);
end;

function udf_WeekDay(T: PFBTS): SmallInt; cdecl; export;
begin
  { The first day of the week is zero. }

  { When Date = 0, WeekDay = 3 (wednesday) --- [0..6] }
  Result := (T^.Date + 3) mod DAYS_PER_WEEK;
  if Result < 0 then
    Inc(Result, DAYS_PER_WEEK);
end;

procedure udf_MonthName(Ret: PChar; T: PFBTS); cdecl; export;
begin
  case udf_Month(T) of
    1: StrPCopy(Ret, SLongJan);
    2: StrPCopy(Ret, SLongFeb);
    3: StrPCopy(Ret, SLongMar);
    4: StrPCopy(Ret, SLongApr);
    5: StrPCopy(Ret, SLongMay);
    6: StrPCopy(Ret, SLongJun);
    7: StrPCopy(Ret, SLongJul);
    8: StrPCopy(Ret, SLongAug);
    9: StrPCopy(Ret, SLongSep);
    10: StrPCopy(Ret, SLongOct);
    11: StrPCopy(Ret, SLongNov);
    12: StrPCopy(Ret, SLongDec);
  else
    Ret^ := #0;
  end;
end;

procedure udf_SMonthName(Ret: PChar; T: PFBTS); cdecl; export;
begin
  case udf_Month(T) of
    1: StrPCopy(Ret, SShortJan);
    2: StrPCopy(Ret, SShortFeb);
    3: StrPCopy(Ret, SShortMar);
    4: StrPCopy(Ret, SShortApr);
    5: StrPCopy(Ret, SShortMay);
    6: StrPCopy(Ret, SShortJun);
    7: StrPCopy(Ret, SShortJul);
    8: StrPCopy(Ret, SShortAug);
    9: StrPCopy(Ret, SShortSep);
    10: StrPCopy(Ret, SShortOct);
    11: StrPCopy(Ret, SShortNov);
    12: StrPCopy(Ret, SShortDec);
  else
    Ret^ := #0;
  end;
end;

procedure udf_DayName(Ret: PChar; T: PFBTS); cdecl; export;
begin
  case udf_WeekDay(T) of
    0: StrPCopy(Ret, SLongSun);
    1: StrPCopy(Ret, SLongMon);
    2: StrPCopy(Ret, SLongTue);
    3: StrPCopy(Ret, SLongWed);
    4: StrPCopy(Ret, SLongThu);
    5: StrPCopy(Ret, SLongFri);
    6: StrPCopy(Ret, SLongSat);
  else
    Ret^ := #0;
  end;
end;

procedure udf_SDayName(Ret: PChar; T: PFBTS); cdecl; export;
begin
  case udf_WeekDay(T) of
    0: StrPCopy(Ret, SShortSun);
    1: StrPCopy(Ret, SShortMon);
    2: StrPCopy(Ret, SShortTue);
    3: StrPCopy(Ret, SShortWed);
    4: StrPCopy(Ret, SShortThu);
    5: StrPCopy(Ret, SShortFri);
    6: StrPCopy(Ret, SShortSat);
  else
    Ret^ := #0;
  end;
end;

{ *** Math functions *** }

function udf_NVL(var X: double): double; cdecl; export;
begin
  Result := X;
end;

function udf_Frac(var X: double): double; cdecl; export;
begin
  Result := Frac(X);
end;

function udf_Int(var X: double): double; cdecl; export;
begin
  Result := Int(X);
end;

function udf_Trunc(var X: double): integer; cdecl; export;
begin
  Result := Trunc32(X);
end;

function udf_TruncDec(var X: double; var Decimal: SmallInt): double; cdecl; export;
var
  Factor: integer;
begin
  if Decimal <= 0 then
    Result := Int(X)
  else begin
    Factor := PosValue(1, 10, Decimal);
    Result := Int(X * Factor) / Factor;
  end;
end;

function udf_Round(var X: double): integer; cdecl; export;
begin
  Result := Round32(X);
end;


function SimpleRoundToEX(const AValue: Extended; const ADigit: TRoundToRange = -2): Extended;
var
  LFactor: Extended;
begin
  LFactor := IntPower(10.0, ADigit);
  if AValue < 0 then
    Result := Int((AValue / LFactor) - 0.5) * LFactor
  else
    Result := Int((AValue / LFactor) + 0.5) * LFactor;
end;

function udf_RoundABNT(var AValue: Double; var Digits: SmallInt):Double; cdecl; export;
var
   Pow, FracValue, PowValue : Extended;
   RestPart: Double;
   IntCalc, FracCalc, LastNumber, IntValue : Int64;
    OldValue : LongBool;
Begin





   Pow       := intpower(10, abs(Digits) );
   PowValue  := AValue / 10 ;
   IntValue  := trunc(PowValue);
   FracValue := frac(PowValue);

   PowValue := FracValue * 10 * Pow ;
   IntCalc  := trunc( PowValue );
   FracCalc := TruncFix( frac( PowValue ) * 100 );

   if (FracCalc > 50) then
      Inc( IntCalc )

   else if (FracCalc = 50) then
    begin
      LastNumber := round( frac( IntCalc / 10) * 10);

      if odd(LastNumber) then
         Inc( IntCalc )
      else
       begin
         PowValue := PowValue * 10;
         RestPart := PowValue - TruncFix(PowValue);

         if RestPart > 0.00001 then
            Inc( IntCalc );
       end ;
    end ;

   Result := ((IntValue*10) + (IntCalc / Pow));


end;

function udf_RoundDec(var X: double; var Decimal: SmallInt): double; cdecl; export;
var
  Factor: integer;
begin
  if Decimal <= 0 then
    Result := RoundDouble(X)
  else begin
    Factor := PosValue(1, 10, Decimal);
    Result := RoundDouble(X * Factor) / Factor;
  end;
end;

function udf_Ceil(var X: double): integer; cdecl; export;
begin
  Result := Integer(Trunc32(X));
  if Frac(X) > 0 then
    Inc(Result);
end;

function udf_Floor(var X: double): integer; cdecl; export;
begin
  Result := Integer(Trunc32(X));
  if Frac(X) < 0 then
    Dec(Result);
end;

function udf_Max(var A, B: double): double; cdecl; export;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

function udf_Min(var A, B: double): double; cdecl; export;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function udf_Abs(var X: double): double; cdecl; export;
begin
  if X < 0 then
    Result := -X
  else
    Result := X;
end;

function udf_Sign(var X: double): SmallInt; cdecl; export;
begin
  if X < 0 then
    Result := -1
  else if X > 0 then
    Result := 1
  else
    Result := 0;
end;

function udf_Odd(var X: integer): SmallInt; cdecl; export;
begin
  Result := SmallInt(Odd(X));
end;

function udf_Div(var Dividend, Divisor: integer): integer; cdecl; export;
begin
  if Divisor = 0 then
    Result := 0
  else
    Result := Dividend div Divisor;
end;

function udf_Mod(var Dividend, Divisor: integer): integer; cdecl; export;
begin
  if Divisor = 0 then
    Result := 0
  else
    Result := Dividend mod Divisor;
end;

function udf_DZero(var X, Y, Z: double): double; cdecl; export;
begin
  if Y = 0 then
    Result := Z
  else
    Result := X / Y;
end;

function udf_Exp(var X: double): double; cdecl; export;
begin
  Result := Exp(X);
end;

function udf_Factorial(var N: integer): int64; cdecl; export;
var
  I: int64;
begin
  if N < 0 then
    Result := 0
  else if N = 0 then
    Result := 1
  else begin
    Result := int64(N);
    I := int64(N) - 1;
    while I > 1 do begin
      Result := Result * I;
      Dec(I);
    end;
  end;
end;

function udf_Sqr(var X: double): double; cdecl; export;
begin
  Result := X * X;
end;

function udf_Sqrt(var X: double): double; cdecl; export;
begin
  if X < 0 then
    Result := 0
  else
    Result := Sqrt(X);
end;

function udf_Power(var B, E: double): double; cdecl; export;
begin
  Result := Power(B, E);
end;

function udf_LnXP1(var X: double): double; cdecl; export;
begin
  Result := LnXP1(X);
end;

function udf_Log10(var X: double): double; cdecl; export;
begin
  Result := Log10(X);
end;

function udf_Log2(var X: double): double; cdecl; export;
begin
  Result := Log2(X);
end;

function udf_LogN(var Base, X: double): double; cdecl; export;
begin
  Result := LogN(Base, X);
end;

function udf_Rand: double; cdecl; export;
begin
  Result := Random;
end;

function udf_RandInt(var X, Y: integer): integer; cdecl; export;
var
  Range: integer;
begin
  Range := Abs(Y - X) + 1;
  Result := Random(Range) + Min(X, Y);
end;

{ *** Trigonometric functions *** }

function udf_Pi: double; cdecl; export;
begin
  Result := Pi;
end;

function udf_DegToRad(var x: double): double; cdecl; export;
begin
  Result := x * (Pi / 180);
end;

function udf_RadToDeg(var x: double): double; cdecl; export;
begin
  Result := x * (180 / Pi);
end;

function udf_Cos(var x: double): double; cdecl; export;
begin
  Result := Cos(x);
end;

function udf_Sin(var x: double): double; cdecl; export;
begin
  Result := Sin(x);
end;

function udf_Tan(var x: double): double; cdecl; export;
begin
  try
    Result := Sin(x) / Cos(x);
  except
    Result := 0;
  end;
end;

function udf_CoTan(var x: double): double; cdecl; export;
begin
  try
    Result := Cos(x) / Sin(x);
  except
    Result := 0;
  end;
end;

function udf_ACos(var x: double): double; cdecl; export;
begin
  if (x >= -1) and (x <= 1) then
    Result := ArcCos(x)
  else
    Result := 0;
end;

function udf_ASin(var x: double): double; cdecl; export;
begin
  if (x >= -1) and (x <= 1) then
    Result := ArcSin(x)
  else
    Result := 0;
end;

function udf_ATan(var x: double): double; cdecl; export;
begin
  Result := ArcTan(x);
end;

function udf_Hypot(var x, y: double): double; cdecl; export;
begin
  if (x < 0) or (y < 0) then
    Result := 0
  else
    Result := Sqrt(x * x + y * y);
end;

{ *** Bit functions *** }

function udf_Not(var X: integer): integer; cdecl; export;
begin
  Result := not X;
end;

function udf_And(var X, Y: integer): integer; cdecl; export;
begin
  Result := X and Y;
end;

function udf_Or(var X, Y: integer): integer; cdecl; export;
begin
  Result := X or Y;
end;

function udf_Xor(var X, Y: integer): integer; cdecl; export;
begin
  Result := X xor Y;
end;

function udf_ShL(var X, Y: integer): integer; cdecl; export;
begin
  Result := X shl Y;
end;

function udf_ShR(var X, Y: integer): integer; cdecl; export;
begin
  Result := X shr Y;
end;

function udf_GetBit(var X: integer; var Sh: SmallInt): integer; cdecl; export;
begin
  if (X < 0) or (Sh < 0) or (Sh > 31) then
    Result := -1
  else if ((1 shl Sh) and X) = 0 then
    Result := 0
  else
    Result := 1;
end;

function udf_SetBit(var X: integer; var Sh, Val: SmallInt): integer; cdecl; export;
begin
  if (X < 0) or (Sh < 0) or (Sh > 31) then
    Result := X
  else if Val = 0 then
    Result := X and (not (1 shl Sh))
  else
    Result := X or (1 shl Sh);
end;

exports

  udf_Ver, { 2.2 }
  udf_Len,
  udf_Pos,
  udf_Copy,
  udf_Left,
  udf_Right,
  udf_Replace, { 2.1 }
  udf_Stuff, { 2.2 }
  udf_Strip, { 2.1 }
  udf_Upper,
  udf_Lower,
  udf_AnsiUpper,
  udf_AnsiLower,
  udf_StrOfChr,
  udf_Space,
  udf_Repeat, { 2.2 }
  udf_Digits,
  udf_LTrim,
  udf_RTrim,
  udf_Trim,
  udf_PadL, { 2.1 }
  udf_PadR, { 2.1 }
  udf_StrZero, { 2.1 }
  udf_Chr,
  udf_Ord,
  udf_IsLower, { 2.1 }
  udf_IsUpper, { 2.1 }
  udf_IsDigit, { 2.1 }
  udf_IsAlpha, { 2.1 }

  udf_IntToHex,
  udf_HexToInt,

  udf_Year,
  udf_Month,
  udf_Day,
  udf_Hour,
  udf_Minute,
  udf_Second,
  udf_EncDate,
  udf_EncTime,
  udf_EncTS,
  udf_YearSpan,
  udf_MonthSpan,
  udf_WeekSpan,
  udf_DaySpan,
  udf_HourSpan,
  udf_MinuteSpan,
  udf_SecondSpan,
  udf_YearsBetween,
  udf_MonthsBetween,
  udf_WeeksBetween,
  udf_DaysBetween,
  udf_HoursBetween,
  udf_MinutesBetween,
  udf_SecondsBetween,
  udf_Age, { 2.2 }
  udf_Age2, { 2.2 }
  udf_IncYear,
  udf_IncMonth,
  udf_IncWeek, { 2.1 }
  udf_IncDay, { 2.1 }
  udf_IncHour, { 2.1 }
  udf_IncMinute, { 2.1 }
  udf_IncSecond, { 2.1 }
  udf_IncDate, { 2.2 }
  udf_IncTime, { 2.2 }
  udf_IncTS, { 2.2 }
  udf_MaxDate, { 2.2 }
  udf_MaxTime, { 2.2 }
  udf_MaxTS, { 2.1 }
  udf_MinDate, { 2.2 }
  udf_MinTime, { 2.2 }
  udf_MinTS, { 2.1 }
  udf_MonthStart,
  udf_MonthEnd,
  udf_LastDay,
  udf_DayFrac,
  udf_YearDay,
  udf_WeekDay,
  udf_MonthName, { 2.1 }
  udf_SMonthName, { 2.1 }
  udf_DayName, { 2.1 }
  udf_SDayName, { 2.1 }

  udf_NVL,
  udf_Frac,
  udf_Int,
  udf_Trunc,
  udf_TruncDec,
  udf_Round,
  udf_RoundABNT,
  udf_RoundDec,
  udf_Ceil,
  udf_Floor,
  udf_Max,
  udf_Min,
  udf_Abs,
  udf_Sign, { 2.2 }
  udf_Odd, { 2.2 }
  udf_Div,
  udf_Mod,
  udf_DZero, { 2.2 }
  udf_Exp,
  udf_Factorial,
  udf_Sqr, { 2.2 }
  udf_Sqrt,
  udf_Power,
  udf_LnXP1,
  udf_Log10,
  udf_Log2,
  udf_LogN,
  udf_Rand, { 2.1 }
  udf_RandInt, { 2.1 }

  udf_Pi,
  udf_DegToRad,
  udf_RadToDeg,
  udf_Cos,
  udf_Sin,
  udf_Tan,
  udf_CoTan,
  udf_ACos, { 2.2 }
  udf_ASin, { 2.2 }
  udf_ATan, { 2.2 }
  udf_Hypot,

  udf_Not, { 2.0 }
  udf_And,
  udf_Or,
  udf_Xor,
  udf_ShL, { 2.0 }
  udf_ShR, { 2.0 }
  udf_GetBit, { 2.2 }
  udf_SetBit; { 2.2 }

begin
  Randomize;
end.

